# libvlc instance

type CstrArr = object
    argc: int
    argv: cstringArray
proc `=destroy`(a: CstrArr) = deallocCstringArray(a.argv)
converter toCstrArr(a: openarray[string]): CstrArr = CStrArr(argc: a.len, argv: a.allocCStringArray)
converter toPtrCstr(a: CstrArr): ptr cstring = cast[ptr cstring](a.argv)
converter toCint(a: CstrArr): cint = a.argc.cint
proc len*(a: CstrArr): int = a.argc

type Instance* = object
    impl: ptr instance_t
    args: seq[string]
destroyImpl(Instance, instance_release)
convertImpl(Instance, instance_t)
proc newInstance*(vargs: varargs[string]): Instance =
    var argc = vargs.len()
    var argv = toCstrArr(vargs)

    setVlcPluginPath()
    let p = instance_new(argc.cint, argv)
    if p == nil:
        raise newException(ValueError, "libvlc_new returned null pointer")
    result.impl = p

type
    EventManager = ptr event_manager_t
    Event = event_t
    EventType = enum_event_e
    Callback = callback_t
proc errmsg*(): string = $libvlc.errmsg()
proc clearerr*() = libvlc.clearerr()
proc vprinterr*(fmt: string, ap: varargs[string, `$`]): string = $libvlc.vprinterr(fmt.cstring, ap)
proc printerr*(fmt: string, ap: varargs[string, `$`]): string = $libvlc.printerr(fmt.cstring, ap)
proc retain*(i: Instance) = i.instance_retain()
proc addIntf*(i: Instance, name: string): int = i.add_intf(name.cstring)
type ExitHandler = proc(a0: pointer): void {.cdecl.}
proc setExitHandler*(i: Instance, fn: ExitHandler, opaque: pointer) = libvlc.set_exit_handler(i, fn, opaque)
proc setUserAgent*(i: Instance, name: string, http: string ) = i.set_user_agent(name.cstring, http.cstring)
proc setAppId*(i: Instance, id: string, version: string, icon: string) = libvlc.set_app_id(i.impl, id.cstring, version.cstring, icon.cstring)
proc version*(): string = $get_version()
proc compiler*(): string = $get_compiler()
proc changeset*(): string = $get_changeset()
proc free*(p: pointer) = libvlc.free(p)
proc eventAttach*(em: EventManager, t: EventType, cbk: Callback, user_data: pointer): int = libvlc.event_attach(em, t.cint, cbk, user_data)
proc eventDetach*(em: EventManager, t: EventType, cbk: Callback, user_data: pointer)      = libvlc.event_detach(em, t.cint, cbk, user_data)
proc name*(t: EventType): string = $event_type_name(t.cint)
type
    Log = object
        impl: ptr log_t
    LogContext = object
        module*: string
        file*: string
        line*: uint
    LogObject = object
        name: string
        header: string
        id: culong
    ModuleDescription = object
        impl: ptr module_description_t
    va_list* {.importc: "va_list", header: "<stdarg.h>".} = object
    CFile {.importc: "FILE", header: "<stdio.h>", incompleteStruct.} = object
    #LogCb = proc(data: pointer, level: cint, ctx: Log, fmt: cstring, args: VAList) {.cdecl.}
    LogCb = proc(data: pointer, level: int, ctx: Log, fmt: string, args: va_list)
convertImpl(ModuleDescription, module_description_t)
convertImpl(Log, log_t)
proc logContext*(ctx: Log): LogContext =
    var module, file: cstring
    var line: cuint
    ctx.log_get_context(module.addr, file.addr, line.addr)
    result = LogContext(module: $module, file: $file, line: line)
proc logObject*(ctx: Log): LogObject =
    var name, header: cstring
    var id: uintptr_t
    ctx.log_get_object(name.addr, header.addr, id.addr)
    result = LogObject(name: $name, header: $header, id: id)
proc logUnset*(i: Instance) = libvlc.log_unset(i)
proc logSet*(i: Instance, cb: LogCb, data: pointer) =
    proc log_callback(data: pointer, level: cint, log: ptr log_t, fmt: cstring, args: va_list) {.cdecl.} =
        cb(data, level, log, $fmt, args)
    libvlc.log_set(i, cast[log_cb](log_callback), data)
proc logSetFile*(i: Instance, stream: ptr CFile) =
    libvlc.log_set_file(i, cast[ptr libvlc.FILE](stream))
proc `=destroy`*(list: ModuleDescription) = list.module_description_list_release()
proc audioFilterList*(i: Instance): ModuleDescription = result.impl = libvlc.audio_filter_list_get(i)
proc videoFilterList*(i: Instance): ModuleDescription = result.impl = libvlc.video_filter_list_get(i)
proc clock*(): int64 = libvlc.clock()

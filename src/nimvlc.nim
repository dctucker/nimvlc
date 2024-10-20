import futhark

when defined(useFuthark):
    importc:
        path "."
        "/usr/include/vlc/vlc.h"
else:
    {.passL: "-lvlc"}
    include "libvlc.nim"

type Instance = distinct ptr libvlc_instance_t
converter toBase*(i: Instance): ptr libvlc_instance_t = cast[ptr libvlc_instance_t](i)
proc `=destroy`(i: Instance) =
    i.libvlc_release()
proc newInstance*(args: varargs[string]): Instance =
    var argc = args.len()
    var p: ptr cstring = nil
    if argc > 0:
        let a = addr args[0]
        p = cast[ptr cstring](a)
    result = Instance( libvlc_new( args.len().cint, p ) )

type
    Media = object
        impl: ptr libvlc_media_t
    MediaOpenCb*  = proc (opaque: pointer; datap: ptr pointer; sizep: ptr uint64): cint {.cdecl.}
    MediaReadCb*  = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.cdecl.}
    MediaSeekCb*  = proc (opaque: pointer; offset: uint64): cint {.cdecl.}
    MediaCloseCb* = proc (opaque: pointer): void {.cdecl.}
converter toBase*(m: Media): ptr libvlc_media_t = m.impl
proc `=destroy`(m: Media) =
    m.impl.libvlc_media_release()
proc newMediaLocation*(i: var Instance, arg: string): Media =
    result.impl = i.libvlc_media_new_location(arg)
proc newMediaPath*(i: var Instance, arg: string): Media =
    result.impl = i.libvlc_media_new_path(arg)
proc newMediaFd*(i: var Instance, arg: cint): Media =
    result.impl = i.libvlc_media_new_fd(arg)
proc newMediaCallbacks*(i: var Instance, open: MediaOpenCb,
        read: MediaReadCb, seek: MediaSeekCb,
        close: MediaCloseCb, opaque: pointer): Media =
    result.impl = i.libvlc_media_new_callbacks(open, read, seek, close, opaque)

type MediaPlayer = object
    impl: ptr libvlc_media_player_t
converter toBase*(mp: MediaPlayer): ptr libvlc_media_player_t = mp.impl
proc `=destroy`(mp: MediaPlayer) =
    mp.impl.libvlc_media_player_release()
proc newMediaPlayer*(m: Media): MediaPlayer =
    result.impl = m.libvlc_media_player_new_from_media()
proc play*(mp: var MediaPlayer): int {.discardable.} = return mp.libvlc_media_player_play()
proc stop*(mp: var MediaPlayer) = mp.libvlc_media_player_stop()
proc setXwindow*(mp: var MediaPlayer, handle: uint32) = mp.libvlc_media_player_set_xwindow(handle)
proc setHwnd*(mp: var MediaPlayer, handle: pointer) = mp.libvlc_media_player_set_hwnd(handle)
proc setNsObject*(mp: var MediaPlayer, handle: pointer) = mp.libvlc_media_player_set_nsobject(handle)

type EventManager = ptr libvlc_event_manager_t

type RdDescription = libvlc_rd_description_t
type RdDescriptionList = object
    size: csize_t
    services: ptr UncheckedArray[ptr RdDescription]
iterator items*(list: RdDescriptionList): ptr RdDescription =
    for i in 0..list.size:
        yield list.services[i]
proc `=destroy`(list: RdDescriptionList) =
    var pp_services = cast[ptr ptr libvlc_rd_description_t](addr list.services)
    pp_services.libvlc_renderer_discoverer_list_release(list.size)
proc len*(list: RdDescriptionList): csize_t = return list.size

type RendererDiscoverer = object
    impl: ptr libvlc_renderer_discoverer_t
converter toBase*(rd: RendererDiscoverer): ptr libvlc_renderer_discoverer_t = rd.impl
proc `=destroy`(rd: RendererDiscoverer) = rd.impl.libvlc_renderer_discoverer_release()
proc newRendererDiscoverer*(inst: Instance, name: cstring): RendererDiscoverer =
    result.impl = inst.libvlc_renderer_discoverer_new(name)
proc start*(rd: RendererDiscoverer): int = return rd.libvlc_renderer_discoverer_start()
proc stop*(rd: RendererDiscoverer) = rd.libvlc_renderer_discoverer_stop()
proc eventManager*(rd: RendererDiscoverer): EventManager = return rd.libvlc_renderer_discoverer_event_manager()
proc list*(inst: Instance): RdDescriptionList =
    var pp_services: ptr ptr libvlc_rd_description_t
    result.size = inst.libvlc_renderer_discoverer_list_get(addr pp_services)
    result.services = cast[ptr UncheckedArray[ptr RdDescription]](pp_services)

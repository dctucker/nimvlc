type Vlm = object
    instance: ptr instance_t
    name: cstring

proc `=destroy`*(vlm: Vlm) = libvlc.vlm_release(vlm.instance) # not sure why this is part of the API since libvlc_release does this anyway
proc addBroadcast*(vlm: Vlm, name: string, input: string, output: string, options: seq[string], enabled: bool; loop: bool): int =
    var opts = toCstrArr(options)
    vlm_add_broadcast(vlm.instance, name.cstring, input.cstring, output.cstring, opts.cint, opts, enabled.cint, loop.cint)
proc addVod*(vlm: Vlm, name: string, input: string, options: seq[string], enabled: bool, mux: string): int =
    var opts = toCstrArr(options)
    vlm_add_vod(vlm.instance, name.cstring, input.cstring, opts, opts, enabled.cint, mux.cstring)
proc delMedia*(vlm: Vlm, name: string): int = vlm.instance.vlm_del_media(name.cstring)
proc setEnabled*(vlm: Vlm, name: string, enabled: bool): int = vlm.instance.vlm_set_enabled(name.cstring, enabled.cint)
proc setOutput*(vlm: Vlm, name: string, output: string): int = vlm.instance.vlm_set_output(name.cstring, output.cstring)
proc setInput*(vlm: Vlm, name: string, input: string): int = vlm.instance.vlm_set_input(name.cstring, input.cstring)
proc addInput*(vlm: Vlm, name: string, input: string): int = vlm.instance.vlm_add_input(name.cstring, input.cstring)
proc setLoop*(vlm: Vlm, name: string, loop: bool): int = vlm.instance.vlm_set_loop(name.cstring, loop.cint)
proc setMux*(vlm: Vlm, name: string, mux: string): int = vlm.instance.vlm_set_mux(name.cstring, mux.cstring)
proc changeMedia*(vlm: Vlm, name: string, input: string, output: string, options: seq[string], enabled: bool, loop: bool): int =
    var opts = toCstrArr(options)
    return vlm.instance.vlm_change_media(name.cstring, input.cstring, output.cstring, opts, opts, enabled.cint, loop.cint)
proc playMedia*(vlm: Vlm, name: string): int = vlm.instance.vlm_play_media(name.cstring)
proc stopMedia*(vlm: Vlm, name: string): int = vlm.instance.vlm_stop_media(name.cstring)
proc pauseMedia*(vlm: Vlm, name: string): int = vlm.instance.vlm_pause_media(name.cstring)
proc seekMedia*(vlm: Vlm, name: string, percentage: float): int = vlm.instance.vlm_seek_media(name.cstring, percentage.cfloat)
proc showMedia*(vlm: Vlm, name: string): string = $vlm.instance.vlm_show_media(name.cstring)
proc mediaInstancePosition*(vlm: Vlm, name: string, iid: int): float = vlm.instance.vlm_get_media_instance_position(name.cstring, iid.cint)
proc mediaInstanceTime*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_time(name.cstring, iid.cint)
proc mediaInstanceLength*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_length(name.cstring, iid.cint)
proc mediaInstanceRate*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_rate(name.cstring, iid.cint)
when false:
    proc mediaInstanceTitle*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_title(name.cstring, iid.cint)
    proc mediaInstanceChapter*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_chapter(name.cstring, iid.cint)
    proc mediaInstanceSeekable*(vlm: Vlm, name: string, iid: int): int = vlm.instance.vlm_get_media_instance_seekable(name.cstring, iid.cint)
proc eventManager*(vlm: Vlm): EventManager = vlm_get_event_manager(vlm.instance)

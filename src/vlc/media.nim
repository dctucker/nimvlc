when NimMajor == 1:
    import std/os
when NimMajor == 2:
    import std/paths

type
    Meta* = meta_t
    MediaType* = media_type_t
    Media* = object
        impl: ptr media_t
    MediaList* = object
        impl: ptr media_list_t
    SlaveType* = media_slave_type_t
    Slaves* = object of ImplSeq[media_slave_t]
        media: ref Media
    State* = state_t
    Stats* = media_stats_t
    Time* = time_t
    ParseFlag* = media_parse_flag_t
    ParsedStatus* = media_parsed_status_t
    MediaOpenCb*  = proc (opaque: pointer; datap: ptr pointer; sizep: ptr uint64): cint {.cdecl.}
    MediaReadCb*  = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.cdecl.}
    MediaSeekCb*  = proc (opaque: pointer; offset: uint64): cint {.cdecl.}
    MediaCloseCb* = proc (opaque: pointer): void {.cdecl.}
    TrackType = track_type_t
    Tracks = ImplSeq[media_track_t]
destroyImpl(Media, media_release)
converter toBase*(m: Media): ptr media_t = m.impl
converter fromBase*(p: ptr media_t): Media = Media(impl: p)
converter toBase*(ml: MediaList): ptr media_list_t = ml.impl
proc newMedia*(i: var Instance, arg: Path): Media = result.impl = i.media_new_path(arg.cstring)
proc newMedia*(i: var Instance, arg: string): Media = result.impl = i.media_new_location(arg.cstring)
proc newMedia*(i: var Instance, arg: cint): Media = result.impl = i.media_new_fd(arg)
proc newMedia*(i: var Instance, open: MediaOpenCb, read: MediaReadCb,
        seek: MediaSeekCb, close: MediaCloseCb, opaque: pointer): Media =
    result.impl = i.media_new_callbacks(open, read, seek, close, opaque)
proc newMediaNode*(i: var Instance, name: string): Media = result.impl = i.media_new_as_node(name.cstring)
proc addOption(m: Media, options: string) = m.media_add_option(options)
proc addOptionFlag( m: Media, options: string, flags: uint) = m.media_add_option_flag(options.cstring, flags.cuint)
proc mrl(m: Media): string = $m.media_get_mrl()
proc duplicate(m: Media): Media = result.impl = m.media_duplicate()
proc meta(m: Media, meta: Meta): string = $m.media_get_meta(meta)
proc `meta=`(m: Media, meta: Meta, value: string) = m.media_set_meta(meta, value)
proc saveMeta(m: Media): int = m.media_save_meta()
proc state(m: Media): State = m.media_get_state()
proc stats(m: Media): (bool, Stats) = result[0] = m.media_get_stats(result[1].addr) == 1
proc subitems(m: Media): MediaList = result.impl = m.media_subitems()
proc eventManager(m: Media): EventManager = m.media_event_manager()
proc duration(m: Media): Time = m.media_get_duration()
proc parseWithOptions(m: Media, pf: ParseFlag, timeout: int): int = m.media_parse_with_options(pf, timeout.cint)
proc parseStop(m: Media) = m.media_parse_stop()
proc parsedStatus(m: Media): ParsedStatus = m.media_get_parsed_status()
proc `userData=`( m: Media, p: pointer ) = m.media_set_user_data(p)
proc userData(m: Media): pointer = m.media_get_user_data()

destroyImplSeq(Tracks, media_tracks_release)
proc tracks*(m: Media): Tracks = result.size = m.media_tracks_get(result.initAddr)
proc codecDescription*(tt: TrackType, codec: uint32): string = $tt.media_get_codec_description(codec)
proc mediaType*(m: Media): MediaType = m.media_get_type()

destroyImplSeq(Slaves, media_slaves_release)
proc slaves*(m: Media): Slaves = result.size = m.media_slaves_get(result.initAddr)
proc add*(s: Slaves, st: SlaveType, priority: uint, uri: string): int = s.media.impl.media_slaves_add(st, priority.cuint, uri.cstring)
proc clear*(s: Slaves) = s.media.impl.media_slaves_clear()


{.passL: "-lvlc"}
import libvlc

# libvlc instance

type Instance = distinct ptr instance_t
converter toBase*(i: Instance): ptr instance_t = cast[ptr instance_t](i)
proc `=destroy`(i: Instance) = i.instance_release()
proc newInstance*(args: varargs[string]): Instance =
    var argc = args.len()
    var p: ptr cstring = nil
    if argc > 0:
        let a = addr args[0]
        p = cast[ptr cstring](a)
    result = Instance( instance_new( args.len().cint, p ) )

type EventManager = ptr event_manager_t


# renderer discoverer

type
    RendererFlag* {.size: sizeof(cint).} = enum
        Audio = LIBVLC_RENDERER_CAN_AUDIO
        Video = LIBVLC_RENDERER_CAN_VIDEO
    RendererFlags* = set[RendererFlag]
    RendererItem = object
        impl: ptr renderer_item_t
converter toBase*(ri: RendererItem): ptr renderer_item_t = ri.impl
converter toInt*(rf: RendererFlags): int =
    for f in rf:
        result += f.ord
converter fromInt*(x:int): RendererFlags = cast[RendererFlags](x)
proc `=destroy`(ri: RendererItem) =
    ri.impl.renderer_item_release()
proc hold*(ri: RendererItem): RendererItem = RendererItem(impl: ri.renderer_item_hold())
proc name*(ri: RendererItem): string = return $ri.renderer_item_name()
proc `type`*(ri: RendererItem): string = return $ri.renderer_item_type()
proc iconURI*(ri: RendererItem): string = return $ri.renderer_item_icon_uri()
proc flags*(ri: RendererItem): RendererFlags =
    return ri.renderer_item_flags().int.RendererFlags

type RdDescription = rd_description_t
type RdDescriptionList = object
    size: csize_t
    services: ptr UncheckedArray[ptr RdDescription]
iterator items*(list: RdDescriptionList): ptr RdDescription =
    for i in 0..list.size:
        yield list.services[i]
proc `=destroy`(list: RdDescriptionList) =
    var pp_services = cast[ptr ptr rd_description_t](addr list.services)
    pp_services.renderer_discoverer_list_release(list.size)
proc len*(list: RdDescriptionList): csize_t = return list.size

type RendererDiscoverer = object
    impl: ptr renderer_discoverer_t
converter toBase*(rd: RendererDiscoverer): ptr renderer_discoverer_t = rd.impl
proc `=destroy`(rd: RendererDiscoverer) = rd.impl.renderer_discoverer_release()
proc newRendererDiscoverer*(inst: Instance, name: cstring): RendererDiscoverer =
    result.impl = inst.renderer_discoverer_new(name)
proc start*(rd: RendererDiscoverer): int = return rd.renderer_discoverer_start()
proc stop*(rd: RendererDiscoverer) = rd.renderer_discoverer_stop()
proc eventManager*(rd: RendererDiscoverer): EventManager = return rd.renderer_discoverer_event_manager()
proc list*(inst: Instance): RdDescriptionList =
    var pp_services: ptr ptr rd_description_t
    result.size = inst.renderer_discoverer_list_get(addr pp_services)
    result.services = cast[ptr UncheckedArray[ptr RdDescription]](pp_services)


# media

type
    Meta* {.pure.} = meta_t
    Media = object
        impl: ptr media_t
    MediaOpenCb*  = proc (opaque: pointer; datap: ptr pointer; sizep: ptr uint64): cint {.cdecl.}
    MediaReadCb*  = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.cdecl.}
    MediaSeekCb*  = proc (opaque: pointer; offset: uint64): cint {.cdecl.}
    MediaCloseCb* = proc (opaque: pointer): void {.cdecl.}
converter toBase*(m: Media): ptr media_t = m.impl
proc `=destroy`(m: Media) = m.impl.media_release()
proc newMediaLocation*(i: var Instance, arg: string): Media = result.impl = i.media_new_location(arg)
proc newMediaPath*(i: var Instance, arg: string): Media = result.impl = i.media_new_path(arg)
proc newMediaFd*(i: var Instance, arg: cint): Media = result.impl = i.media_new_fd(arg)
proc newMediaCallbacks*(i: var Instance, open: MediaOpenCb, read: MediaReadCb,
        seek: MediaSeekCb, close: MediaCloseCb, opaque: pointer): Media =
    result.impl = i.media_new_callbacks(open, read, seek, close, opaque)


# media player

type
    TrackDescription = ptr track_description_t
    TitleDescription = ptr title_description_t
    ChapterDescription = ptr chapter_description_t
    AudioOutput = ptr audio_output_t
    AudioOutputDevice = ptr audio_output_device_t

type MediaPlayer = object
    impl: ptr media_player_t
converter toBase*(mp: MediaPlayer): ptr media_player_t = mp.impl
proc `=destroy`(mp: MediaPlayer) = mp.impl.media_player_release()
proc newMediaPlayer*(m: Media): MediaPlayer = MediaPlayer(impl: m.media_player_new_from_media())
proc newMediaPlayer*(inst: Instance): MediaPlayer = MediaPlayer(impl: inst.media_player_new())
proc retain*(mp: MediaPlayer) = mp.media_player_retain() # copy?
proc `media=`*(mp: var MediaPlayer, m: Media) = mp.media_player_set_media(m)
proc media*(mp: MediaPlayer): Media = return Media(impl: mp.media_player_get_media())
proc eventManager*(mp: MediaPlayer): EventManager = return mp.media_player_event_manager()
proc isPlaying*(mp: MediaPlayer): bool = return (mp.media_player_is_playing() == 1)
proc play*(mp: var MediaPlayer): int {.discardable.} = return mp.media_player_play()
proc `pause=`*(mp: var MediaPlayer, doPause: bool) = mp.media_player_set_pause(if doPause: 1 else: 0)
proc pause*(mp: var MediaPlayer) = mp.media_player_pause()
proc stop*(mp: var MediaPlayer) = mp.media_player_stop()
proc `renderer=`*(mp: var MediaPlayer, item: RendererItem): int = mp.media_player_set_renderer(item)

proc setCallbacks*(mp: var MediaPlayer,
         lock: proc(opaque: pointer, planes: ptr pointer): pointer {.cdecl.},
         unlock: proc(opaque: pointer; picture: pointer; planes: ptr pointer) {.cdecl.},
         display: proc(opaque: pointer; picture: pointer): void {.cdecl.},
         opaque: pointer) =
    mp.video_set_callbacks(lock, unlock, display, opaque)

## video controls
proc setFormat*(mp: var MediaPlayer, chroma: string; width, height, pitch: uint) = mp.video_set_format(chroma, width.cuint, height.cuint, pitch.cuint)
proc setFormatCallbacks*(mp: var MediaPlayer,
        setup: proc(opaque: ptr pointer; chroma: cstring; width: ptr cuint; height: ptr cuint; pitches: ptr cuint; lines: ptr cuint): cuint {.cdecl.},
        cleanup: proc(opaque: pointer): void {.cdecl.}) =
    mp.video_set_format_callbacks(setup, cleanup)

proc `nsObject=`*(mp: var MediaPlayer, handle: pointer) = mp.media_player_set_nsobject(handle)
proc nsObject*(mp: var MediaPlayer): pointer = mp.media_player_get_nsobject()
proc `xwindow=`*(mp: var MediaPlayer, handle: uint32) = mp.media_player_set_xwindow(handle)
proc xwindow*(mp: var MediaPlayer): uint32 = mp.media_player_get_xwindow()
proc `hwnd=`*(mp: var MediaPlayer, handle: pointer) = mp.media_player_set_hwnd(handle)
proc hwnd*(mp: var MediaPlayer): pointer = mp.media_player_get_hwnd()
proc `androidContext=`*(mp: MediaPlayer; awindow_handler: pointer) = mp.media_player_set_android_context(awindow_handler)
proc `evasObject=`*(mp: MediaPlayer; evas_object: pointer): int = mp.media_player_set_evas_object(evas_object)

## audio controls
proc setCallbacks*(mp: MediaPlayer;
        play: proc(data: pointer; samples: pointer; count: cuint; pts: int64): void {.cdecl.},
        pause: proc(data: pointer; pts: int64): void {.cdecl.},
        resume: proc(data: pointer; pts: int64): void {.cdecl.},
        flush: proc(data: pointer; pts: int64): void {.cdecl.},
        drain: proc(data: pointer): void {.cdecl.},
        opaque: pointer) =
    mp.audio_set_callbacks(play, pause, resume, flush, drain, opaque)
proc setVolumeCallback*(mp: MediaPlayer;
        set_volume: proc(data: pointer; volume: cfloat; mute: bool): void {.cdecl.}) =
    mp.audio_set_volume_callback(set_volume)
proc setFormatCallbacks*(mp: MediaPlayer;
        setup: proc(data: ptr pointer; format: cstring; rate: ptr cuint; channels: ptr cuint): cint {.cdecl.},
        cleanup: proc(data: pointer): void {.cdecl.}) =
    mp.audio_set_format_callbacks(setup, cleanup)
proc setFormat*(mp: MediaPlayer; format: string; rate: uint; channels: uint) = mp.audio_set_format(format.cstring, rate.cuint, channels.cuint)

proc length*(mp: MediaPlayer): time_t = mp.media_player_get_length()
proc time*(mp: MediaPlayer): time_t = mp.media_player_get_time()
proc `time=`*(mp: MediaPlayer; time: time_t) = mp.media_player_set_time(time)
proc position*(mp: MediaPlayer): cfloat = mp.media_player_get_position()
proc `position=`*(mp: MediaPlayer; pos: float) = mp.media_player_set_position(pos)
proc `chapter=`*(mp: MediaPlayer; chapter: int) = mp.media_player_set_chapter(chapter.cint)
proc chapter*(mp: MediaPlayer): int = mp.media_player_get_chapter()
proc chapterCount*(mp: MediaPlayer): int = mp.media_player_get_chapter_count()
proc willPlay*(mp: MediaPlayer): int = mp.media_player_will_play()
proc chapterCount*(mp: MediaPlayer; title: int): int = mp.media_player_get_chapter_count_for_title(title.cint)
proc `title=`*(mp: MediaPlayer; title: int) = mp.media_player_set_title(title.cint)
proc title*(mp: MediaPlayer): int = mp.media_player_get_title()
proc titleCount*(mp: MediaPlayer): int = mp.media_player_get_title_count()
proc previousChapter*(mp: MediaPlayer) = mp.media_player_previous_chapter()
proc nextChapter*(mp: MediaPlayer) = mp.media_player_next_chapter()
proc rate*(mp: MediaPlayer): float = mp.media_player_get_rate()
proc `rate=`*(mp: MediaPlayer; rate: float): int = mp.media_player_set_rate(rate)
proc state*(mp: MediaPlayer): state_t = mp.media_player_get_state()
proc hasVout*(mp: MediaPlayer): uint = mp.media_player_has_vout()
proc isSeekable*(mp: MediaPlayer): bool = mp.media_player_is_seekable() == 1
proc canPause*(mp: MediaPlayer): bool = mp.media_player_can_pause() == 1
proc programScrambled*(mp: MediaPlayer): int = mp.media_player_program_scrambled()
proc nextFrame*(mp: MediaPlayer) = mp.media_player_next_frame()
proc navigate*(mp: MediaPlayer; navigate: uint) = mp.media_player_navigate(navigate.cuint)
proc `videoTitleDisplay=`*(mp: MediaPlayer; pos: position_t; timeout: uint) = mp.media_player_set_video_title_display(pos, timeout.cuint)
proc addSlave*(mp: MediaPlayer; ty: media_slave_type_t; uri: string; select: bool): int = mp.media_player_add_slave(ty, uri, select)


# media track

type
    #MediaTracklist = object # opaque # 4.0.0
    AudioTrack = object
        impl: ptr audio_track_t
    VideoViewpoint = object
        impl: ptr video_viewpoint_t
    VideoTrack = object
        impl: ptr video_track_t
    SubtitleTrack = object
        impl: ptr subtitle_track_t
    MediaTrack = object
        impl: ptr media_track_t
#proc count*(mtl: MediaTracklist): uint = mtl.media_tracklist_count()
#proc at*(mtl: MediaTracklist): MediaTrack = MediaTrack(impl: mtl.media_tracklist_at(index))
#proc delete*(mtl: MediaTracklist) = mtl.media_tracklist_delete()
#proc `=destroy`(mt: MediaTrack) = mtl.media_track_release()
#proc hold*(mtl: MediaTrack): MediaTrack = MediaTrack(impl: mt.media_track_hold())
#proc release*(mtl: MediaTrack) = mt.media_track_release()




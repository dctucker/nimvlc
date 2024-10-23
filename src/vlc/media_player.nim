type
    TrackDescription = ptr track_description_t
    TitleDescription = ptr title_description_t
    ChapterDescription = ptr chapter_description_t
    AudioOutput = ptr audio_output_t
    AudioOutputDevice = ptr audio_output_device_t
    SlaveType* = media_slave_type_t

type MediaPlayer = object
    impl: ptr media_player_t
converter toBase*(mp: MediaPlayer): ptr media_player_t = mp.impl
proc `=destroy`(mp: var MediaPlayer) = mp.impl.media_player_release()
proc newMediaPlayer*(inst: Instance): MediaPlayer = MediaPlayer(impl: inst.media_player_new())
proc newMediaPlayer*(m: Media): MediaPlayer = MediaPlayer(impl: m.media_player_new_from_media())
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
proc programScrambled*(mp: MediaPlayer): bool = mp.media_player_program_scrambled() == 1
proc nextFrame*(mp: MediaPlayer) = mp.media_player_next_frame()
proc navigate*(mp: MediaPlayer; navigate: uint) = mp.media_player_navigate(navigate.cuint)
proc `videoTitleDisplay=`*(mp: MediaPlayer; pos: position_t; timeout: uint) = mp.media_player_set_video_title_display(pos, timeout.cuint)
proc addSlave*(mp: MediaPlayer; ty: SlaveType; uri: string; select: bool): int = mp.media_player_add_slave(ty, uri, select)

proc release*(td: TrackDescription) = td.track_description_list_release()

proc toggleFullscreen*(mp: MediaPlayer) = mp.impl.toggle_fullscreen()
proc `fullScreen=`*(mp: MediaPlayer, fullscreen: bool) = mp.set_fullscreen(if fullscreen: 1 else: 0)
proc `fullScreen`*(mp: MediaPlayer): bool = mp.get_fullscreen() == 1
proc `keyInput=`*(mp: MediaPlayer, on: bool) = mp.video_set_key_input(if on: 1 else: 0)
proc `mouseInput=`*(mp: MediaPlayer, on: bool) = mp.video_set_mouse_input(if on: 1 else: 0)
proc `videoSize`*(mp: MediaPlayer, num: uint): (bool, tuple[x,y: uint]) =
    var x, y: cuint
    if mp.video_get_size(num.cuint, x.addr, y.addr) == 0:
        return (true, (x.uint, y.uint))
proc cursor*(mp: MediaPlayer, num: uint): (bool, tuple[x:int,y:int]) =
    var x, y: cint
    if mp.impl.video_get_cursor(num.cuint, x.addr, y.addr) == 0:
        return (true, (x.int, y.int))


proc scale(mp: MediaPlayer): float = mp.video_get_scale()
proc `scale=`*(mp: MediaPlayer, factor: float) = mp.video_set_scale(factor)
proc aspectRatio*(mp: MediaPlayer): string = $mp.video_get_aspect_ratio()
proc `aspectRatio=`*(mp: MediaPlayer, aspect: string) = mp.video_set_aspect_ratio(aspect.cstring)

type Viewpoint = object
    impl: ptr video_viewpoint_t
converter toBase*(v: Viewpoint): ptr video_viewpoint_t = v.impl
proc yaw*(v: Viewpoint): float = v.impl.f_yaw
proc `yaw=`*(v: Viewpoint, w: float) = v.impl.f_yaw = w
proc pitch*(v: Viewpoint): float = v.impl.f_pitch
proc `pitch=`*(v: Viewpoint, w: float) = v.impl.f_pitch = w
proc roll*(v: Viewpoint): float = v.impl.f_roll
proc `roll=`*(v: Viewpoint, w: float) = v.impl.f_roll = w
proc fieldOfView*(v: Viewpoint): float = v.impl.f_field_of_view
proc `fieldOfView=`*(v: Viewpoint, w: float) = v.impl.f_field_of_view = w

proc newViewpoint*(): Viewpoint = Viewpoint(impl: video_new_viewpoint())
proc updateViewpoint*(mp: MediaPlayer, viewpoint: Viewpoint, absolute: bool): int = mp.video_update_viewpoint(viewpoint, absolute)
proc spu(mp: MediaPlayer): int = mp.video_get_spu()
proc spuCount(mp: MediaPlayer): int = mp.video_get_spu_count()
proc spuDescription(mp: MediaPlayer): TrackDescription = mp.video_get_spu_description()
proc `spu=`*(mp: MediaPlayer, spu: int): int = mp.video_set_spu(spu.cint)
proc spuDelay(mp: MediaPlayer): int64 = mp.video_get_spu_delay()

#proc video_set_spu_delay*(p_mi: ptr media_player_t; i_delay: int64): cint {.  cdecl, importc: "libvlc_video_set_spu_delay".}
#proc media_player_get_full_title_descriptions*(p_mi: ptr media_player_t; titles: ptr ptr ptr title_description_t): cint {.cdecl, importc: "libvlc_media_player_get_full_title_descriptions".}
#proc title_descriptions_release*(p_titles: ptr ptr title_description_t; i_count: cuint): void {.cdecl, importc: "libvlc_title_descriptions_release".}
#proc media_player_get_full_chapter_descriptions*(p_mi: ptr media_player_t; i_chapters_of_title: cint; pp_chapters: ptr ptr ptr chapter_description_t): cint {.  cdecl, importc: "libvlc_media_player_get_full_chapter_descriptions".}
#proc chapter_descriptions_release*(p_chapters: ptr ptr chapter_description_t; i_count: cuint): void {.cdecl, importc: "libvlc_chapter_descriptions_release".}
#proc video_get_crop_geometry*(p_mi: ptr media_player_t): cstring {.cdecl, importc: "libvlc_video_get_crop_geometry".}
#proc video_set_crop_geometry*(p_mi: ptr media_player_t; psz_geometry: cstring): void {.  cdecl, importc: "libvlc_video_set_crop_geometry".}
#proc video_get_teletext*(p_mi: ptr media_player_t): cint {.cdecl, importc: "libvlc_video_get_teletext".}
#proc video_set_teletext*(p_mi: ptr media_player_t; i_page: cint): void {.cdecl, importc: "libvlc_video_set_teletext".}
#proc video_get_track_count*(p_mi: ptr media_player_t): cint {.cdecl, importc: "libvlc_video_get_track_count".}
#proc video_get_track_description*(p_mi: ptr media_player_t): ptr track_description_t {.  cdecl, importc: "libvlc_video_get_track_description".}
#proc video_get_track*(p_mi: ptr media_player_t): cint {.cdecl, importc: "libvlc_video_get_track".}
#proc video_set_track*(p_mi: ptr media_player_t; i_track: cint): cint {.cdecl, importc: "libvlc_video_set_track".}
#proc video_take_snapshot*(p_mi: ptr media_player_t; num: cuint; psz_filepath: cstring; i_width: cuint; i_height: cuint): cint {.  cdecl, importc: "libvlc_video_take_snapshot".}
#proc video_set_deinterlace*(p_mi: ptr media_player_t; psz_mode: cstring): void {.  cdecl, importc: "libvlc_video_set_deinterlace".}
#proc video_get_marquee_int*(p_mi: ptr media_player_t; option: cuint): cint {.  cdecl, importc: "libvlc_video_get_marquee_int".}
#proc video_get_marquee_string*(p_mi: ptr media_player_t; option: cuint): cstring {.  cdecl, importc: "libvlc_video_get_marquee_string".}
#proc video_set_marquee_int*(p_mi: ptr media_player_t; option: cuint; i_val: cint): void {.  cdecl, importc: "libvlc_video_set_marquee_int".}
#proc video_set_marquee_string*(p_mi: ptr media_player_t; option: cuint; psz_text: cstring): void {.cdecl, importc: "libvlc_video_set_marquee_string".}
#proc video_get_logo_int*(p_mi: ptr media_player_t; option: cuint): cint {.cdecl, importc: "libvlc_video_get_logo_int".}
#proc video_set_logo_int*(p_mi: ptr media_player_t; option: cuint; value: cint): void {.  cdecl, importc: "libvlc_video_set_logo_int".}
#proc video_set_logo_string*(p_mi: ptr media_player_t; option: cuint; psz_value: cstring): void {.cdecl, importc: "libvlc_video_set_logo_string".}
#proc video_get_adjust_int*(p_mi: ptr media_player_t; option: cuint): cint {.  cdecl, importc: "libvlc_video_get_adjust_int".}
#proc video_set_adjust_int*(p_mi: ptr media_player_t; option: cuint; value: cint): void {.  cdecl, importc: "libvlc_video_set_adjust_int".}
#proc video_get_adjust_float*(p_mi: ptr media_player_t; option: cuint): cfloat {.  cdecl, importc: "libvlc_video_get_adjust_float".}


proc fps*(mp: MediaPlayer): float = mp.media_player_get_fps()
proc `agl=`*(mp: MediaPlayer; drawable: uint32) = mp.media_player_set_agl(drawable)
proc `agl`*(mp: MediaPlayer): uint32 = mp.media_player_get_agl()

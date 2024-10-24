type
    TrackDescription = object
        impl: ptr track_description_t

    TitleDescription = object
        impl: ptr title_description_t
    ChapterDescription = ptr chapter_description_t
    AudioOutput = object
        impl: ptr audio_output_t
    AudioOutputDevice = object
        impl: ptr audio_output_device_t
    AudioOutputDeviceType = audio_output_device_types_t
    AudioOutputChannel = audio_output_channel_t
    SlaveType* = media_slave_type_t
proc `=destroy`*(td: var TrackDescription) = td.impl.track_description_list_release()


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
proc `titleDisplay=`*(mp: MediaPlayer, pos: position_t, timeout: uint) = mp.media_player_set_video_title_display(pos, timeout.cuint)
proc addSlave*(mp: MediaPlayer; ty: SlaveType; uri: string; select: bool): int = mp.media_player_add_slave(ty, uri, select)
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
proc spuDescription(mp: MediaPlayer): TrackDescription = TrackDescription(impl: mp.video_get_spu_description())
proc `spu=`*(mp: MediaPlayer, spu: int): int = mp.video_set_spu(spu.cint)
proc spuDelay(mp: MediaPlayer): int64 = mp.video_get_spu_delay()
proc `spu_delay=`*(mp: MediaPlayer, delay: int): int = mp.video_set_spu_delay(delay)

# These types are sequences in which all members are alloc/dealloc'd by release
type
    ImplSeq[T] = object
        size: cuint
        impl: ptr UncheckedArray[ptr T]
    TitleDescriptions = ImplSeq[title_description_t]
    ChapterDescriptions = ImplSeq[chapter_description_t]
iterator items*[T](a: ImplSeq[T]): ptr T =
    if a.size > 0:
        for i in 0..a.size-1: yield a.impl[i]
proc initAddr[T](a: ImplSeq[T]): ptr ptr ptr T = cast[ptr ptr ptr T](a.impl.addr)
proc releaseAddr[T](a: ImplSeq[T]):  ptr ptr T = cast[  ptr ptr   T](a.impl)
template destroyImplSeq(ty, releaseFunc) =
    proc `=destroy`*(a: var ty) =
        if a.size > 0: releaseFunc(a.releaseAddr, a.size)

#type
#    TitleDescriptions = object
#        impl: ptr UncheckedArray[ptr title_description_t]
#        size: cuint
#    ChapterDescriptions = object
#        impl: ptr UncheckedArray[ptr chapter_description_t]
#        size: cuint
#iterator items*(tds: TitleDescriptions): ptr title_description_t =
#    for i in 0..tds.size-1: yield tds.impl[i]
#iterator items*(cds: ChapterDescriptions): ptr chapter_description_t =
#    for i in 0..cds.size-1: yield cds.impl[i]

destroyImplSeq(TitleDescriptions, title_descriptions_release)
proc titleDescriptions*(mp: MediaPlayer): TitleDescriptions =
    var titles = mp.media_player_get_full_title_descriptions(result.initAddr)
    result.size = if titles > 0: titles.cuint else: 0

destroyImplSeq(ChapterDescriptions, chapter_descriptions_release)
proc chapterDescriptions*(mp: MediaPlayer, title: cint = -1): ChapterDescriptions =
    var chapters = mp.media_player_get_full_chapter_descriptions(title, result.initAddr)
    result.size = if chapters > 0: chapters.cuint else: 0

proc crop_geometry*(mp: MediaPlayer): cstring = mp.video_get_crop_geometry()
proc `cropGeometry=`*(mp: MediaPlayer, g: string) = mp.video_set_crop_geometry(g.cstring)
proc teletext*(mp: MediaPlayer): cint = mp.video_get_teletext()
proc `teletext=`*(mp: MediaPlayer, page: int) = mp.video_set_teletext(page.cint)
proc trackCount*(mp: MediaPlayer): cint = mp.video_get_track_count()
proc trackDescription*(mp: MediaPlayer): ptr track_description_t = mp.video_get_track_description()
proc track*(mp: MediaPlayer): cint = mp.video_get_track()
proc `track=`*(mp: MediaPlayer, track: int): int = mp.video_set_track(track.cint)
proc takeSnapshot*(mp: MediaPlayer, num: uint, filepath: string, width: uint, height: uint): cint = mp.video_take_snapshot(num.cuint, filepath.cstring, width.cuint, height.cuint)
proc `deinterlace=`*(mp: MediaPlayer, mode: string) = mp.video_set_deinterlace(mode.cstring)

type MarqueeOption = enum_video_marquee_option_t
proc marqueeInt*(mp: MediaPlayer, option: MarqueeOption): cint = mp.video_get_marquee_int(option.cuint)
proc marqueeString*(mp: MediaPlayer, option: MarqueeOption): cstring = mp.video_get_marquee_string(option.cuint)
proc `marqueeInt=`*(mp: MediaPlayer, option: MarqueeOption, val: int) = mp.video_set_marquee_int(option.cuint, val.cint)
proc `marqueeString=`*(mp: MediaPlayer, option: MarqueeOption, text: string) = mp.video_set_marquee_string(option.cuint, text.cstring)

type LogoOption* = enum_video_logo_option_t
proc logoInt*(mp: MediaPlayer, option: LogoOption): cint = mp.video_get_logo_int(option.cuint)
proc `logoInt=`*(mp: MediaPlayer, option: LogoOption, value: int) = mp.video_set_logo_int(option.cuint, value.cint)
proc `logoString=`*(mp: MediaPlayer, option: LogoOption, value: string) = mp.video_set_logo_string(option.cuint, value.cstring)

type AdjustOption* = enum_video_adjust_option_t
proc adjustInt*(mp: MediaPlayer, option: AdjustOption): cint = mp.video_get_adjust_int(option.cuint)
proc `adjustInt=`*(mp: MediaPlayer, option: AdjustOption, value: int) = mp.video_set_adjust_int(option.cuint, value.cint)
proc adjustFloat*(mp: MediaPlayer, option: AdjustOption): cfloat = mp.video_get_adjust_float(option.cuint)
proc `adjustFloat=`*(mp: MediaPlayer, option: AdjustOption, value: float) = mp.video_set_adjust_float(option.cuint, value.cfloat)


proc `=destroy`*(ao: AudioOutput) = ao.impl.audio_output_list_release()
proc audioOutputList*(inst: Instance): AudioOutput = AudioOutput(impl: inst.audio_output_list_get())
proc `audioOutput=`*(mp: MediaPlayer; name: string): int = mp.audio_output_set(name.cstring)

proc `=destroy`*(list: AudioOutputDevice) = list.impl.audio_output_device_list_release()
proc audioOutputDeviceEnum*(mp: MediaPlayer): AudioOutputDevice = mp.audio_output_device_enum()
proc audioOutputDeviceList*(inst: Instance, ao: string): AudioOutputDevice = AudioOutputDevice(impl: inst.audio_output_device_list_get(ao.cstring))
proc `audioOutputDevice=`*(mp: MediaPlayer, module: string, device_id: string) = mp.audio_output_device_set(module, device_id)
proc audioOutputDevice*(mp: ptr media_player_t): string = $mp.audio_output_device_get()
proc toggleMute*(mp: MediaPlayer) = mp.audio_toggle_mute()
proc mute*(mp: MediaPlayer): cint {.cdecl, importc: "libvlc_audio_get_mute".}
proc `mute=`*(mp: MediaPlayer, status: bool) = mp.audio_set_mute(if status: 1 else: 0)
proc volume*(mp: MediaPlayer): int = mp.audio_get_volume()
proc `volume=`*(mp: MediaPlayer, volume: int): int = mp.audio_set_volume(volume.cint)
proc audioTrackCount*(mp: MediaPlayer): int = mp.audio_get_track_count()
proc audioTrackDescription*(mp: MediaPlayer): TrackDescription = TrackDescription(impl: mp.audio_get_track_description())
proc audioTrack*(mp: MediaPlayer): int = mp.audio_get_track()
proc `audioTrack=`*(mp: MediaPlayer, track: int): int = mp.audio_set_track(track.cint)
proc audioChannel*(mp: MediaPlayer): cint = mp.audio_get_channel()
proc `audioChannel=`*(mp: MediaPlayer, channel: int): cint = mp.audio_set_channel(channel.cint)
proc audioDelay*(mp: MediaPlayer): int64 = mp.audio_get_delay()
proc `audioDelay=`*(mp: MediaPlayer, delay: int64): cint = mp.audio_set_delay(delay)

type Equalizer = object
    impl: ptr equalizer_t
proc `=destroy`*(eq: Equalizer) = eq.impl.audio_equalizer_release()
proc equalizerPresetCount*(): uint = audio_equalizer_get_preset_count()
proc equalizerPresetName*(index: uint): string = $audio_equalizer_get_preset_name(index.cuint)
proc equalizerBandCount*(): uint = audio_equalizer_get_band_count()
proc equalizerBandFrequency*(index: uint): float = audio_equalizer_get_band_frequency(index.cuint)
proc newEqualizer*(): Equalizer = Equalizer(impl: audio_equalizer_new())
proc newEqualizer*(preset: uint): Equalizer = Equalizer(impl: audio_equalizer_new_from_preset(preset.cuint))
proc `preamp=`*(eq: Equalizer, preamp: float): int = eq.impl.audio_equalizer_set_preamp(preamp.cfloat)
proc preamp*(eq: Equalizer): float = eq.impl.audio_equalizer_get_preamp()
proc `ampAtIndex=`*(eq: Equalizer, amp: float; band: uint): cint = eq.impl.audio_equalizer_set_amp_at_index(amp.cfloat, band.cuint)
proc ampAtIndex*(eq: Equalizer, band: uint): float = eq.impl.audio_equalizer_get_amp_at_index(band.cuint)
proc `equalizer=`*(mp: MediaPlayer, eq: Equalizer): int = mp.media_player_set_equalizer(eq.impl)

proc role*(mp: MediaPlayer): media_player_role_t = media_player_role_t(mp.media_player_get_role())
proc `role=`*(mp: MediaPlayer, role: media_player_role_t): int = mp.media_player_set_role(role.cuint)

proc fps*(mp: MediaPlayer): float = mp.media_player_get_fps()
proc `agl=`*(mp: MediaPlayer; drawable: uint32) = mp.media_player_set_agl(drawable)
proc `agl`*(mp: MediaPlayer): uint32 = mp.media_player_get_agl()

proc height*(mp: MediaPlayer): int = mp.video_get_height()
proc width*(mp: MediaPlayer): int = mp.video_get_width()
proc titleDescription*(mp: MediaPlayer): TrackDescription = TrackDescription(impl: mp.video_get_title_description())
proc chapterDescription*(mp: MediaPlayer, title: int): TrackDescription = TrackDescription(impl: mp.video_get_chapter_description(title.cint))
proc `subtitleFile=`*(mp: MediaPlayer, subtitle: string): int = mp.video_set_subtitle_file(subtitle.cstring)
proc toggleTeletext*(mp: MediaPlayer) = mp.impl.toggle_teletext()

# audio

proc audio_output_get_device_type*(mp: MediaPlayer): AudioOutputDeviceType = mp.audio_output_get_device_type()
proc audio_output_set_device_type*(mp: MediaPlayer, ty: AudioOutputDeviceType) = mp.audio_output_set_device_type(ty)

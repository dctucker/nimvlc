
when defined(useFuthark):
    import futhark
    import std/[strutils,strformat,unicode,json]
    const Delimiters = [Rune('_'), Rune('-'), Rune(' ')]
    func toCamelCase(s: string): string =
        let s = s.strip(chars = Whitespace)
        var prev = Rune(0)
        for rune in s.runes:
            if prev in Delimiters:
                result.add rune.toUpper
            elif rune notin Delimiters:
                result.add rune
            prev = rune
    importc:
        path "./include"
        "vlc/libvlc.h"
        "vlc/libvlc_renderer_discoverer.h"
        "vlc/libvlc_media.h"
        "vlc/libvlc_media_player.h"
        "vlc/libvlc_media_list.h"
        "vlc/libvlc_media_list_player.h"
        "vlc/libvlc_media_library.h"
        "vlc/libvlc_media_discoverer.h"
        "vlc/libvlc_events.h"
        "vlc/libvlc_dialog.h"
        "vlc/libvlc_vlm.h"
        "vlc/deprecated.h"
        outputPath "src/libvlc.nim"
        renameCallback proc(name: string, kind: string, partof = ""): string =
            result = name
            case kind:
            of "proc":
                if name.startsWith("libvlc_"):
                    let verb = name.split("_")[1]
                    if verb in @["new", "release", "retain", "wait"]:
                        return name.replace("libvlc_", "instance_")
                    return name.replace("libvlc_","")
                #if name.endsWith("_retain"): return "retain"
                #if name.endsWith("_release"): return "release"
            else:
                return name.replace("libvlc_","")
        addOpirCallback proc(given: JsonNode): JsonNode {.closure.} =
            result = % []
            for i in given.items:
                var o = i.copy()
                case i["kind"].getStr:
                of "enum":
                    o["fields"] = % []
                    var prefix = ""
                    if i.hasKey("name"):
                        prefix = i["name"].getStr.replace("enum_","")
                        if prefix.endsWith("_t"):
                            prefix = prefix[0..^2]
                    for f in i["fields"]:
                        let value = f["value"].getStr
                        var name = f["name"].getStr
                        name = name.replace(prefix,"").replace("libvlc_","")
                        let field = %* {"name": name, "value": value}
                        o["fields"].add(field)
                        #echo $field
                #of "typedef":
                #    let ty = i["type"]
                #    if ty["kind"].getStr == "alias" and ty["value"].getStr.startsWith("enum_"):
                #        var name = i["name"].getStr
                #        if name.endsWith("_t"):
                #            name = name[0..^3]
                #        name = name.replace("libvlc_","").toCamelCase().capitalizeAscii()
                #        o["name"] = % name
                #        echo name
                result.add(o)
else:
    {.passL: "-lvlc"}
    include "libvlc.nim"

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

# renderer discoverer

type RendererItem = object
    impl: ptr renderer_item_t
converter toBase*(ri: RendererItem): ptr renderer_item_t = ri.impl
proc `=destroy`(ri: RendererItem) =
    ri.impl.renderer_item_release()
proc hold*(ri: RendererItem): RendererItem = RendererItem(impl: ri.renderer_item_hold())
proc name*(ri: RendererItem): string = return $ri.renderer_item_name()
proc `type`*(ri: RendererItem): string = return $ri.renderer_item_type()
proc iconURI*(ri: RendererItem): string = return $ri.renderer_item_icon_uri()
proc flags*(ri: RendererItem): int = return ri.renderer_item_flags()

type EventManager = ptr event_manager_t

type RendererCan {.size: sizeof(cint).} = enum
    Audio = LIBVLC_RENDERER_CAN_AUDIO
    Video = LIBVLC_RENDERER_CAN_VIDEO
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
    Media = object
        impl: ptr media_t
    MediaOpenCb*  = proc (opaque: pointer; datap: ptr pointer; sizep: ptr uint64): cint {.cdecl.}
    MediaReadCb*  = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.cdecl.}
    MediaSeekCb*  = proc (opaque: pointer; offset: uint64): cint {.cdecl.}
    MediaCloseCb* = proc (opaque: pointer): void {.cdecl.}
converter toBase*(m: Media): ptr media_t = m.impl
proc `=destroy`(m: Media) = m.impl.media_release()
proc newMediaLocation*(i: var Instance, arg: string): Media =
    result.impl = i.media_new_location(arg)
proc newMediaPath*(i: var Instance, arg: string): Media =
    result.impl = i.media_new_path(arg)
proc newMediaFd*(i: var Instance, arg: cint): Media =
    result.impl = i.media_new_fd(arg)
proc newMediaCallbacks*(i: var Instance, open: MediaOpenCb,
        read: MediaReadCb, seek: MediaSeekCb,
        close: MediaCloseCb, opaque: pointer): Media =
    result.impl = i.media_new_callbacks(open, read, seek, close, opaque)

# media player
## video controls
## audio controls
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
proc retain(mp: MediaPlayer) = mp.media_player_retain()
proc setMedia(mp: var MediaPlayer, m: Media) = mp.media_player_set_media(m)
proc getMedia(mp: MediaPlayer): Media = return Media(impl: mp.media_player_get_media())
proc eventManager(mp: MediaPlayer): EventManager = return mp.media_player_event_manager()
proc isPlaying(mp: MediaPlayer): bool = return (mp.media_player_is_playing() == 1)
proc play*(mp: var MediaPlayer): int {.discardable.} = return mp.media_player_play()
proc setPause(mp: var MediaPlayer, doPause: bool) = mp.media_player_set_pause(if doPause: 1 else: 0)
proc pause*(mp: var MediaPlayer) = mp.media_player_pause()
proc stop*(mp: var MediaPlayer) = mp.media_player_stop()
proc setRenderer(mp: var MediaPlayer, item: RendererItem): int = mp.media_player_set_renderer(item)

proc videoSetCallbacks(mp: var MediaPlayer, lock: videoLockCb, unlock: videoUnlockCb, display: videoDisplayCb, opaque: pointer) = mp.video_set_callbacks(lock, unlock, display, opaque)
proc videoSetFormat*(mp: var MediaPlayer, chroma: string; width, height, pitch: uint) = mp.video_set_format(chroma, width.cuint, height.cuint, pitch.cuint)
proc videoSetFormatCallbacks*(mp: var MediaPlayer, setup: videoFormatCb, cleanup: videoCleanupCb) = mp.video_set_format_callbacks(setup, cleanup)

proc setNsObject*(mp: var MediaPlayer, handle: pointer) = mp.media_player_set_nsobject(handle)
proc getNsObject*(mp: var MediaPlayer): pointer = mp.media_player_get_nsobject()
proc setXwindow*(mp: var MediaPlayer, handle: uint32) = mp.media_player_set_xwindow(handle)
proc getXwindow*(mp: var MediaPlayer): uint32 = mp.media_player_get_xwindow()
proc setHwnd*(mp: var MediaPlayer, handle: pointer) = mp.media_player_set_hwnd(handle)
proc getHwnd*(mp: var MediaPlayer): pointer = mp.media_player_get_hwnd()
proc setAndroidContext*(mp: MediaPlayer; awindow_handler: pointer) = mp.media_player_set_android_context(awindow_handler)
proc setEvasObject*(mp: MediaPlayer; evas_object: pointer): int = mp.media_player_set_evas_object(evas_object)

proc audioSetCallbacks*(mp: MediaPlayer; play: audio_play_cb; pause: audio_pause_cb; resume: audio_resume_cb; flush: audio_flush_cb; drain: audio_drain_cb; opaque: pointer) = mp.audio_set_callbacks(play, pause, resume, flush, drain, opaque)
proc audioSetVolumeCallback*(mp: MediaPlayer; set_volume: audio_set_volume_cb) = mp.audio_set_volume_callback(set_volume)
proc audioSetFormatCallbacks*(mp: MediaPlayer; setup: audio_setup_cb; cleanup: audio_cleanup_cb) = mp.audio_set_format_callbacks(setup, cleanup)
proc audioSetFormat*(mp: MediaPlayer; format: string; rate: uint; channels: uint) = mp.audio_set_format(format, rate, channels)

proc getLength*(mp: MediaPlayer): time_t = mp.media_player_get_length()
proc getTime*(mp: MediaPlayer): time_t = mp.media_player_get_time()
proc setTime*(mp: MediaPlayer; time: time_t) = mp.media_player_set_time(time)
proc getPosition*(mp: MediaPlayer): cfloat = mp.media_player_get_position()
proc setPosition*(mp: MediaPlayer; pos: float) = mp.media_player_set_position(pos)
proc setChapter*(mp: MediaPlayer; chapter: int) = mp.media_player_set_chapter(chapter.cint)
proc getChapter*(mp: MediaPlayer): int = mp.media_player_get_chapter()
proc getChapterCount*(mp: MediaPlayer): int = mp.media_player_get_chapter_count()
proc willPlay*(mp: MediaPlayer): int = mp.media_player_will_play()
proc getChapterCountForTitle*(mp: MediaPlayer; title: int): int = mp.media_player_get_chapter_count_for_title(title.cint)
proc setTitle*(mp: MediaPlayer; title: int) = mp.media_player_set_title(title.cint)
proc getTitle*(mp: MediaPlayer): int = mp.media_player_get_title()
proc getTitleCount*(mp: MediaPlayer): int = mp.media_player_get_title_count()
proc previousChapter*(mp: MediaPlayer) = mp.media_player_previous_chapter()
proc nextChapter*(mp: MediaPlayer) = mp.media_player_next_chapter()
proc getRate*(mp: MediaPlayer): float = mp.media_player_get_rate()
proc setRate*(mp: MediaPlayer; rate: float): int = mp.media_player_set_rate(rate)
proc getState*(mp: MediaPlayer): state_t = mp.media_player_get_state()
proc hasVout*(mp: MediaPlayer): uint = mp.media_player_has_vout()
proc isSeekable*(mp: MediaPlayer): bool = mp.media_player_is_seekable() == 1
proc canPause*(mp: MediaPlayer): bool = mp.media_player_can_pause() == 1
proc programScrambled*(mp: MediaPlayer): int = mp.media_player_program_scrambled()
proc nextFrame*(mp: MediaPlayer) = mp.media_player_next_frame()
proc navigate*(mp: MediaPlayer; navigate: uint) = mp.media_player_navigate(navigate.cuint)
proc setVideoTitleDisplay*(mp: MediaPlayer; pos: position_t; timeout: uint) = mp.media_player_set_video_title_display(pos, timeout.cuint)
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




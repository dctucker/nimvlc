# TODO use macros to generate this structure
type
    Event* = object
        impl: ptr event_t
    EventTarget* = (
        Instance or
        Media or
        MediaPlayer or
        MediaList or
        MediaListPlayer or
        #MediaDiscoverer or    ## \deprecated Useless, media_discoverer events are only triggered when calling libvlc_media_discoverer_start() and libvlc_media_discoverer_stop().
        RendererDiscoverer or
        Vlm
    )
    EventType* {.size: sizeof(cuint).} = enum # MediaEvent | MediaPlayerEvent | MediaListEvent | MediaListViewEvent | MediaListPlayerEvent | DiscovererEvent | VlmEvent
    #MediaEvent = enum
        MediaMetaChanged=0,
        MediaSubItemAdded,
        MediaDurationChanged,
        MediaParsedChanged,
        MediaFreed,
        MediaStateChanged,
        MediaSubItemTreeAdded
    #MediaPlayerEvent = enum
        MediaPlayerMediaChanged=0x100,
        MediaPlayerNothingSpecial,
        MediaPlayerOpening,
        MediaPlayerBuffering,
        MediaPlayerPlaying,
        MediaPlayerPaused,
        MediaPlayerStopped,
        MediaPlayerForward,
        MediaPlayerBackward,
        MediaPlayerEndReached,
        MediaPlayerEncounteredError,
        MediaPlayerTimeChanged,
        MediaPlayerPositionChanged,
        MediaPlayerSeekableChanged,
        MediaPlayerPausableChanged,
        MediaPlayerTitleChanged,
        MediaPlayerSnapshotTaken,
        MediaPlayerLengthChanged,
        MediaPlayerVout,
        MediaPlayerScrambledChanged,
        MediaPlayerESAdded,
        MediaPlayerESDeleted,
        MediaPlayerESSelected,
        MediaPlayerCorked,
        MediaPlayerUncorked,
        MediaPlayerMuted,
        MediaPlayerUnmuted,
        MediaPlayerAudioVolume,
        MediaPlayerAudioDevice,
        MediaPlayerChapterChanged
    #MediaListEvent = enum
        MediaListItemAdded=0x200,
        MediaListWillAddItem,
        MediaListItemDeleted,
        MediaListWillDeleteItem,
        MediaListEndReached
    #MediaListViewEvent = enum
        MediaListViewItemAdded=0x300,
        MediaListViewWillAddItem,
        MediaListViewItemDeleted,
        MediaListViewWillDeleteItem
    #MediaListPlayerEvent = enum
        MediaListPlayerPlayed=0x400,
        MediaListPlayerNextItemSet,
        MediaListPlayerStopped
    #DiscovererEvent = enum
        MediaDiscovererStarted=0x500, ## \deprecated Useless event, it will be triggered only when calling libvlc_media_discoverer_start()
        MediaDiscovererEnded,         ## \deprecated Useless event, it will be triggered only when calling libvlc_media_discoverer_stop()
        RendererDiscovererItemAdded,
        RendererDiscovererItemDeleted
    #VlmEvent = enum
        VlmMediaAdded=0x600,
        VlmMediaRemoved,
        VlmMediaChanged,
        VlmMediaInstanceStarted,
        VlmMediaInstanceStopped,
        VlmMediaInstanceStatusInit,
        VlmMediaInstanceStatusOpening,
        VlmMediaInstanceStatusPlaying,
        VlmMediaInstanceStatusPause,
        VlmMediaInstanceStatusEnd,
        VlmMediaInstanceStatusError

convertImpl(Event, event_t)
proc name*(t: EventType): string = $event_type_name(t.cint)

proc kind*(event: Event): EventType = {.warning[HoleEnumConv]:off.}:
    EventType(event.impl.type_field)

template eventGet(lib1, lib2: untyped, types: varargs[EventType]) =
    let t = EventType(e.kind)
    if t in types:
        when result is string:
            return $ e.impl.u.lib1.lib2
        else:
            return e.impl.u.lib1.lib2
    else:
        let `lib2` {.inject.}: string = ""
        raise newException(FieldDefect, "Field `" & lib2.astToStr & "` not found for EventType." & $t)


proc meta_type*    (e: Event): Meta         {.inline.} = eventGet( media_meta_changed            , meta_type        , MediaMetaChanged )
proc new_child*    (e: Event): Media        {.inline.} = eventGet( media_subitem_added           , new_child        , MediaSubItemAdded )
proc new_duration* (e: Event): int64        {.inline.} = eventGet( media_duration_changed        , new_duration     , MediaDurationChanged )
proc new_status*   (e: Event): int          {.inline.} = eventGet( media_parsed_changed          , new_status       , MediaParsedChanged )
proc md*           (e: Event): Media        {.inline.} = eventGet( media_freed                   , md               , MediaFreed )
proc new_state*    (e: Event): State        {.inline.} = eventGet( media_state_changed           , new_state        , MediaStateChanged )
proc new_media*    (e: Event): Media        {.inline.} = eventGet( media_player_media_changed    , new_media        , MediaPlayerMediaChanged )
proc new_cache*    (e: Event): float        {.inline.} = eventGet( media_player_buffering        , new_cache        , MediaPlayerBuffering )
proc new_time*     (e: Event): time_t       {.inline.} = eventGet( media_player_time_changed     , new_time         , MediaPlayerTimeChanged )
proc new_position* (e: Event): float        {.inline.} = eventGet( media_player_position_changed , new_position     , MediaPlayerPositionChanged )
proc new_seekable* (e: Event): int          {.inline.} = eventGet( media_player_seekable_changed , new_seekable     , MediaPlayerSeekableChanged )
proc new_pausable* (e: Event): int          {.inline.} = eventGet( media_player_pausable_changed , new_pausable     , MediaPlayerPausableChanged )
proc new_title*    (e: Event): int          {.inline.} = eventGet( media_player_title_changed    , new_title        , MediaPlayerTitleChanged )
proc filename*     (e: Event): string       {.inline.} = eventGet( media_player_snapshot_taken   , psz_filename     , MediaPlayerSnapshotTaken )
proc new_length*   (e: Event): time_t       {.inline.} = eventGet( media_player_length_changed   , new_length       , MediaPlayerLengthChanged )
proc new_count*    (e: Event): int          {.inline.} = eventGet( media_player_vout             , new_count        , MediaPlayerVout )
proc new_scrambled*(e: Event): int          {.inline.} = eventGet( media_player_scrambled_changed, new_scrambled    , MediaPlayerScrambledChanged )
proc track_type*   (e: Event): TrackType    {.inline.} = eventGet( media_player_es_changed       , i_type           , MediaPlayerESAdded, MediaPlayerESDeleted, MediaPlayerESSelected )
proc id*           (e: Event): int          {.inline.} = eventGet( media_player_es_changed       , i_id             , MediaPlayerESAdded, MediaPlayerESDeleted, MediaPlayerESSelected )
proc volume*       (e: Event): float        {.inline.} = eventGet( media_player_audio_volume     , volume           , MediaPlayerAudioVolume )
proc device*       (e: Event): string       {.inline.} = eventGet( media_player_audio_device     , device           , MediaPlayerAudioDevice )
proc new_chapter*  (e: Event): int          {.inline.} = eventGet( media_player_chapter_changed  , new_chapter      , MediaPlayerChapterChanged )
proc item*         (e: Event): Media        {.inline.} = eventGet( media_list_item_added         , item             , MediaListItemAdded, MediaListWillAddItem, MediaListItemDeleted, MediaListWillDeleteItem, MediaSubItemTreeAdded, MediaListPlayerNextItemSet )
proc index*        (e: Event): int          {.inline.} = eventGet( media_list_item_added         , index            , MediaListItemAdded, MediaListWillAddItem, MediaListItemDeleted, MediaListWillDeleteItem, MediaSubItemTreeAdded, MediaListPlayerNextItemSet )
proc renderer_item*(e: Event): RendererItem {.inline.} = eventGet( renderer_discoverer_item_added, item             , RendererDiscovererItemAdded, RendererDiscovererItemDeleted )
proc media_name*   (e: Event): string       {.inline.} = eventGet( vlm_media_event               , psz_media_name   , VlmMediaAdded, VlmMediaRemoved, VlmMediaChanged, VlmMediaInstanceStarted, VlmMediaInstanceStopped, VlmMediaInstanceStatusInit, VlmMediaInstanceStatusOpening, VlmMediaInstanceStatusPlaying, VlmMediaInstanceStatusPause, VlmMediaInstanceStatusEnd, VlmMediaInstanceStatusError )
proc instance_name*(e: Event): string       {.inline.} = eventGet( vlm_media_event               , psz_instance_name, VlmMediaAdded, VlmMediaRemoved, VlmMediaChanged, VlmMediaInstanceStarted, VlmMediaInstanceStopped, VlmMediaInstanceStatusInit, VlmMediaInstanceStatusOpening, VlmMediaInstanceStatusPlaying, VlmMediaInstanceStatusPause, VlmMediaInstanceStatusEnd, VlmMediaInstanceStatusError )

type
    CallbackFn = proc(event: Event, data: pointer)
    Callback = object
        fn: CallbackFn
        cbk: callback_t
        data: pointer

proc newCallback*(data: pointer=nil, fn: CallbackFn): Callback =
    result.fn = fn
    result.data = data
    result.cbk = proc(event: ptr event_t, data: pointer) {.cdecl.} =
        var cbk = cast[ptr Callback](data)
        cbk.fn(event, cbk.data)

proc eventAttach*(em: EventManager, t: EventType, cbk: Callback): int =
    libvlc.event_attach(em, t.cint, cbk.cbk, cbk.addr)

proc eventDetach*(em: EventManager, t: EventType, cbk: Callback) =
    libvlc.event_detach(em, t.cint, cbk.cbk, cbk.addr)

proc attach*[T: EventTarget](obj: T, t: EventType, fn: CallbackFn): Callback =
    result = newCallback(obj.impl, fn)
    let err = eventAttach(obj.eventManager, t, result)
    if err != 0:
        raise newException(OutOfMemDefect, "libvlc_event_attach returned ENOMEM")

proc detach*[T: EventTarget](obj: T, t: EventType, cb: Callback) =
    return eventDetach(obj.eventManager, t, cb, obj.impl)

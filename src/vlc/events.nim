# TODO use macros to generate this structure
type
    Event* = object
        impl: ptr event_t

convertImpl(Event, event_t)

template eventGet(lib1, lib2: untyped, types: varargs[EventType]) =
    let t = EventType(e.impl.type_field)
    if t in types:
        when result is string:
            return $ e.impl.u.lib1.lib2
        else:
            return e.impl.u.lib1.lib2
    else:
        let `lib2` {.inject.}: string = ""
        raise newException(FieldDefect, "Field `" & lib2.astToStr & "` not found for EventType." & $t)

proc kind*(event: Event): EventType = EventType(event.impl.type_field)

proc meta_type*    (e: Event): Meta         = eventGet( media_meta_changed            , meta_type        , MediaMetaChanged )
proc new_child*    (e: Event): Media        = eventGet( media_subitem_added           , new_child        , MediaSubItemAdded )
proc new_duration* (e: Event): int64        = eventGet( media_duration_changed        , new_duration     , MediaDurationChanged )
proc new_status*   (e: Event): int          = eventGet( media_parsed_changed          , new_status       , MediaParsedChanged )
proc md*           (e: Event): Media        = eventGet( media_freed                   , md               , MediaFreed )
proc new_state*    (e: Event): State        = eventGet( media_state_changed           , new_state        , MediaStateChanged )
proc new_media*    (e: Event): Media        = eventGet( media_player_media_changed    , new_media        , MediaPlayerMediaChanged )
proc new_cache*    (e: Event): float        = eventGet( media_player_buffering        , new_cache        , MediaPlayerBuffering )
proc new_time*     (e: Event): time_t       = eventGet( media_player_time_changed     , new_time         , MediaPlayerTimeChanged )
proc new_position* (e: Event): float        = eventGet( media_player_position_changed , new_position     , MediaPlayerPositionChanged )
proc new_seekable* (e: Event): int          = eventGet( media_player_seekable_changed , new_seekable     , MediaPlayerSeekableChanged )
proc new_pausable* (e: Event): int          = eventGet( media_player_pausable_changed , new_pausable     , MediaPlayerPausableChanged )
proc new_title*    (e: Event): int          = eventGet( media_player_title_changed    , new_title        , MediaPlayerTitleChanged )
proc filename*     (e: Event): string       = eventGet( media_player_snapshot_taken   , psz_filename     , MediaPlayerSnapshotTaken )
proc new_length*   (e: Event): time_t       = eventGet( media_player_length_changed   , new_length       , MediaPlayerLengthChanged )
proc new_count*    (e: Event): int          = eventGet( media_player_vout             , new_count        , MediaPlayerVout )
proc new_scrambled*(e: Event): int          = eventGet( media_player_scrambled_changed, new_scrambled    , MediaPlayerScrambledChanged )
proc trackType*    (e: Event): TrackType    = eventGet( media_player_es_changed       , i_type           , MediaPlayerESAdded, MediaPlayerESDeleted, MediaPlayerESSelected )
proc id*           (e: Event): int          = eventGet( media_player_es_changed       , i_id             , MediaPlayerESAdded, MediaPlayerESDeleted, MediaPlayerESSelected )
proc volume*       (e: Event): float        = eventGet( media_player_audio_volume     , volume           , MediaPlayerAudioVolume )
proc device*       (e: Event): string       = eventGet( media_player_audio_device     , device           , MediaPlayerAudioDevice )
proc new_chapter*  (e: Event): int          = eventGet( media_player_chapter_changed  , new_chapter      , MediaPlayerChapterChanged )
proc item*         (e: Event): Media        = eventGet( media_list_item_added         , item             , MediaListItemAdded, MediaListWillAddItem, MediaListItemDeleted, MediaListWillDeleteItem, MediaSubItemTreeAdded, MediaListPlayerNextItemSet )
proc index*        (e: Event): int          = eventGet( media_list_item_added         , index            , MediaListItemAdded, MediaListWillAddItem, MediaListItemDeleted, MediaListWillDeleteItem, MediaSubItemTreeAdded, MediaListPlayerNextItemSet )
proc renderer_item*(e: Event): RendererItem = eventGet( renderer_discoverer_item_added, item             , RendererDiscovererItemAdded, RendererDiscovererItemDeleted )
proc media_name*   (e: Event): string       = eventGet( vlm_media_event               , psz_media_name   , VlmMediaAdded, VlmMediaRemoved, VlmMediaChanged, VlmMediaInstanceStarted, VlmMediaInstanceStopped, VlmMediaInstanceStatusInit, VlmMediaInstanceStatusOpening, VlmMediaInstanceStatusPlaying, VlmMediaInstanceStatusPause, VlmMediaInstanceStatusEnd, VlmMediaInstanceStatusError )
proc instance_name*(e: Event): string       = eventGet( vlm_media_event               , psz_instance_name, VlmMediaAdded, VlmMediaRemoved, VlmMediaChanged, VlmMediaInstanceStarted, VlmMediaInstanceStopped, VlmMediaInstanceStatusInit, VlmMediaInstanceStatusOpening, VlmMediaInstanceStatusPlaying, VlmMediaInstanceStatusPause, VlmMediaInstanceStatusEnd, VlmMediaInstanceStatusError )

type
    CallbackFn = proc(event: Event, data: pointer)
    Callback = object
        fn: CallbackFn
        cbk: callback_t
        data: pointer

proc newCallback*(data: pointer, fn: CallbackFn): Callback =
    result.fn = fn
    result.cbk = proc(event: ptr struct_event_t, data: pointer) {.cdecl.} =
        var cbk = cast[ptr Callback](data)
        cbk.fn(event, cbk.data)

template callback*(body: untyped) =
    newCallback( proc(event: Event, data: pointer) =
        body
    )

proc eventAttach*(em: EventManager, t: EventType, cbk: Callback): int =
    libvlc.event_attach(em, t.cint, cbk.cbk, cbk.addr)

proc eventDetach*(em: EventManager, t: EventType, cbk: Callback) =
    libvlc.event_detach(em, t.cint, cbk.cbk, cbk.addr)

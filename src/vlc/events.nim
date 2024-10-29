# TODO use macros to generate this structure
type
    Event* = object
        obj: pointer
        case kind*: EventType
        of MediaMetaChanged: #media_meta_changed*: struct_event_t_u_t_media_meta_changed_t
            meta_type*: Meta
        of MediaSubItemAdded: #media_subitem_added*: struct_event_t_u_t_media_subitem_added_t
            new_child*: Media
        of MediaDurationChanged: #media_duration_changed*: struct_event_t_u_t_media_duration_changed_t
            new_duration*: int64
        of MediaParsedChanged: #media_parsed_changed*: struct_event_t_u_t_media_parsed_changed_t
            new_status*: int
        of MediaFreed: #media_freed*: struct_event_t_u_t_media_freed_t
            md*: Media
        of MediaStateChanged: #media_state_changed*: struct_event_t_u_t_media_state_changed_t
            new_state*: cint
        of MediaPlayerMediaChanged: #media_player_media_changed*: struct_event_t_u_t_media_player_media_changed_t
            new_media*: Media
        of MediaPlayerBuffering: #media_player_buffering*: struct_event_t_u_t_media_player_buffering_t
            new_cache*: float
        of MediaPlayerTimeChanged: #media_player_time_changed*: struct_event_t_u_t_media_player_time_changed_t
            new_time*: time_t
        of MediaPlayerPositionChanged: #media_player_position_changed*: struct_event_t_u_t_media_player_position_changed_t
            new_position*: float
        of MediaPlayerSeekableChanged: #media_player_seekable_changed*: struct_event_t_u_t_media_player_seekable_changed_t
            new_seekable*: int
        of MediaPlayerPausableChanged: #media_player_pausable_changed*: struct_event_t_u_t_media_player_pausable_changed_t
            new_pausable*: int
        of MediaPlayerTitleChanged: #media_player_title_changed*: struct_event_t_u_t_media_player_title_changed_t
            new_title*: int
        of MediaPlayerSnapshotTaken: #media_player_snapshot_taken*: struct_event_t_u_t_media_player_snapshot_taken_t
            filename*: string
        of MediaPlayerLengthChanged: #media_player_length_changed*: struct_event_t_u_t_media_player_length_changed_t
            new_length*: time_t
        of MediaPlayerVout: #media_player_vout*: struct_event_t_u_t_media_player_vout_t
            new_count*: int
        of MediaPlayerScrambledChanged: #media_player_scrambled_changed*: struct_event_t_u_t_media_player_scrambled_changed_t
            new_scrambled*: int
        of MediaPlayerESAdded,
           MediaPlayerESDeleted,
           MediaPlayerESSelected: #media_player_es_changed*: struct_event_t_u_t_media_player_es_changed_t
            trackType*: TrackType
            id*: int
        of MediaPlayerAudioVolume: #media_player_audio_volume*: struct_event_t_u_t_media_player_audio_volume_t
            volume*: float
        of MediaPlayerAudioDevice: #media_player_audio_device*: struct_event_t_u_t_media_player_audio_device_t
            device: string
        of MediaPlayerChapterChanged: #media_player_chapter_changed*: struct_event_t_u_t_media_player_chapter_changed_t
            new_chapter*: int
        of MediaListItemAdded, #media_list_item_added*: struct_event_t_u_t_media_list_item_added_t
           MediaListWillAddItem, #media_list_will_add_item*: struct_event_t_u_t_media_list_will_add_item_t
           MediaListItemDeleted, #media_list_item_deleted*: struct_event_t_u_t_media_list_item_deleted_t
           MediaListWillDeleteItem, #media_list_will_delete_item*: struct_event_t_u_t_media_list_will_delete_item_t
           MediaSubItemTreeAdded, #media_subitemtree_added*: struct_event_t_u_t_media_subitemtree_added_t
           MediaListPlayerNextItemSet: #media_list_player_next_item_set*: struct_event_t_u_t_media_list_player_next_item_set_t
            item*: Media
            index*: int
        of RendererDiscovererItemAdded,   #renderer_discoverer_item_added*: struct_event_t_u_t_renderer_discoverer_item_added_t
           RendererDiscovererItemDeleted: #renderer_discoverer_item_deleted*: struct_event_t_u_t_renderer_discoverer_item_deleted_t
            renderer_item*: RendererItem
        of VlmMediaAdded,
           VlmMediaRemoved,
           VlmMediaChanged,
           VlmMediaInstanceStarted,
           VlmMediaInstanceStopped,
           VlmMediaInstanceStatusInit,
           VlmMediaInstanceStatusOpening,
           VlmMediaInstanceStatusPlaying,
           VlmMediaInstanceStatusPause,
           VlmMediaInstanceStatusEnd,
           VlmMediaInstanceStatusError: #vlm_media_event*: struct_event_t_u_t_vlm_media_event_t
            media_name*: string
            instance_name*: string
        #of MediaPlayerNothingSpecial:
        #of MediaPlayerOpening:
        #of MediaPlayerPlaying:
        #of MediaPlayerPaused:
        #of MediaPlayerStopped:
        #of MediaPlayerForward:
        #of MediaPlayerBackward:
        #of MediaPlayerEndReached:
        #of MediaPlayerEncounteredError:
        #of MediaPlayerCorked:
        #of MediaPlayerUncorked:
        #of MediaPlayerMuted:
        #of MediaPlayerUnmuted:
        #of MediaListEndReached:
        #of MediaListViewItemAdded:
        #of MediaListViewWillAddItem:
        #of MediaListViewItemDeleted:
        #of MediaListViewWillDeleteItem:
        #of MediaListPlayerPlayed:
        #of MediaListPlayerStopped:
        #of MediaDiscovererStarted:
        #of MediaDiscovererEnded:
        else:
            meh: pointer

converter toEvent(p: ptr struct_event_t): Event =
    result.kind = EventType(p.type_field)
    result.obj = p.p_obj

    case result.kind
    of MediaMetaChanged:              #media_meta_changed*: struct_event_t_u_t_media_meta_changed_t
        result.meta_type = p.u.media_meta_changed.meta_type
    of MediaSubItemAdded:             #media_subitem_added*: struct_event_t_u_t_media_subitem_added_t
        result.new_child = p.u.media_subitem_added.new_child
    of MediaDurationChanged:          #media_duration_changed*: struct_event_t_u_t_media_duration_changed_t
        result.new_duration = p.u.media_duration_changed.new_duration
    of MediaParsedChanged:            #media_parsed_changed*: struct_event_t_u_t_media_parsed_changed_t
        result.new_status = p.u.media_parsed_changed.new_status
    of MediaFreed:                    #media_freed*: struct_event_t_u_t_media_freed_t
        result.md = p.u.media_freed.md
    of MediaStateChanged:             #media_state_changed*: struct_event_t_u_t_media_state_changed_t
        result.new_state = p.u.media_state_changed.new_state
    of MediaPlayerMediaChanged:       #media_player_media_changed*: struct_event_t_u_t_media_player_media_changed_t
        result.new_media = p.u.media_player_media_changed.new_media
    of MediaPlayerBuffering:          #media_player_buffering*: struct_event_t_u_t_media_player_buffering_t
        result.new_cache = p.u.media_player_buffering.new_cache
    of MediaPlayerTimeChanged:        #media_player_time_changed*: struct_event_t_u_t_media_player_time_changed_t
        result.new_time = p.u.media_player_time_changed.new_time
    of MediaPlayerPositionChanged:    #media_player_position_changed*: struct_event_t_u_t_media_player_position_changed_t
        result.new_position = p.u.media_player_position_changed.new_position
    of MediaPlayerSeekableChanged:    #media_player_seekable_changed*: struct_event_t_u_t_media_player_seekable_changed_t
        result.new_seekable = p.u.media_player_seekable_changed.new_seekable
    of MediaPlayerPausableChanged:    #media_player_pausable_changed*: struct_event_t_u_t_media_player_pausable_changed_t
        result.new_pausable = p.u.media_player_pausable_changed.new_pausable
    of MediaPlayerTitleChanged:       #media_player_title_changed*: struct_event_t_u_t_media_player_title_changed_t
        result.new_title = p.u.media_player_title_changed.new_title
    of MediaPlayerSnapshotTaken:      #media_player_snapshot_taken*: struct_event_t_u_t_media_player_snapshot_taken_t
        result.filename = $p.u.media_player_snapshot_taken.psz_filename
    of MediaPlayerLengthChanged:      #media_player_length_changed*: struct_event_t_u_t_media_player_length_changed_t
        result.new_length = p.u.media_player_length_changed.new_length
    of MediaPlayerVout:               #media_player_vout*: struct_event_t_u_t_media_player_vout_t
        result.new_count = p.u.media_player_vout.new_count
    of MediaPlayerScrambledChanged:   #media_player_scrambled_changed*: struct_event_t_u_t_media_player_scrambled_changed_t
        result.new_scrambled = p.u.media_player_scrambled_changed.new_scrambled
    of MediaPlayerESAdded,
       MediaPlayerESDeleted,
       MediaPlayerESSelected:         #media_player_es_changed*: struct_event_t_u_t_media_player_es_changed_t
        result.trackType = TrackType(p.u.media_player_es_changed.i_type)
        result.id = p.u.media_player_es_changed.i_id
    of MediaPlayerAudioVolume:        #media_player_audio_volume*: struct_event_t_u_t_media_player_audio_volume_t
        result.volume = p.u.media_player_audio_volume.volume
    of MediaPlayerAudioDevice:        #media_player_audio_device*: struct_event_t_u_t_media_player_audio_device_t
        result.device = $p.u.media_player_audio_device.device
    of MediaPlayerChapterChanged:     #media_player_chapter_changed*: struct_event_t_u_t_media_player_chapter_changed_t
        result.new_chapter = p.u.media_player_chapter_changed.new_chapter
    of MediaListItemAdded,            #media_list_item_added*: struct_event_t_u_t_media_list_item_added_t
       MediaListWillAddItem,          #media_list_will_add_item*: struct_event_t_u_t_media_list_will_add_item_t
       MediaListItemDeleted,          #media_list_item_deleted*: struct_event_t_u_t_media_list_item_deleted_t
       MediaListWillDeleteItem,       #media_list_will_delete_item*: struct_event_t_u_t_media_list_will_delete_item_t
       MediaSubItemTreeAdded,         #media_subitemtree_added*: struct_event_t_u_t_media_subitemtree_added_t
       MediaListPlayerNextItemSet:    #media_list_player_next_item_set*: struct_event_t_u_t_media_list_player_next_item_set_t
        result.item = p.u.media_list_item_added.item
        result.index = p.u.media_list_item_added.index
    of RendererDiscovererItemAdded,   #renderer_discoverer_item_added*: struct_event_t_u_t_renderer_discoverer_item_added_t
       RendererDiscovererItemDeleted: #renderer_discoverer_item_deleted*: struct_event_t_u_t_renderer_discoverer_item_deleted_t
        result.renderer_item = p.u.renderer_discoverer_item_added.item
    of VlmMediaAdded,
       VlmMediaRemoved,
       VlmMediaChanged,
       VlmMediaInstanceStarted,
       VlmMediaInstanceStopped,
       VlmMediaInstanceStatusInit,
       VlmMediaInstanceStatusOpening,
       VlmMediaInstanceStatusPlaying,
       VlmMediaInstanceStatusPause,
       VlmMediaInstanceStatusEnd,
       VlmMediaInstanceStatusError:   #vlm_media_event*: struct_event_t_u_t_vlm_media_event_t
        result.media_name = $p.u.vlm_media_event.psz_media_name
        result.instance_name = $p.u.vlm_media_event.psz_instance_name
    else:
        discard

#    template resultAssign(name) =
#        result.name = p.u.name
#    case result.kind
#        of MediaMetaChanged:
#            resultAssign media_meta_changed
#        of MediaSubItemAdded:
#            resultAssign media_subitem_added
#        of MediaDurationChanged:
#            resultAssign media_duration_changed
#        of MediaParsedChanged:
#            resultAssign media_parsed_changed
#        of MediaFreed:
#            resultAssign media_freed
#        of MediaStateChanged:
#            resultAssign media_state_changed
#        of MediaSubItemTreeAdded:
#            resultAssign media_subitemtree_added
#        of MediaPlayerMediaChanged:
#            resultAssign media_player_media_changed
#        of MediaPlayerBuffering:
#            resultAssign media_player_buffering
#        of MediaPlayerTimeChanged:
#            resultAssign media_player_time_changed
#        of MediaPlayerPositionChanged:
#            resultAssign media_player_position_changed
#        of MediaPlayerSeekableChanged:
#            resultAssign media_player_seekable_changed
#        of MediaPlayerPausableChanged:
#            resultAssign media_player_pausable_changed
#        of MediaPlayerTitleChanged:
#            resultAssign media_player_title_changed
#        of MediaPlayerSnapshotTaken:
#            resultAssign media_player_snapshot_taken
#        of MediaPlayerLengthChanged:
#            resultAssign media_player_length_changed
#        of MediaPlayerVout:
#            resultAssign media_player_vout
#        of MediaPlayerScrambledChanged:
#            resultAssign media_player_scrambled_changed
#        of MediaPlayerESAdded,
#           MediaPlayerESDeleted,
#           MediaPlayerESSelected:
#            resultAssign media_player_es_changed
#        of MediaPlayerAudioVolume:
#            resultAssign media_player_audio_volume
#        of MediaPlayerAudioDevice:
#            resultAssign media_player_audio_device
#        of MediaPlayerChapterChanged:
#            resultAssign media_player_chapter_changed
#        of MediaListItemAdded:
#            resultAssign media_list_item_added
#        of MediaListWillAddItem:
#            resultAssign media_list_will_add_item
#        of MediaListItemDeleted:
#            resultAssign media_list_item_deleted
#        of MediaListWillDeleteItem:
#            resultAssign media_list_will_delete_item
#        of MediaListPlayerNextItemSet:
#            resultAssign media_list_player_next_item_set
#        of RendererDiscovererItemAdded:
#            resultAssign renderer_discoverer_item_added
#        of RendererDiscovererItemDeleted:
#            resultAssign renderer_discoverer_item_deleted
#        of VlmMediaAdded,
#           VlmMediaRemoved,
#           VlmMediaChanged,
#           VlmMediaInstanceStarted,
#           VlmMediaInstanceStopped,
#           VlmMediaInstanceStatusInit,
#           VlmMediaInstanceStatusOpening,
#           VlmMediaInstanceStatusPlaying,
#           VlmMediaInstanceStatusPause,
#           VlmMediaInstanceStatusEnd,
#           VlmMediaInstanceStatusError:
#            resultAssign vlm_media_event
#        else:
#            discard

#type Callback = callback_t
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

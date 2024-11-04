
const
  MediaOptionTrusted* = cuint(2)
const
  MediaOptionUnique* = cuint(256)
const
  TitleMenu* = cuint(1)
const
  TitleInteractive* = cuint(2)
type
  enum_log_level* {.size: sizeof(cuint), pure.} = enum
    DEBUG = 0, NOTICE = 2, WARNING = 3, ERROR = 4
type
  enum_meta_t* {.size: sizeof(cuint), pure.} = enum
    Title = 0, Artist = 1, Genre = 2, Copyright = 3, Album = 4, TrackNumber = 5,
    Description = 6, Rating = 7, Date = 8, Setting = 9, URL = 10, Language = 11,
    NowPlaying = 12, Publisher = 13, EncodedBy = 14, ArtworkURL = 15,
    TrackID = 16, TrackTotal = 17, Director = 18, Season = 19, Episode = 20,
    ShowName = 21, Actors = 22, AlbumArtist = 23, DiscNumber = 24,
    DiscTotal = 25
type
  enum_state_t* {.size: sizeof(cuint), pure.} = enum
    NothingSpecial = 0, Opening = 1, Buffering = 2, Playing = 3, Paused = 4,
    Stopped = 5, Ended = 6, Error = 7
type
  enum_track_type_t* {.size: sizeof(cint), pure.} = enum
    Unknown = -1, Audio = 0, Video = 1, Text = 2
type
  enum_video_orient_t* {.size: sizeof(cuint), pure.} = enum
    TopLeft = 0, TopRight = 1, BottomLeft = 2, BottomRight = 3, LeftTop = 4,
    LeftBottom = 5, RightTop = 6, RightBottom = 7
type
  enum_video_projection_t* {.size: sizeof(cuint), pure.} = enum
    Rectangular = 0, Equirectangular = 1, CubemapLayoutStandard = 256
type
  enum_media_type_t* {.size: sizeof(cuint), pure.} = enum
    Unknown = 0, File = 1, Directory = 2, Disc = 3, Stream = 4,
    Playlist = 5
type
  enum_media_parse_flag_t* {.size: sizeof(cuint), pure.} = enum
    MediaParseLocal = 0, MediaParseNetwork = 1, MediaFetchLocal = 2,
    MediaFetchNetwork = 4, MediaDoInteract = 8
type
  enum_media_parsed_status_t* {.size: sizeof(cuint), pure.} = enum
    Skipped = 1, Failed = 2, Timeout = 3, Done = 4
type
  enum_media_slave_type_t* {.size: sizeof(cuint), pure.} = enum
    Subtitle = 0, Audio = 1
type
  enum_video_marquee_option_t* {.size: sizeof(cuint), pure.} = enum
    Enable = 0, Text = 1, Color = 2, Opacity = 3, Position = 4, Refresh = 5,
    Size = 6, Timeout = 7, X = 8, Y = 9
type
  enum_navigate_mode_t* {.size: sizeof(cuint), pure.} = enum
    NavigateActivate = 0, NavigateUp = 1, NavigateDown = 2, NavigateLeft = 3,
    NavigateRight = 4, NavigatePopup = 5
type
  enum_position_t* {.size: sizeof(cint), pure.} = enum
    Disable = -1, Center = 0, Left = 1, Right = 2, Top = 3, TopLeft = 4,
    TopRight = 5, Bottom = 6, BottomLeft = 7, BottomRight = 8
type
  enum_teletext_key_t* {.size: sizeof(cuint), pure.} = enum
    Blue = 6422528, Green = 6750208, Index = 6881280, Red = 7471104,
    Yellow = 7929856
type
  enum_video_logo_option_t* {.size: sizeof(cuint), pure.} = enum
    Enable = 0, File = 1, X = 2, Y = 3, Delay = 4, Repeat = 5,
    Opacity = 6, Position = 7
type
  enum_video_adjust_option_t* {.size: sizeof(cuint), pure.} = enum
    Enable = 0, Contrast = 1, Brightness = 2, Hue = 3, Saturation = 4, Gamma = 5
type
  enum_audio_output_device_types_t* {.size: sizeof(cint), pure.} = enum
    OutputError = -1, OutputMono = 1, OutputStereo = 2, Output2F2R = 4,
    Output3F2R = 5, Output51 = 6, Output61 = 7, Output71 = 8, OutputSPDIF = 10
type
  enum_audio_output_channel_t* {.size: sizeof(cint), pure.} = enum
    Error = -1, Stereo = 1, RStereo = 2, Left = 3, Right = 4, Dolbys = 5
type
  enum_media_player_role* {.size: sizeof(cuint), pure.} = enum
    None = 0, Music = 1, Video = 2, Communication = 3, Game = 4,
    Notification = 5, Animation = 6, Production = 7, Accessibility = 8, Test = 9
type
  enum_playback_mode_t* {.size: sizeof(cuint), pure.} = enum
    Default = 0, Loop = 1, Repeat = 2
type
  enum_media_discoverer_category_t* {.size: sizeof(cuint), pure.} = enum
    Devices = 0, Lan = 1, Podcasts = 2, Localdirs = 3
type
  enum_event_e* {.size: sizeof(cuint), pure.} = enum
    MediaMetaChanged = 0, MediaSubItemAdded = 1, MediaDurationChanged = 2,
    MediaParsedChanged = 3, MediaFreed = 4, MediaStateChanged = 5,
    MediaSubItemTreeAdded = 6, MediaPlayerMediaChanged = 256,
    MediaPlayerNothingSpecial = 257, MediaPlayerOpening = 258,
    MediaPlayerBuffering = 259, MediaPlayerPlaying = 260,
    MediaPlayerPaused = 261, MediaPlayerStopped = 262, MediaPlayerForward = 263,
    MediaPlayerBackward = 264, MediaPlayerEndReached = 265,
    MediaPlayerEncounteredError = 266, MediaPlayerTimeChanged = 267,
    MediaPlayerPositionChanged = 268, MediaPlayerSeekableChanged = 269,
    MediaPlayerPausableChanged = 270, MediaPlayerTitleChanged = 271,
    MediaPlayerSnapshotTaken = 272, MediaPlayerLengthChanged = 273,
    MediaPlayerVout = 274, MediaPlayerScrambledChanged = 275,
    MediaPlayerESAdded = 276, MediaPlayerESDeleted = 277,
    MediaPlayerESSelected = 278, MediaPlayerCorked = 279,
    MediaPlayerUncorked = 280, MediaPlayerMuted = 281, MediaPlayerUnmuted = 282,
    MediaPlayerAudioVolume = 283, MediaPlayerAudioDevice = 284,
    MediaPlayerChapterChanged = 285, MediaListItemAdded = 512,
    MediaListWillAddItem = 513, MediaListItemDeleted = 514,
    MediaListWillDeleteItem = 515, MediaListEndReached = 516,
    MediaListViewItemAdded = 768, MediaListViewWillAddItem = 769,
    MediaListViewItemDeleted = 770, MediaListViewWillDeleteItem = 771,
    MediaListPlayerPlayed = 1024, MediaListPlayerNextItemSet = 1025,
    MediaListPlayerStopped = 1026, MediaDiscovererStarted = 1280,
    MediaDiscovererEnded = 1281, RendererDiscovererItemAdded = 1282,
    RendererDiscovererItemDeleted = 1283, VlmMediaAdded = 1536,
    VlmMediaRemoved = 1537, VlmMediaChanged = 1538,
    VlmMediaInstanceStarted = 1539, VlmMediaInstanceStopped = 1540,
    VlmMediaInstanceStatusInit = 1541, VlmMediaInstanceStatusOpening = 1542,
    VlmMediaInstanceStatusPlaying = 1543, VlmMediaInstanceStatusPause = 1544,
    VlmMediaInstanceStatusEnd = 1545, VlmMediaInstanceStatusError = 1546
type
  enum_dialog_question_type* {.size: sizeof(cuint), pure.} = enum
    NORMAL = 0, WARNING = 1, CRITICAL = 2
type
  struct_media_library_t* = object
type
  struct_vlc_log_t* = object
type
  struct_media_list_t* = object
type
  struct_log_iterator_t* = object
type
  struct_renderer_discoverer_t* = object
type
  struct_IO_marker* = object
type
  struct_media_list_player_t* = object
type
  struct_media_discoverer_t* = object
type
  struct_IO_wide_data* = object
type
  struct_media_player_t* = object
type
  struct_media_t* = object
type
  struct_equalizer_t* = object
type
  role_Test* = object
type
  struct_event_manager_t* = object
type
  struct_dialog_id* = object
type
  struct_instance_t* = object
type
  struct_renderer_item_t* = object
type
  struct_IO_codecvt* = object
type
  instance_t* = struct_instance_t ## Generated based on /usr/include/vlc/libvlc.h:77:34
  time_t* = int64            ## Generated based on /usr/include/vlc/libvlc.h:79:17
  event_manager_t* = struct_event_manager_t ## Generated based on /usr/include/vlc/libvlc.h:311:39
  event_type_t* = cint       ## Generated based on /usr/include/vlc/libvlc.h:318:13
  callback_t* = proc (a0: ptr struct_event_t; a1: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc.h:324:17
  struct_event_t_u_t_media_meta_changed_t* {.pure, inheritable, bycopy.} = object
    meta_type*: meta_t
  struct_event_t_u_t_media_subitem_added_t* {.pure, inheritable, bycopy.} = object
    new_child*: ptr media_t
  struct_event_t_u_t_media_duration_changed_t* {.pure, inheritable, bycopy.} = object
    new_duration*: int64
  struct_event_t_u_t_media_parsed_changed_t* {.pure, inheritable, bycopy.} = object
    new_status*: cint
  struct_event_t_u_t_media_freed_t* {.pure, inheritable, bycopy.} = object
    md*: ptr media_t
  struct_event_t_u_t_media_state_changed_t* {.pure, inheritable, bycopy.} = object
    new_state*: cint
  struct_event_t_u_t_media_subitemtree_added_t* {.pure, inheritable, bycopy.} = object
    item*: ptr media_t
  struct_event_t_u_t_media_player_buffering_t* {.pure, inheritable, bycopy.} = object
    new_cache*: cfloat
  struct_event_t_u_t_media_player_chapter_changed_t* {.pure, inheritable, bycopy.} = object
    new_chapter*: cint
  struct_event_t_u_t_media_player_position_changed_t* {.pure, inheritable,
      bycopy.} = object
    new_position*: cfloat
  struct_event_t_u_t_media_player_time_changed_t* {.pure, inheritable, bycopy.} = object
    new_time*: time_t
  struct_event_t_u_t_media_player_title_changed_t* {.pure, inheritable, bycopy.} = object
    new_title*: cint
  struct_event_t_u_t_media_player_seekable_changed_t* {.pure, inheritable,
      bycopy.} = object
    new_seekable*: cint
  struct_event_t_u_t_media_player_pausable_changed_t* {.pure, inheritable,
      bycopy.} = object
    new_pausable*: cint
  struct_event_t_u_t_media_player_scrambled_changed_t* {.pure, inheritable,
      bycopy.} = object
    new_scrambled*: cint
  struct_event_t_u_t_media_player_vout_t* {.pure, inheritable, bycopy.} = object
    new_count*: cint
  struct_event_t_u_t_media_list_item_added_t* {.pure, inheritable, bycopy.} = object
    item*: ptr media_t
    index*: cint
  struct_event_t_u_t_media_list_will_add_item_t* {.pure, inheritable, bycopy.} = object
    item*: ptr media_t
    index*: cint
  struct_event_t_u_t_media_list_item_deleted_t* {.pure, inheritable, bycopy.} = object
    item*: ptr media_t
    index*: cint
  struct_event_t_u_t_media_list_will_delete_item_t* {.pure, inheritable, bycopy.} = object
    item*: ptr media_t
    index*: cint
  struct_event_t_u_t_media_list_player_next_item_set_t* {.pure, inheritable,
      bycopy.} = object
    item*: ptr media_t
  struct_event_t_u_t_media_player_snapshot_taken_t* {.pure, inheritable, bycopy.} = object
    psz_filename*: cstring
  struct_event_t_u_t_media_player_length_changed_t* {.pure, inheritable, bycopy.} = object
    new_length*: time_t
  struct_event_t_u_t_vlm_media_event_t* {.pure, inheritable, bycopy.} = object
    psz_media_name*: cstring
    psz_instance_name*: cstring
  struct_event_t_u_t_media_player_media_changed_t* {.pure, inheritable, bycopy.} = object
    new_media*: ptr media_t
  struct_event_t_u_t_media_player_es_changed_t* {.pure, inheritable, bycopy.} = object
    i_type*: track_type_t
    i_id*: cint
  struct_event_t_u_t_media_player_audio_volume_t* {.pure, inheritable, bycopy.} = object
    volume*: cfloat
  struct_event_t_u_t_media_player_audio_device_t* {.pure, inheritable, bycopy.} = object
    device*: cstring
  struct_event_t_u_t_renderer_discoverer_item_added_t* {.pure, inheritable,
      bycopy.} = object
    item*: ptr renderer_item_t
  struct_event_t_u_t_renderer_discoverer_item_deleted_t* {.pure, inheritable,
      bycopy.} = object
    item*: ptr renderer_item_t
  struct_event_t_u_t* {.union, bycopy.} = object
    media_meta_changed*: struct_event_t_u_t_media_meta_changed_t
    media_subitem_added*: struct_event_t_u_t_media_subitem_added_t
    media_duration_changed*: struct_event_t_u_t_media_duration_changed_t
    media_parsed_changed*: struct_event_t_u_t_media_parsed_changed_t
    media_freed*: struct_event_t_u_t_media_freed_t
    media_state_changed*: struct_event_t_u_t_media_state_changed_t
    media_subitemtree_added*: struct_event_t_u_t_media_subitemtree_added_t
    media_player_buffering*: struct_event_t_u_t_media_player_buffering_t
    media_player_chapter_changed*: struct_event_t_u_t_media_player_chapter_changed_t
    media_player_position_changed*: struct_event_t_u_t_media_player_position_changed_t
    media_player_time_changed*: struct_event_t_u_t_media_player_time_changed_t
    media_player_title_changed*: struct_event_t_u_t_media_player_title_changed_t
    media_player_seekable_changed*: struct_event_t_u_t_media_player_seekable_changed_t
    media_player_pausable_changed*: struct_event_t_u_t_media_player_pausable_changed_t
    media_player_scrambled_changed*: struct_event_t_u_t_media_player_scrambled_changed_t
    media_player_vout*: struct_event_t_u_t_media_player_vout_t
    media_list_item_added*: struct_event_t_u_t_media_list_item_added_t
    media_list_will_add_item*: struct_event_t_u_t_media_list_will_add_item_t
    media_list_item_deleted*: struct_event_t_u_t_media_list_item_deleted_t
    media_list_will_delete_item*: struct_event_t_u_t_media_list_will_delete_item_t
    media_list_player_next_item_set*: struct_event_t_u_t_media_list_player_next_item_set_t
    media_player_snapshot_taken*: struct_event_t_u_t_media_player_snapshot_taken_t
    media_player_length_changed*: struct_event_t_u_t_media_player_length_changed_t
    vlm_media_event*: struct_event_t_u_t_vlm_media_event_t
    media_player_media_changed*: struct_event_t_u_t_media_player_media_changed_t
    media_player_es_changed*: struct_event_t_u_t_media_player_es_changed_t
    media_player_audio_volume*: struct_event_t_u_t_media_player_audio_volume_t
    media_player_audio_device*: struct_event_t_u_t_media_player_audio_device_t
    renderer_discoverer_item_added*: struct_event_t_u_t_renderer_discoverer_item_added_t
    renderer_discoverer_item_deleted*: struct_event_t_u_t_renderer_discoverer_item_deleted_t
  struct_event_t* {.pure, inheritable, bycopy.} = object
    type_field*: cint        ## Generated based on /usr/include/vlc/libvlc_events.h:135:16
    p_obj*: pointer
    u*: struct_event_t_u_t
  log_t* = struct_vlc_log_t  ## Generated based on /usr/include/vlc/libvlc.h:382:26
  uintptr_t* = culong        ## Generated based on /usr/include/stdint.h:79:27
  log_cb* = proc (a0: pointer; a1: cint; a2: ptr log_t; a3: cstring): void {.
      cdecl, varargs.}       ## Generated based on /usr/include/vlc/libvlc.h:447:16
  FILE* = struct_IO_FILE     ## Generated based on /usr/include/bits/types/FILE.h:7:25
  struct_module_description_t* {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /usr/include/vlc/libvlc.h:500:16
    psz_shortname*: cstring
    psz_longname*: cstring
    psz_help*: cstring
    p_next*: ptr struct_module_description_t
  module_description_t* = struct_module_description_t ## Generated based on /usr/include/vlc/libvlc.h:507:3
  renderer_discoverer_t* = struct_renderer_discoverer_t ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:38:45
  struct_rd_description_t* {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:45:16
    psz_longname*: cstring
  rd_description_t* = struct_rd_description_t ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:49:3
  renderer_item_t* = struct_renderer_item_t ## Generated based on /usr/include/vlc/libvlc_events.h:37:39
  media_t* = struct_media_t  ## Generated based on /usr/include/vlc/libvlc_media.h:48:31
  meta_t* = enum_meta_t      ## Generated based on /usr/include/vlc/libvlc_media.h:79:3
  state_t* = enum_state_t    ## Generated based on /usr/include/vlc/libvlc_media.h:102:3
  track_type_t* = enum_track_type_t ## Generated based on /usr/include/vlc/libvlc_media.h:116:3
  struct_media_stats_t* {.pure, inheritable, bycopy.} = object
    i_read_bytes*: cint      ## Generated based on /usr/include/vlc/libvlc_media.h:118:16
    f_input_bitrate*: cfloat
    i_demux_read_bytes*: cint
    f_demux_bitrate*: cfloat
    i_demux_corrupted*: cint
    i_demux_discontinuity*: cint
    i_decoded_video*: cint
    i_decoded_audio*: cint
    i_displayed_pictures*: cint
    i_lost_pictures*: cint
    i_played_abuffers*: cint
    i_lost_abuffers*: cint
    i_sent_packets*: cint
    i_sent_bytes*: cint
    f_send_bitrate*: cfloat
  media_stats_t* = struct_media_stats_t ## Generated based on /usr/include/vlc/libvlc_media.h:146:3
  struct_media_track_info_t_u_t_audio_t* {.pure, inheritable, bycopy.} = object
    i_channels*: cuint
    i_rate*: cuint
  struct_media_track_info_t_u_t_video_t* {.pure, inheritable, bycopy.} = object
    i_height*: cuint
    i_width*: cuint
  struct_media_track_info_t_u_t* {.union, bycopy.} = object
    audio*: struct_media_track_info_t_u_t_audio_t
    video*: struct_media_track_info_t_u_t_video_t
  struct_media_track_info_t* {.pure, inheritable, bycopy.} = object
    i_codec*: uint32         ## Generated based on /usr/include/vlc/libvlc_media.h:148:16
    i_id*: cint
    i_type*: track_type_t
    i_profile*: cint
    i_level*: cint
    u*: struct_media_track_info_t_u_t
  media_track_info_t* = struct_media_track_info_t ## Generated based on /usr/include/vlc/libvlc_media.h:172:3
  struct_audio_track_t* {.pure, inheritable, bycopy.} = object
    i_channels*: cuint       ## Generated based on /usr/include/vlc/libvlc_media.h:175:16
    i_rate*: cuint
  audio_track_t* = struct_audio_track_t ## Generated based on /usr/include/vlc/libvlc_media.h:179:3
  video_orient_t* = enum_video_orient_t ## Generated based on /usr/include/vlc/libvlc_media.h:191:3
  video_projection_t* = enum_video_projection_t ## Generated based on /usr/include/vlc/libvlc_media.h:199:3
  struct_video_viewpoint_t* {.pure, inheritable, bycopy.} = object
    f_yaw*: cfloat           ## Generated based on /usr/include/vlc/libvlc_media.h:206:16
    f_pitch*: cfloat
    f_roll*: cfloat
    f_field_of_view*: cfloat
  video_viewpoint_t* = struct_video_viewpoint_t ## Generated based on /usr/include/vlc/libvlc_media.h:212:3
  struct_video_track_t* {.pure, inheritable, bycopy.} = object
    i_height*: cuint         ## Generated based on /usr/include/vlc/libvlc_media.h:214:16
    i_width*: cuint
    i_sar_num*: cuint
    i_sar_den*: cuint
    i_frame_rate_num*: cuint
    i_frame_rate_den*: cuint
    i_orientation*: video_orient_t
    i_projection*: video_projection_t
    pose*: video_viewpoint_t
  video_track_t* = struct_video_track_t ## Generated based on /usr/include/vlc/libvlc_media.h:226:3
  struct_subtitle_track_t* {.pure, inheritable, bycopy.} = object
    psz_encoding*: cstring   ## Generated based on /usr/include/vlc/libvlc_media.h:228:16
  subtitle_track_t* = struct_subtitle_track_t ## Generated based on /usr/include/vlc/libvlc_media.h:231:3
  struct_media_track_t_anon0_t* {.union, bycopy.} = object
    audio*: ptr audio_track_t
    video*: ptr video_track_t
    subtitle*: ptr subtitle_track_t
  struct_media_track_t* {.pure, inheritable, bycopy.} = object
    i_codec*: uint32         ## Generated based on /usr/include/vlc/libvlc_media.h:233:16
    i_original_fourcc*: uint32
    i_id*: cint
    i_type*: track_type_t
    i_profile*: cint
    i_level*: cint
    anon0*: struct_media_track_t_anon0_t
    i_bitrate*: cuint
    psz_language*: cstring
    psz_description*: cstring
  media_track_t* = struct_media_track_t ## Generated based on /usr/include/vlc/libvlc_media.h:255:3
  media_type_t* = enum_media_type_t ## Generated based on /usr/include/vlc/libvlc_media.h:269:3
  media_parse_flag_t* = enum_media_parse_flag_t ## Generated based on /usr/include/vlc/libvlc_media.h:300:3
  media_parsed_status_t* = enum_media_parsed_status_t ## Generated based on /usr/include/vlc/libvlc_media.h:315:3
  media_slave_type_t* = enum_media_slave_type_t ## Generated based on /usr/include/vlc/libvlc_media.h:324:3
  struct_media_slave_t* {.pure, inheritable, bycopy.} = object
    psz_uri*: cstring        ## Generated based on /usr/include/vlc/libvlc_media.h:330:16
    i_type*: media_slave_type_t
    i_priority*: cuint
  media_slave_t* = struct_media_slave_t ## Generated based on /usr/include/vlc/libvlc_media.h:335:3
  media_open_cb* = proc (a0: pointer; a1: ptr pointer; a2: ptr uint64): cint {.
      cdecl.}                ## Generated based on /usr/include/vlc/libvlc_media.h:355:15
  media_read_cb* = proc (a0: pointer; a1: ptr uint8; a2: csize_t): ssize_t {.
      cdecl.}                ## Generated based on /usr/include/vlc/libvlc_media.h:374:19
  ssize_t* = compiler_ssize_t ## Generated based on /usr/include/stdio.h:78:19
  media_seek_cb* = proc (a0: pointer; a1: uint64): cint {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media.h:385:15
  media_close_cb* = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media.h:393:16
  media_player_t* = struct_media_player_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:43:38
  struct_track_description_t* {.pure, inheritable, bycopy.} = object
    i_id*: cint              ## Generated based on /usr/include/vlc/libvlc_media_player.h:49:16
    psz_name*: cstring
    p_next*: ptr struct_track_description_t
  track_description_t* = struct_track_description_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:55:3
  struct_title_description_t* {.pure, inheritable, bycopy.} = object
    i_duration*: int64       ## Generated based on /usr/include/vlc/libvlc_media_player.h:66:16
    psz_name*: cstring
    i_flags*: cuint
  title_description_t* = struct_title_description_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:71:3
  struct_chapter_description_t* {.pure, inheritable, bycopy.} = object
    i_time_offset*: int64    ## Generated based on /usr/include/vlc/libvlc_media_player.h:76:16
    i_duration*: int64
    psz_name*: cstring
  chapter_description_t* = struct_chapter_description_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:81:3
  struct_audio_output_t* {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /usr/include/vlc/libvlc_media_player.h:87:16
    psz_description*: cstring
    p_next*: ptr struct_audio_output_t
  audio_output_t* = struct_audio_output_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:93:3
  struct_audio_output_device_t* {.pure, inheritable, bycopy.} = object
    p_next*: ptr struct_audio_output_device_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:98:16
    psz_device*: cstring
    psz_description*: cstring
  audio_output_device_t* = struct_audio_output_device_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:104:3
  video_marquee_option_t* = enum_video_marquee_option_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:120:3
  navigate_mode_t* = enum_navigate_mode_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:133:3
  position_t* = enum_position_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:149:3
  teletext_key_t* = enum_teletext_key_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:161:3
  equalizer_t* = struct_equalizer_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:168:35
  video_lock_cb* = proc (a0: pointer; a1: ptr pointer): pointer {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:307:17
  video_unlock_cb* = proc (a0: pointer; a1: pointer; a2: ptr pointer): void {.
      cdecl.}                ## Generated based on /usr/include/vlc/libvlc_media_player.h:325:16
  video_display_cb* = proc (a0: pointer; a1: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:338:16
  video_format_cb* = proc (a0: ptr pointer; a1: cstring; a2: ptr cuint;
                           a3: ptr cuint; a4: ptr cuint; a5: ptr cuint): cuint {.
      cdecl.}                ## Generated based on /usr/include/vlc/libvlc_media_player.h:366:20
  video_cleanup_cb* = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:377:16
  audio_play_cb* = proc (a0: pointer; a1: pointer; a2: cuint; a3: int64): void {.
      cdecl.}                ## Generated based on /usr/include/vlc/libvlc_media_player.h:627:16
  audio_pause_cb* = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:639:16
  audio_resume_cb* = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:651:16
  audio_flush_cb* = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:662:16
  audio_drain_cb* = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:673:16
  audio_set_volume_cb* = proc (a0: pointer; a1: cfloat; a2: bool): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:681:16
  audio_setup_cb* = proc (a0: ptr pointer; a1: cstring; a2: ptr cuint;
                          a3: ptr cuint): cint {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:737:15
  audio_cleanup_cb* = proc (a0: pointer): void {.cdecl.} ## Generated based on /usr/include/vlc/libvlc_media_player.h:746:16
  audio_output_device_types_t* = enum_audio_output_device_types_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:1591:3
  audio_output_channel_t* = enum_audio_output_channel_t ## Generated based on /usr/include/vlc/libvlc_media_player.h:1603:3
  media_player_role_t* = enum_media_player_role ## Generated based on /usr/include/vlc/libvlc_media_player.h:2063:3
  media_list_t* = struct_media_list_t ## Generated based on /usr/include/vlc/libvlc_media_list.h:39:36
  media_list_player_t* = struct_media_list_player_t ## Generated based on /usr/include/vlc/libvlc_media_list_player.h:43:43
  playback_mode_t* = enum_playback_mode_t ## Generated based on /usr/include/vlc/libvlc_media_list_player.h:53:3
  media_library_t* = struct_media_library_t ## Generated based on /usr/include/vlc/libvlc_media_library.h:40:39
  media_discoverer_category_t* = enum_media_discoverer_category_t ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:46:3
  struct_media_discoverer_description_t* {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:52:16
    psz_longname*: cstring
    i_cat*: media_discoverer_category_t
  media_discoverer_description_t* = struct_media_discoverer_description_t ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:56:3
  media_discoverer_t* = struct_media_discoverer_t ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:70:42
  event_t* = struct_event_t  ## Generated based on /usr/include/vlc/libvlc_events.h:287:3
  dialog_id* = struct_dialog_id ## Generated based on /usr/include/vlc/libvlc_dialog.h:30:33
  dialog_question_type* = enum_dialog_question_type ## Generated based on /usr/include/vlc/libvlc_dialog.h:45:3
  struct_dialog_cbs* {.pure, inheritable, bycopy.} = object
    pf_display_error*: proc (a0: pointer; a1: cstring; a2: cstring): void {.
        cdecl.}              ## Generated based on /usr/include/vlc/libvlc_dialog.h:50:16
    pf_display_login*: proc (a0: pointer; a1: ptr dialog_id; a2: cstring;
                             a3: cstring; a4: cstring; a5: bool): void {.cdecl.}
    pf_display_question*: proc (a0: pointer; a1: ptr dialog_id; a2: cstring;
                                a3: cstring; a4: dialog_question_type;
                                a5: cstring; a6: cstring; a7: cstring): void {.
        cdecl.}
    pf_display_progress*: proc (a0: pointer; a1: ptr dialog_id; a2: cstring;
                                a3: cstring; a4: bool; a5: cfloat; a6: cstring): void {.
        cdecl.}
    pf_cancel*: proc (a0: pointer; a1: ptr dialog_id): void {.cdecl.}
    pf_update_progress*: proc (a0: pointer; a1: ptr dialog_id; a2: cfloat;
                               a3: cstring): void {.cdecl.}
  dialog_cbs* = struct_dialog_cbs ## Generated based on /usr/include/vlc/libvlc_dialog.h:155:3
  log_iterator_t* = struct_log_iterator_t ## Generated based on /usr/include/vlc/deprecated.h:347:38
  struct_log_message_t* {.pure, inheritable, bycopy.} = object
    i_severity*: cint        ## Generated based on /usr/include/vlc/deprecated.h:349:16
    psz_type*: cstring
    psz_name*: cstring
    psz_header*: cstring
    psz_message*: cstring
  log_message_t* = struct_log_message_t ## Generated based on /usr/include/vlc/deprecated.h:356:3
  struct_IO_FILE* {.pure, inheritable, bycopy.} = object
    internal_flags*: cint    ## Generated based on /usr/include/bits/types/struct_FILE.h:49:8
    internal_IO_read_ptr*: cstring
    internal_IO_read_end*: cstring
    internal_IO_read_base*: cstring
    internal_IO_write_base*: cstring
    internal_IO_write_ptr*: cstring
    internal_IO_write_end*: cstring
    internal_IO_buf_base*: cstring
    internal_IO_buf_end*: cstring
    internal_IO_save_base*: cstring
    internal_IO_backup_base*: cstring
    internal_IO_save_end*: cstring
    internal_markers*: ptr struct_IO_marker
    internal_chain*: ptr struct_IO_FILE
    internal_fileno*: cint
    internal_flags2*: cint
    internal_old_offset*: compiler_off_t
    internal_cur_column*: cushort
    internal_vtable_offset*: cschar
    internal_shortbuf*: array[1'i64, cschar]
    internal_lock*: pointer
    internal_offset*: compiler_off64_t
    internal_codecvt*: ptr struct_IO_codecvt
    internal_wide_data*: ptr struct_IO_wide_data
    internal_freeres_list*: ptr struct_IO_FILE
    internal_freeres_buf*: pointer
    internal_prevchain*: ptr ptr struct_IO_FILE
    internal_mode*: cint
    internal_unused2*: array[20'i64, cschar]
  compiler_ssize_t* = clong  ## Generated based on /usr/include/bits/types.h:194:27
  compiler_off_t* = clong    ## Generated based on /usr/include/bits/types.h:152:25
  compiler_off64_t* = clong  ## Generated based on /usr/include/bits/types.h:153:27
when 1 is static:
  const
    VLC_LIBVLC_H* = 1        ## Generated based on /usr/include/vlc/libvlc.h:36:9
else:
  let VLC_LIBVLC_H* = 1      ## Generated based on /usr/include/vlc/libvlc.h:36:9
when 1 is static:
  const
    VLC_LIBVLC_RENDERER_DISCOVERER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:22:9
else:
  let VLC_LIBVLC_RENDERER_DISCOVERER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:22:9
when 1 is static:
  const
    LIBVLC_RENDERER_CAN_AUDIO* = 1 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:52:9
else:
  let LIBVLC_RENDERER_CAN_AUDIO* = 1 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:52:9
when 2 is static:
  const
    LIBVLC_RENDERER_CAN_VIDEO* = 2 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:54:9
else:
  let LIBVLC_RENDERER_CAN_VIDEO* = 2 ## Generated based on /usr/include/vlc/libvlc_renderer_discoverer.h:54:9
when 1 is static:
  const
    VLC_LIBVLC_MEDIA_H* = 1  ## Generated based on /usr/include/vlc/libvlc_media.h:27:9
else:
  let VLC_LIBVLC_MEDIA_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media.h:27:9
when 1 is static:
  const
    VLC_LIBVLC_MEDIA_PLAYER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_player.h:27:9
else:
  let VLC_LIBVLC_MEDIA_PLAYER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_player.h:27:9
when 1 is static:
  const
    LIBVLC_MEDIA_LIST_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_list.h:25:9
else:
  let LIBVLC_MEDIA_LIST_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_list.h:25:9
when 1 is static:
  const
    LIBVLC_MEDIA_LIST_PLAYER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_list_player.h:25:9
else:
  let LIBVLC_MEDIA_LIST_PLAYER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_list_player.h:25:9
when 1 is static:
  const
    VLC_LIBVLC_MEDIA_LIBRARY_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_library.h:27:9
else:
  let VLC_LIBVLC_MEDIA_LIBRARY_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_library.h:27:9
when 1 is static:
  const
    VLC_LIBVLC_MEDIA_DISCOVERER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:27:9
else:
  let VLC_LIBVLC_MEDIA_DISCOVERER_H* = 1 ## Generated based on /usr/include/vlc/libvlc_media_discoverer.h:27:9
when 1 is static:
  const
    LIBVLC_EVENTS_H* = 1     ## Generated based on /usr/include/vlc/libvlc_events.h:26:9
else:
  let LIBVLC_EVENTS_H* = 1   ## Generated based on /usr/include/vlc/libvlc_events.h:26:9
when 1 is static:
  const
    LIBVLC_DIALOG_H* = 1     ## Generated based on /usr/include/vlc/libvlc_dialog.h:22:9
else:
  let LIBVLC_DIALOG_H* = 1   ## Generated based on /usr/include/vlc/libvlc_dialog.h:22:9
when 1 is static:
  const
    LIBVLC_VLM_H* = 1        ## Generated based on /usr/include/vlc/libvlc_vlm.h:26:9
else:
  let LIBVLC_VLM_H* = 1      ## Generated based on /usr/include/vlc/libvlc_vlm.h:26:9
when 1 is static:
  const
    LIBVLC_DEPRECATED_H* = 1 ## Generated based on /usr/include/vlc/deprecated.h:26:9
else:
  let LIBVLC_DEPRECATED_H* = 1 ## Generated based on /usr/include/vlc/deprecated.h:26:9
proc errmsg*(): cstring {.cdecl, importc: "libvlc_errmsg".}
proc clearerr*(): void {.cdecl, importc: "libvlc_clearerr".}
proc vprinterr*(fmt: cstring): cstring {.cdecl, varargs,
    importc: "libvlc_vprinterr".}
proc printerr*(fmt: cstring): cstring {.cdecl, varargs,
                                        importc: "libvlc_printerr".}
proc instance_new*(argc: cint; argv: ptr cstring): ptr instance_t {.cdecl,
    importc: "libvlc_new".}
proc instance_release*(p_instance: ptr instance_t): void {.cdecl,
    importc: "libvlc_release".}
proc instance_retain*(p_instance: ptr instance_t): void {.cdecl,
    importc: "libvlc_retain".}
proc add_intf*(p_instance: ptr instance_t; name: cstring): cint {.cdecl,
    importc: "libvlc_add_intf".}
proc set_exit_handler*(p_instance: ptr instance_t;
                       cb: proc (a0: pointer): void {.cdecl.}; opaque: pointer): void {.
    cdecl, importc: "libvlc_set_exit_handler".}
proc set_user_agent*(p_instance: ptr instance_t; name: cstring; http: cstring): void {.
    cdecl, importc: "libvlc_set_user_agent".}
proc set_app_id*(p_instance: ptr instance_t; id: cstring; version: cstring;
                 icon: cstring): void {.cdecl, importc: "libvlc_set_app_id".}
proc get_version*(): cstring {.cdecl, importc: "libvlc_get_version".}
proc get_compiler*(): cstring {.cdecl, importc: "libvlc_get_compiler".}
proc get_changeset*(): cstring {.cdecl, importc: "libvlc_get_changeset".}
proc free*(ptr_arg: pointer): void {.cdecl, importc: "libvlc_free".}
proc event_attach*(p_event_manager: ptr event_manager_t;
                   i_event_type: event_type_t; f_callback: callback_t;
                   user_data: pointer): cint {.cdecl,
    importc: "libvlc_event_attach".}
proc event_detach*(p_event_manager: ptr event_manager_t;
                   i_event_type: event_type_t; f_callback: callback_t;
                   p_user_data: pointer): void {.cdecl,
    importc: "libvlc_event_detach".}
proc event_type_name*(event_type: event_type_t): cstring {.cdecl,
    importc: "libvlc_event_type_name".}
proc log_get_context*(ctx: ptr log_t; module: ptr cstring; file: ptr cstring;
                      line: ptr cuint): void {.cdecl,
    importc: "libvlc_log_get_context".}
proc log_get_object*(ctx: ptr log_t; name: ptr cstring; header: ptr cstring;
                     id: ptr uintptr_t): void {.cdecl,
    importc: "libvlc_log_get_object".}
proc log_unset*(p_instance: ptr instance_t): void {.cdecl,
    importc: "libvlc_log_unset".}
proc log_set*(p_instance: ptr instance_t; cb: log_cb; data: pointer): void {.
    cdecl, importc: "libvlc_log_set".}
proc log_set_file*(p_instance: ptr instance_t; stream: ptr FILE): void {.cdecl,
    importc: "libvlc_log_set_file".}
proc module_description_list_release*(p_list: ptr module_description_t): void {.
    cdecl, importc: "libvlc_module_description_list_release".}
proc audio_filter_list_get*(p_instance: ptr instance_t): ptr module_description_t {.
    cdecl, importc: "libvlc_audio_filter_list_get".}
proc video_filter_list_get*(p_instance: ptr instance_t): ptr module_description_t {.
    cdecl, importc: "libvlc_video_filter_list_get".}
proc clock*(): int64 {.cdecl, importc: "libvlc_clock".}
proc renderer_item_hold*(p_item: ptr renderer_item_t): ptr renderer_item_t {.
    cdecl, importc: "libvlc_renderer_item_hold".}
proc renderer_item_release*(p_item: ptr renderer_item_t): void {.cdecl,
    importc: "libvlc_renderer_item_release".}
proc renderer_item_name*(p_item: ptr renderer_item_t): cstring {.cdecl,
    importc: "libvlc_renderer_item_name".}
proc renderer_item_type*(p_item: ptr renderer_item_t): cstring {.cdecl,
    importc: "libvlc_renderer_item_type".}
proc renderer_item_icon_uri*(p_item: ptr renderer_item_t): cstring {.cdecl,
    importc: "libvlc_renderer_item_icon_uri".}
proc renderer_item_flags*(p_item: ptr renderer_item_t): cint {.cdecl,
    importc: "libvlc_renderer_item_flags".}
proc renderer_discoverer_new*(p_inst: ptr instance_t; psz_name: cstring): ptr renderer_discoverer_t {.
    cdecl, importc: "libvlc_renderer_discoverer_new".}
proc renderer_discoverer_release*(p_rd: ptr renderer_discoverer_t): void {.
    cdecl, importc: "libvlc_renderer_discoverer_release".}
proc renderer_discoverer_start*(p_rd: ptr renderer_discoverer_t): cint {.cdecl,
    importc: "libvlc_renderer_discoverer_start".}
proc renderer_discoverer_stop*(p_rd: ptr renderer_discoverer_t): void {.cdecl,
    importc: "libvlc_renderer_discoverer_stop".}
proc renderer_discoverer_event_manager*(p_rd: ptr renderer_discoverer_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_renderer_discoverer_event_manager".}
proc renderer_discoverer_list_get*(p_inst: ptr instance_t;
                                   ppp_services: ptr ptr ptr rd_description_t): csize_t {.
    cdecl, importc: "libvlc_renderer_discoverer_list_get".}
proc renderer_discoverer_list_release*(pp_services: ptr ptr rd_description_t;
                                       i_count: csize_t): void {.cdecl,
    importc: "libvlc_renderer_discoverer_list_release".}
proc media_new_location*(p_instance: ptr instance_t; psz_mrl: cstring): ptr media_t {.
    cdecl, importc: "libvlc_media_new_location".}
proc media_new_path*(p_instance: ptr instance_t; path: cstring): ptr media_t {.
    cdecl, importc: "libvlc_media_new_path".}
proc media_new_fd*(p_instance: ptr instance_t; fd: cint): ptr media_t {.cdecl,
    importc: "libvlc_media_new_fd".}
proc media_new_callbacks*(instance: ptr instance_t; open_cb: media_open_cb;
                          read_cb: media_read_cb; seek_cb: media_seek_cb;
                          close_cb: media_close_cb; opaque: pointer): ptr media_t {.
    cdecl, importc: "libvlc_media_new_callbacks".}
proc media_new_as_node*(p_instance: ptr instance_t; psz_name: cstring): ptr media_t {.
    cdecl, importc: "libvlc_media_new_as_node".}
proc media_add_option*(p_md: ptr media_t; psz_options: cstring): void {.cdecl,
    importc: "libvlc_media_add_option".}
proc media_add_option_flag*(p_md: ptr media_t; psz_options: cstring;
                            i_flags: cuint): void {.cdecl,
    importc: "libvlc_media_add_option_flag".}
proc media_retain*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_retain".}
proc media_release*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_release".}
proc media_get_mrl*(p_md: ptr media_t): cstring {.cdecl,
    importc: "libvlc_media_get_mrl".}
proc media_duplicate*(p_md: ptr media_t): ptr media_t {.cdecl,
    importc: "libvlc_media_duplicate".}
proc media_get_meta*(p_md: ptr media_t; e_meta: meta_t): cstring {.cdecl,
    importc: "libvlc_media_get_meta".}
proc media_set_meta*(p_md: ptr media_t; e_meta: meta_t; psz_value: cstring): void {.
    cdecl, importc: "libvlc_media_set_meta".}
proc media_save_meta*(p_md: ptr media_t): cint {.cdecl,
    importc: "libvlc_media_save_meta".}
proc media_get_state*(p_md: ptr media_t): state_t {.cdecl,
    importc: "libvlc_media_get_state".}
proc media_get_stats*(p_md: ptr media_t; p_stats: ptr media_stats_t): cint {.
    cdecl, importc: "libvlc_media_get_stats".}
proc media_subitems*(p_md: ptr media_t): ptr struct_media_list_t {.cdecl,
    importc: "libvlc_media_subitems".}
proc media_event_manager*(p_md: ptr media_t): ptr event_manager_t {.cdecl,
    importc: "libvlc_media_event_manager".}
proc media_get_duration*(p_md: ptr media_t): time_t {.cdecl,
    importc: "libvlc_media_get_duration".}
proc media_parse_with_options*(p_md: ptr media_t;
                               parse_flag: media_parse_flag_t; timeout: cint): cint {.
    cdecl, importc: "libvlc_media_parse_with_options".}
proc media_parse_stop*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_parse_stop".}
proc media_get_parsed_status*(p_md: ptr media_t): media_parsed_status_t {.cdecl,
    importc: "libvlc_media_get_parsed_status".}
proc media_set_user_data*(p_md: ptr media_t; p_new_user_data: pointer): void {.
    cdecl, importc: "libvlc_media_set_user_data".}
proc media_get_user_data*(p_md: ptr media_t): pointer {.cdecl,
    importc: "libvlc_media_get_user_data".}
proc media_tracks_get*(p_md: ptr media_t; tracks: ptr ptr ptr media_track_t): cuint {.
    cdecl, importc: "libvlc_media_tracks_get".}
proc media_get_codec_description*(i_type: track_type_t; i_codec: uint32): cstring {.
    cdecl, importc: "libvlc_media_get_codec_description".}
proc media_tracks_release*(p_tracks: ptr ptr media_track_t; i_count: cuint): void {.
    cdecl, importc: "libvlc_media_tracks_release".}
proc media_get_type*(p_md: ptr media_t): media_type_t {.cdecl,
    importc: "libvlc_media_get_type".}
proc media_slaves_add*(p_md: ptr media_t; i_type: media_slave_type_t;
                       i_priority: cuint; psz_uri: cstring): cint {.cdecl,
    importc: "libvlc_media_slaves_add".}
proc media_slaves_clear*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_slaves_clear".}
proc media_slaves_get*(p_md: ptr media_t; ppp_slaves: ptr ptr ptr media_slave_t): cuint {.
    cdecl, importc: "libvlc_media_slaves_get".}
proc media_slaves_release*(pp_slaves: ptr ptr media_slave_t; i_count: cuint): void {.
    cdecl, importc: "libvlc_media_slaves_release".}
proc media_player_new*(p_instance: ptr instance_t): ptr media_player_t {.cdecl,
    importc: "libvlc_media_player_new".}
proc media_player_new_from_media*(p_md: ptr media_t): ptr media_player_t {.
    cdecl, importc: "libvlc_media_player_new_from_media".}
proc media_player_release*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_release".}
proc media_player_retain*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_retain".}
proc media_player_set_media*(p_mi: ptr media_player_t; p_md: ptr media_t): void {.
    cdecl, importc: "libvlc_media_player_set_media".}
proc media_player_get_media*(p_mi: ptr media_player_t): ptr media_t {.cdecl,
    importc: "libvlc_media_player_get_media".}
proc media_player_event_manager*(p_mi: ptr media_player_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_media_player_event_manager".}
proc media_player_is_playing*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_is_playing".}
proc media_player_play*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_play".}
proc media_player_set_pause*(mp: ptr media_player_t; do_pause: cint): void {.
    cdecl, importc: "libvlc_media_player_set_pause".}
proc media_player_pause*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_pause".}
proc media_player_stop*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_stop".}
proc media_player_set_renderer*(p_mi: ptr media_player_t;
                                p_item: ptr renderer_item_t): cint {.cdecl,
    importc: "libvlc_media_player_set_renderer".}
proc video_set_callbacks*(mp: ptr media_player_t; lock: video_lock_cb;
                          unlock: video_unlock_cb; display: video_display_cb;
                          opaque: pointer): void {.cdecl,
    importc: "libvlc_video_set_callbacks".}
proc video_set_format*(mp: ptr media_player_t; chroma: cstring; width: cuint;
                       height: cuint; pitch: cuint): void {.cdecl,
    importc: "libvlc_video_set_format".}
proc video_set_format_callbacks*(mp: ptr media_player_t; setup: video_format_cb;
                                 cleanup: video_cleanup_cb): void {.cdecl,
    importc: "libvlc_video_set_format_callbacks".}
proc media_player_set_nsobject*(p_mi: ptr media_player_t; drawable: pointer): void {.
    cdecl, importc: "libvlc_media_player_set_nsobject".}
proc media_player_get_nsobject*(p_mi: ptr media_player_t): pointer {.cdecl,
    importc: "libvlc_media_player_get_nsobject".}
proc media_player_set_xwindow*(p_mi: ptr media_player_t; drawable: uint32): void {.
    cdecl, importc: "libvlc_media_player_set_xwindow".}
proc media_player_get_xwindow*(p_mi: ptr media_player_t): uint32 {.cdecl,
    importc: "libvlc_media_player_get_xwindow".}
proc media_player_set_hwnd*(p_mi: ptr media_player_t; drawable: pointer): void {.
    cdecl, importc: "libvlc_media_player_set_hwnd".}
proc media_player_get_hwnd*(p_mi: ptr media_player_t): pointer {.cdecl,
    importc: "libvlc_media_player_get_hwnd".}
proc media_player_set_android_context*(p_mi: ptr media_player_t;
                                       p_awindow_handler: pointer): void {.
    cdecl, importc: "libvlc_media_player_set_android_context".}
proc media_player_set_evas_object*(p_mi: ptr media_player_t;
                                   p_evas_object: pointer): cint {.cdecl,
    importc: "libvlc_media_player_set_evas_object".}
proc audio_set_callbacks*(mp: ptr media_player_t; play: audio_play_cb;
                          pause: audio_pause_cb; resume: audio_resume_cb;
                          flush: audio_flush_cb; drain: audio_drain_cb;
                          opaque: pointer): void {.cdecl,
    importc: "libvlc_audio_set_callbacks".}
proc audio_set_volume_callback*(mp: ptr media_player_t;
                                set_volume: audio_set_volume_cb): void {.cdecl,
    importc: "libvlc_audio_set_volume_callback".}
proc audio_set_format_callbacks*(mp: ptr media_player_t; setup: audio_setup_cb;
                                 cleanup: audio_cleanup_cb): void {.cdecl,
    importc: "libvlc_audio_set_format_callbacks".}
proc audio_set_format*(mp: ptr media_player_t; format: cstring; rate: cuint;
                       channels: cuint): void {.cdecl,
    importc: "libvlc_audio_set_format".}
proc media_player_get_length*(p_mi: ptr media_player_t): time_t {.cdecl,
    importc: "libvlc_media_player_get_length".}
proc media_player_get_time*(p_mi: ptr media_player_t): time_t {.cdecl,
    importc: "libvlc_media_player_get_time".}
proc media_player_set_time*(p_mi: ptr media_player_t; i_time: time_t): void {.
    cdecl, importc: "libvlc_media_player_set_time".}
proc media_player_get_position*(p_mi: ptr media_player_t): cfloat {.cdecl,
    importc: "libvlc_media_player_get_position".}
proc media_player_set_position*(p_mi: ptr media_player_t; f_pos: cfloat): void {.
    cdecl, importc: "libvlc_media_player_set_position".}
proc media_player_set_chapter*(p_mi: ptr media_player_t; i_chapter: cint): void {.
    cdecl, importc: "libvlc_media_player_set_chapter".}
proc media_player_get_chapter*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_get_chapter".}
proc media_player_get_chapter_count*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_get_chapter_count".}
proc media_player_will_play*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_will_play".}
proc media_player_get_chapter_count_for_title*(p_mi: ptr media_player_t;
    i_title: cint): cint {.cdecl, importc: "libvlc_media_player_get_chapter_count_for_title".}
proc media_player_set_title*(p_mi: ptr media_player_t; i_title: cint): void {.
    cdecl, importc: "libvlc_media_player_set_title".}
proc media_player_get_title*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_get_title".}
proc media_player_get_title_count*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_get_title_count".}
proc media_player_previous_chapter*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_previous_chapter".}
proc media_player_next_chapter*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_next_chapter".}
proc media_player_get_rate*(p_mi: ptr media_player_t): cfloat {.cdecl,
    importc: "libvlc_media_player_get_rate".}
proc media_player_set_rate*(p_mi: ptr media_player_t; rate: cfloat): cint {.
    cdecl, importc: "libvlc_media_player_set_rate".}
proc media_player_get_state*(p_mi: ptr media_player_t): state_t {.cdecl,
    importc: "libvlc_media_player_get_state".}
proc media_player_has_vout*(p_mi: ptr media_player_t): cuint {.cdecl,
    importc: "libvlc_media_player_has_vout".}
proc media_player_is_seekable*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_is_seekable".}
proc media_player_can_pause*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_can_pause".}
proc media_player_program_scrambled*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_program_scrambled".}
proc media_player_next_frame*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_media_player_next_frame".}
proc media_player_navigate*(p_mi: ptr media_player_t; navigate: cuint): void {.
    cdecl, importc: "libvlc_media_player_navigate".}
proc media_player_set_video_title_display*(p_mi: ptr media_player_t;
    position: position_t; timeout: cuint): void {.cdecl,
    importc: "libvlc_media_player_set_video_title_display".}
proc media_player_add_slave*(p_mi: ptr media_player_t;
                             i_type: media_slave_type_t; psz_uri: cstring;
                             b_select: bool): cint {.cdecl,
    importc: "libvlc_media_player_add_slave".}
proc track_description_list_release*(p_track_description: ptr track_description_t): void {.
    cdecl, importc: "libvlc_track_description_list_release".}
proc toggle_fullscreen*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_toggle_fullscreen".}
proc set_fullscreen*(p_mi: ptr media_player_t; b_fullscreen: cint): void {.
    cdecl, importc: "libvlc_set_fullscreen".}
proc get_fullscreen*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_get_fullscreen".}
proc video_set_key_input*(p_mi: ptr media_player_t; on: cuint): void {.cdecl,
    importc: "libvlc_video_set_key_input".}
proc video_set_mouse_input*(p_mi: ptr media_player_t; on: cuint): void {.cdecl,
    importc: "libvlc_video_set_mouse_input".}
proc video_get_size*(p_mi: ptr media_player_t; num: cuint; px: ptr cuint;
                     py: ptr cuint): cint {.cdecl,
    importc: "libvlc_video_get_size".}
proc video_get_cursor*(p_mi: ptr media_player_t; num: cuint; px: ptr cint;
                       py: ptr cint): cint {.cdecl,
    importc: "libvlc_video_get_cursor".}
proc video_get_scale*(p_mi: ptr media_player_t): cfloat {.cdecl,
    importc: "libvlc_video_get_scale".}
proc video_set_scale*(p_mi: ptr media_player_t; f_factor: cfloat): void {.cdecl,
    importc: "libvlc_video_set_scale".}
proc video_get_aspect_ratio*(p_mi: ptr media_player_t): cstring {.cdecl,
    importc: "libvlc_video_get_aspect_ratio".}
proc video_set_aspect_ratio*(p_mi: ptr media_player_t; psz_aspect: cstring): void {.
    cdecl, importc: "libvlc_video_set_aspect_ratio".}
proc video_new_viewpoint*(): ptr video_viewpoint_t {.cdecl,
    importc: "libvlc_video_new_viewpoint".}
proc video_update_viewpoint*(p_mi: ptr media_player_t;
                             p_viewpoint: ptr video_viewpoint_t;
                             b_absolute: bool): cint {.cdecl,
    importc: "libvlc_video_update_viewpoint".}
proc video_get_spu*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_spu".}
proc video_get_spu_count*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_spu_count".}
proc video_get_spu_description*(p_mi: ptr media_player_t): ptr track_description_t {.
    cdecl, importc: "libvlc_video_get_spu_description".}
proc video_set_spu*(p_mi: ptr media_player_t; i_spu: cint): cint {.cdecl,
    importc: "libvlc_video_set_spu".}
proc video_get_spu_delay*(p_mi: ptr media_player_t): int64 {.cdecl,
    importc: "libvlc_video_get_spu_delay".}
proc video_set_spu_delay*(p_mi: ptr media_player_t; i_delay: int64): cint {.
    cdecl, importc: "libvlc_video_set_spu_delay".}
proc media_player_get_full_title_descriptions*(p_mi: ptr media_player_t;
    titles: ptr ptr ptr title_description_t): cint {.cdecl,
    importc: "libvlc_media_player_get_full_title_descriptions".}
proc title_descriptions_release*(p_titles: ptr ptr title_description_t;
                                 i_count: cuint): void {.cdecl,
    importc: "libvlc_title_descriptions_release".}
proc media_player_get_full_chapter_descriptions*(p_mi: ptr media_player_t;
    i_chapters_of_title: cint; pp_chapters: ptr ptr ptr chapter_description_t): cint {.
    cdecl, importc: "libvlc_media_player_get_full_chapter_descriptions".}
proc chapter_descriptions_release*(p_chapters: ptr ptr chapter_description_t;
                                   i_count: cuint): void {.cdecl,
    importc: "libvlc_chapter_descriptions_release".}
proc video_get_crop_geometry*(p_mi: ptr media_player_t): cstring {.cdecl,
    importc: "libvlc_video_get_crop_geometry".}
proc video_set_crop_geometry*(p_mi: ptr media_player_t; psz_geometry: cstring): void {.
    cdecl, importc: "libvlc_video_set_crop_geometry".}
proc video_get_teletext*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_teletext".}
proc video_set_teletext*(p_mi: ptr media_player_t; i_page: cint): void {.cdecl,
    importc: "libvlc_video_set_teletext".}
proc video_get_track_count*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_track_count".}
proc video_get_track_description*(p_mi: ptr media_player_t): ptr track_description_t {.
    cdecl, importc: "libvlc_video_get_track_description".}
proc video_get_track*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_track".}
proc video_set_track*(p_mi: ptr media_player_t; i_track: cint): cint {.cdecl,
    importc: "libvlc_video_set_track".}
proc video_take_snapshot*(p_mi: ptr media_player_t; num: cuint;
                          psz_filepath: cstring; i_width: cuint; i_height: cuint): cint {.
    cdecl, importc: "libvlc_video_take_snapshot".}
proc video_set_deinterlace*(p_mi: ptr media_player_t; psz_mode: cstring): void {.
    cdecl, importc: "libvlc_video_set_deinterlace".}
proc video_get_marquee_int*(p_mi: ptr media_player_t; option: cuint): cint {.
    cdecl, importc: "libvlc_video_get_marquee_int".}
proc video_get_marquee_string*(p_mi: ptr media_player_t; option: cuint): cstring {.
    cdecl, importc: "libvlc_video_get_marquee_string".}
proc video_set_marquee_int*(p_mi: ptr media_player_t; option: cuint; i_val: cint): void {.
    cdecl, importc: "libvlc_video_set_marquee_int".}
proc video_set_marquee_string*(p_mi: ptr media_player_t; option: cuint;
                               psz_text: cstring): void {.cdecl,
    importc: "libvlc_video_set_marquee_string".}
proc video_get_logo_int*(p_mi: ptr media_player_t; option: cuint): cint {.cdecl,
    importc: "libvlc_video_get_logo_int".}
proc video_set_logo_int*(p_mi: ptr media_player_t; option: cuint; value: cint): void {.
    cdecl, importc: "libvlc_video_set_logo_int".}
proc video_set_logo_string*(p_mi: ptr media_player_t; option: cuint;
                            psz_value: cstring): void {.cdecl,
    importc: "libvlc_video_set_logo_string".}
proc video_get_adjust_int*(p_mi: ptr media_player_t; option: cuint): cint {.
    cdecl, importc: "libvlc_video_get_adjust_int".}
proc video_set_adjust_int*(p_mi: ptr media_player_t; option: cuint; value: cint): void {.
    cdecl, importc: "libvlc_video_set_adjust_int".}
proc video_get_adjust_float*(p_mi: ptr media_player_t; option: cuint): cfloat {.
    cdecl, importc: "libvlc_video_get_adjust_float".}
proc video_set_adjust_float*(p_mi: ptr media_player_t; option: cuint;
                             value: cfloat): void {.cdecl,
    importc: "libvlc_video_set_adjust_float".}
proc audio_output_list_get*(p_instance: ptr instance_t): ptr audio_output_t {.
    cdecl, importc: "libvlc_audio_output_list_get".}
proc audio_output_list_release*(p_list: ptr audio_output_t): void {.cdecl,
    importc: "libvlc_audio_output_list_release".}
proc audio_output_set*(p_mi: ptr media_player_t; psz_name: cstring): cint {.
    cdecl, importc: "libvlc_audio_output_set".}
proc audio_output_device_enum*(mp: ptr media_player_t): ptr audio_output_device_t {.
    cdecl, importc: "libvlc_audio_output_device_enum".}
proc audio_output_device_list_get*(p_instance: ptr instance_t; aout: cstring): ptr audio_output_device_t {.
    cdecl, importc: "libvlc_audio_output_device_list_get".}
proc audio_output_device_list_release*(p_list: ptr audio_output_device_t): void {.
    cdecl, importc: "libvlc_audio_output_device_list_release".}
proc audio_output_device_set*(mp: ptr media_player_t; module: cstring;
                              device_id: cstring): void {.cdecl,
    importc: "libvlc_audio_output_device_set".}
proc audio_output_device_get*(mp: ptr media_player_t): cstring {.cdecl,
    importc: "libvlc_audio_output_device_get".}
proc audio_toggle_mute*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_audio_toggle_mute".}
proc audio_get_mute*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_get_mute".}
proc audio_set_mute*(p_mi: ptr media_player_t; status: cint): void {.cdecl,
    importc: "libvlc_audio_set_mute".}
proc audio_get_volume*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_get_volume".}
proc audio_set_volume*(p_mi: ptr media_player_t; i_volume: cint): cint {.cdecl,
    importc: "libvlc_audio_set_volume".}
proc audio_get_track_count*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_get_track_count".}
proc audio_get_track_description*(p_mi: ptr media_player_t): ptr track_description_t {.
    cdecl, importc: "libvlc_audio_get_track_description".}
proc audio_get_track*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_get_track".}
proc audio_set_track*(p_mi: ptr media_player_t; i_track: cint): cint {.cdecl,
    importc: "libvlc_audio_set_track".}
proc audio_get_channel*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_get_channel".}
proc audio_set_channel*(p_mi: ptr media_player_t; channel: cint): cint {.cdecl,
    importc: "libvlc_audio_set_channel".}
proc audio_get_delay*(p_mi: ptr media_player_t): int64 {.cdecl,
    importc: "libvlc_audio_get_delay".}
proc audio_set_delay*(p_mi: ptr media_player_t; i_delay: int64): cint {.cdecl,
    importc: "libvlc_audio_set_delay".}
proc audio_equalizer_get_preset_count*(): cuint {.cdecl,
    importc: "libvlc_audio_equalizer_get_preset_count".}
proc audio_equalizer_get_preset_name*(u_index: cuint): cstring {.cdecl,
    importc: "libvlc_audio_equalizer_get_preset_name".}
proc audio_equalizer_get_band_count*(): cuint {.cdecl,
    importc: "libvlc_audio_equalizer_get_band_count".}
proc audio_equalizer_get_band_frequency*(u_index: cuint): cfloat {.cdecl,
    importc: "libvlc_audio_equalizer_get_band_frequency".}
proc audio_equalizer_new*(): ptr equalizer_t {.cdecl,
    importc: "libvlc_audio_equalizer_new".}
proc audio_equalizer_new_from_preset*(u_index: cuint): ptr equalizer_t {.cdecl,
    importc: "libvlc_audio_equalizer_new_from_preset".}
proc audio_equalizer_release*(p_equalizer: ptr equalizer_t): void {.cdecl,
    importc: "libvlc_audio_equalizer_release".}
proc audio_equalizer_set_preamp*(p_equalizer: ptr equalizer_t; f_preamp: cfloat): cint {.
    cdecl, importc: "libvlc_audio_equalizer_set_preamp".}
proc audio_equalizer_get_preamp*(p_equalizer: ptr equalizer_t): cfloat {.cdecl,
    importc: "libvlc_audio_equalizer_get_preamp".}
proc audio_equalizer_set_amp_at_index*(p_equalizer: ptr equalizer_t;
                                       f_amp: cfloat; u_band: cuint): cint {.
    cdecl, importc: "libvlc_audio_equalizer_set_amp_at_index".}
proc audio_equalizer_get_amp_at_index*(p_equalizer: ptr equalizer_t;
                                       u_band: cuint): cfloat {.cdecl,
    importc: "libvlc_audio_equalizer_get_amp_at_index".}
proc media_player_set_equalizer*(p_mi: ptr media_player_t;
                                 p_equalizer: ptr equalizer_t): cint {.cdecl,
    importc: "libvlc_media_player_set_equalizer".}
proc media_player_get_role*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_media_player_get_role".}
proc media_player_set_role*(p_mi: ptr media_player_t; role: cuint): cint {.
    cdecl, importc: "libvlc_media_player_set_role".}
proc media_list_new*(p_instance: ptr instance_t): ptr media_list_t {.cdecl,
    importc: "libvlc_media_list_new".}
proc media_list_release*(p_ml: ptr media_list_t): void {.cdecl,
    importc: "libvlc_media_list_release".}
proc media_list_retain*(p_ml: ptr media_list_t): void {.cdecl,
    importc: "libvlc_media_list_retain".}
proc media_list_set_media*(p_ml: ptr media_list_t; p_md: ptr media_t): void {.
    cdecl, importc: "libvlc_media_list_set_media".}
proc media_list_media*(p_ml: ptr media_list_t): ptr media_t {.cdecl,
    importc: "libvlc_media_list_media".}
proc media_list_add_media*(p_ml: ptr media_list_t; p_md: ptr media_t): cint {.
    cdecl, importc: "libvlc_media_list_add_media".}
proc media_list_insert_media*(p_ml: ptr media_list_t; p_md: ptr media_t;
                              i_pos: cint): cint {.cdecl,
    importc: "libvlc_media_list_insert_media".}
proc media_list_remove_index*(p_ml: ptr media_list_t; i_pos: cint): cint {.
    cdecl, importc: "libvlc_media_list_remove_index".}
proc media_list_count*(p_ml: ptr media_list_t): cint {.cdecl,
    importc: "libvlc_media_list_count".}
proc media_list_item_at_index*(p_ml: ptr media_list_t; i_pos: cint): ptr media_t {.
    cdecl, importc: "libvlc_media_list_item_at_index".}
proc media_list_index_of_item*(p_ml: ptr media_list_t; p_md: ptr media_t): cint {.
    cdecl, importc: "libvlc_media_list_index_of_item".}
proc media_list_is_readonly*(p_ml: ptr media_list_t): cint {.cdecl,
    importc: "libvlc_media_list_is_readonly".}
proc media_list_lock*(p_ml: ptr media_list_t): void {.cdecl,
    importc: "libvlc_media_list_lock".}
proc media_list_unlock*(p_ml: ptr media_list_t): void {.cdecl,
    importc: "libvlc_media_list_unlock".}
proc media_list_event_manager*(p_ml: ptr media_list_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_media_list_event_manager".}
proc media_list_player_new*(p_instance: ptr instance_t): ptr media_list_player_t {.
    cdecl, importc: "libvlc_media_list_player_new".}
proc media_list_player_release*(p_mlp: ptr media_list_player_t): void {.cdecl,
    importc: "libvlc_media_list_player_release".}
proc media_list_player_retain*(p_mlp: ptr media_list_player_t): void {.cdecl,
    importc: "libvlc_media_list_player_retain".}
proc media_list_player_event_manager*(p_mlp: ptr media_list_player_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_media_list_player_event_manager".}
proc media_list_player_set_media_player*(p_mlp: ptr media_list_player_t;
    p_mi: ptr media_player_t): void {.cdecl, importc: "libvlc_media_list_player_set_media_player".}
proc media_list_player_get_media_player*(p_mlp: ptr media_list_player_t): ptr media_player_t {.
    cdecl, importc: "libvlc_media_list_player_get_media_player".}
proc media_list_player_set_media_list*(p_mlp: ptr media_list_player_t;
                                       p_mlist: ptr media_list_t): void {.cdecl,
    importc: "libvlc_media_list_player_set_media_list".}
proc media_list_player_play*(p_mlp: ptr media_list_player_t): void {.cdecl,
    importc: "libvlc_media_list_player_play".}
proc media_list_player_pause*(p_mlp: ptr media_list_player_t): void {.cdecl,
    importc: "libvlc_media_list_player_pause".}
proc media_list_player_set_pause*(p_mlp: ptr media_list_player_t; do_pause: cint): void {.
    cdecl, importc: "libvlc_media_list_player_set_pause".}
proc media_list_player_is_playing*(p_mlp: ptr media_list_player_t): cint {.
    cdecl, importc: "libvlc_media_list_player_is_playing".}
proc media_list_player_get_state*(p_mlp: ptr media_list_player_t): state_t {.
    cdecl, importc: "libvlc_media_list_player_get_state".}
proc media_list_player_play_item_at_index*(p_mlp: ptr media_list_player_t;
    i_index: cint): cint {.cdecl, importc: "libvlc_media_list_player_play_item_at_index".}
proc media_list_player_play_item*(p_mlp: ptr media_list_player_t;
                                  p_md: ptr media_t): cint {.cdecl,
    importc: "libvlc_media_list_player_play_item".}
proc media_list_player_stop*(p_mlp: ptr media_list_player_t): void {.cdecl,
    importc: "libvlc_media_list_player_stop".}
proc media_list_player_next*(p_mlp: ptr media_list_player_t): cint {.cdecl,
    importc: "libvlc_media_list_player_next".}
proc media_list_player_previous*(p_mlp: ptr media_list_player_t): cint {.cdecl,
    importc: "libvlc_media_list_player_previous".}
proc media_list_player_set_playback_mode*(p_mlp: ptr media_list_player_t;
    e_mode: playback_mode_t): void {.cdecl, importc: "libvlc_media_list_player_set_playback_mode".}
proc media_library_new*(p_instance: ptr instance_t): ptr media_library_t {.
    cdecl, importc: "libvlc_media_library_new".}
proc media_library_release*(p_mlib: ptr media_library_t): void {.cdecl,
    importc: "libvlc_media_library_release".}
proc media_library_retain*(p_mlib: ptr media_library_t): void {.cdecl,
    importc: "libvlc_media_library_retain".}
proc media_library_load*(p_mlib: ptr media_library_t): cint {.cdecl,
    importc: "libvlc_media_library_load".}
proc media_library_media_list*(p_mlib: ptr media_library_t): ptr media_list_t {.
    cdecl, importc: "libvlc_media_library_media_list".}
proc media_discoverer_new*(p_inst: ptr instance_t; psz_name: cstring): ptr media_discoverer_t {.
    cdecl, importc: "libvlc_media_discoverer_new".}
proc media_discoverer_start*(p_mdis: ptr media_discoverer_t): cint {.cdecl,
    importc: "libvlc_media_discoverer_start".}
proc media_discoverer_stop*(p_mdis: ptr media_discoverer_t): void {.cdecl,
    importc: "libvlc_media_discoverer_stop".}
proc media_discoverer_release*(p_mdis: ptr media_discoverer_t): void {.cdecl,
    importc: "libvlc_media_discoverer_release".}
proc media_discoverer_media_list*(p_mdis: ptr media_discoverer_t): ptr media_list_t {.
    cdecl, importc: "libvlc_media_discoverer_media_list".}
proc media_discoverer_is_running*(p_mdis: ptr media_discoverer_t): cint {.cdecl,
    importc: "libvlc_media_discoverer_is_running".}
proc media_discoverer_list_get*(p_inst: ptr instance_t;
                                i_cat: media_discoverer_category_t; ppp_services: ptr ptr ptr media_discoverer_description_t): csize_t {.
    cdecl, importc: "libvlc_media_discoverer_list_get".}
proc media_discoverer_list_release*(pp_services: ptr ptr media_discoverer_description_t;
                                    i_count: csize_t): void {.cdecl,
    importc: "libvlc_media_discoverer_list_release".}
proc dialog_set_callbacks*(p_instance: ptr instance_t; p_cbs: ptr dialog_cbs;
                           p_data: pointer): void {.cdecl,
    importc: "libvlc_dialog_set_callbacks".}
proc dialog_set_context*(p_id: ptr dialog_id; p_context: pointer): void {.cdecl,
    importc: "libvlc_dialog_set_context".}
proc dialog_get_context*(p_id: ptr dialog_id): pointer {.cdecl,
    importc: "libvlc_dialog_get_context".}
proc dialog_post_login*(p_id: ptr dialog_id; psz_username: cstring;
                        psz_password: cstring; b_store: bool): cint {.cdecl,
    importc: "libvlc_dialog_post_login".}
proc dialog_post_action*(p_id: ptr dialog_id; i_action: cint): cint {.cdecl,
    importc: "libvlc_dialog_post_action".}
proc dialog_dismiss*(p_id: ptr dialog_id): cint {.cdecl,
    importc: "libvlc_dialog_dismiss".}
proc vlm_release*(p_instance: ptr instance_t): void {.cdecl,
    importc: "libvlc_vlm_release".}
proc vlm_add_broadcast*(p_instance: ptr instance_t; psz_name: cstring;
                        psz_input: cstring; psz_output: cstring;
                        i_options: cint; ppsz_options: ptr cstring;
                        b_enabled: cint; b_loop: cint): cint {.cdecl,
    importc: "libvlc_vlm_add_broadcast".}
proc vlm_add_vod*(p_instance: ptr instance_t; psz_name: cstring;
                  psz_input: cstring; i_options: cint;
                  ppsz_options: ptr cstring; b_enabled: cint; psz_mux: cstring): cint {.
    cdecl, importc: "libvlc_vlm_add_vod".}
proc vlm_del_media*(p_instance: ptr instance_t; psz_name: cstring): cint {.
    cdecl, importc: "libvlc_vlm_del_media".}
proc vlm_set_enabled*(p_instance: ptr instance_t; psz_name: cstring;
                      b_enabled: cint): cint {.cdecl,
    importc: "libvlc_vlm_set_enabled".}
proc vlm_set_output*(p_instance: ptr instance_t; psz_name: cstring;
                     psz_output: cstring): cint {.cdecl,
    importc: "libvlc_vlm_set_output".}
proc vlm_set_input*(p_instance: ptr instance_t; psz_name: cstring;
                    psz_input: cstring): cint {.cdecl,
    importc: "libvlc_vlm_set_input".}
proc vlm_add_input*(p_instance: ptr instance_t; psz_name: cstring;
                    psz_input: cstring): cint {.cdecl,
    importc: "libvlc_vlm_add_input".}
proc vlm_set_loop*(p_instance: ptr instance_t; psz_name: cstring; b_loop: cint): cint {.
    cdecl, importc: "libvlc_vlm_set_loop".}
proc vlm_set_mux*(p_instance: ptr instance_t; psz_name: cstring;
                  psz_mux: cstring): cint {.cdecl, importc: "libvlc_vlm_set_mux".}
proc vlm_change_media*(p_instance: ptr instance_t; psz_name: cstring;
                       psz_input: cstring; psz_output: cstring; i_options: cint;
                       ppsz_options: ptr cstring; b_enabled: cint; b_loop: cint): cint {.
    cdecl, importc: "libvlc_vlm_change_media".}
proc vlm_play_media*(p_instance: ptr instance_t; psz_name: cstring): cint {.
    cdecl, importc: "libvlc_vlm_play_media".}
proc vlm_stop_media*(p_instance: ptr instance_t; psz_name: cstring): cint {.
    cdecl, importc: "libvlc_vlm_stop_media".}
proc vlm_pause_media*(p_instance: ptr instance_t; psz_name: cstring): cint {.
    cdecl, importc: "libvlc_vlm_pause_media".}
proc vlm_seek_media*(p_instance: ptr instance_t; psz_name: cstring;
                     f_percentage: cfloat): cint {.cdecl,
    importc: "libvlc_vlm_seek_media".}
proc vlm_show_media*(p_instance: ptr instance_t; psz_name: cstring): cstring {.
    cdecl, importc: "libvlc_vlm_show_media".}
proc vlm_get_media_instance_position*(p_instance: ptr instance_t;
                                      psz_name: cstring; i_instance: cint): cfloat {.
    cdecl, importc: "libvlc_vlm_get_media_instance_position".}
proc vlm_get_media_instance_time*(p_instance: ptr instance_t; psz_name: cstring;
                                  i_instance: cint): cint {.cdecl,
    importc: "libvlc_vlm_get_media_instance_time".}
proc vlm_get_media_instance_length*(p_instance: ptr instance_t;
                                    psz_name: cstring; i_instance: cint): cint {.
    cdecl, importc: "libvlc_vlm_get_media_instance_length".}
proc vlm_get_media_instance_rate*(p_instance: ptr instance_t; psz_name: cstring;
                                  i_instance: cint): cint {.cdecl,
    importc: "libvlc_vlm_get_media_instance_rate".}
proc vlm_get_event_manager*(p_instance: ptr instance_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_vlm_get_event_manager".}
proc media_player_get_fps*(p_mi: ptr media_player_t): cfloat {.cdecl,
    importc: "libvlc_media_player_get_fps".}
proc media_player_set_agl*(p_mi: ptr media_player_t; drawable: uint32): void {.
    cdecl, importc: "libvlc_media_player_set_agl".}
proc media_player_get_agl*(p_mi: ptr media_player_t): uint32 {.cdecl,
    importc: "libvlc_media_player_get_agl".}
proc track_description_release*(p_track_description: ptr track_description_t): void {.
    cdecl, importc: "libvlc_track_description_release".}
proc video_get_height*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_height".}
proc video_get_width*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_video_get_width".}
proc video_get_title_description*(p_mi: ptr media_player_t): ptr track_description_t {.
    cdecl, importc: "libvlc_video_get_title_description".}
proc video_get_chapter_description*(p_mi: ptr media_player_t; i_title: cint): ptr track_description_t {.
    cdecl, importc: "libvlc_video_get_chapter_description".}
proc video_set_subtitle_file*(p_mi: ptr media_player_t; psz_subtitle: cstring): cint {.
    cdecl, importc: "libvlc_video_set_subtitle_file".}
proc toggle_teletext*(p_mi: ptr media_player_t): void {.cdecl,
    importc: "libvlc_toggle_teletext".}
proc audio_output_device_count*(p_instance: ptr instance_t;
                                psz_audio_output: cstring): cint {.cdecl,
    importc: "libvlc_audio_output_device_count".}
proc audio_output_device_longname*(p_instance: ptr instance_t;
                                   psz_output: cstring; i_device: cint): cstring {.
    cdecl, importc: "libvlc_audio_output_device_longname".}
proc audio_output_device_id*(p_instance: ptr instance_t;
                             psz_audio_output: cstring; i_device: cint): cstring {.
    cdecl, importc: "libvlc_audio_output_device_id".}
proc audio_output_get_device_type*(p_mi: ptr media_player_t): cint {.cdecl,
    importc: "libvlc_audio_output_get_device_type".}
proc audio_output_set_device_type*(p_mp: ptr media_player_t; device_type: cint): void {.
    cdecl, importc: "libvlc_audio_output_set_device_type".}
proc media_parse*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_parse".}
proc media_parse_async*(p_md: ptr media_t): void {.cdecl,
    importc: "libvlc_media_parse_async".}
proc media_is_parsed*(p_md: ptr media_t): cint {.cdecl,
    importc: "libvlc_media_is_parsed".}
proc media_get_tracks_info*(p_md: ptr media_t;
                            tracks: ptr ptr media_track_info_t): cint {.cdecl,
    importc: "libvlc_media_get_tracks_info".}
proc media_list_add_file_content*(p_ml: ptr media_list_t; psz_uri: cstring): cint {.
    cdecl, importc: "libvlc_media_list_add_file_content".}
proc media_discoverer_new_from_name*(p_inst: ptr instance_t; psz_name: cstring): ptr media_discoverer_t {.
    cdecl, importc: "libvlc_media_discoverer_new_from_name".}
proc media_discoverer_localized_name*(p_mdis: ptr media_discoverer_t): cstring {.
    cdecl, importc: "libvlc_media_discoverer_localized_name".}
proc media_discoverer_event_manager*(p_mdis: ptr media_discoverer_t): ptr event_manager_t {.
    cdecl, importc: "libvlc_media_discoverer_event_manager".}
proc instance_wait*(p_instance: ptr instance_t): void {.cdecl,
    importc: "libvlc_wait".}
proc get_log_verbosity*(p_instance: ptr instance_t): cuint {.cdecl,
    importc: "libvlc_get_log_verbosity".}
proc set_log_verbosity*(p_instance: ptr instance_t; level: cuint): void {.cdecl,
    importc: "libvlc_set_log_verbosity".}
proc log_open*(p_instance: ptr instance_t): ptr log_t {.cdecl,
    importc: "libvlc_log_open".}
proc log_close*(p_log: ptr log_t): void {.cdecl, importc: "libvlc_log_close".}
proc log_count*(p_log: ptr log_t): cuint {.cdecl, importc: "libvlc_log_count".}
proc log_clear*(p_log: ptr log_t): void {.cdecl, importc: "libvlc_log_clear".}
proc log_get_iterator*(p_log: ptr log_t): ptr log_iterator_t {.cdecl,
    importc: "libvlc_log_get_iterator".}
proc log_iterator_free*(p_iter: ptr log_iterator_t): void {.cdecl,
    importc: "libvlc_log_iterator_free".}
proc log_iterator_has_next*(p_iter: ptr log_iterator_t): cint {.cdecl,
    importc: "libvlc_log_iterator_has_next".}
proc log_iterator_next*(p_iter: ptr log_iterator_t; p_buf: ptr log_message_t): ptr log_message_t {.
    cdecl, importc: "libvlc_log_iterator_next".}
proc playlist_play*(p_instance: ptr instance_t; i_id: cint; i_options: cint;
                    ppsz_options: ptr cstring): void {.cdecl,
    importc: "libvlc_playlist_play".}
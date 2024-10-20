
{.warning[UnusedImport]: off.}
{.hint[XDeclaredButNotUsed]: off.}
from macros import hint, warning, newLit, getSize

from os import parentDir

when not declared(ownSizeOf):
  macro ownSizeof(x: typed): untyped =
    newLit(x.getSize)

when not declared(libvlc_media_option_trusted):
  const
    libvlc_media_option_trusted* = cuint(2)
else:
  static :
    hint("Declaration of " & "libvlc_media_option_trusted" &
        " already exists, not redeclaring")
when not declared(libvlc_media_option_unique):
  const
    libvlc_media_option_unique* = cuint(256)
else:
  static :
    hint("Declaration of " & "libvlc_media_option_unique" &
        " already exists, not redeclaring")
when not declared(libvlc_title_menu):
  const
    libvlc_title_menu* = cuint(1)
else:
  static :
    hint("Declaration of " & "libvlc_title_menu" &
        " already exists, not redeclaring")
when not declared(libvlc_title_interactive):
  const
    libvlc_title_interactive* = cuint(2)
else:
  static :
    hint("Declaration of " & "libvlc_title_interactive" &
        " already exists, not redeclaring")
type
  enum_libvlc_log_level_520094173* {.size: sizeof(cuint).} = enum
    LIBVLC_DEBUG = 0, LIBVLC_NOTICE = 2, LIBVLC_WARNING = 3, LIBVLC_ERROR = 4
type
  enum_libvlc_meta_t_520094197* {.size: sizeof(cuint).} = enum
    libvlc_meta_Title = 0, libvlc_meta_Artist = 1, libvlc_meta_Genre = 2,
    libvlc_meta_Copyright = 3, libvlc_meta_Album = 4,
    libvlc_meta_TrackNumber = 5, libvlc_meta_Description = 6,
    libvlc_meta_Rating = 7, libvlc_meta_Date = 8, libvlc_meta_Setting = 9,
    libvlc_meta_URL = 10, libvlc_meta_Language = 11,
    libvlc_meta_NowPlaying = 12, libvlc_meta_Publisher = 13,
    libvlc_meta_EncodedBy = 14, libvlc_meta_ArtworkURL = 15,
    libvlc_meta_TrackID = 16, libvlc_meta_TrackTotal = 17,
    libvlc_meta_Director = 18, libvlc_meta_Season = 19,
    libvlc_meta_Episode = 20, libvlc_meta_ShowName = 21,
    libvlc_meta_Actors = 22, libvlc_meta_AlbumArtist = 23,
    libvlc_meta_DiscNumber = 24, libvlc_meta_DiscTotal = 25
type
  enum_libvlc_state_t_520094201* {.size: sizeof(cuint).} = enum
    libvlc_NothingSpecial = 0, libvlc_Opening = 1, libvlc_Buffering = 2,
    libvlc_Playing = 3, libvlc_Paused = 4, libvlc_Stopped = 5, libvlc_Ended = 6,
    libvlc_Error = 7
type
  enum_libvlc_track_type_t_520094205* {.size: sizeof(cint).} = enum
    libvlc_track_unknown = -1, libvlc_track_audio = 0, libvlc_track_video = 1,
    libvlc_track_text = 2
type
  enum_libvlc_video_orient_t_520094221* {.size: sizeof(cuint).} = enum
    libvlc_video_orient_top_left = 0, libvlc_video_orient_top_right = 1,
    libvlc_video_orient_bottom_left = 2, libvlc_video_orient_bottom_right = 3,
    libvlc_video_orient_left_top = 4, libvlc_video_orient_left_bottom = 5,
    libvlc_video_orient_right_top = 6, libvlc_video_orient_right_bottom = 7
type
  enum_libvlc_video_projection_t_520094225* {.size: sizeof(cuint).} = enum
    libvlc_video_projection_rectangular = 0,
    libvlc_video_projection_equirectangular = 1,
    libvlc_video_projection_cubemap_layout_standard = 256
type
  enum_libvlc_media_type_t_520094252* {.size: sizeof(cuint).} = enum
    libvlc_media_type_unknown = 0, libvlc_media_type_file = 1,
    libvlc_media_type_directory = 2, libvlc_media_type_disc = 3,
    libvlc_media_type_stream = 4, libvlc_media_type_playlist = 5
type
  enum_libvlc_media_parse_flag_t_520094256* {.size: sizeof(cuint).} = enum
    libvlc_media_parse_local = 0, libvlc_media_parse_network = 1,
    libvlc_media_fetch_local = 2, libvlc_media_fetch_network = 4,
    libvlc_media_do_interact = 8
type
  enum_libvlc_media_parsed_status_t_520094260* {.size: sizeof(cuint).} = enum
    libvlc_media_parsed_status_skipped = 1,
    libvlc_media_parsed_status_failed = 2,
    libvlc_media_parsed_status_timeout = 3, libvlc_media_parsed_status_done = 4
type
  enum_libvlc_media_slave_type_t_520094264* {.size: sizeof(cuint).} = enum
    libvlc_media_slave_type_subtitle = 0, libvlc_media_slave_type_audio = 1
type
  enum_libvlc_video_marquee_option_t* {.pure, size: sizeof(cuint).} = enum
    Enable = 0, Text = 1, Color = 2, Opacity = 3, Position = 4,
    Refresh = 5, Size = 6, Timeout = 7, X = 8, Y = 9
type
  enum_libvlc_navigate_mode_t_520094308* {.size: sizeof(cuint).} = enum
    libvlc_navigate_activate = 0, libvlc_navigate_up = 1,
    libvlc_navigate_down = 2, libvlc_navigate_left = 3,
    libvlc_navigate_right = 4, libvlc_navigate_popup = 5
type
  enum_libvlc_position_t_520094312* {.size: sizeof(cint).} = enum
    libvlc_position_disable = -1, libvlc_position_center = 0,
    libvlc_position_left = 1, libvlc_position_right = 2,
    libvlc_position_top = 3, libvlc_position_top_left = 4,
    libvlc_position_top_right = 5, libvlc_position_bottom = 6,
    libvlc_position_bottom_left = 7, libvlc_position_bottom_right = 8
type
  enum_libvlc_teletext_key_t_520094316* {.size: sizeof(cuint).} = enum
    libvlc_teletext_key_blue = 6422528, libvlc_teletext_key_green = 6750208,
    libvlc_teletext_key_index = 6881280, libvlc_teletext_key_red = 7471104,
    libvlc_teletext_key_yellow = 7929856
type
  enum_libvlc_video_logo_option_t_520094348* {.size: sizeof(cuint).} = enum
    libvlc_logo_enable = 0, libvlc_logo_file = 1, libvlc_logo_x = 2,
    libvlc_logo_y = 3, libvlc_logo_delay = 4, libvlc_logo_repeat = 5,
    libvlc_logo_opacity = 6, libvlc_logo_position = 7
type
  enum_libvlc_video_adjust_option_t_520094350* {.size: sizeof(cuint).} = enum
    libvlc_adjust_Enable = 0, libvlc_adjust_Contrast = 1,
    libvlc_adjust_Brightness = 2, libvlc_adjust_Hue = 3,
    libvlc_adjust_Saturation = 4, libvlc_adjust_Gamma = 5
type
  enum_libvlc_audio_output_device_types_t_520094352* {.size: sizeof(cint).} = enum
    libvlc_AudioOutputDevice_Error = -1, libvlc_AudioOutputDevice_Mono = 1,
    libvlc_AudioOutputDevice_Stereo = 2, libvlc_AudioOutputDevice_2F2R = 4,
    libvlc_AudioOutputDevice_3F2R = 5, libvlc_AudioOutputDevice_5_1 = 6,
    libvlc_AudioOutputDevice_6_1 = 7, libvlc_AudioOutputDevice_7_1 = 8,
    libvlc_AudioOutputDevice_SPDIF = 10
type
  enum_libvlc_audio_output_channel_t_520094356* {.size: sizeof(cint).} = enum
    libvlc_AudioChannel_Error = -1, libvlc_AudioChannel_Stereo = 1,
    libvlc_AudioChannel_RStereo = 2, libvlc_AudioChannel_Left = 3,
    libvlc_AudioChannel_Right = 4, libvlc_AudioChannel_Dolbys = 5
type
  enum_libvlc_media_player_role_520094360* {.size: sizeof(cuint).} = enum
    libvlc_role_None = 0, libvlc_role_Music = 1, libvlc_role_Video = 2,
    libvlc_role_Communication = 3, libvlc_role_Game = 4,
    libvlc_role_Notification = 5, libvlc_role_Animation = 6,
    libvlc_role_Production = 7, libvlc_role_Accessibility = 8,
    libvlc_role_Test = 9
type
  enum_libvlc_playback_mode_t_520094368* {.size: sizeof(cuint).} = enum
    libvlc_playback_mode_default = 0, libvlc_playback_mode_loop = 1,
    libvlc_playback_mode_repeat = 2
type
  enum_libvlc_media_discoverer_category_t_520094374* {.size: sizeof(cuint).} = enum
    libvlc_media_discoverer_devices = 0, libvlc_media_discoverer_lan = 1,
    libvlc_media_discoverer_podcasts = 2, libvlc_media_discoverer_localdirs = 3
type
  enum_libvlc_event_e_520094384* {.size: sizeof(cuint).} = enum
    libvlc_MediaMetaChanged = 0, libvlc_MediaSubItemAdded = 1,
    libvlc_MediaDurationChanged = 2, libvlc_MediaParsedChanged = 3,
    libvlc_MediaFreed = 4, libvlc_MediaStateChanged = 5,
    libvlc_MediaSubItemTreeAdded = 6, libvlc_MediaPlayerMediaChanged = 256,
    libvlc_MediaPlayerNothingSpecial = 257, libvlc_MediaPlayerOpening = 258,
    libvlc_MediaPlayerBuffering = 259, libvlc_MediaPlayerPlaying = 260,
    libvlc_MediaPlayerPaused = 261, libvlc_MediaPlayerStopped = 262,
    libvlc_MediaPlayerForward = 263, libvlc_MediaPlayerBackward = 264,
    libvlc_MediaPlayerEndReached = 265,
    libvlc_MediaPlayerEncounteredError = 266,
    libvlc_MediaPlayerTimeChanged = 267,
    libvlc_MediaPlayerPositionChanged = 268,
    libvlc_MediaPlayerSeekableChanged = 269,
    libvlc_MediaPlayerPausableChanged = 270,
    libvlc_MediaPlayerTitleChanged = 271, libvlc_MediaPlayerSnapshotTaken = 272,
    libvlc_MediaPlayerLengthChanged = 273, libvlc_MediaPlayerVout = 274,
    libvlc_MediaPlayerScrambledChanged = 275, libvlc_MediaPlayerESAdded = 276,
    libvlc_MediaPlayerESDeleted = 277, libvlc_MediaPlayerESSelected = 278,
    libvlc_MediaPlayerCorked = 279, libvlc_MediaPlayerUncorked = 280,
    libvlc_MediaPlayerMuted = 281, libvlc_MediaPlayerUnmuted = 282,
    libvlc_MediaPlayerAudioVolume = 283, libvlc_MediaPlayerAudioDevice = 284,
    libvlc_MediaPlayerChapterChanged = 285, libvlc_MediaListItemAdded = 512,
    libvlc_MediaListWillAddItem = 513, libvlc_MediaListItemDeleted = 514,
    libvlc_MediaListWillDeleteItem = 515, libvlc_MediaListEndReached = 516,
    libvlc_MediaListViewItemAdded = 768, libvlc_MediaListViewWillAddItem = 769,
    libvlc_MediaListViewItemDeleted = 770,
    libvlc_MediaListViewWillDeleteItem = 771,
    libvlc_MediaListPlayerPlayed = 1024,
    libvlc_MediaListPlayerNextItemSet = 1025,
    libvlc_MediaListPlayerStopped = 1026, libvlc_MediaDiscovererStarted = 1280,
    libvlc_MediaDiscovererEnded = 1281,
    libvlc_RendererDiscovererItemAdded = 1282,
    libvlc_RendererDiscovererItemDeleted = 1283, libvlc_VlmMediaAdded = 1536,
    libvlc_VlmMediaRemoved = 1537, libvlc_VlmMediaChanged = 1538,
    libvlc_VlmMediaInstanceStarted = 1539,
    libvlc_VlmMediaInstanceStopped = 1540,
    libvlc_VlmMediaInstanceStatusInit = 1541,
    libvlc_VlmMediaInstanceStatusOpening = 1542,
    libvlc_VlmMediaInstanceStatusPlaying = 1543,
    libvlc_VlmMediaInstanceStatusPause = 1544,
    libvlc_VlmMediaInstanceStatusEnd = 1545,
    libvlc_VlmMediaInstanceStatusError = 1546
type
  enum_libvlc_dialog_question_type_520094390* {.size: sizeof(cuint).} = enum
    LIBVLC_DIALOG_QUESTION_NORMAL = 0, LIBVLC_DIALOG_QUESTION_WARNING = 1,
    LIBVLC_DIALOG_QUESTION_CRITICAL = 2
when not declared(struct_libvlc_media_library_t):
  type
    struct_libvlc_media_library_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_library_t" &
        " already exists, not redeclaring")
when not declared(struct_vlc_log_t):
  type
    struct_vlc_log_t* = object
else:
  static :
    hint("Declaration of " & "struct_vlc_log_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_list_t):
  type
    struct_libvlc_media_list_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_list_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_log_iterator_t):
  type
    struct_libvlc_log_iterator_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_log_iterator_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_renderer_discoverer_t):
  type
    struct_libvlc_renderer_discoverer_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_renderer_discoverer_t" &
        " already exists, not redeclaring")
when not declared(struct_IO_marker):
  type
    struct_IO_marker* = object
else:
  static :
    hint("Declaration of " & "struct_IO_marker" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_list_player_t):
  type
    struct_libvlc_media_list_player_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_list_player_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_discoverer_t):
  type
    struct_libvlc_media_discoverer_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_discoverer_t" &
        " already exists, not redeclaring")
when not declared(struct_IO_wide_data):
  type
    struct_IO_wide_data* = object
else:
  static :
    hint("Declaration of " & "struct_IO_wide_data" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_player_t):
  type
    struct_libvlc_media_player_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_player_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_t):
  type
    struct_libvlc_media_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_equalizer_t):
  type
    struct_libvlc_equalizer_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_equalizer_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_event_manager_t):
  type
    struct_libvlc_event_manager_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_event_manager_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_dialog_id):
  type
    struct_libvlc_dialog_id* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_dialog_id" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_instance_t):
  type
    struct_libvlc_instance_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_instance_t" &
        " already exists, not redeclaring")

when not declared(libvlc_instance_t):
  type
    libvlc_instance_t* = struct_libvlc_instance_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:77:34

when not declared(struct_libvlc_renderer_item_t):
  type
    struct_libvlc_renderer_item_t* = object
else:
  static :
    hint("Declaration of " & "struct_libvlc_renderer_item_t" &
        " already exists, not redeclaring")
when not declared(struct_IO_codecvt):
  type
    struct_IO_codecvt* = object
else:
  static :
    hint("Declaration of " & "struct_IO_codecvt" &
        " already exists, not redeclaring")
type
  libvlc_time_t_520094163 = int64 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:79:17
  libvlc_event_manager_t_520094165 = struct_libvlc_event_manager_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:311:39
  libvlc_event_type_t_520094167 = cint ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:318:13
  libvlc_callback_t_520094169 = proc (a0: ptr struct_libvlc_event_t_520094172;
                                      a1: pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:324:17
  struct_libvlc_event_t_u_t_media_meta_changed_t {.pure, inheritable, bycopy.} = object
    meta_type*: libvlc_meta_t_520094200
  struct_libvlc_event_t_u_t_media_subitem_added_t {.pure, inheritable, bycopy.} = object
    new_child*: ptr libvlc_media_t
  struct_libvlc_event_t_u_t_media_duration_changed_t {.pure, inheritable, bycopy.} = object
    new_duration*: int64
  struct_libvlc_event_t_u_t_media_parsed_changed_t {.pure, inheritable, bycopy.} = object
    new_status*: cint
  struct_libvlc_event_t_u_t_media_freed_t {.pure, inheritable, bycopy.} = object
    md*: ptr libvlc_media_t
  struct_libvlc_event_t_u_t_media_state_changed_t {.pure, inheritable, bycopy.} = object
    new_state*: cint
  struct_libvlc_event_t_u_t_media_subitemtree_added_t {.pure, inheritable,
      bycopy.} = object
    item*: ptr libvlc_media_t
  struct_libvlc_event_t_u_t_media_player_buffering_t {.pure, inheritable, bycopy.} = object
    new_cache*: cfloat
  struct_libvlc_event_t_u_t_media_player_chapter_changed_t {.pure, inheritable,
      bycopy.} = object
    new_chapter*: cint
  struct_libvlc_event_t_u_t_media_player_position_changed_t {.pure, inheritable,
      bycopy.} = object
    new_position*: cfloat
  struct_libvlc_event_t_u_t_media_player_time_changed_t {.pure, inheritable,
      bycopy.} = object
    new_time*: libvlc_time_t_520094164
  struct_libvlc_event_t_u_t_media_player_title_changed_t {.pure, inheritable,
      bycopy.} = object
    new_title*: cint
  struct_libvlc_event_t_u_t_media_player_seekable_changed_t {.pure, inheritable,
      bycopy.} = object
    new_seekable*: cint
  struct_libvlc_event_t_u_t_media_player_pausable_changed_t {.pure, inheritable,
      bycopy.} = object
    new_pausable*: cint
  struct_libvlc_event_t_u_t_media_player_scrambled_changed_t {.pure,
      inheritable, bycopy.} = object
    new_scrambled*: cint
  struct_libvlc_event_t_u_t_media_player_vout_t {.pure, inheritable, bycopy.} = object
    new_count*: cint
  struct_libvlc_event_t_u_t_media_list_item_added_t {.pure, inheritable, bycopy.} = object
    item*: ptr libvlc_media_t
    index*: cint
  struct_libvlc_event_t_u_t_media_list_will_add_item_t {.pure, inheritable,
      bycopy.} = object
    item*: ptr libvlc_media_t
    index*: cint
  struct_libvlc_event_t_u_t_media_list_item_deleted_t {.pure, inheritable,
      bycopy.} = object
    item*: ptr libvlc_media_t
    index*: cint
  struct_libvlc_event_t_u_t_media_list_will_delete_item_t {.pure, inheritable,
      bycopy.} = object
    item*: ptr libvlc_media_t
    index*: cint
  struct_libvlc_event_t_u_t_media_list_player_next_item_set_t {.pure,
      inheritable, bycopy.} = object
    item*: ptr libvlc_media_t
  struct_libvlc_event_t_u_t_media_player_snapshot_taken_t {.pure, inheritable,
      bycopy.} = object
    psz_filename*: cstring
  struct_libvlc_event_t_u_t_media_player_length_changed_t {.pure, inheritable,
      bycopy.} = object
    new_length*: libvlc_time_t_520094164
  struct_libvlc_event_t_u_t_vlm_media_event_t {.pure, inheritable, bycopy.} = object
    psz_media_name*: cstring
    psz_instance_name*: cstring
  struct_libvlc_event_t_u_t_media_player_media_changed_t {.pure, inheritable,
      bycopy.} = object
    new_media*: ptr libvlc_media_t
  struct_libvlc_event_t_u_t_media_player_es_changed_t {.pure, inheritable,
      bycopy.} = object
    i_type*: libvlc_track_type_t_520094208
    i_id*: cint
  struct_libvlc_event_t_u_t_media_player_audio_volume_t {.pure, inheritable,
      bycopy.} = object
    volume*: cfloat
  struct_libvlc_event_t_u_t_media_player_audio_device_t {.pure, inheritable,
      bycopy.} = object
    device*: cstring
  struct_libvlc_event_t_u_t_renderer_discoverer_item_added_t {.pure,
      inheritable, bycopy.} = object
    item*: ptr libvlc_renderer_item_t_520094194
  struct_libvlc_event_t_u_t_renderer_discoverer_item_deleted_t {.pure,
      inheritable, bycopy.} = object
    item*: ptr libvlc_renderer_item_t_520094194
  struct_libvlc_event_t_u_t {.union, bycopy.} = object
    media_meta_changed*: struct_libvlc_event_t_u_t_media_meta_changed_t
    media_subitem_added*: struct_libvlc_event_t_u_t_media_subitem_added_t
    media_duration_changed*: struct_libvlc_event_t_u_t_media_duration_changed_t
    media_parsed_changed*: struct_libvlc_event_t_u_t_media_parsed_changed_t
    media_freed*: struct_libvlc_event_t_u_t_media_freed_t
    media_state_changed*: struct_libvlc_event_t_u_t_media_state_changed_t
    media_subitemtree_added*: struct_libvlc_event_t_u_t_media_subitemtree_added_t
    media_player_buffering*: struct_libvlc_event_t_u_t_media_player_buffering_t
    media_player_chapter_changed*: struct_libvlc_event_t_u_t_media_player_chapter_changed_t
    media_player_position_changed*: struct_libvlc_event_t_u_t_media_player_position_changed_t
    media_player_time_changed*: struct_libvlc_event_t_u_t_media_player_time_changed_t
    media_player_title_changed*: struct_libvlc_event_t_u_t_media_player_title_changed_t
    media_player_seekable_changed*: struct_libvlc_event_t_u_t_media_player_seekable_changed_t
    media_player_pausable_changed*: struct_libvlc_event_t_u_t_media_player_pausable_changed_t
    media_player_scrambled_changed*: struct_libvlc_event_t_u_t_media_player_scrambled_changed_t
    media_player_vout*: struct_libvlc_event_t_u_t_media_player_vout_t
    media_list_item_added*: struct_libvlc_event_t_u_t_media_list_item_added_t
    media_list_will_add_item*: struct_libvlc_event_t_u_t_media_list_will_add_item_t
    media_list_item_deleted*: struct_libvlc_event_t_u_t_media_list_item_deleted_t
    media_list_will_delete_item*: struct_libvlc_event_t_u_t_media_list_will_delete_item_t
    media_list_player_next_item_set*: struct_libvlc_event_t_u_t_media_list_player_next_item_set_t
    media_player_snapshot_taken*: struct_libvlc_event_t_u_t_media_player_snapshot_taken_t
    media_player_length_changed*: struct_libvlc_event_t_u_t_media_player_length_changed_t
    vlm_media_event*: struct_libvlc_event_t_u_t_vlm_media_event_t
    media_player_media_changed*: struct_libvlc_event_t_u_t_media_player_media_changed_t
    media_player_es_changed*: struct_libvlc_event_t_u_t_media_player_es_changed_t
    media_player_audio_volume*: struct_libvlc_event_t_u_t_media_player_audio_volume_t
    media_player_audio_device*: struct_libvlc_event_t_u_t_media_player_audio_device_t
    renderer_discoverer_item_added*: struct_libvlc_event_t_u_t_renderer_discoverer_item_added_t
    renderer_discoverer_item_deleted*: struct_libvlc_event_t_u_t_renderer_discoverer_item_deleted_t
  struct_libvlc_event_t_520094171 {.pure, inheritable, bycopy.} = object
    type_field*: cint        ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_events.h:135:16
    p_obj*: pointer
    u*: struct_libvlc_event_t_u_t
  libvlc_log_t_520094175 = struct_vlc_log_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:382:26
  uintptr_t_520094177 = culong ## Generated based on /usr/include/stdint.h:79:27
  libvlc_log_cb_520094179 = proc (a0: pointer; a1: cint; a2: ptr libvlc_log_t_520094176;
                                  a3: cstring): void {.cdecl, varargs.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:447:16
  FILE = struct_IO_FILE ## Generated based on /usr/include/bits/types/FILE.h:7:25
  struct_libvlc_module_description_t_520094183 {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:500:16
    psz_shortname*: cstring
    psz_longname*: cstring
    psz_help*: cstring
    p_next*: ptr struct_libvlc_module_description_t_520094184
  libvlc_module_description_t_520094185 = struct_libvlc_module_description_t_520094184 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:507:3
  libvlc_renderer_discoverer_t_520094187 = struct_libvlc_renderer_discoverer_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:38:45
  struct_libvlc_rd_description_t {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:45:16
    psz_longname*: cstring
  libvlc_rd_description_t = struct_libvlc_rd_description_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:49:3
  libvlc_renderer_item_t_520094193 = struct_libvlc_renderer_item_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_events.h:37:39
  libvlc_media_t = struct_libvlc_media_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:48:31
  libvlc_meta_t_520094199 = enum_libvlc_meta_t_520094198 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:79:3
  libvlc_state_t_520094203 = enum_libvlc_state_t_520094202 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:102:3
  libvlc_track_type_t_520094207 = enum_libvlc_track_type_t_520094206 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:116:3
  struct_libvlc_media_stats_t_520094209 {.pure, inheritable, bycopy.} = object
    i_read_bytes*: cint      ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:118:16
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
  libvlc_media_stats_t_520094211 = struct_libvlc_media_stats_t_520094210 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:146:3
  struct_libvlc_media_track_info_t_u_t_audio_t {.pure, inheritable, bycopy.} = object
    i_channels*: cuint
    i_rate*: cuint
  struct_libvlc_media_track_info_t_u_t_video_t {.pure, inheritable, bycopy.} = object
    i_height*: cuint
    i_width*: cuint
  struct_libvlc_media_track_info_t_u_t {.union, bycopy.} = object
    audio*: struct_libvlc_media_track_info_t_u_t_audio_t
    video*: struct_libvlc_media_track_info_t_u_t_video_t
  struct_libvlc_media_track_info_t_520094213 {.pure, inheritable, bycopy.} = object
    i_codec*: uint32         ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:148:16
    i_id*: cint
    i_type*: libvlc_track_type_t_520094208
    i_profile*: cint
    i_level*: cint
    u*: struct_libvlc_media_track_info_t_u_t
  libvlc_media_track_info_t_520094215 = struct_libvlc_media_track_info_t_520094214 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:172:3
  struct_libvlc_audio_track_t_520094217 {.pure, inheritable, bycopy.} = object
    i_channels*: cuint       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:175:16
    i_rate*: cuint
  libvlc_audio_track_t_520094219 = struct_libvlc_audio_track_t_520094218 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:179:3
  libvlc_video_orient_t_520094223 = enum_libvlc_video_orient_t_520094222 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:191:3
  libvlc_video_projection_t_520094227 = enum_libvlc_video_projection_t_520094226 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:199:3
  struct_libvlc_video_viewpoint_t_520094229 {.pure, inheritable, bycopy.} = object
    f_yaw*: cfloat           ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:206:16
    f_pitch*: cfloat
    f_roll*: cfloat
    f_field_of_view*: cfloat
  libvlc_video_viewpoint_t_520094231 = struct_libvlc_video_viewpoint_t_520094230 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:212:3
  struct_libvlc_video_track_t_520094233 {.pure, inheritable, bycopy.} = object
    i_height*: cuint         ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:214:16
    i_width*: cuint
    i_sar_num*: cuint
    i_sar_den*: cuint
    i_frame_rate_num*: cuint
    i_frame_rate_den*: cuint
    i_orientation*: libvlc_video_orient_t_520094224
    i_projection*: libvlc_video_projection_t_520094228
    pose*: libvlc_video_viewpoint_t_520094232
  libvlc_video_track_t_520094242 = struct_libvlc_video_track_t_520094234 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:226:3
  struct_libvlc_subtitle_track_t_520094244 {.pure, inheritable, bycopy.} = object
    psz_encoding*: cstring   ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:228:16
  libvlc_subtitle_track_t_520094246 = struct_libvlc_subtitle_track_t_520094245 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:231:3
  struct_libvlc_media_track_t_anon0_t {.union, bycopy.} = object
    audio*: ptr libvlc_audio_track_t_520094220
    video*: ptr libvlc_video_track_t_520094243
    subtitle*: ptr libvlc_subtitle_track_t_520094247
  struct_libvlc_media_track_t_520094248 {.pure, inheritable, bycopy.} = object
    i_codec*: uint32         ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:233:16
    i_original_fourcc*: uint32
    i_id*: cint
    i_type*: libvlc_track_type_t_520094208
    i_profile*: cint
    i_level*: cint
    anon0*: struct_libvlc_media_track_t_anon0_t
    i_bitrate*: cuint
    psz_language*: cstring
    psz_description*: cstring
  libvlc_media_track_t_520094250 = struct_libvlc_media_track_t_520094249 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:255:3
  libvlc_media_type_t_520094254 = enum_libvlc_media_type_t_520094253 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:269:3
  libvlc_media_parse_flag_t_520094258 = enum_libvlc_media_parse_flag_t_520094257 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:300:3
  libvlc_media_parsed_status_t_520094262 = enum_libvlc_media_parsed_status_t_520094261 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:315:3
  libvlc_media_slave_type_t_520094266 = enum_libvlc_media_slave_type_t_520094265 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:324:3
  struct_libvlc_media_slave_t_520094268 {.pure, inheritable, bycopy.} = object
    psz_uri*: cstring        ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:330:16
    i_type*: libvlc_media_slave_type_t_520094267
    i_priority*: cuint
  libvlc_media_slave_t_520094270 = struct_libvlc_media_slave_t_520094269 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:335:3
  libvlc_media_open_cb = proc (opaque: pointer; datap: ptr pointer;
      sizep: ptr uint64): cint {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:355:15
  libvlc_media_read_cb = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.
      cdecl.}                ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:374:19
  ssize_t = compiler_ssize_t ## Generated based on /usr/include/stdio.h:78:19
  libvlc_media_seek_cb = proc (a0: pointer; a1: uint64): cint {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:385:15
  libvlc_media_close_cb = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:393:16
  libvlc_media_player_t_520094282 = struct_libvlc_media_player_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:43:38
  struct_libvlc_track_description_t_520094284 {.pure, inheritable, bycopy.} = object
    i_id*: cint              ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:49:16
    psz_name*: cstring
    p_next*: ptr struct_libvlc_track_description_t_520094285
  libvlc_track_description_t_520094286 = struct_libvlc_track_description_t_520094285 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:55:3
  struct_libvlc_title_description_t_520094288 {.pure, inheritable, bycopy.} = object
    i_duration*: int64       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:66:16
    psz_name*: cstring
    i_flags*: cuint
  libvlc_title_description_t_520094290 = struct_libvlc_title_description_t_520094289 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:71:3
  struct_libvlc_chapter_description_t_520094292 {.pure, inheritable, bycopy.} = object
    i_time_offset*: int64    ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:76:16
    i_duration*: int64
    psz_name*: cstring
  libvlc_chapter_description_t_520094294 = struct_libvlc_chapter_description_t_520094293 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:81:3
  struct_libvlc_audio_output_t_520094296 {.pure, inheritable, bycopy.} = object
    psz_name*: cstring       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:87:16
    psz_description*: cstring
    p_next*: ptr struct_libvlc_audio_output_t_520094297
  libvlc_audio_output_t_520094298 = struct_libvlc_audio_output_t_520094297 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:93:3
  struct_libvlc_audio_output_device_t_520094300 {.pure, inheritable, bycopy.} = object
    p_next*: ptr struct_libvlc_audio_output_device_t_520094301 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:98:16
    psz_device*: cstring
    psz_description*: cstring
  libvlc_audio_output_device_t_520094302 = struct_libvlc_audio_output_device_t_520094301 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:104:3
  libvlc_video_marquee_option_t = enum_libvlc_video_marquee_option_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:120:3
  libvlc_navigate_mode_t_520094310 = enum_libvlc_navigate_mode_t_520094309 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:133:3
  libvlc_position_t_520094314 = enum_libvlc_position_t_520094313 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:149:3
  libvlc_teletext_key_t_520094318 = enum_libvlc_teletext_key_t_520094317 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:161:3
  libvlc_equalizer_t_520094320 = struct_libvlc_equalizer_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:168:35
  libvlc_video_lock_cb_520094322 = proc (a0: pointer; a1: ptr pointer): pointer {.
      cdecl.}                ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:307:17
  libvlc_video_unlock_cb_520094324 = proc (a0: pointer; a1: pointer;
      a2: ptr pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:325:16
  libvlc_video_display_cb_520094326 = proc (a0: pointer; a1: pointer): void {.
      cdecl.}                ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:338:16
  libvlc_video_format_cb_520094328 = proc (a0: ptr pointer; a1: cstring;
      a2: ptr cuint; a3: ptr cuint; a4: ptr cuint; a5: ptr cuint): cuint {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:366:20
  libvlc_video_cleanup_cb_520094330 = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:377:16
  libvlc_audio_play_cb_520094332 = proc (a0: pointer; a1: pointer; a2: cuint;
      a3: int64): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:627:16
  libvlc_audio_pause_cb_520094334 = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:639:16
  libvlc_audio_resume_cb_520094336 = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:651:16
  libvlc_audio_flush_cb_520094338 = proc (a0: pointer; a1: int64): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:662:16
  libvlc_audio_drain_cb_520094340 = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:673:16
  libvlc_audio_set_volume_cb_520094342 = proc (a0: pointer; a1: cfloat; a2: bool): void {.
      cdecl.}                ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:681:16
  libvlc_audio_setup_cb_520094344 = proc (a0: ptr pointer; a1: cstring;
      a2: ptr cuint; a3: ptr cuint): cint {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:737:15
  libvlc_audio_cleanup_cb_520094346 = proc (a0: pointer): void {.cdecl.} ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:746:16
  libvlc_audio_output_device_types_t_520094354 = enum_libvlc_audio_output_device_types_t_520094353 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:1591:3
  libvlc_audio_output_channel_t_520094358 = enum_libvlc_audio_output_channel_t_520094357 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:1603:3
  libvlc_media_player_role_t_520094362 = enum_libvlc_media_player_role_520094361 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:2063:3
  libvlc_media_list_t_520094364 = struct_libvlc_media_list_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list.h:39:36
  libvlc_media_list_player_t_520094366 = struct_libvlc_media_list_player_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list_player.h:43:43
  libvlc_playback_mode_t_520094370 = enum_libvlc_playback_mode_t_520094369 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list_player.h:53:3
  libvlc_media_library_t_520094372 = struct_libvlc_media_library_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_library.h:40:39
  libvlc_media_discoverer_category_t_520094376 = enum_libvlc_media_discoverer_category_t_520094375 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:46:3
  struct_libvlc_media_discoverer_description_t_520094378 {.pure, inheritable,
      bycopy.} = object
    psz_name*: cstring       ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:52:16
    psz_longname*: cstring
    i_cat*: libvlc_media_discoverer_category_t_520094377
  libvlc_media_discoverer_description_t_520094380 = struct_libvlc_media_discoverer_description_t_520094379 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:56:3
  libvlc_media_discoverer_t_520094382 = struct_libvlc_media_discoverer_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:70:42
  libvlc_event_t_520094386 = struct_libvlc_event_t_520094172 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_events.h:287:3
  libvlc_dialog_id_520094388 = struct_libvlc_dialog_id ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:30:33
  libvlc_dialog_question_type_520094392 = enum_libvlc_dialog_question_type_520094391 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:45:3
  struct_libvlc_dialog_cbs_520094394 {.pure, inheritable, bycopy.} = object
    pf_display_error*: proc (a0: pointer; a1: cstring; a2: cstring): void {.
        cdecl.}              ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:50:16
    pf_display_login*: proc (a0: pointer; a1: ptr libvlc_dialog_id_520094389;
                             a2: cstring; a3: cstring; a4: cstring; a5: bool): void {.
        cdecl.}
    pf_display_question*: proc (a0: pointer; a1: ptr libvlc_dialog_id_520094389;
                                a2: cstring; a3: cstring;
                                a4: libvlc_dialog_question_type_520094393;
                                a5: cstring; a6: cstring; a7: cstring): void {.
        cdecl.}
    pf_display_progress*: proc (a0: pointer; a1: ptr libvlc_dialog_id_520094389;
                                a2: cstring; a3: cstring; a4: bool; a5: cfloat;
                                a6: cstring): void {.cdecl.}
    pf_cancel*: proc (a0: pointer; a1: ptr libvlc_dialog_id_520094389): void {.
        cdecl.}
    pf_update_progress*: proc (a0: pointer; a1: ptr libvlc_dialog_id_520094389;
                               a2: cfloat; a3: cstring): void {.cdecl.}
  libvlc_dialog_cbs_520094396 = struct_libvlc_dialog_cbs_520094395 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:155:3
  libvlc_log_iterator_t_520094398 = struct_libvlc_log_iterator_t ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/deprecated.h:347:38
  struct_libvlc_log_message_t_520094400 {.pure, inheritable, bycopy.} = object
    i_severity*: cint        ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/deprecated.h:349:16
    psz_type*: cstring
    psz_name*: cstring
    psz_header*: cstring
    psz_message*: cstring
  libvlc_log_message_t_520094402 = struct_libvlc_log_message_t_520094401 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/deprecated.h:356:3
  struct_IO_FILE {.pure, inheritable, bycopy.} = object
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
    internal_old_offset*: compiler_off_t_520094412
    internal_cur_column*: cushort
    internal_vtable_offset*: cschar
    internal_shortbuf*: array[1'i64, cschar]
    internal_lock*: pointer
    internal_offset*: compiler_off64_t_520094416
    internal_codecvt*: ptr struct_IO_codecvt
    internal_wide_data*: ptr struct_IO_wide_data
    internal_freeres_list*: ptr struct_IO_FILE
    internal_freeres_buf*: pointer
    internal_prevchain*: ptr ptr struct_IO_FILE
    internal_mode*: cint
    internal_unused2*: array[20'i64, cschar]
  compiler_ssize_t = clong ## Generated based on /usr/include/bits/types.h:194:27
  compiler_off_t_520094411 = clong ## Generated based on /usr/include/bits/types.h:152:25
  compiler_off64_t_520094415 = clong ## Generated based on /usr/include/bits/types.h:153:27
  libvlc_audio_play_cb_520094333 = (when declared(libvlc_audio_play_cb):
    when ownSizeof(libvlc_audio_play_cb) != ownSizeof(libvlc_audio_play_cb_520094332):
      static :
        warning("Declaration of " & "libvlc_audio_play_cb" &
            " exists but with different size")
    libvlc_audio_play_cb
   else:
    libvlc_audio_play_cb_520094332)
  libvlc_media_track_t_520094251 = (when declared(libvlc_media_track_t):
    when ownSizeof(libvlc_media_track_t) != ownSizeof(libvlc_media_track_t_520094250):
      static :
        warning("Declaration of " & "libvlc_media_track_t" &
            " exists but with different size")
    libvlc_media_track_t
   else:
    libvlc_media_track_t_520094250)
  struct_libvlc_subtitle_track_t_520094245 = (when declared(
      struct_libvlc_subtitle_track_t):
    when ownSizeof(struct_libvlc_subtitle_track_t) !=
        ownSizeof(struct_libvlc_subtitle_track_t_520094244):
      static :
        warning("Declaration of " & "struct_libvlc_subtitle_track_t" &
            " exists but with different size")
    struct_libvlc_subtitle_track_t
   else:
    struct_libvlc_subtitle_track_t_520094244)
  libvlc_position_t_520094315 = (when declared(libvlc_position_t):
    when ownSizeof(libvlc_position_t) != ownSizeof(libvlc_position_t_520094314):
      static :
        warning("Declaration of " & "libvlc_position_t" &
            " exists but with different size")
    libvlc_position_t
   else:
    libvlc_position_t_520094314)
  libvlc_audio_output_channel_t_520094359 = (when declared(
      libvlc_audio_output_channel_t):
    when ownSizeof(libvlc_audio_output_channel_t) !=
        ownSizeof(libvlc_audio_output_channel_t_520094358):
      static :
        warning("Declaration of " & "libvlc_audio_output_channel_t" &
            " exists but with different size")
    libvlc_audio_output_channel_t
   else:
    libvlc_audio_output_channel_t_520094358)
  libvlc_navigate_mode_t_520094311 = (when declared(libvlc_navigate_mode_t):
    when ownSizeof(libvlc_navigate_mode_t) != ownSizeof(libvlc_navigate_mode_t_520094310):
      static :
        warning("Declaration of " & "libvlc_navigate_mode_t" &
            " exists but with different size")
    libvlc_navigate_mode_t
   else:
    libvlc_navigate_mode_t_520094310)
  enum_libvlc_media_player_role_520094361 = (when declared(
      enum_libvlc_media_player_role):
    when ownSizeof(enum_libvlc_media_player_role) !=
        ownSizeof(enum_libvlc_media_player_role_520094360):
      static :
        warning("Declaration of " & "enum_libvlc_media_player_role" &
            " exists but with different size")
    enum_libvlc_media_player_role
   else:
    enum_libvlc_media_player_role_520094360)
  libvlc_state_t_520094204 = (when declared(libvlc_state_t):
    when ownSizeof(libvlc_state_t) != ownSizeof(libvlc_state_t_520094203):
      static :
        warning("Declaration of " & "libvlc_state_t" &
            " exists but with different size")
    libvlc_state_t
   else:
    libvlc_state_t_520094203)
  libvlc_video_viewpoint_t_520094232 = (when declared(libvlc_video_viewpoint_t):
    when ownSizeof(libvlc_video_viewpoint_t) !=
        ownSizeof(libvlc_video_viewpoint_t_520094231):
      static :
        warning("Declaration of " & "libvlc_video_viewpoint_t" &
            " exists but with different size")
    libvlc_video_viewpoint_t
   else:
    libvlc_video_viewpoint_t_520094231)
  libvlc_media_player_role_t_520094363 = (when declared(
      libvlc_media_player_role_t):
    when ownSizeof(libvlc_media_player_role_t) !=
        ownSizeof(libvlc_media_player_role_t_520094362):
      static :
        warning("Declaration of " & "libvlc_media_player_role_t" &
            " exists but with different size")
    libvlc_media_player_role_t
   else:
    libvlc_media_player_role_t_520094362)
  enum_libvlc_position_t_520094313 = (when declared(enum_libvlc_position_t):
    when ownSizeof(enum_libvlc_position_t) != ownSizeof(enum_libvlc_position_t_520094312):
      static :
        warning("Declaration of " & "enum_libvlc_position_t" &
            " exists but with different size")
    enum_libvlc_position_t
   else:
    enum_libvlc_position_t_520094312)
  libvlc_log_iterator_t_520094399 = (when declared(libvlc_log_iterator_t):
    when ownSizeof(libvlc_log_iterator_t) != ownSizeof(libvlc_log_iterator_t_520094398):
      static :
        warning("Declaration of " & "libvlc_log_iterator_t" &
            " exists but with different size")
    libvlc_log_iterator_t
   else:
    libvlc_log_iterator_t_520094398)
  enum_libvlc_media_parse_flag_t_520094257 = (when declared(
      enum_libvlc_media_parse_flag_t):
    when ownSizeof(enum_libvlc_media_parse_flag_t) !=
        ownSizeof(enum_libvlc_media_parse_flag_t_520094256):
      static :
        warning("Declaration of " & "enum_libvlc_media_parse_flag_t" &
            " exists but with different size")
    enum_libvlc_media_parse_flag_t
   else:
    enum_libvlc_media_parse_flag_t_520094256)
  libvlc_playback_mode_t_520094371 = (when declared(libvlc_playback_mode_t):
    when ownSizeof(libvlc_playback_mode_t) != ownSizeof(libvlc_playback_mode_t_520094370):
      static :
        warning("Declaration of " & "libvlc_playback_mode_t" &
            " exists but with different size")
    libvlc_playback_mode_t
   else:
    libvlc_playback_mode_t_520094370)
  libvlc_audio_setup_cb_520094345 = (when declared(libvlc_audio_setup_cb):
    when ownSizeof(libvlc_audio_setup_cb) != ownSizeof(libvlc_audio_setup_cb_520094344):
      static :
        warning("Declaration of " & "libvlc_audio_setup_cb" &
            " exists but with different size")
    libvlc_audio_setup_cb
   else:
    libvlc_audio_setup_cb_520094344)
  enum_libvlc_playback_mode_t_520094369 = (when declared(
      enum_libvlc_playback_mode_t):
    when ownSizeof(enum_libvlc_playback_mode_t) !=
        ownSizeof(enum_libvlc_playback_mode_t_520094368):
      static :
        warning("Declaration of " & "enum_libvlc_playback_mode_t" &
            " exists but with different size")
    enum_libvlc_playback_mode_t
   else:
    enum_libvlc_playback_mode_t_520094368)
  libvlc_track_type_t_520094208 = (when declared(libvlc_track_type_t):
    when ownSizeof(libvlc_track_type_t) != ownSizeof(libvlc_track_type_t_520094207):
      static :
        warning("Declaration of " & "libvlc_track_type_t" &
            " exists but with different size")
    libvlc_track_type_t
   else:
    libvlc_track_type_t_520094207)
  libvlc_event_manager_t_520094166 = (when declared(libvlc_event_manager_t):
    when ownSizeof(libvlc_event_manager_t) != ownSizeof(libvlc_event_manager_t_520094165):
      static :
        warning("Declaration of " & "libvlc_event_manager_t" &
            " exists but with different size")
    libvlc_event_manager_t
   else:
    libvlc_event_manager_t_520094165)
  enum_libvlc_meta_t_520094198 = (when declared(enum_libvlc_meta_t):
    when ownSizeof(enum_libvlc_meta_t) != ownSizeof(enum_libvlc_meta_t_520094197):
      static :
        warning("Declaration of " & "enum_libvlc_meta_t" &
            " exists but with different size")
    enum_libvlc_meta_t
   else:
    enum_libvlc_meta_t_520094197)
  libvlc_chapter_description_t_520094295 = (when declared(
      libvlc_chapter_description_t):
    when ownSizeof(libvlc_chapter_description_t) !=
        ownSizeof(libvlc_chapter_description_t_520094294):
      static :
        warning("Declaration of " & "libvlc_chapter_description_t" &
            " exists but with different size")
    libvlc_chapter_description_t
   else:
    libvlc_chapter_description_t_520094294)
  libvlc_media_player_t_520094283 = (when declared(libvlc_media_player_t):
    when ownSizeof(libvlc_media_player_t) != ownSizeof(libvlc_media_player_t_520094282):
      static :
        warning("Declaration of " & "libvlc_media_player_t" &
            " exists but with different size")
    libvlc_media_player_t
   else:
    libvlc_media_player_t_520094282)
  enum_libvlc_teletext_key_t_520094317 = (when declared(
      enum_libvlc_teletext_key_t):
    when ownSizeof(enum_libvlc_teletext_key_t) !=
        ownSizeof(enum_libvlc_teletext_key_t_520094316):
      static :
        warning("Declaration of " & "enum_libvlc_teletext_key_t" &
            " exists but with different size")
    enum_libvlc_teletext_key_t
   else:
    enum_libvlc_teletext_key_t_520094316)
  enum_libvlc_log_level_520094174 = (when declared(enum_libvlc_log_level):
    when ownSizeof(enum_libvlc_log_level) != ownSizeof(enum_libvlc_log_level_520094173):
      static :
        warning("Declaration of " & "enum_libvlc_log_level" &
            " exists but with different size")
    enum_libvlc_log_level
   else:
    enum_libvlc_log_level_520094173)
  libvlc_video_lock_cb_520094323 = (when declared(libvlc_video_lock_cb):
    when ownSizeof(libvlc_video_lock_cb) != ownSizeof(libvlc_video_lock_cb_520094322):
      static :
        warning("Declaration of " & "libvlc_video_lock_cb" &
            " exists but with different size")
    libvlc_video_lock_cb
   else:
    libvlc_video_lock_cb_520094322)
  libvlc_media_type_t_520094255 = (when declared(libvlc_media_type_t):
    when ownSizeof(libvlc_media_type_t) != ownSizeof(libvlc_media_type_t_520094254):
      static :
        warning("Declaration of " & "libvlc_media_type_t" &
            " exists but with different size")
    libvlc_media_type_t
   else:
    libvlc_media_type_t_520094254)
  compiler_off64_t_520094416 = (when declared(compiler_off64_t):
    when ownSizeof(compiler_off64_t) != ownSizeof(compiler_off64_t_520094415):
      static :
        warning("Declaration of " & "compiler_off64_t" &
            " exists but with different size")
    compiler_off64_t
   else:
    compiler_off64_t_520094415)
  libvlc_log_cb_520094180 = (when declared(libvlc_log_cb):
    when ownSizeof(libvlc_log_cb) != ownSizeof(libvlc_log_cb_520094179):
      static :
        warning("Declaration of " & "libvlc_log_cb" &
            " exists but with different size")
    libvlc_log_cb
   else:
    libvlc_log_cb_520094179)
  enum_libvlc_audio_output_device_types_t_520094353 = (when declared(
      enum_libvlc_audio_output_device_types_t):
    when ownSizeof(enum_libvlc_audio_output_device_types_t) !=
        ownSizeof(enum_libvlc_audio_output_device_types_t_520094352):
      static :
        warning("Declaration of " & "enum_libvlc_audio_output_device_types_t" &
            " exists but with different size")
    enum_libvlc_audio_output_device_types_t
   else:
    enum_libvlc_audio_output_device_types_t_520094352)
  libvlc_media_stats_t_520094212 = (when declared(libvlc_media_stats_t):
    when ownSizeof(libvlc_media_stats_t) != ownSizeof(libvlc_media_stats_t_520094211):
      static :
        warning("Declaration of " & "libvlc_media_stats_t" &
            " exists but with different size")
    libvlc_media_stats_t
   else:
    libvlc_media_stats_t_520094211)
  libvlc_log_message_t_520094403 = (when declared(libvlc_log_message_t):
    when ownSizeof(libvlc_log_message_t) != ownSizeof(libvlc_log_message_t_520094402):
      static :
        warning("Declaration of " & "libvlc_log_message_t" &
            " exists but with different size")
    libvlc_log_message_t
   else:
    libvlc_log_message_t_520094402)
  enum_libvlc_audio_output_channel_t_520094357 = (when declared(
      enum_libvlc_audio_output_channel_t):
    when ownSizeof(enum_libvlc_audio_output_channel_t) !=
        ownSizeof(enum_libvlc_audio_output_channel_t_520094356):
      static :
        warning("Declaration of " & "enum_libvlc_audio_output_channel_t" &
            " exists but with different size")
    enum_libvlc_audio_output_channel_t
   else:
    enum_libvlc_audio_output_channel_t_520094356)
  enum_libvlc_media_slave_type_t_520094265 = (when declared(
      enum_libvlc_media_slave_type_t):
    when ownSizeof(enum_libvlc_media_slave_type_t) !=
        ownSizeof(enum_libvlc_media_slave_type_t_520094264):
      static :
        warning("Declaration of " & "enum_libvlc_media_slave_type_t" &
            " exists but with different size")
    enum_libvlc_media_slave_type_t
   else:
    enum_libvlc_media_slave_type_t_520094264)
  enum_libvlc_navigate_mode_t_520094309 = (when declared(
      enum_libvlc_navigate_mode_t):
    when ownSizeof(enum_libvlc_navigate_mode_t) !=
        ownSizeof(enum_libvlc_navigate_mode_t_520094308):
      static :
        warning("Declaration of " & "enum_libvlc_navigate_mode_t" &
            " exists but with different size")
    enum_libvlc_navigate_mode_t
   else:
    enum_libvlc_navigate_mode_t_520094308)
  libvlc_audio_output_device_types_t_520094355 = (when declared(
      libvlc_audio_output_device_types_t):
    when ownSizeof(libvlc_audio_output_device_types_t) !=
        ownSizeof(libvlc_audio_output_device_types_t_520094354):
      static :
        warning("Declaration of " & "libvlc_audio_output_device_types_t" &
            " exists but with different size")
    libvlc_audio_output_device_types_t
   else:
    libvlc_audio_output_device_types_t_520094354)
  enum_libvlc_media_discoverer_category_t_520094375 = (when declared(
      enum_libvlc_media_discoverer_category_t):
    when ownSizeof(enum_libvlc_media_discoverer_category_t) !=
        ownSizeof(enum_libvlc_media_discoverer_category_t_520094374):
      static :
        warning("Declaration of " & "enum_libvlc_media_discoverer_category_t" &
            " exists but with different size")
    enum_libvlc_media_discoverer_category_t
   else:
    enum_libvlc_media_discoverer_category_t_520094374)
  libvlc_audio_resume_cb_520094337 = (when declared(libvlc_audio_resume_cb):
    when ownSizeof(libvlc_audio_resume_cb) != ownSizeof(libvlc_audio_resume_cb_520094336):
      static :
        warning("Declaration of " & "libvlc_audio_resume_cb" &
            " exists but with different size")
    libvlc_audio_resume_cb
   else:
    libvlc_audio_resume_cb_520094336)
  enum_libvlc_dialog_question_type_520094391 = (when declared(
      enum_libvlc_dialog_question_type):
    when ownSizeof(enum_libvlc_dialog_question_type) !=
        ownSizeof(enum_libvlc_dialog_question_type_520094390):
      static :
        warning("Declaration of " & "enum_libvlc_dialog_question_type" &
            " exists but with different size")
    enum_libvlc_dialog_question_type
   else:
    enum_libvlc_dialog_question_type_520094390)
  enum_libvlc_media_type_t_520094253 = (when declared(enum_libvlc_media_type_t):
    when ownSizeof(enum_libvlc_media_type_t) !=
        ownSizeof(enum_libvlc_media_type_t_520094252):
      static :
        warning("Declaration of " & "enum_libvlc_media_type_t" &
            " exists but with different size")
    enum_libvlc_media_type_t
   else:
    enum_libvlc_media_type_t_520094252)
  libvlc_video_format_cb_520094329 = (when declared(libvlc_video_format_cb):
    when ownSizeof(libvlc_video_format_cb) != ownSizeof(libvlc_video_format_cb_520094328):
      static :
        warning("Declaration of " & "libvlc_video_format_cb" &
            " exists but with different size")
    libvlc_video_format_cb
   else:
    libvlc_video_format_cb_520094328)
  libvlc_log_t_520094176 = (when declared(libvlc_log_t):
    when ownSizeof(libvlc_log_t) != ownSizeof(libvlc_log_t_520094175):
      static :
        warning("Declaration of " & "libvlc_log_t" &
            " exists but with different size")
    libvlc_log_t
   else:
    libvlc_log_t_520094175)
  libvlc_audio_set_volume_cb_520094343 = (when declared(
      libvlc_audio_set_volume_cb):
    when ownSizeof(libvlc_audio_set_volume_cb) !=
        ownSizeof(libvlc_audio_set_volume_cb_520094342):
      static :
        warning("Declaration of " & "libvlc_audio_set_volume_cb" &
            " exists but with different size")
    libvlc_audio_set_volume_cb
   else:
    libvlc_audio_set_volume_cb_520094342)
  libvlc_media_library_t_520094373 = (when declared(libvlc_media_library_t):
    when ownSizeof(libvlc_media_library_t) != ownSizeof(libvlc_media_library_t_520094372):
      static :
        warning("Declaration of " & "libvlc_media_library_t" &
            " exists but with different size")
    libvlc_media_library_t
   else:
    libvlc_media_library_t_520094372)
  enum_libvlc_state_t_520094202 = (when declared(enum_libvlc_state_t):
    when ownSizeof(enum_libvlc_state_t) != ownSizeof(enum_libvlc_state_t_520094201):
      static :
        warning("Declaration of " & "enum_libvlc_state_t" &
            " exists but with different size")
    enum_libvlc_state_t
   else:
    enum_libvlc_state_t_520094201)
  libvlc_dialog_question_type_520094393 = (when declared(
      libvlc_dialog_question_type):
    when ownSizeof(libvlc_dialog_question_type) !=
        ownSizeof(libvlc_dialog_question_type_520094392):
      static :
        warning("Declaration of " & "libvlc_dialog_question_type" &
            " exists but with different size")
    libvlc_dialog_question_type
   else:
    libvlc_dialog_question_type_520094392)
  libvlc_media_slave_type_t_520094267 = (when declared(libvlc_media_slave_type_t):
    when ownSizeof(libvlc_media_slave_type_t) !=
        ownSizeof(libvlc_media_slave_type_t_520094266):
      static :
        warning("Declaration of " & "libvlc_media_slave_type_t" &
            " exists but with different size")
    libvlc_media_slave_type_t
   else:
    libvlc_media_slave_type_t_520094266)
  struct_libvlc_media_track_info_t_520094214 = (when declared(
      struct_libvlc_media_track_info_t):
    when ownSizeof(struct_libvlc_media_track_info_t) !=
        ownSizeof(struct_libvlc_media_track_info_t_520094213):
      static :
        warning("Declaration of " & "struct_libvlc_media_track_info_t" &
            " exists but with different size")
    struct_libvlc_media_track_info_t
   else:
    struct_libvlc_media_track_info_t_520094213)
  libvlc_callback_t_520094170 = (when declared(libvlc_callback_t):
    when ownSizeof(libvlc_callback_t) != ownSizeof(libvlc_callback_t_520094169):
      static :
        warning("Declaration of " & "libvlc_callback_t" &
            " exists but with different size")
    libvlc_callback_t
   else:
    libvlc_callback_t_520094169)
  libvlc_audio_track_t_520094220 = (when declared(libvlc_audio_track_t):
    when ownSizeof(libvlc_audio_track_t) != ownSizeof(libvlc_audio_track_t_520094219):
      static :
        warning("Declaration of " & "libvlc_audio_track_t" &
            " exists but with different size")
    libvlc_audio_track_t
   else:
    libvlc_audio_track_t_520094219)
  struct_libvlc_log_message_t_520094401 = (when declared(
      struct_libvlc_log_message_t):
    when ownSizeof(struct_libvlc_log_message_t) !=
        ownSizeof(struct_libvlc_log_message_t_520094400):
      static :
        warning("Declaration of " & "struct_libvlc_log_message_t" &
            " exists but with different size")
    struct_libvlc_log_message_t
   else:
    struct_libvlc_log_message_t_520094400)
  struct_libvlc_title_description_t_520094289 = (when declared(
      struct_libvlc_title_description_t):
    when ownSizeof(struct_libvlc_title_description_t) !=
        ownSizeof(struct_libvlc_title_description_t_520094288):
      static :
        warning("Declaration of " & "struct_libvlc_title_description_t" &
            " exists but with different size")
    struct_libvlc_title_description_t
   else:
    struct_libvlc_title_description_t_520094288)
  libvlc_audio_drain_cb_520094341 = (when declared(libvlc_audio_drain_cb):
    when ownSizeof(libvlc_audio_drain_cb) != ownSizeof(libvlc_audio_drain_cb_520094340):
      static :
        warning("Declaration of " & "libvlc_audio_drain_cb" &
            " exists but with different size")
    libvlc_audio_drain_cb
   else:
    libvlc_audio_drain_cb_520094340)
  libvlc_media_discoverer_description_t_520094381 = (when declared(
      libvlc_media_discoverer_description_t):
    when ownSizeof(libvlc_media_discoverer_description_t) !=
        ownSizeof(libvlc_media_discoverer_description_t_520094380):
      static :
        warning("Declaration of " & "libvlc_media_discoverer_description_t" &
            " exists but with different size")
    libvlc_media_discoverer_description_t
   else:
    libvlc_media_discoverer_description_t_520094380)
  libvlc_audio_output_t_520094299 = (when declared(libvlc_audio_output_t):
    when ownSizeof(libvlc_audio_output_t) != ownSizeof(libvlc_audio_output_t_520094298):
      static :
        warning("Declaration of " & "libvlc_audio_output_t" &
            " exists but with different size")
    libvlc_audio_output_t
   else:
    libvlc_audio_output_t_520094298)
  libvlc_video_orient_t_520094224 = (when declared(libvlc_video_orient_t):
    when ownSizeof(libvlc_video_orient_t) != ownSizeof(libvlc_video_orient_t_520094223):
      static :
        warning("Declaration of " & "libvlc_video_orient_t" &
            " exists but with different size")
    libvlc_video_orient_t
   else:
    libvlc_video_orient_t_520094223)
  libvlc_audio_pause_cb_520094335 = (when declared(libvlc_audio_pause_cb):
    when ownSizeof(libvlc_audio_pause_cb) != ownSizeof(libvlc_audio_pause_cb_520094334):
      static :
        warning("Declaration of " & "libvlc_audio_pause_cb" &
            " exists but with different size")
    libvlc_audio_pause_cb
   else:
    libvlc_audio_pause_cb_520094334)
  libvlc_meta_t_520094200 = (when declared(libvlc_meta_t):
    when ownSizeof(libvlc_meta_t) != ownSizeof(libvlc_meta_t_520094199):
      static :
        warning("Declaration of " & "libvlc_meta_t" &
            " exists but with different size")
    libvlc_meta_t
   else:
    libvlc_meta_t_520094199)
  libvlc_media_slave_t_520094271 = (when declared(libvlc_media_slave_t):
    when ownSizeof(libvlc_media_slave_t) != ownSizeof(libvlc_media_slave_t_520094270):
      static :
        warning("Declaration of " & "libvlc_media_slave_t" &
            " exists but with different size")
    libvlc_media_slave_t
   else:
    libvlc_media_slave_t_520094270)
  compiler_off_t_520094412 = (when declared(compiler_off_t):
    when ownSizeof(compiler_off_t) != ownSizeof(compiler_off_t_520094411):
      static :
        warning("Declaration of " & "compiler_off_t" &
            " exists but with different size")
    compiler_off_t
   else:
    compiler_off_t_520094411)
  libvlc_video_projection_t_520094228 = (when declared(libvlc_video_projection_t):
    when ownSizeof(libvlc_video_projection_t) !=
        ownSizeof(libvlc_video_projection_t_520094227):
      static :
        warning("Declaration of " & "libvlc_video_projection_t" &
            " exists but with different size")
    libvlc_video_projection_t
   else:
    libvlc_video_projection_t_520094227)
  struct_libvlc_audio_output_t_520094297 = (when declared(
      struct_libvlc_audio_output_t):
    when ownSizeof(struct_libvlc_audio_output_t) !=
        ownSizeof(struct_libvlc_audio_output_t_520094296):
      static :
        warning("Declaration of " & "struct_libvlc_audio_output_t" &
            " exists but with different size")
    struct_libvlc_audio_output_t
   else:
    struct_libvlc_audio_output_t_520094296)
  libvlc_video_display_cb_520094327 = (when declared(libvlc_video_display_cb):
    when ownSizeof(libvlc_video_display_cb) !=
        ownSizeof(libvlc_video_display_cb_520094326):
      static :
        warning("Declaration of " & "libvlc_video_display_cb" &
            " exists but with different size")
    libvlc_video_display_cb
   else:
    libvlc_video_display_cb_520094326)
  struct_libvlc_event_t_520094172 = (when declared(struct_libvlc_event_t):
    when ownSizeof(struct_libvlc_event_t) != ownSizeof(struct_libvlc_event_t_520094171):
      static :
        warning("Declaration of " & "struct_libvlc_event_t" &
            " exists but with different size")
    struct_libvlc_event_t
   else:
    struct_libvlc_event_t_520094171)
  uintptr_t_520094178 = (when declared(uintptr_t):
    when ownSizeof(uintptr_t) != ownSizeof(uintptr_t_520094177):
      static :
        warning("Declaration of " & "uintptr_t" &
            " exists but with different size")
    uintptr_t
   else:
    uintptr_t_520094177)
  libvlc_audio_output_device_t_520094303 = (when declared(
      libvlc_audio_output_device_t):
    when ownSizeof(libvlc_audio_output_device_t) !=
        ownSizeof(libvlc_audio_output_device_t_520094302):
      static :
        warning("Declaration of " & "libvlc_audio_output_device_t" &
            " exists but with different size")
    libvlc_audio_output_device_t
   else:
    libvlc_audio_output_device_t_520094302)
  libvlc_dialog_cbs_520094397 = (when declared(libvlc_dialog_cbs):
    when ownSizeof(libvlc_dialog_cbs) != ownSizeof(libvlc_dialog_cbs_520094396):
      static :
        warning("Declaration of " & "libvlc_dialog_cbs" &
            " exists but with different size")
    libvlc_dialog_cbs
   else:
    libvlc_dialog_cbs_520094396)
  libvlc_media_list_t_520094365 = (when declared(libvlc_media_list_t):
    when ownSizeof(libvlc_media_list_t) != ownSizeof(libvlc_media_list_t_520094364):
      static :
        warning("Declaration of " & "libvlc_media_list_t" &
            " exists but with different size")
    libvlc_media_list_t
   else:
    libvlc_media_list_t_520094364)
  libvlc_module_description_t_520094186 = (when declared(
      libvlc_module_description_t):
    when ownSizeof(libvlc_module_description_t) !=
        ownSizeof(libvlc_module_description_t_520094185):
      static :
        warning("Declaration of " & "libvlc_module_description_t" &
            " exists but with different size")
    libvlc_module_description_t
   else:
    libvlc_module_description_t_520094185)
  libvlc_renderer_item_t_520094194 = (when declared(libvlc_renderer_item_t):
    when ownSizeof(libvlc_renderer_item_t) != ownSizeof(libvlc_renderer_item_t_520094193):
      static :
        warning("Declaration of " & "libvlc_renderer_item_t" &
            " exists but with different size")
    libvlc_renderer_item_t
   else:
    libvlc_renderer_item_t_520094193)
  enum_libvlc_video_adjust_option_t_520094351 = (when declared(
      enum_libvlc_video_adjust_option_t):
    when ownSizeof(enum_libvlc_video_adjust_option_t) !=
        ownSizeof(enum_libvlc_video_adjust_option_t_520094350):
      static :
        warning("Declaration of " & "enum_libvlc_video_adjust_option_t" &
            " exists but with different size")
    enum_libvlc_video_adjust_option_t
   else:
    enum_libvlc_video_adjust_option_t_520094350)
  struct_libvlc_audio_track_t_520094218 = (when declared(
      struct_libvlc_audio_track_t):
    when ownSizeof(struct_libvlc_audio_track_t) !=
        ownSizeof(struct_libvlc_audio_track_t_520094217):
      static :
        warning("Declaration of " & "struct_libvlc_audio_track_t" &
            " exists but with different size")
    struct_libvlc_audio_track_t
   else:
    struct_libvlc_audio_track_t_520094217)
  enum_libvlc_video_orient_t_520094222 = (when declared(
      enum_libvlc_video_orient_t):
    when ownSizeof(enum_libvlc_video_orient_t) !=
        ownSizeof(enum_libvlc_video_orient_t_520094221):
      static :
        warning("Declaration of " & "enum_libvlc_video_orient_t" &
            " exists but with different size")
    enum_libvlc_video_orient_t
   else:
    enum_libvlc_video_orient_t_520094221)
  libvlc_renderer_discoverer_t_520094188 = (when declared(
      libvlc_renderer_discoverer_t):
    when ownSizeof(libvlc_renderer_discoverer_t) !=
        ownSizeof(libvlc_renderer_discoverer_t_520094187):
      static :
        warning("Declaration of " & "libvlc_renderer_discoverer_t" &
            " exists but with different size")
    libvlc_renderer_discoverer_t
   else:
    libvlc_renderer_discoverer_t_520094187)
  libvlc_audio_cleanup_cb_520094347 = (when declared(libvlc_audio_cleanup_cb):
    when ownSizeof(libvlc_audio_cleanup_cb) !=
        ownSizeof(libvlc_audio_cleanup_cb_520094346):
      static :
        warning("Declaration of " & "libvlc_audio_cleanup_cb" &
            " exists but with different size")
    libvlc_audio_cleanup_cb
   else:
    libvlc_audio_cleanup_cb_520094346)
  struct_libvlc_chapter_description_t_520094293 = (when declared(
      struct_libvlc_chapter_description_t):
    when ownSizeof(struct_libvlc_chapter_description_t) !=
        ownSizeof(struct_libvlc_chapter_description_t_520094292):
      static :
        warning("Declaration of " & "struct_libvlc_chapter_description_t" &
            " exists but with different size")
    struct_libvlc_chapter_description_t
   else:
    struct_libvlc_chapter_description_t_520094292)
  libvlc_event_type_t_520094168 = (when declared(libvlc_event_type_t):
    when ownSizeof(libvlc_event_type_t) != ownSizeof(libvlc_event_type_t_520094167):
      static :
        warning("Declaration of " & "libvlc_event_type_t" &
            " exists but with different size")
    libvlc_event_type_t
   else:
    libvlc_event_type_t_520094167)
  libvlc_teletext_key_t_520094319 = (when declared(libvlc_teletext_key_t):
    when ownSizeof(libvlc_teletext_key_t) != ownSizeof(libvlc_teletext_key_t_520094318):
      static :
        warning("Declaration of " & "libvlc_teletext_key_t" &
            " exists but with different size")
    libvlc_teletext_key_t
   else:
    libvlc_teletext_key_t_520094318)
  libvlc_video_track_t_520094243 = (when declared(libvlc_video_track_t):
    when ownSizeof(libvlc_video_track_t) != ownSizeof(libvlc_video_track_t_520094242):
      static :
        warning("Declaration of " & "libvlc_video_track_t" &
            " exists but with different size")
    libvlc_video_track_t
   else:
    libvlc_video_track_t_520094242)
  libvlc_event_t_520094387 = (when declared(libvlc_event_t):
    when ownSizeof(libvlc_event_t) != ownSizeof(libvlc_event_t_520094386):
      static :
        warning("Declaration of " & "libvlc_event_t" &
            " exists but with different size")
    libvlc_event_t
   else:
    libvlc_event_t_520094386)
  libvlc_media_parsed_status_t_520094263 = (when declared(
      libvlc_media_parsed_status_t):
    when ownSizeof(libvlc_media_parsed_status_t) !=
        ownSizeof(libvlc_media_parsed_status_t_520094262):
      static :
        warning("Declaration of " & "libvlc_media_parsed_status_t" &
            " exists but with different size")
    libvlc_media_parsed_status_t
   else:
    libvlc_media_parsed_status_t_520094262)
  struct_libvlc_dialog_cbs_520094395 = (when declared(struct_libvlc_dialog_cbs):
    when ownSizeof(struct_libvlc_dialog_cbs) !=
        ownSizeof(struct_libvlc_dialog_cbs_520094394):
      static :
        warning("Declaration of " & "struct_libvlc_dialog_cbs" &
            " exists but with different size")
    struct_libvlc_dialog_cbs
   else:
    struct_libvlc_dialog_cbs_520094394)
  libvlc_subtitle_track_t_520094247 = (when declared(libvlc_subtitle_track_t):
    when ownSizeof(libvlc_subtitle_track_t) !=
        ownSizeof(libvlc_subtitle_track_t_520094246):
      static :
        warning("Declaration of " & "libvlc_subtitle_track_t" &
            " exists but with different size")
    libvlc_subtitle_track_t
   else:
    libvlc_subtitle_track_t_520094246)
  libvlc_video_cleanup_cb_520094331 = (when declared(libvlc_video_cleanup_cb):
    when ownSizeof(libvlc_video_cleanup_cb) !=
        ownSizeof(libvlc_video_cleanup_cb_520094330):
      static :
        warning("Declaration of " & "libvlc_video_cleanup_cb" &
            " exists but with different size")
    libvlc_video_cleanup_cb
   else:
    libvlc_video_cleanup_cb_520094330)
  libvlc_media_list_player_t_520094367 = (when declared(
      libvlc_media_list_player_t):
    when ownSizeof(libvlc_media_list_player_t) !=
        ownSizeof(libvlc_media_list_player_t_520094366):
      static :
        warning("Declaration of " & "libvlc_media_list_player_t" &
            " exists but with different size")
    libvlc_media_list_player_t
   else:
    libvlc_media_list_player_t_520094366)
  struct_libvlc_video_track_t_520094234 = (when declared(
      struct_libvlc_video_track_t):
    when ownSizeof(struct_libvlc_video_track_t) !=
        ownSizeof(struct_libvlc_video_track_t_520094233):
      static :
        warning("Declaration of " & "struct_libvlc_video_track_t" &
            " exists but with different size")
    struct_libvlc_video_track_t
   else:
    struct_libvlc_video_track_t_520094233)
  enum_libvlc_event_e_520094385 = (when declared(enum_libvlc_event_e):
    when ownSizeof(enum_libvlc_event_e) != ownSizeof(enum_libvlc_event_e_520094384):
      static :
        warning("Declaration of " & "enum_libvlc_event_e" &
            " exists but with different size")
    enum_libvlc_event_e
   else:
    enum_libvlc_event_e_520094384)
  struct_libvlc_media_track_t_520094249 = (when declared(
      struct_libvlc_media_track_t):
    when ownSizeof(struct_libvlc_media_track_t) !=
        ownSizeof(struct_libvlc_media_track_t_520094248):
      static :
        warning("Declaration of " & "struct_libvlc_media_track_t" &
            " exists but with different size")
    struct_libvlc_media_track_t
   else:
    struct_libvlc_media_track_t_520094248)
  libvlc_audio_flush_cb_520094339 = (when declared(libvlc_audio_flush_cb):
    when ownSizeof(libvlc_audio_flush_cb) != ownSizeof(libvlc_audio_flush_cb_520094338):
      static :
        warning("Declaration of " & "libvlc_audio_flush_cb" &
            " exists but with different size")
    libvlc_audio_flush_cb
   else:
    libvlc_audio_flush_cb_520094338)
  libvlc_dialog_id_520094389 = (when declared(libvlc_dialog_id):
    when ownSizeof(libvlc_dialog_id) != ownSizeof(libvlc_dialog_id_520094388):
      static :
        warning("Declaration of " & "libvlc_dialog_id" &
            " exists but with different size")
    libvlc_dialog_id
   else:
    libvlc_dialog_id_520094388)
  enum_libvlc_media_parsed_status_t_520094261 = (when declared(
      enum_libvlc_media_parsed_status_t):
    when ownSizeof(enum_libvlc_media_parsed_status_t) !=
        ownSizeof(enum_libvlc_media_parsed_status_t_520094260):
      static :
        warning("Declaration of " & "enum_libvlc_media_parsed_status_t" &
            " exists but with different size")
    enum_libvlc_media_parsed_status_t
   else:
    enum_libvlc_media_parsed_status_t_520094260)
  struct_libvlc_audio_output_device_t_520094301 = (when declared(
      struct_libvlc_audio_output_device_t):
    when ownSizeof(struct_libvlc_audio_output_device_t) !=
        ownSizeof(struct_libvlc_audio_output_device_t_520094300):
      static :
        warning("Declaration of " & "struct_libvlc_audio_output_device_t" &
            " exists but with different size")
    struct_libvlc_audio_output_device_t
   else:
    struct_libvlc_audio_output_device_t_520094300)
  struct_libvlc_media_discoverer_description_t_520094379 = (when declared(
      struct_libvlc_media_discoverer_description_t):
    when ownSizeof(struct_libvlc_media_discoverer_description_t) !=
        ownSizeof(struct_libvlc_media_discoverer_description_t_520094378):
      static :
        warning("Declaration of " &
            "struct_libvlc_media_discoverer_description_t" &
            " exists but with different size")
    struct_libvlc_media_discoverer_description_t
   else:
    struct_libvlc_media_discoverer_description_t_520094378)
  libvlc_media_discoverer_category_t_520094377 = (when declared(
      libvlc_media_discoverer_category_t):
    when ownSizeof(libvlc_media_discoverer_category_t) !=
        ownSizeof(libvlc_media_discoverer_category_t_520094376):
      static :
        warning("Declaration of " & "libvlc_media_discoverer_category_t" &
            " exists but with different size")
    libvlc_media_discoverer_category_t
   else:
    libvlc_media_discoverer_category_t_520094376)
  libvlc_media_discoverer_t_520094383 = (when declared(libvlc_media_discoverer_t):
    when ownSizeof(libvlc_media_discoverer_t) !=
        ownSizeof(libvlc_media_discoverer_t_520094382):
      static :
        warning("Declaration of " & "libvlc_media_discoverer_t" &
            " exists but with different size")
    libvlc_media_discoverer_t
   else:
    libvlc_media_discoverer_t_520094382)
  libvlc_title_description_t_520094291 = (when declared(
      libvlc_title_description_t):
    when ownSizeof(libvlc_title_description_t) !=
        ownSizeof(libvlc_title_description_t_520094290):
      static :
        warning("Declaration of " & "libvlc_title_description_t" &
            " exists but with different size")
    libvlc_title_description_t
   else:
    libvlc_title_description_t_520094290)
  enum_libvlc_track_type_t_520094206 = (when declared(enum_libvlc_track_type_t):
    when ownSizeof(enum_libvlc_track_type_t) !=
        ownSizeof(enum_libvlc_track_type_t_520094205):
      static :
        warning("Declaration of " & "enum_libvlc_track_type_t" &
            " exists but with different size")
    enum_libvlc_track_type_t
   else:
    enum_libvlc_track_type_t_520094205)
  struct_libvlc_track_description_t_520094285 = (when declared(
      struct_libvlc_track_description_t):
    when ownSizeof(struct_libvlc_track_description_t) !=
        ownSizeof(struct_libvlc_track_description_t_520094284):
      static :
        warning("Declaration of " & "struct_libvlc_track_description_t" &
            " exists but with different size")
    struct_libvlc_track_description_t
   else:
    struct_libvlc_track_description_t_520094284)
  libvlc_track_description_t_520094287 = (when declared(
      libvlc_track_description_t):
    when ownSizeof(libvlc_track_description_t) !=
        ownSizeof(libvlc_track_description_t_520094286):
      static :
        warning("Declaration of " & "libvlc_track_description_t" &
            " exists but with different size")
    libvlc_track_description_t
   else:
    libvlc_track_description_t_520094286)
  enum_libvlc_video_logo_option_t_520094349 = (when declared(
      enum_libvlc_video_logo_option_t):
    when ownSizeof(enum_libvlc_video_logo_option_t) !=
        ownSizeof(enum_libvlc_video_logo_option_t_520094348):
      static :
        warning("Declaration of " & "enum_libvlc_video_logo_option_t" &
            " exists but with different size")
    enum_libvlc_video_logo_option_t
   else:
    enum_libvlc_video_logo_option_t_520094348)
  libvlc_time_t_520094164 = (when declared(libvlc_time_t):
    when ownSizeof(libvlc_time_t) != ownSizeof(libvlc_time_t_520094163):
      static :
        warning("Declaration of " & "libvlc_time_t" &
            " exists but with different size")
    libvlc_time_t
   else:
    libvlc_time_t_520094163)
  struct_libvlc_media_stats_t_520094210 = (when declared(
      struct_libvlc_media_stats_t):
    when ownSizeof(struct_libvlc_media_stats_t) !=
        ownSizeof(struct_libvlc_media_stats_t_520094209):
      static :
        warning("Declaration of " & "struct_libvlc_media_stats_t" &
            " exists but with different size")
    struct_libvlc_media_stats_t
   else:
    struct_libvlc_media_stats_t_520094209)
  struct_libvlc_video_viewpoint_t_520094230 = (when declared(
      struct_libvlc_video_viewpoint_t):
    when ownSizeof(struct_libvlc_video_viewpoint_t) !=
        ownSizeof(struct_libvlc_video_viewpoint_t_520094229):
      static :
        warning("Declaration of " & "struct_libvlc_video_viewpoint_t" &
            " exists but with different size")
    struct_libvlc_video_viewpoint_t
   else:
    struct_libvlc_video_viewpoint_t_520094229)
  libvlc_video_unlock_cb_520094325 = (when declared(libvlc_video_unlock_cb):
    when ownSizeof(libvlc_video_unlock_cb) != ownSizeof(libvlc_video_unlock_cb_520094324):
      static :
        warning("Declaration of " & "libvlc_video_unlock_cb" &
            " exists but with different size")
    libvlc_video_unlock_cb
   else:
    libvlc_video_unlock_cb_520094324)
  struct_libvlc_module_description_t_520094184 = (when declared(
      struct_libvlc_module_description_t):
    when ownSizeof(struct_libvlc_module_description_t) !=
        ownSizeof(struct_libvlc_module_description_t_520094183):
      static :
        warning("Declaration of " & "struct_libvlc_module_description_t" &
            " exists but with different size")
    struct_libvlc_module_description_t
   else:
    struct_libvlc_module_description_t_520094183)
  libvlc_media_track_info_t_520094216 = (when declared(libvlc_media_track_info_t):
    when ownSizeof(libvlc_media_track_info_t) !=
        ownSizeof(libvlc_media_track_info_t_520094215):
      static :
        warning("Declaration of " & "libvlc_media_track_info_t" &
            " exists but with different size")
    libvlc_media_track_info_t
   else:
    libvlc_media_track_info_t_520094215)
  enum_libvlc_video_projection_t_520094226 = (when declared(
      enum_libvlc_video_projection_t):
    when ownSizeof(enum_libvlc_video_projection_t) !=
        ownSizeof(enum_libvlc_video_projection_t_520094225):
      static :
        warning("Declaration of " & "enum_libvlc_video_projection_t" &
            " exists but with different size")
    enum_libvlc_video_projection_t
   else:
    enum_libvlc_video_projection_t_520094225)
  libvlc_equalizer_t_520094321 = (when declared(libvlc_equalizer_t):
    when ownSizeof(libvlc_equalizer_t) != ownSizeof(libvlc_equalizer_t_520094320):
      static :
        warning("Declaration of " & "libvlc_equalizer_t" &
            " exists but with different size")
    libvlc_equalizer_t
   else:
    libvlc_equalizer_t_520094320)
  struct_libvlc_media_slave_t_520094269 = (when declared(
      struct_libvlc_media_slave_t):
    when ownSizeof(struct_libvlc_media_slave_t) !=
        ownSizeof(struct_libvlc_media_slave_t_520094268):
      static :
        warning("Declaration of " & "struct_libvlc_media_slave_t" &
            " exists but with different size")
    struct_libvlc_media_slave_t
   else:
    struct_libvlc_media_slave_t_520094268)
  libvlc_media_parse_flag_t_520094259 = (when declared(libvlc_media_parse_flag_t):
    when ownSizeof(libvlc_media_parse_flag_t) !=
        ownSizeof(libvlc_media_parse_flag_t_520094258):
      static :
        warning("Declaration of " & "libvlc_media_parse_flag_t" &
            " exists but with different size")
    libvlc_media_parse_flag_t
   else:
    libvlc_media_parse_flag_t_520094258)
when not declared(libvlc_audio_play_cb):
  type
    libvlc_audio_play_cb* = libvlc_audio_play_cb_520094332
else:
  static :
    hint("Declaration of " & "libvlc_audio_play_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_media_track_t):
  type
    libvlc_media_track_t* = libvlc_media_track_t_520094250
else:
  static :
    hint("Declaration of " & "libvlc_media_track_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_subtitle_track_t):
  type
    struct_libvlc_subtitle_track_t* = struct_libvlc_subtitle_track_t_520094244
else:
  static :
    hint("Declaration of " & "struct_libvlc_subtitle_track_t" &
        " already exists, not redeclaring")
when not declared(libvlc_position_t):
  type
    libvlc_position_t* = libvlc_position_t_520094314
else:
  static :
    hint("Declaration of " & "libvlc_position_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_channel_t):
  type
    libvlc_audio_output_channel_t* = libvlc_audio_output_channel_t_520094358
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_channel_t" &
        " already exists, not redeclaring")
when not declared(libvlc_navigate_mode_t):
  type
    libvlc_navigate_mode_t* = libvlc_navigate_mode_t_520094310
else:
  static :
    hint("Declaration of " & "libvlc_navigate_mode_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_player_role):
  type
    enum_libvlc_media_player_role* = enum_libvlc_media_player_role_520094360
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_player_role" &
        " already exists, not redeclaring")
when not declared(libvlc_state_t):
  type
    libvlc_state_t* = libvlc_state_t_520094203
else:
  static :
    hint("Declaration of " & "libvlc_state_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_viewpoint_t):
  type
    libvlc_video_viewpoint_t* = libvlc_video_viewpoint_t_520094231
else:
  static :
    hint("Declaration of " & "libvlc_video_viewpoint_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_role_t):
  type
    libvlc_media_player_role_t* = libvlc_media_player_role_t_520094362
else:
  static :
    hint("Declaration of " & "libvlc_media_player_role_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_position_t):
  type
    enum_libvlc_position_t* = enum_libvlc_position_t_520094312
else:
  static :
    hint("Declaration of " & "enum_libvlc_position_t" &
        " already exists, not redeclaring")
when not declared(libvlc_log_iterator_t):
  type
    libvlc_log_iterator_t* = libvlc_log_iterator_t_520094398
else:
  static :
    hint("Declaration of " & "libvlc_log_iterator_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_parse_flag_t):
  type
    enum_libvlc_media_parse_flag_t* = enum_libvlc_media_parse_flag_t_520094256
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_parse_flag_t" &
        " already exists, not redeclaring")
when not declared(libvlc_playback_mode_t):
  type
    libvlc_playback_mode_t* = libvlc_playback_mode_t_520094370
else:
  static :
    hint("Declaration of " & "libvlc_playback_mode_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_setup_cb):
  type
    libvlc_audio_setup_cb* = libvlc_audio_setup_cb_520094344
else:
  static :
    hint("Declaration of " & "libvlc_audio_setup_cb" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_playback_mode_t):
  type
    enum_libvlc_playback_mode_t* = enum_libvlc_playback_mode_t_520094368
else:
  static :
    hint("Declaration of " & "enum_libvlc_playback_mode_t" &
        " already exists, not redeclaring")
when not declared(libvlc_track_type_t):
  type
    libvlc_track_type_t* = libvlc_track_type_t_520094207
else:
  static :
    hint("Declaration of " & "libvlc_track_type_t" &
        " already exists, not redeclaring")
when not declared(libvlc_event_manager_t):
  type
    libvlc_event_manager_t* = libvlc_event_manager_t_520094165
else:
  static :
    hint("Declaration of " & "libvlc_event_manager_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_meta_t):
  type
    enum_libvlc_meta_t* = enum_libvlc_meta_t_520094197
else:
  static :
    hint("Declaration of " & "enum_libvlc_meta_t" &
        " already exists, not redeclaring")
when not declared(libvlc_chapter_description_t):
  type
    libvlc_chapter_description_t* = libvlc_chapter_description_t_520094294
else:
  static :
    hint("Declaration of " & "libvlc_chapter_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_t):
  type
    libvlc_media_player_t* = libvlc_media_player_t_520094282
else:
  static :
    hint("Declaration of " & "libvlc_media_player_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_teletext_key_t):
  type
    enum_libvlc_teletext_key_t* = enum_libvlc_teletext_key_t_520094316
else:
  static :
    hint("Declaration of " & "enum_libvlc_teletext_key_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_log_level):
  type
    enum_libvlc_log_level* = enum_libvlc_log_level_520094173
else:
  static :
    hint("Declaration of " & "enum_libvlc_log_level" &
        " already exists, not redeclaring")
when not declared(libvlc_video_lock_cb):
  type
    libvlc_video_lock_cb* = libvlc_video_lock_cb_520094322
else:
  static :
    hint("Declaration of " & "libvlc_video_lock_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_media_type_t):
  type
    libvlc_media_type_t* = libvlc_media_type_t_520094254
else:
  static :
    hint("Declaration of " & "libvlc_media_type_t" &
        " already exists, not redeclaring")
when not declared(compiler_off64_t):
  type
    compiler_off64_t* = compiler_off64_t_520094415
else:
  static :
    hint("Declaration of " & "compiler_off64_t" &
        " already exists, not redeclaring")
when not declared(libvlc_log_cb):
  type
    libvlc_log_cb* = libvlc_log_cb_520094179
else:
  static :
    hint("Declaration of " & "libvlc_log_cb" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_audio_output_device_types_t):
  type
    enum_libvlc_audio_output_device_types_t* = enum_libvlc_audio_output_device_types_t_520094352
else:
  static :
    hint("Declaration of " & "enum_libvlc_audio_output_device_types_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_stats_t):
  type
    libvlc_media_stats_t* = libvlc_media_stats_t_520094211
else:
  static :
    hint("Declaration of " & "libvlc_media_stats_t" &
        " already exists, not redeclaring")
when not declared(libvlc_log_message_t):
  type
    libvlc_log_message_t* = libvlc_log_message_t_520094402
else:
  static :
    hint("Declaration of " & "libvlc_log_message_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_audio_output_channel_t):
  type
    enum_libvlc_audio_output_channel_t* = enum_libvlc_audio_output_channel_t_520094356
else:
  static :
    hint("Declaration of " & "enum_libvlc_audio_output_channel_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_slave_type_t):
  type
    enum_libvlc_media_slave_type_t* = enum_libvlc_media_slave_type_t_520094264
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_slave_type_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_navigate_mode_t):
  type
    enum_libvlc_navigate_mode_t* = enum_libvlc_navigate_mode_t_520094308
else:
  static :
    hint("Declaration of " & "enum_libvlc_navigate_mode_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_types_t):
  type
    libvlc_audio_output_device_types_t* = libvlc_audio_output_device_types_t_520094354
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_types_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_discoverer_category_t):
  type
    enum_libvlc_media_discoverer_category_t* = enum_libvlc_media_discoverer_category_t_520094374
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_discoverer_category_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_resume_cb):
  type
    libvlc_audio_resume_cb* = libvlc_audio_resume_cb_520094336
else:
  static :
    hint("Declaration of " & "libvlc_audio_resume_cb" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_dialog_question_type):
  type
    enum_libvlc_dialog_question_type* = enum_libvlc_dialog_question_type_520094390
else:
  static :
    hint("Declaration of " & "enum_libvlc_dialog_question_type" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_type_t):
  type
    enum_libvlc_media_type_t* = enum_libvlc_media_type_t_520094252
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_type_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_format_cb):
  type
    libvlc_video_format_cb* = libvlc_video_format_cb_520094328
else:
  static :
    hint("Declaration of " & "libvlc_video_format_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_log_t):
  type
    libvlc_log_t* = libvlc_log_t_520094175
else:
  static :
    hint("Declaration of " & "libvlc_log_t" & " already exists, not redeclaring")
when not declared(libvlc_audio_set_volume_cb):
  type
    libvlc_audio_set_volume_cb* = libvlc_audio_set_volume_cb_520094342
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_volume_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_t):
  type
    libvlc_media_library_t* = libvlc_media_library_t_520094372
else:
  static :
    hint("Declaration of " & "libvlc_media_library_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_state_t):
  type
    enum_libvlc_state_t* = enum_libvlc_state_t_520094201
else:
  static :
    hint("Declaration of " & "enum_libvlc_state_t" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_question_type):
  type
    libvlc_dialog_question_type* = libvlc_dialog_question_type_520094392
else:
  static :
    hint("Declaration of " & "libvlc_dialog_question_type" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slave_type_t):
  type
    libvlc_media_slave_type_t* = libvlc_media_slave_type_t_520094266
else:
  static :
    hint("Declaration of " & "libvlc_media_slave_type_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_track_info_t):
  type
    struct_libvlc_media_track_info_t* = struct_libvlc_media_track_info_t_520094213
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_track_info_t" &
        " already exists, not redeclaring")
when not declared(libvlc_callback_t):
  type
    libvlc_callback_t* = libvlc_callback_t_520094169
else:
  static :
    hint("Declaration of " & "libvlc_callback_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_track_t):
  type
    libvlc_audio_track_t* = libvlc_audio_track_t_520094219
else:
  static :
    hint("Declaration of " & "libvlc_audio_track_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_log_message_t):
  type
    struct_libvlc_log_message_t* = struct_libvlc_log_message_t_520094400
else:
  static :
    hint("Declaration of " & "struct_libvlc_log_message_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_title_description_t):
  type
    struct_libvlc_title_description_t* = struct_libvlc_title_description_t_520094288
else:
  static :
    hint("Declaration of " & "struct_libvlc_title_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_drain_cb):
  type
    libvlc_audio_drain_cb* = libvlc_audio_drain_cb_520094340
else:
  static :
    hint("Declaration of " & "libvlc_audio_drain_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_description_t):
  type
    libvlc_media_discoverer_description_t* = libvlc_media_discoverer_description_t_520094380
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_t):
  type
    libvlc_audio_output_t* = libvlc_audio_output_t_520094298
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_orient_t):
  type
    libvlc_video_orient_t* = libvlc_video_orient_t_520094223
else:
  static :
    hint("Declaration of " & "libvlc_video_orient_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_pause_cb):
  type
    libvlc_audio_pause_cb* = libvlc_audio_pause_cb_520094334
else:
  static :
    hint("Declaration of " & "libvlc_audio_pause_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_meta_t):
  type
    libvlc_meta_t* = libvlc_meta_t_520094199
else:
  static :
    hint("Declaration of " & "libvlc_meta_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slave_t):
  type
    libvlc_media_slave_t* = libvlc_media_slave_t_520094270
else:
  static :
    hint("Declaration of " & "libvlc_media_slave_t" &
        " already exists, not redeclaring")
when not declared(compiler_off_t):
  type
    compiler_off_t* = compiler_off_t_520094411
else:
  static :
    hint("Declaration of " & "compiler_off_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_projection_t):
  type
    libvlc_video_projection_t* = libvlc_video_projection_t_520094227
else:
  static :
    hint("Declaration of " & "libvlc_video_projection_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_audio_output_t):
  type
    struct_libvlc_audio_output_t* = struct_libvlc_audio_output_t_520094296
else:
  static :
    hint("Declaration of " & "struct_libvlc_audio_output_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_display_cb):
  type
    libvlc_video_display_cb* = libvlc_video_display_cb_520094326
else:
  static :
    hint("Declaration of " & "libvlc_video_display_cb" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_event_t):
  type
    struct_libvlc_event_t* = struct_libvlc_event_t_520094171
else:
  static :
    hint("Declaration of " & "struct_libvlc_event_t" &
        " already exists, not redeclaring")
when not declared(uintptr_t):
  type
    uintptr_t* = uintptr_t_520094177
else:
  static :
    hint("Declaration of " & "uintptr_t" & " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_t):
  type
    libvlc_audio_output_device_t* = libvlc_audio_output_device_t_520094302
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_t" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_cbs):
  type
    libvlc_dialog_cbs* = libvlc_dialog_cbs_520094396
else:
  static :
    hint("Declaration of " & "libvlc_dialog_cbs" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_t):
  type
    libvlc_media_list_t* = libvlc_media_list_t_520094364
else:
  static :
    hint("Declaration of " & "libvlc_media_list_t" &
        " already exists, not redeclaring")
when not declared(libvlc_module_description_t):
  type
    libvlc_module_description_t* = libvlc_module_description_t_520094185
else:
  static :
    hint("Declaration of " & "libvlc_module_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_t):
  type
    libvlc_renderer_item_t* = libvlc_renderer_item_t_520094193
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_video_adjust_option_t):
  type
    enum_libvlc_video_adjust_option_t* = enum_libvlc_video_adjust_option_t_520094350
else:
  static :
    hint("Declaration of " & "enum_libvlc_video_adjust_option_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_audio_track_t):
  type
    struct_libvlc_audio_track_t* = struct_libvlc_audio_track_t_520094217
else:
  static :
    hint("Declaration of " & "struct_libvlc_audio_track_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_video_orient_t):
  type
    enum_libvlc_video_orient_t* = enum_libvlc_video_orient_t_520094221
else:
  static :
    hint("Declaration of " & "enum_libvlc_video_orient_t" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_t):
  type
    libvlc_renderer_discoverer_t* = libvlc_renderer_discoverer_t_520094187
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_cleanup_cb):
  type
    libvlc_audio_cleanup_cb* = libvlc_audio_cleanup_cb_520094346
else:
  static :
    hint("Declaration of " & "libvlc_audio_cleanup_cb" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_chapter_description_t):
  type
    struct_libvlc_chapter_description_t* = struct_libvlc_chapter_description_t_520094292
else:
  static :
    hint("Declaration of " & "struct_libvlc_chapter_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_event_type_t):
  type
    libvlc_event_type_t* = libvlc_event_type_t_520094167
else:
  static :
    hint("Declaration of " & "libvlc_event_type_t" &
        " already exists, not redeclaring")
when not declared(libvlc_teletext_key_t):
  type
    libvlc_teletext_key_t* = libvlc_teletext_key_t_520094318
else:
  static :
    hint("Declaration of " & "libvlc_teletext_key_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_track_t):
  type
    libvlc_video_track_t* = libvlc_video_track_t_520094242
else:
  static :
    hint("Declaration of " & "libvlc_video_track_t" &
        " already exists, not redeclaring")
when not declared(libvlc_event_t):
  type
    libvlc_event_t* = libvlc_event_t_520094386
else:
  static :
    hint("Declaration of " & "libvlc_event_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parsed_status_t):
  type
    libvlc_media_parsed_status_t* = libvlc_media_parsed_status_t_520094262
else:
  static :
    hint("Declaration of " & "libvlc_media_parsed_status_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_dialog_cbs):
  type
    struct_libvlc_dialog_cbs* = struct_libvlc_dialog_cbs_520094394
else:
  static :
    hint("Declaration of " & "struct_libvlc_dialog_cbs" &
        " already exists, not redeclaring")
when not declared(libvlc_subtitle_track_t):
  type
    libvlc_subtitle_track_t* = libvlc_subtitle_track_t_520094246
else:
  static :
    hint("Declaration of " & "libvlc_subtitle_track_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_cleanup_cb):
  type
    libvlc_video_cleanup_cb* = libvlc_video_cleanup_cb_520094330
else:
  static :
    hint("Declaration of " & "libvlc_video_cleanup_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_t):
  type
    libvlc_media_list_player_t* = libvlc_media_list_player_t_520094366
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_video_track_t):
  type
    struct_libvlc_video_track_t* = struct_libvlc_video_track_t_520094233
else:
  static :
    hint("Declaration of " & "struct_libvlc_video_track_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_event_e):
  type
    enum_libvlc_event_e* = enum_libvlc_event_e_520094384
else:
  static :
    hint("Declaration of " & "enum_libvlc_event_e" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_track_t):
  type
    struct_libvlc_media_track_t* = struct_libvlc_media_track_t_520094248
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_track_t" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_flush_cb):
  type
    libvlc_audio_flush_cb* = libvlc_audio_flush_cb_520094338
else:
  static :
    hint("Declaration of " & "libvlc_audio_flush_cb" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_id):
  type
    libvlc_dialog_id* = libvlc_dialog_id_520094388
else:
  static :
    hint("Declaration of " & "libvlc_dialog_id" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_media_parsed_status_t):
  type
    enum_libvlc_media_parsed_status_t* = enum_libvlc_media_parsed_status_t_520094260
else:
  static :
    hint("Declaration of " & "enum_libvlc_media_parsed_status_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_audio_output_device_t):
  type
    struct_libvlc_audio_output_device_t* = struct_libvlc_audio_output_device_t_520094300
else:
  static :
    hint("Declaration of " & "struct_libvlc_audio_output_device_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_discoverer_description_t):
  type
    struct_libvlc_media_discoverer_description_t* = struct_libvlc_media_discoverer_description_t_520094378
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_discoverer_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_category_t):
  type
    libvlc_media_discoverer_category_t* = libvlc_media_discoverer_category_t_520094376
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_category_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_t):
  type
    libvlc_media_discoverer_t* = libvlc_media_discoverer_t_520094382
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_t" &
        " already exists, not redeclaring")
when not declared(libvlc_title_description_t):
  type
    libvlc_title_description_t* = libvlc_title_description_t_520094290
else:
  static :
    hint("Declaration of " & "libvlc_title_description_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_track_type_t):
  type
    enum_libvlc_track_type_t* = enum_libvlc_track_type_t_520094205
else:
  static :
    hint("Declaration of " & "enum_libvlc_track_type_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_track_description_t):
  type
    struct_libvlc_track_description_t* = struct_libvlc_track_description_t_520094284
else:
  static :
    hint("Declaration of " & "struct_libvlc_track_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_track_description_t):
  type
    libvlc_track_description_t* = libvlc_track_description_t_520094286
else:
  static :
    hint("Declaration of " & "libvlc_track_description_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_video_logo_option_t):
  type
    enum_libvlc_video_logo_option_t* = enum_libvlc_video_logo_option_t_520094348
else:
  static :
    hint("Declaration of " & "enum_libvlc_video_logo_option_t" &
        " already exists, not redeclaring")
when not declared(libvlc_time_t):
  type
    libvlc_time_t* = libvlc_time_t_520094163
else:
  static :
    hint("Declaration of " & "libvlc_time_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_stats_t):
  type
    struct_libvlc_media_stats_t* = struct_libvlc_media_stats_t_520094209
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_stats_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_video_viewpoint_t):
  type
    struct_libvlc_video_viewpoint_t* = struct_libvlc_video_viewpoint_t_520094229
else:
  static :
    hint("Declaration of " & "struct_libvlc_video_viewpoint_t" &
        " already exists, not redeclaring")
when not declared(libvlc_video_unlock_cb):
  type
    libvlc_video_unlock_cb* = libvlc_video_unlock_cb_520094324
else:
  static :
    hint("Declaration of " & "libvlc_video_unlock_cb" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_module_description_t):
  type
    struct_libvlc_module_description_t* = struct_libvlc_module_description_t_520094183
else:
  static :
    hint("Declaration of " & "struct_libvlc_module_description_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_track_info_t):
  type
    libvlc_media_track_info_t* = libvlc_media_track_info_t_520094215
else:
  static :
    hint("Declaration of " & "libvlc_media_track_info_t" &
        " already exists, not redeclaring")
when not declared(enum_libvlc_video_projection_t):
  type
    enum_libvlc_video_projection_t* = enum_libvlc_video_projection_t_520094225
else:
  static :
    hint("Declaration of " & "enum_libvlc_video_projection_t" &
        " already exists, not redeclaring")
when not declared(libvlc_equalizer_t):
  type
    libvlc_equalizer_t* = libvlc_equalizer_t_520094320
else:
  static :
    hint("Declaration of " & "libvlc_equalizer_t" &
        " already exists, not redeclaring")
when not declared(struct_libvlc_media_slave_t):
  type
    struct_libvlc_media_slave_t* = struct_libvlc_media_slave_t_520094268
else:
  static :
    hint("Declaration of " & "struct_libvlc_media_slave_t" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parse_flag_t):
  type
    libvlc_media_parse_flag_t* = libvlc_media_parse_flag_t_520094258
else:
  static :
    hint("Declaration of " & "libvlc_media_parse_flag_t" &
        " already exists, not redeclaring")
when not declared(VLC_VLC_H):
  when 1 is static:
    const
      VLC_VLC_H* = 1         ## Generated based on /usr/include/vlc/vlc.h:29:9
  else:
    let VLC_VLC_H* = 1       ## Generated based on /usr/include/vlc/vlc.h:29:9
else:
  static :
    hint("Declaration of " & "VLC_VLC_H" & " already exists, not redeclaring")
when not declared(VLC_LIBVLC_H):
  when 1 is static:
    const
      VLC_LIBVLC_H* = 1      ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:36:9
  else:
    let VLC_LIBVLC_H* = 1    ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc.h:36:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_H" & " already exists, not redeclaring")
when not declared(VLC_LIBVLC_RENDERER_DISCOVERER_H):
  when 1 is static:
    const
      VLC_LIBVLC_RENDERER_DISCOVERER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:22:9
  else:
    let VLC_LIBVLC_RENDERER_DISCOVERER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:22:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_RENDERER_DISCOVERER_H" &
        " already exists, not redeclaring")
when not declared(LIBVLC_RENDERER_CAN_AUDIO):
  when 1 is static:
    const
      LIBVLC_RENDERER_CAN_AUDIO* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:52:9
  else:
    let LIBVLC_RENDERER_CAN_AUDIO* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:52:9
else:
  static :
    hint("Declaration of " & "LIBVLC_RENDERER_CAN_AUDIO" &
        " already exists, not redeclaring")
when not declared(LIBVLC_RENDERER_CAN_VIDEO):
  when 2 is static:
    const
      LIBVLC_RENDERER_CAN_VIDEO* = 2 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:54:9
  else:
    let LIBVLC_RENDERER_CAN_VIDEO* = 2 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_renderer_discoverer.h:54:9
else:
  static :
    hint("Declaration of " & "LIBVLC_RENDERER_CAN_VIDEO" &
        " already exists, not redeclaring")
when not declared(VLC_LIBVLC_MEDIA_H):
  when 1 is static:
    const
      VLC_LIBVLC_MEDIA_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:27:9
  else:
    let VLC_LIBVLC_MEDIA_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media.h:27:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_MEDIA_H" &
        " already exists, not redeclaring")
when not declared(VLC_LIBVLC_MEDIA_PLAYER_H):
  when 1 is static:
    const
      VLC_LIBVLC_MEDIA_PLAYER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:27:9
  else:
    let VLC_LIBVLC_MEDIA_PLAYER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:27:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_MEDIA_PLAYER_H" &
        " already exists, not redeclaring")
when not declared(libvlc_role_Last):
  when libvlc_role_Test is typedesc:
    type
      libvlc_role_Last* = libvlc_role_Test ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:2062:9
  else:
    when libvlc_role_Test is static:
      const
        libvlc_role_Last* = libvlc_role_Test ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:2062:9
    else:
      let libvlc_role_Last* = libvlc_role_Test ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_player.h:2062:9
else:
  static :
    hint("Declaration of " & "libvlc_role_Last" &
        " already exists, not redeclaring")
when not declared(LIBVLC_MEDIA_LIST_H):
  when 1 is static:
    const
      LIBVLC_MEDIA_LIST_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list.h:25:9
  else:
    let LIBVLC_MEDIA_LIST_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list.h:25:9
else:
  static :
    hint("Declaration of " & "LIBVLC_MEDIA_LIST_H" &
        " already exists, not redeclaring")
when not declared(LIBVLC_MEDIA_LIST_PLAYER_H):
  when 1 is static:
    const
      LIBVLC_MEDIA_LIST_PLAYER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list_player.h:25:9
  else:
    let LIBVLC_MEDIA_LIST_PLAYER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_list_player.h:25:9
else:
  static :
    hint("Declaration of " & "LIBVLC_MEDIA_LIST_PLAYER_H" &
        " already exists, not redeclaring")
when not declared(VLC_LIBVLC_MEDIA_LIBRARY_H):
  when 1 is static:
    const
      VLC_LIBVLC_MEDIA_LIBRARY_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_library.h:27:9
  else:
    let VLC_LIBVLC_MEDIA_LIBRARY_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_library.h:27:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_MEDIA_LIBRARY_H" &
        " already exists, not redeclaring")
when not declared(VLC_LIBVLC_MEDIA_DISCOVERER_H):
  when 1 is static:
    const
      VLC_LIBVLC_MEDIA_DISCOVERER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:27:9
  else:
    let VLC_LIBVLC_MEDIA_DISCOVERER_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_media_discoverer.h:27:9
else:
  static :
    hint("Declaration of " & "VLC_LIBVLC_MEDIA_DISCOVERER_H" &
        " already exists, not redeclaring")
when not declared(LIBVLC_EVENTS_H):
  when 1 is static:
    const
      LIBVLC_EVENTS_H* = 1   ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_events.h:26:9
  else:
    let LIBVLC_EVENTS_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_events.h:26:9
else:
  static :
    hint("Declaration of " & "LIBVLC_EVENTS_H" &
        " already exists, not redeclaring")
when not declared(LIBVLC_DIALOG_H):
  when 1 is static:
    const
      LIBVLC_DIALOG_H* = 1   ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:22:9
  else:
    let LIBVLC_DIALOG_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_dialog.h:22:9
else:
  static :
    hint("Declaration of " & "LIBVLC_DIALOG_H" &
        " already exists, not redeclaring")
when not declared(LIBVLC_VLM_H):
  when 1 is static:
    const
      LIBVLC_VLM_H* = 1      ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_vlm.h:26:9
  else:
    let LIBVLC_VLM_H* = 1    ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/libvlc_vlm.h:26:9
else:
  static :
    hint("Declaration of " & "LIBVLC_VLM_H" & " already exists, not redeclaring")
when not declared(LIBVLC_DEPRECATED_H):
  when 1 is static:
    const
      LIBVLC_DEPRECATED_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/deprecated.h:26:9
  else:
    let LIBVLC_DEPRECATED_H* = 1 ## Generated based on /home/casey/Development/nimvlc/contrib/futhark/vlc/deprecated.h:26:9
else:
  static :
    hint("Declaration of " & "LIBVLC_DEPRECATED_H" &
        " already exists, not redeclaring")
when not declared(libvlc_errmsg):
  proc libvlc_errmsg*(): cstring {.cdecl, importc: "libvlc_errmsg".}
else:
  static :
    hint("Declaration of " & "libvlc_errmsg" &
        " already exists, not redeclaring")
when not declared(libvlc_clearerr):
  proc libvlc_clearerr*(): void {.cdecl, importc: "libvlc_clearerr".}
else:
  static :
    hint("Declaration of " & "libvlc_clearerr" &
        " already exists, not redeclaring")
when not declared(libvlc_vprinterr):
  proc libvlc_vprinterr*(fmt: cstring): cstring {.cdecl, varargs,
      importc: "libvlc_vprinterr".}
else:
  static :
    hint("Declaration of " & "libvlc_vprinterr" &
        " already exists, not redeclaring")
when not declared(libvlc_printerr):
  proc libvlc_printerr*(fmt: cstring): cstring {.cdecl, varargs,
      importc: "libvlc_printerr".}
else:
  static :
    hint("Declaration of " & "libvlc_printerr" &
        " already exists, not redeclaring")
when not declared(libvlc_new):
  proc libvlc_new*(argc: cint; argv: ptr cstring): ptr libvlc_instance_t {.
      cdecl, importc: "libvlc_new".}
else:
  static :
    hint("Declaration of " & "libvlc_new" & " already exists, not redeclaring")
when not declared(libvlc_release):
  proc libvlc_release*(p_instance: ptr libvlc_instance_t): void {.
      cdecl, importc: "libvlc_release".}
else:
  static :
    hint("Declaration of " & "libvlc_release" &
        " already exists, not redeclaring")
when not declared(libvlc_retain):
  proc libvlc_retain*(p_instance: ptr libvlc_instance_t): void {.
      cdecl, importc: "libvlc_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_add_intf):
  proc libvlc_add_intf*(p_instance: ptr libvlc_instance_t;
                        name: cstring): cint {.cdecl, importc: "libvlc_add_intf".}
else:
  static :
    hint("Declaration of " & "libvlc_add_intf" &
        " already exists, not redeclaring")
when not declared(libvlc_set_exit_handler):
  proc libvlc_set_exit_handler*(p_instance: ptr libvlc_instance_t;
                                cb: proc (a0: pointer): void {.cdecl.};
                                opaque: pointer): void {.cdecl,
      importc: "libvlc_set_exit_handler".}
else:
  static :
    hint("Declaration of " & "libvlc_set_exit_handler" &
        " already exists, not redeclaring")
when not declared(libvlc_set_user_agent):
  proc libvlc_set_user_agent*(p_instance: ptr libvlc_instance_t;
                              name: cstring; http: cstring): void {.cdecl,
      importc: "libvlc_set_user_agent".}
else:
  static :
    hint("Declaration of " & "libvlc_set_user_agent" &
        " already exists, not redeclaring")
when not declared(libvlc_set_app_id):
  proc libvlc_set_app_id*(p_instance: ptr libvlc_instance_t;
                          id: cstring; version: cstring; icon: cstring): void {.
      cdecl, importc: "libvlc_set_app_id".}
else:
  static :
    hint("Declaration of " & "libvlc_set_app_id" &
        " already exists, not redeclaring")
when not declared(libvlc_get_version):
  proc libvlc_get_version*(): cstring {.cdecl, importc: "libvlc_get_version".}
else:
  static :
    hint("Declaration of " & "libvlc_get_version" &
        " already exists, not redeclaring")
when not declared(libvlc_get_compiler):
  proc libvlc_get_compiler*(): cstring {.cdecl, importc: "libvlc_get_compiler".}
else:
  static :
    hint("Declaration of " & "libvlc_get_compiler" &
        " already exists, not redeclaring")
when not declared(libvlc_get_changeset):
  proc libvlc_get_changeset*(): cstring {.cdecl, importc: "libvlc_get_changeset".}
else:
  static :
    hint("Declaration of " & "libvlc_get_changeset" &
        " already exists, not redeclaring")
when not declared(libvlc_free):
  proc libvlc_free*(ptr_arg: pointer): void {.cdecl, importc: "libvlc_free".}
else:
  static :
    hint("Declaration of " & "libvlc_free" & " already exists, not redeclaring")
when not declared(libvlc_event_attach):
  proc libvlc_event_attach*(p_event_manager: ptr libvlc_event_manager_t_520094166;
                            i_event_type: libvlc_event_type_t_520094168;
                            f_callback: libvlc_callback_t_520094170;
                            user_data: pointer): cint {.cdecl,
      importc: "libvlc_event_attach".}
else:
  static :
    hint("Declaration of " & "libvlc_event_attach" &
        " already exists, not redeclaring")
when not declared(libvlc_event_detach):
  proc libvlc_event_detach*(p_event_manager: ptr libvlc_event_manager_t_520094166;
                            i_event_type: libvlc_event_type_t_520094168;
                            f_callback: libvlc_callback_t_520094170;
                            p_user_data: pointer): void {.cdecl,
      importc: "libvlc_event_detach".}
else:
  static :
    hint("Declaration of " & "libvlc_event_detach" &
        " already exists, not redeclaring")
when not declared(libvlc_event_type_name):
  proc libvlc_event_type_name*(event_type: libvlc_event_type_t_520094168): cstring {.
      cdecl, importc: "libvlc_event_type_name".}
else:
  static :
    hint("Declaration of " & "libvlc_event_type_name" &
        " already exists, not redeclaring")
when not declared(libvlc_log_get_context):
  proc libvlc_log_get_context*(ctx: ptr libvlc_log_t_520094176;
                               module: ptr cstring; file: ptr cstring;
                               line: ptr cuint): void {.cdecl,
      importc: "libvlc_log_get_context".}
else:
  static :
    hint("Declaration of " & "libvlc_log_get_context" &
        " already exists, not redeclaring")
when not declared(libvlc_log_get_object):
  proc libvlc_log_get_object*(ctx: ptr libvlc_log_t_520094176;
                              name: ptr cstring; header: ptr cstring;
                              id: ptr uintptr_t_520094178): void {.cdecl,
      importc: "libvlc_log_get_object".}
else:
  static :
    hint("Declaration of " & "libvlc_log_get_object" &
        " already exists, not redeclaring")
when not declared(libvlc_log_unset):
  proc libvlc_log_unset*(p_instance: ptr libvlc_instance_t): void {.
      cdecl, importc: "libvlc_log_unset".}
else:
  static :
    hint("Declaration of " & "libvlc_log_unset" &
        " already exists, not redeclaring")
when not declared(libvlc_log_set):
  proc libvlc_log_set*(p_instance: ptr libvlc_instance_t;
                       cb: libvlc_log_cb_520094180; data: pointer): void {.
      cdecl, importc: "libvlc_log_set".}
else:
  static :
    hint("Declaration of " & "libvlc_log_set" &
        " already exists, not redeclaring")
when not declared(libvlc_log_set_file):
  proc libvlc_log_set_file*(p_instance: ptr libvlc_instance_t;
                            stream: ptr FILE): void {.cdecl,
      importc: "libvlc_log_set_file".}
else:
  static :
    hint("Declaration of " & "libvlc_log_set_file" &
        " already exists, not redeclaring")
when not declared(libvlc_module_description_list_release):
  proc libvlc_module_description_list_release*(
      p_list: ptr libvlc_module_description_t_520094186): void {.cdecl,
      importc: "libvlc_module_description_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_module_description_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_filter_list_get):
  proc libvlc_audio_filter_list_get*(p_instance: ptr libvlc_instance_t): ptr libvlc_module_description_t_520094186 {.
      cdecl, importc: "libvlc_audio_filter_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_filter_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_video_filter_list_get):
  proc libvlc_video_filter_list_get*(p_instance: ptr libvlc_instance_t): ptr libvlc_module_description_t_520094186 {.
      cdecl, importc: "libvlc_video_filter_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_video_filter_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_clock):
  proc libvlc_clock*(): int64 {.cdecl, importc: "libvlc_clock".}
else:
  static :
    hint("Declaration of " & "libvlc_clock" & " already exists, not redeclaring")
when not declared(libvlc_renderer_item_hold):
  proc libvlc_renderer_item_hold*(p_item: ptr libvlc_renderer_item_t_520094194): ptr libvlc_renderer_item_t_520094194 {.
      cdecl, importc: "libvlc_renderer_item_hold".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_hold" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_release):
  proc libvlc_renderer_item_release*(p_item: ptr libvlc_renderer_item_t_520094194): void {.
      cdecl, importc: "libvlc_renderer_item_release".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_release" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_name):
  proc libvlc_renderer_item_name*(p_item: ptr libvlc_renderer_item_t_520094194): cstring {.
      cdecl, importc: "libvlc_renderer_item_name".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_name" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_type):
  proc libvlc_renderer_item_type*(p_item: ptr libvlc_renderer_item_t_520094194): cstring {.
      cdecl, importc: "libvlc_renderer_item_type".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_type" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_icon_uri):
  proc libvlc_renderer_item_icon_uri*(p_item: ptr libvlc_renderer_item_t_520094194): cstring {.
      cdecl, importc: "libvlc_renderer_item_icon_uri".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_icon_uri" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_item_flags):
  proc libvlc_renderer_item_flags*(p_item: ptr libvlc_renderer_item_t_520094194): cint {.
      cdecl, importc: "libvlc_renderer_item_flags".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_item_flags" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_new):
  proc libvlc_renderer_discoverer_new*(p_inst: ptr libvlc_instance_t;
                                       psz_name: cstring): ptr libvlc_renderer_discoverer_t_520094188 {.
      cdecl, importc: "libvlc_renderer_discoverer_new".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_new" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_release):
  proc libvlc_renderer_discoverer_release*(
      p_rd: ptr libvlc_renderer_discoverer_t_520094188): void {.cdecl,
      importc: "libvlc_renderer_discoverer_release".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_release" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_start):
  proc libvlc_renderer_discoverer_start*(p_rd: ptr libvlc_renderer_discoverer_t_520094188): cint {.
      cdecl, importc: "libvlc_renderer_discoverer_start".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_start" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_stop):
  proc libvlc_renderer_discoverer_stop*(p_rd: ptr libvlc_renderer_discoverer_t_520094188): void {.
      cdecl, importc: "libvlc_renderer_discoverer_stop".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_stop" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_event_manager):
  proc libvlc_renderer_discoverer_event_manager*(
      p_rd: ptr libvlc_renderer_discoverer_t_520094188): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_renderer_discoverer_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_list_get):
  proc libvlc_renderer_discoverer_list_get*(p_inst: ptr libvlc_instance_t;
      ppp_services: ptr ptr ptr libvlc_rd_description_t): csize_t {.
      cdecl, importc: "libvlc_renderer_discoverer_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_renderer_discoverer_list_release):
  proc libvlc_renderer_discoverer_list_release*(
      pp_services: ptr ptr libvlc_rd_description_t; i_count: csize_t): void {.
      cdecl, importc: "libvlc_renderer_discoverer_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_renderer_discoverer_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_new_location):
  proc libvlc_media_new_location*(p_instance: ptr libvlc_instance_t;
                                  psz_mrl: cstring): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_new_location".}
else:
  static :
    hint("Declaration of " & "libvlc_media_new_location" &
        " already exists, not redeclaring")
when not declared(libvlc_media_new_path):
  proc libvlc_media_new_path*(p_instance: ptr libvlc_instance_t;
                              path: cstring): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_new_path".}
else:
  static :
    hint("Declaration of " & "libvlc_media_new_path" &
        " already exists, not redeclaring")
when not declared(libvlc_media_new_fd):
  proc libvlc_media_new_fd*(p_instance: ptr libvlc_instance_t;
                            fd: cint): ptr libvlc_media_t {.cdecl,
      importc: "libvlc_media_new_fd".}
else:
  static :
    hint("Declaration of " & "libvlc_media_new_fd" &
        " already exists, not redeclaring")
when not declared(libvlc_media_new_callbacks):
  proc libvlc_media_new_callbacks*(instance: ptr libvlc_instance_t;
                                   open_cb: libvlc_media_open_cb;
                                   read_cb: libvlc_media_read_cb;
                                   seek_cb: libvlc_media_seek_cb;
                                   close_cb: libvlc_media_close_cb;
                                   opaque: pointer): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_new_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_media_new_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_media_new_as_node):
  proc libvlc_media_new_as_node*(p_instance: ptr libvlc_instance_t;
                                 psz_name: cstring): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_new_as_node".}
else:
  static :
    hint("Declaration of " & "libvlc_media_new_as_node" &
        " already exists, not redeclaring")
when not declared(libvlc_media_add_option):
  proc libvlc_media_add_option*(p_md: ptr libvlc_media_t;
                                psz_options: cstring): void {.cdecl,
      importc: "libvlc_media_add_option".}
else:
  static :
    hint("Declaration of " & "libvlc_media_add_option" &
        " already exists, not redeclaring")
when not declared(libvlc_media_add_option_flag):
  proc libvlc_media_add_option_flag*(p_md: ptr libvlc_media_t;
                                     psz_options: cstring; i_flags: cuint): void {.
      cdecl, importc: "libvlc_media_add_option_flag".}
else:
  static :
    hint("Declaration of " & "libvlc_media_add_option_flag" &
        " already exists, not redeclaring")
when not declared(libvlc_media_retain):
  proc libvlc_media_retain*(p_md: ptr libvlc_media_t): void {.cdecl,
      importc: "libvlc_media_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_media_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_media_release):
  proc libvlc_media_release*(p_md: ptr libvlc_media_t): void {.cdecl,
      importc: "libvlc_media_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_mrl):
  proc libvlc_media_get_mrl*(p_md: ptr libvlc_media_t): cstring {.
      cdecl, importc: "libvlc_media_get_mrl".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_mrl" &
        " already exists, not redeclaring")
when not declared(libvlc_media_duplicate):
  proc libvlc_media_duplicate*(p_md: ptr libvlc_media_t): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_duplicate".}
else:
  static :
    hint("Declaration of " & "libvlc_media_duplicate" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_meta):
  proc libvlc_media_get_meta*(p_md: ptr libvlc_media_t;
                              e_meta: libvlc_meta_t_520094200): cstring {.cdecl,
      importc: "libvlc_media_get_meta".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_meta" &
        " already exists, not redeclaring")
when not declared(libvlc_media_set_meta):
  proc libvlc_media_set_meta*(p_md: ptr libvlc_media_t;
                              e_meta: libvlc_meta_t_520094200;
                              psz_value: cstring): void {.cdecl,
      importc: "libvlc_media_set_meta".}
else:
  static :
    hint("Declaration of " & "libvlc_media_set_meta" &
        " already exists, not redeclaring")
when not declared(libvlc_media_save_meta):
  proc libvlc_media_save_meta*(p_md: ptr libvlc_media_t): cint {.
      cdecl, importc: "libvlc_media_save_meta".}
else:
  static :
    hint("Declaration of " & "libvlc_media_save_meta" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_state):
  proc libvlc_media_get_state*(p_md: ptr libvlc_media_t): libvlc_state_t_520094204 {.
      cdecl, importc: "libvlc_media_get_state".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_state" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_stats):
  proc libvlc_media_get_stats*(p_md: ptr libvlc_media_t;
                               p_stats: ptr libvlc_media_stats_t_520094212): cint {.
      cdecl, importc: "libvlc_media_get_stats".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_stats" &
        " already exists, not redeclaring")
when not declared(libvlc_media_subitems):
  proc libvlc_media_subitems*(p_md: ptr libvlc_media_t): ptr struct_libvlc_media_list_t {.
      cdecl, importc: "libvlc_media_subitems".}
else:
  static :
    hint("Declaration of " & "libvlc_media_subitems" &
        " already exists, not redeclaring")
when not declared(libvlc_media_event_manager):
  proc libvlc_media_event_manager*(p_md: ptr libvlc_media_t): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_media_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_media_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_duration):
  proc libvlc_media_get_duration*(p_md: ptr libvlc_media_t): libvlc_time_t_520094164 {.
      cdecl, importc: "libvlc_media_get_duration".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_duration" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parse_with_options):
  proc libvlc_media_parse_with_options*(p_md: ptr libvlc_media_t;
                                        parse_flag: libvlc_media_parse_flag_t_520094259;
                                        timeout: cint): cint {.cdecl,
      importc: "libvlc_media_parse_with_options".}
else:
  static :
    hint("Declaration of " & "libvlc_media_parse_with_options" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parse_stop):
  proc libvlc_media_parse_stop*(p_md: ptr libvlc_media_t): void {.
      cdecl, importc: "libvlc_media_parse_stop".}
else:
  static :
    hint("Declaration of " & "libvlc_media_parse_stop" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_parsed_status):
  proc libvlc_media_get_parsed_status*(p_md: ptr libvlc_media_t): libvlc_media_parsed_status_t_520094263 {.
      cdecl, importc: "libvlc_media_get_parsed_status".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_parsed_status" &
        " already exists, not redeclaring")
when not declared(libvlc_media_set_user_data):
  proc libvlc_media_set_user_data*(p_md: ptr libvlc_media_t;
                                   p_new_user_data: pointer): void {.cdecl,
      importc: "libvlc_media_set_user_data".}
else:
  static :
    hint("Declaration of " & "libvlc_media_set_user_data" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_user_data):
  proc libvlc_media_get_user_data*(p_md: ptr libvlc_media_t): pointer {.
      cdecl, importc: "libvlc_media_get_user_data".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_user_data" &
        " already exists, not redeclaring")
when not declared(libvlc_media_tracks_get):
  proc libvlc_media_tracks_get*(p_md: ptr libvlc_media_t;
                                tracks: ptr ptr ptr libvlc_media_track_t_520094251): cuint {.
      cdecl, importc: "libvlc_media_tracks_get".}
else:
  static :
    hint("Declaration of " & "libvlc_media_tracks_get" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_codec_description):
  proc libvlc_media_get_codec_description*(i_type: libvlc_track_type_t_520094208;
      i_codec: uint32): cstring {.cdecl,
                                  importc: "libvlc_media_get_codec_description".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_codec_description" &
        " already exists, not redeclaring")
when not declared(libvlc_media_tracks_release):
  proc libvlc_media_tracks_release*(p_tracks: ptr ptr libvlc_media_track_t_520094251;
                                    i_count: cuint): void {.cdecl,
      importc: "libvlc_media_tracks_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_tracks_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_type):
  proc libvlc_media_get_type*(p_md: ptr libvlc_media_t): libvlc_media_type_t_520094255 {.
      cdecl, importc: "libvlc_media_get_type".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_type" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slaves_add):
  proc libvlc_media_slaves_add*(p_md: ptr libvlc_media_t;
                                i_type: libvlc_media_slave_type_t_520094267;
                                i_priority: cuint; psz_uri: cstring): cint {.
      cdecl, importc: "libvlc_media_slaves_add".}
else:
  static :
    hint("Declaration of " & "libvlc_media_slaves_add" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slaves_clear):
  proc libvlc_media_slaves_clear*(p_md: ptr libvlc_media_t): void {.
      cdecl, importc: "libvlc_media_slaves_clear".}
else:
  static :
    hint("Declaration of " & "libvlc_media_slaves_clear" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slaves_get):
  proc libvlc_media_slaves_get*(p_md: ptr libvlc_media_t;
                                ppp_slaves: ptr ptr ptr libvlc_media_slave_t_520094271): cuint {.
      cdecl, importc: "libvlc_media_slaves_get".}
else:
  static :
    hint("Declaration of " & "libvlc_media_slaves_get" &
        " already exists, not redeclaring")
when not declared(libvlc_media_slaves_release):
  proc libvlc_media_slaves_release*(pp_slaves: ptr ptr libvlc_media_slave_t_520094271;
                                    i_count: cuint): void {.cdecl,
      importc: "libvlc_media_slaves_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_slaves_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_new):
  proc libvlc_media_player_new*(p_libvlc_instance: ptr libvlc_instance_t): ptr libvlc_media_player_t_520094283 {.
      cdecl, importc: "libvlc_media_player_new".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_new" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_new_from_media):
  proc libvlc_media_player_new_from_media*(p_md: ptr libvlc_media_t): ptr libvlc_media_player_t_520094283 {.
      cdecl, importc: "libvlc_media_player_new_from_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_new_from_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_release):
  proc libvlc_media_player_release*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_retain):
  proc libvlc_media_player_retain*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_media):
  proc libvlc_media_player_set_media*(p_mi: ptr libvlc_media_player_t_520094283;
                                      p_md: ptr libvlc_media_t): void {.
      cdecl, importc: "libvlc_media_player_set_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_media):
  proc libvlc_media_player_get_media*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_player_get_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_event_manager):
  proc libvlc_media_player_event_manager*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_media_player_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_is_playing):
  proc libvlc_media_player_is_playing*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_is_playing".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_is_playing" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_play):
  proc libvlc_media_player_play*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_play".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_play" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_pause):
  proc libvlc_media_player_set_pause*(mp: ptr libvlc_media_player_t_520094283;
                                      do_pause: cint): void {.cdecl,
      importc: "libvlc_media_player_set_pause".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_pause" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_pause):
  proc libvlc_media_player_pause*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_pause".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_pause" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_stop):
  proc libvlc_media_player_stop*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_stop".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_stop" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_renderer):
  proc libvlc_media_player_set_renderer*(p_mi: ptr libvlc_media_player_t_520094283;
      p_item: ptr libvlc_renderer_item_t_520094194): cint {.cdecl,
      importc: "libvlc_media_player_set_renderer".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_renderer" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_callbacks):
  proc libvlc_video_set_callbacks*(mp: ptr libvlc_media_player_t_520094283;
                                   lock: libvlc_video_lock_cb_520094323;
                                   unlock: libvlc_video_unlock_cb_520094325;
                                   display: libvlc_video_display_cb_520094327;
                                   opaque: pointer): void {.cdecl,
      importc: "libvlc_video_set_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_format):
  proc libvlc_video_set_format*(mp: ptr libvlc_media_player_t_520094283;
                                chroma: cstring; width: cuint; height: cuint;
                                pitch: cuint): void {.cdecl,
      importc: "libvlc_video_set_format".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_format" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_format_callbacks):
  proc libvlc_video_set_format_callbacks*(mp: ptr libvlc_media_player_t_520094283;
      setup: libvlc_video_format_cb_520094329; cleanup: libvlc_video_cleanup_cb_520094331): void {.
      cdecl, importc: "libvlc_video_set_format_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_format_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_nsobject):
  proc libvlc_media_player_set_nsobject*(p_mi: ptr libvlc_media_player_t_520094283;
      drawable: pointer): void {.cdecl,
                                 importc: "libvlc_media_player_set_nsobject".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_nsobject" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_nsobject):
  proc libvlc_media_player_get_nsobject*(p_mi: ptr libvlc_media_player_t_520094283): pointer {.
      cdecl, importc: "libvlc_media_player_get_nsobject".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_nsobject" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_xwindow):
  proc libvlc_media_player_set_xwindow*(p_mi: ptr libvlc_media_player_t_520094283;
                                        drawable: uint32): void {.cdecl,
      importc: "libvlc_media_player_set_xwindow".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_xwindow" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_xwindow):
  proc libvlc_media_player_get_xwindow*(p_mi: ptr libvlc_media_player_t_520094283): uint32 {.
      cdecl, importc: "libvlc_media_player_get_xwindow".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_xwindow" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_hwnd):
  proc libvlc_media_player_set_hwnd*(p_mi: ptr libvlc_media_player_t_520094283;
                                     drawable: pointer): void {.cdecl,
      importc: "libvlc_media_player_set_hwnd".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_hwnd" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_hwnd):
  proc libvlc_media_player_get_hwnd*(p_mi: ptr libvlc_media_player_t_520094283): pointer {.
      cdecl, importc: "libvlc_media_player_get_hwnd".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_hwnd" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_android_context):
  proc libvlc_media_player_set_android_context*(p_mi: ptr libvlc_media_player_t_520094283;
      p_awindow_handler: pointer): void {.cdecl,
      importc: "libvlc_media_player_set_android_context".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_android_context" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_evas_object):
  proc libvlc_media_player_set_evas_object*(p_mi: ptr libvlc_media_player_t_520094283;
      p_evas_object: pointer): cint {.cdecl, importc: "libvlc_media_player_set_evas_object".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_evas_object" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_callbacks):
  proc libvlc_audio_set_callbacks*(mp: ptr libvlc_media_player_t_520094283;
                                   play: libvlc_audio_play_cb_520094333;
                                   pause: libvlc_audio_pause_cb_520094335;
                                   resume: libvlc_audio_resume_cb_520094337;
                                   flush: libvlc_audio_flush_cb_520094339;
                                   drain: libvlc_audio_drain_cb_520094341;
                                   opaque: pointer): void {.cdecl,
      importc: "libvlc_audio_set_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_volume_callback):
  proc libvlc_audio_set_volume_callback*(mp: ptr libvlc_media_player_t_520094283;
      set_volume: libvlc_audio_set_volume_cb_520094343): void {.cdecl,
      importc: "libvlc_audio_set_volume_callback".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_volume_callback" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_format_callbacks):
  proc libvlc_audio_set_format_callbacks*(mp: ptr libvlc_media_player_t_520094283;
      setup: libvlc_audio_setup_cb_520094345; cleanup: libvlc_audio_cleanup_cb_520094347): void {.
      cdecl, importc: "libvlc_audio_set_format_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_format_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_format):
  proc libvlc_audio_set_format*(mp: ptr libvlc_media_player_t_520094283;
                                format: cstring; rate: cuint; channels: cuint): void {.
      cdecl, importc: "libvlc_audio_set_format".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_format" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_length):
  proc libvlc_media_player_get_length*(p_mi: ptr libvlc_media_player_t_520094283): libvlc_time_t_520094164 {.
      cdecl, importc: "libvlc_media_player_get_length".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_length" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_time):
  proc libvlc_media_player_get_time*(p_mi: ptr libvlc_media_player_t_520094283): libvlc_time_t_520094164 {.
      cdecl, importc: "libvlc_media_player_get_time".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_time" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_time):
  proc libvlc_media_player_set_time*(p_mi: ptr libvlc_media_player_t_520094283;
                                     i_time: libvlc_time_t_520094164): void {.
      cdecl, importc: "libvlc_media_player_set_time".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_time" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_position):
  proc libvlc_media_player_get_position*(p_mi: ptr libvlc_media_player_t_520094283): cfloat {.
      cdecl, importc: "libvlc_media_player_get_position".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_position" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_position):
  proc libvlc_media_player_set_position*(p_mi: ptr libvlc_media_player_t_520094283;
      f_pos: cfloat): void {.cdecl, importc: "libvlc_media_player_set_position".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_position" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_chapter):
  proc libvlc_media_player_set_chapter*(p_mi: ptr libvlc_media_player_t_520094283;
                                        i_chapter: cint): void {.cdecl,
      importc: "libvlc_media_player_set_chapter".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_chapter" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_chapter):
  proc libvlc_media_player_get_chapter*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_get_chapter".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_chapter" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_chapter_count):
  proc libvlc_media_player_get_chapter_count*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_get_chapter_count".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_chapter_count" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_will_play):
  proc libvlc_media_player_will_play*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_will_play".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_will_play" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_chapter_count_for_title):
  proc libvlc_media_player_get_chapter_count_for_title*(
      p_mi: ptr libvlc_media_player_t_520094283; i_title: cint): cint {.cdecl,
      importc: "libvlc_media_player_get_chapter_count_for_title".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_chapter_count_for_title" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_title):
  proc libvlc_media_player_set_title*(p_mi: ptr libvlc_media_player_t_520094283;
                                      i_title: cint): void {.cdecl,
      importc: "libvlc_media_player_set_title".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_title" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_title):
  proc libvlc_media_player_get_title*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_get_title".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_title" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_title_count):
  proc libvlc_media_player_get_title_count*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_get_title_count".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_title_count" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_previous_chapter):
  proc libvlc_media_player_previous_chapter*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_previous_chapter".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_previous_chapter" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_next_chapter):
  proc libvlc_media_player_next_chapter*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_next_chapter".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_next_chapter" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_rate):
  proc libvlc_media_player_get_rate*(p_mi: ptr libvlc_media_player_t_520094283): cfloat {.
      cdecl, importc: "libvlc_media_player_get_rate".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_rate" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_rate):
  proc libvlc_media_player_set_rate*(p_mi: ptr libvlc_media_player_t_520094283;
                                     rate: cfloat): cint {.cdecl,
      importc: "libvlc_media_player_set_rate".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_rate" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_state):
  proc libvlc_media_player_get_state*(p_mi: ptr libvlc_media_player_t_520094283): libvlc_state_t_520094204 {.
      cdecl, importc: "libvlc_media_player_get_state".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_state" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_has_vout):
  proc libvlc_media_player_has_vout*(p_mi: ptr libvlc_media_player_t_520094283): cuint {.
      cdecl, importc: "libvlc_media_player_has_vout".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_has_vout" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_is_seekable):
  proc libvlc_media_player_is_seekable*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_is_seekable".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_is_seekable" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_can_pause):
  proc libvlc_media_player_can_pause*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_can_pause".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_can_pause" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_program_scrambled):
  proc libvlc_media_player_program_scrambled*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_program_scrambled".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_program_scrambled" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_next_frame):
  proc libvlc_media_player_next_frame*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_media_player_next_frame".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_next_frame" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_navigate):
  proc libvlc_media_player_navigate*(p_mi: ptr libvlc_media_player_t_520094283;
                                     navigate: cuint): void {.cdecl,
      importc: "libvlc_media_player_navigate".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_navigate" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_video_title_display):
  proc libvlc_media_player_set_video_title_display*(
      p_mi: ptr libvlc_media_player_t_520094283; position: libvlc_position_t_520094315;
      timeout: cuint): void {.cdecl, importc: "libvlc_media_player_set_video_title_display".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_video_title_display" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_add_slave):
  proc libvlc_media_player_add_slave*(p_mi: ptr libvlc_media_player_t_520094283;
                                      i_type: libvlc_media_slave_type_t_520094267;
                                      psz_uri: cstring; b_select: bool): cint {.
      cdecl, importc: "libvlc_media_player_add_slave".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_add_slave" &
        " already exists, not redeclaring")
when not declared(libvlc_track_description_list_release):
  proc libvlc_track_description_list_release*(
      p_track_description: ptr libvlc_track_description_t_520094287): void {.
      cdecl, importc: "libvlc_track_description_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_track_description_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_toggle_fullscreen):
  proc libvlc_toggle_fullscreen*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_toggle_fullscreen".}
else:
  static :
    hint("Declaration of " & "libvlc_toggle_fullscreen" &
        " already exists, not redeclaring")
when not declared(libvlc_set_fullscreen):
  proc libvlc_set_fullscreen*(p_mi: ptr libvlc_media_player_t_520094283;
                              b_fullscreen: cint): void {.cdecl,
      importc: "libvlc_set_fullscreen".}
else:
  static :
    hint("Declaration of " & "libvlc_set_fullscreen" &
        " already exists, not redeclaring")
when not declared(libvlc_get_fullscreen):
  proc libvlc_get_fullscreen*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_get_fullscreen".}
else:
  static :
    hint("Declaration of " & "libvlc_get_fullscreen" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_key_input):
  proc libvlc_video_set_key_input*(p_mi: ptr libvlc_media_player_t_520094283;
                                   on: cuint): void {.cdecl,
      importc: "libvlc_video_set_key_input".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_key_input" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_mouse_input):
  proc libvlc_video_set_mouse_input*(p_mi: ptr libvlc_media_player_t_520094283;
                                     on: cuint): void {.cdecl,
      importc: "libvlc_video_set_mouse_input".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_mouse_input" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_size):
  proc libvlc_video_get_size*(p_mi: ptr libvlc_media_player_t_520094283;
                              num: cuint; px: ptr cuint; py: ptr cuint): cint {.
      cdecl, importc: "libvlc_video_get_size".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_size" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_cursor):
  proc libvlc_video_get_cursor*(p_mi: ptr libvlc_media_player_t_520094283;
                                num: cuint; px: ptr cint; py: ptr cint): cint {.
      cdecl, importc: "libvlc_video_get_cursor".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_cursor" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_scale):
  proc libvlc_video_get_scale*(p_mi: ptr libvlc_media_player_t_520094283): cfloat {.
      cdecl, importc: "libvlc_video_get_scale".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_scale" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_scale):
  proc libvlc_video_set_scale*(p_mi: ptr libvlc_media_player_t_520094283;
                               f_factor: cfloat): void {.cdecl,
      importc: "libvlc_video_set_scale".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_scale" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_aspect_ratio):
  proc libvlc_video_get_aspect_ratio*(p_mi: ptr libvlc_media_player_t_520094283): cstring {.
      cdecl, importc: "libvlc_video_get_aspect_ratio".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_aspect_ratio" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_aspect_ratio):
  proc libvlc_video_set_aspect_ratio*(p_mi: ptr libvlc_media_player_t_520094283;
                                      psz_aspect: cstring): void {.cdecl,
      importc: "libvlc_video_set_aspect_ratio".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_aspect_ratio" &
        " already exists, not redeclaring")
when not declared(libvlc_video_new_viewpoint):
  proc libvlc_video_new_viewpoint*(): ptr libvlc_video_viewpoint_t_520094232 {.
      cdecl, importc: "libvlc_video_new_viewpoint".}
else:
  static :
    hint("Declaration of " & "libvlc_video_new_viewpoint" &
        " already exists, not redeclaring")
when not declared(libvlc_video_update_viewpoint):
  proc libvlc_video_update_viewpoint*(p_mi: ptr libvlc_media_player_t_520094283;
      p_viewpoint: ptr libvlc_video_viewpoint_t_520094232; b_absolute: bool): cint {.
      cdecl, importc: "libvlc_video_update_viewpoint".}
else:
  static :
    hint("Declaration of " & "libvlc_video_update_viewpoint" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_spu):
  proc libvlc_video_get_spu*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_spu".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_spu" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_spu_count):
  proc libvlc_video_get_spu_count*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_spu_count".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_spu_count" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_spu_description):
  proc libvlc_video_get_spu_description*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_track_description_t_520094287 {.
      cdecl, importc: "libvlc_video_get_spu_description".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_spu_description" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_spu):
  proc libvlc_video_set_spu*(p_mi: ptr libvlc_media_player_t_520094283;
                             i_spu: cint): cint {.cdecl,
      importc: "libvlc_video_set_spu".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_spu" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_spu_delay):
  proc libvlc_video_get_spu_delay*(p_mi: ptr libvlc_media_player_t_520094283): int64 {.
      cdecl, importc: "libvlc_video_get_spu_delay".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_spu_delay" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_spu_delay):
  proc libvlc_video_set_spu_delay*(p_mi: ptr libvlc_media_player_t_520094283;
                                   i_delay: int64): cint {.cdecl,
      importc: "libvlc_video_set_spu_delay".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_spu_delay" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_full_title_descriptions):
  proc libvlc_media_player_get_full_title_descriptions*(
      p_mi: ptr libvlc_media_player_t_520094283;
      titles: ptr ptr ptr libvlc_title_description_t_520094291): cint {.cdecl,
      importc: "libvlc_media_player_get_full_title_descriptions".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_full_title_descriptions" &
        " already exists, not redeclaring")
when not declared(libvlc_title_descriptions_release):
  proc libvlc_title_descriptions_release*(
      p_titles: ptr ptr libvlc_title_description_t_520094291; i_count: cuint): void {.
      cdecl, importc: "libvlc_title_descriptions_release".}
else:
  static :
    hint("Declaration of " & "libvlc_title_descriptions_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_full_chapter_descriptions):
  proc libvlc_media_player_get_full_chapter_descriptions*(
      p_mi: ptr libvlc_media_player_t_520094283; i_chapters_of_title: cint;
      pp_chapters: ptr ptr ptr libvlc_chapter_description_t_520094295): cint {.
      cdecl, importc: "libvlc_media_player_get_full_chapter_descriptions".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_full_chapter_descriptions" &
        " already exists, not redeclaring")
when not declared(libvlc_chapter_descriptions_release):
  proc libvlc_chapter_descriptions_release*(
      p_chapters: ptr ptr libvlc_chapter_description_t_520094295; i_count: cuint): void {.
      cdecl, importc: "libvlc_chapter_descriptions_release".}
else:
  static :
    hint("Declaration of " & "libvlc_chapter_descriptions_release" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_crop_geometry):
  proc libvlc_video_get_crop_geometry*(p_mi: ptr libvlc_media_player_t_520094283): cstring {.
      cdecl, importc: "libvlc_video_get_crop_geometry".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_crop_geometry" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_crop_geometry):
  proc libvlc_video_set_crop_geometry*(p_mi: ptr libvlc_media_player_t_520094283;
                                       psz_geometry: cstring): void {.cdecl,
      importc: "libvlc_video_set_crop_geometry".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_crop_geometry" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_teletext):
  proc libvlc_video_get_teletext*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_teletext".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_teletext" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_teletext):
  proc libvlc_video_set_teletext*(p_mi: ptr libvlc_media_player_t_520094283;
                                  i_page: cint): void {.cdecl,
      importc: "libvlc_video_set_teletext".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_teletext" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_track_count):
  proc libvlc_video_get_track_count*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_track_count".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_track_count" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_track_description):
  proc libvlc_video_get_track_description*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_track_description_t_520094287 {.
      cdecl, importc: "libvlc_video_get_track_description".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_track_description" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_track):
  proc libvlc_video_get_track*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_track".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_track" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_track):
  proc libvlc_video_set_track*(p_mi: ptr libvlc_media_player_t_520094283;
                               i_track: cint): cint {.cdecl,
      importc: "libvlc_video_set_track".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_track" &
        " already exists, not redeclaring")
when not declared(libvlc_video_take_snapshot):
  proc libvlc_video_take_snapshot*(p_mi: ptr libvlc_media_player_t_520094283;
                                   num: cuint; psz_filepath: cstring;
                                   i_width: cuint; i_height: cuint): cint {.
      cdecl, importc: "libvlc_video_take_snapshot".}
else:
  static :
    hint("Declaration of " & "libvlc_video_take_snapshot" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_deinterlace):
  proc libvlc_video_set_deinterlace*(p_mi: ptr libvlc_media_player_t_520094283;
                                     psz_mode: cstring): void {.cdecl,
      importc: "libvlc_video_set_deinterlace".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_deinterlace" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_marquee_int):
  proc libvlc_video_get_marquee_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                     option: cuint): cint {.cdecl,
      importc: "libvlc_video_get_marquee_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_marquee_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_marquee_string):
  proc libvlc_video_get_marquee_string*(p_mi: ptr libvlc_media_player_t_520094283;
                                        option: cuint): cstring {.cdecl,
      importc: "libvlc_video_get_marquee_string".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_marquee_string" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_marquee_int):
  proc libvlc_video_set_marquee_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                     option: cuint; i_val: cint): void {.cdecl,
      importc: "libvlc_video_set_marquee_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_marquee_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_marquee_string):
  proc libvlc_video_set_marquee_string*(p_mi: ptr libvlc_media_player_t_520094283;
                                        option: cuint; psz_text: cstring): void {.
      cdecl, importc: "libvlc_video_set_marquee_string".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_marquee_string" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_logo_int):
  proc libvlc_video_get_logo_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                  option: cuint): cint {.cdecl,
      importc: "libvlc_video_get_logo_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_logo_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_logo_int):
  proc libvlc_video_set_logo_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                  option: cuint; value: cint): void {.cdecl,
      importc: "libvlc_video_set_logo_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_logo_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_logo_string):
  proc libvlc_video_set_logo_string*(p_mi: ptr libvlc_media_player_t_520094283;
                                     option: cuint; psz_value: cstring): void {.
      cdecl, importc: "libvlc_video_set_logo_string".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_logo_string" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_adjust_int):
  proc libvlc_video_get_adjust_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                    option: cuint): cint {.cdecl,
      importc: "libvlc_video_get_adjust_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_adjust_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_adjust_int):
  proc libvlc_video_set_adjust_int*(p_mi: ptr libvlc_media_player_t_520094283;
                                    option: cuint; value: cint): void {.cdecl,
      importc: "libvlc_video_set_adjust_int".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_adjust_int" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_adjust_float):
  proc libvlc_video_get_adjust_float*(p_mi: ptr libvlc_media_player_t_520094283;
                                      option: cuint): cfloat {.cdecl,
      importc: "libvlc_video_get_adjust_float".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_adjust_float" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_adjust_float):
  proc libvlc_video_set_adjust_float*(p_mi: ptr libvlc_media_player_t_520094283;
                                      option: cuint; value: cfloat): void {.
      cdecl, importc: "libvlc_video_set_adjust_float".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_adjust_float" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_list_get):
  proc libvlc_audio_output_list_get*(p_instance: ptr libvlc_instance_t): ptr libvlc_audio_output_t_520094299 {.
      cdecl, importc: "libvlc_audio_output_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_list_release):
  proc libvlc_audio_output_list_release*(p_list: ptr libvlc_audio_output_t_520094299): void {.
      cdecl, importc: "libvlc_audio_output_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_set):
  proc libvlc_audio_output_set*(p_mi: ptr libvlc_media_player_t_520094283;
                                psz_name: cstring): cint {.cdecl,
      importc: "libvlc_audio_output_set".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_set" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_enum):
  proc libvlc_audio_output_device_enum*(mp: ptr libvlc_media_player_t_520094283): ptr libvlc_audio_output_device_t_520094303 {.
      cdecl, importc: "libvlc_audio_output_device_enum".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_enum" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_list_get):
  proc libvlc_audio_output_device_list_get*(p_instance: ptr libvlc_instance_t;
      aout: cstring): ptr libvlc_audio_output_device_t_520094303 {.cdecl,
      importc: "libvlc_audio_output_device_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_list_release):
  proc libvlc_audio_output_device_list_release*(
      p_list: ptr libvlc_audio_output_device_t_520094303): void {.cdecl,
      importc: "libvlc_audio_output_device_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_set):
  proc libvlc_audio_output_device_set*(mp: ptr libvlc_media_player_t_520094283;
                                       module: cstring; device_id: cstring): void {.
      cdecl, importc: "libvlc_audio_output_device_set".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_set" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_get):
  proc libvlc_audio_output_device_get*(mp: ptr libvlc_media_player_t_520094283): cstring {.
      cdecl, importc: "libvlc_audio_output_device_get".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_get" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_toggle_mute):
  proc libvlc_audio_toggle_mute*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_audio_toggle_mute".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_toggle_mute" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_mute):
  proc libvlc_audio_get_mute*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_get_mute".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_mute" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_mute):
  proc libvlc_audio_set_mute*(p_mi: ptr libvlc_media_player_t_520094283;
                              status: cint): void {.cdecl,
      importc: "libvlc_audio_set_mute".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_mute" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_volume):
  proc libvlc_audio_get_volume*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_get_volume".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_volume" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_volume):
  proc libvlc_audio_set_volume*(p_mi: ptr libvlc_media_player_t_520094283;
                                i_volume: cint): cint {.cdecl,
      importc: "libvlc_audio_set_volume".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_volume" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_track_count):
  proc libvlc_audio_get_track_count*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_get_track_count".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_track_count" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_track_description):
  proc libvlc_audio_get_track_description*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_track_description_t_520094287 {.
      cdecl, importc: "libvlc_audio_get_track_description".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_track_description" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_track):
  proc libvlc_audio_get_track*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_get_track".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_track" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_track):
  proc libvlc_audio_set_track*(p_mi: ptr libvlc_media_player_t_520094283;
                               i_track: cint): cint {.cdecl,
      importc: "libvlc_audio_set_track".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_track" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_channel):
  proc libvlc_audio_get_channel*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_get_channel".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_channel" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_channel):
  proc libvlc_audio_set_channel*(p_mi: ptr libvlc_media_player_t_520094283;
                                 channel: cint): cint {.cdecl,
      importc: "libvlc_audio_set_channel".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_channel" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_get_delay):
  proc libvlc_audio_get_delay*(p_mi: ptr libvlc_media_player_t_520094283): int64 {.
      cdecl, importc: "libvlc_audio_get_delay".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_get_delay" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_set_delay):
  proc libvlc_audio_set_delay*(p_mi: ptr libvlc_media_player_t_520094283;
                               i_delay: int64): cint {.cdecl,
      importc: "libvlc_audio_set_delay".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_set_delay" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_preset_count):
  proc libvlc_audio_equalizer_get_preset_count*(): cuint {.cdecl,
      importc: "libvlc_audio_equalizer_get_preset_count".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_preset_count" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_preset_name):
  proc libvlc_audio_equalizer_get_preset_name*(u_index: cuint): cstring {.cdecl,
      importc: "libvlc_audio_equalizer_get_preset_name".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_preset_name" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_band_count):
  proc libvlc_audio_equalizer_get_band_count*(): cuint {.cdecl,
      importc: "libvlc_audio_equalizer_get_band_count".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_band_count" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_band_frequency):
  proc libvlc_audio_equalizer_get_band_frequency*(u_index: cuint): cfloat {.
      cdecl, importc: "libvlc_audio_equalizer_get_band_frequency".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_band_frequency" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_new):
  proc libvlc_audio_equalizer_new*(): ptr libvlc_equalizer_t_520094321 {.cdecl,
      importc: "libvlc_audio_equalizer_new".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_new" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_new_from_preset):
  proc libvlc_audio_equalizer_new_from_preset*(u_index: cuint): ptr libvlc_equalizer_t_520094321 {.
      cdecl, importc: "libvlc_audio_equalizer_new_from_preset".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_new_from_preset" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_release):
  proc libvlc_audio_equalizer_release*(p_equalizer: ptr libvlc_equalizer_t_520094321): void {.
      cdecl, importc: "libvlc_audio_equalizer_release".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_release" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_set_preamp):
  proc libvlc_audio_equalizer_set_preamp*(p_equalizer: ptr libvlc_equalizer_t_520094321;
      f_preamp: cfloat): cint {.cdecl,
                                importc: "libvlc_audio_equalizer_set_preamp".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_set_preamp" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_preamp):
  proc libvlc_audio_equalizer_get_preamp*(p_equalizer: ptr libvlc_equalizer_t_520094321): cfloat {.
      cdecl, importc: "libvlc_audio_equalizer_get_preamp".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_preamp" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_set_amp_at_index):
  proc libvlc_audio_equalizer_set_amp_at_index*(
      p_equalizer: ptr libvlc_equalizer_t_520094321; f_amp: cfloat;
      u_band: cuint): cint {.cdecl,
                             importc: "libvlc_audio_equalizer_set_amp_at_index".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_set_amp_at_index" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_equalizer_get_amp_at_index):
  proc libvlc_audio_equalizer_get_amp_at_index*(
      p_equalizer: ptr libvlc_equalizer_t_520094321; u_band: cuint): cfloat {.
      cdecl, importc: "libvlc_audio_equalizer_get_amp_at_index".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_equalizer_get_amp_at_index" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_equalizer):
  proc libvlc_media_player_set_equalizer*(p_mi: ptr libvlc_media_player_t_520094283;
      p_equalizer: ptr libvlc_equalizer_t_520094321): cint {.cdecl,
      importc: "libvlc_media_player_set_equalizer".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_equalizer" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_role):
  proc libvlc_media_player_get_role*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_media_player_get_role".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_role" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_role):
  proc libvlc_media_player_set_role*(p_mi: ptr libvlc_media_player_t_520094283;
                                     role: cuint): cint {.cdecl,
      importc: "libvlc_media_player_set_role".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_role" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_new):
  proc libvlc_media_list_new*(p_instance: ptr libvlc_instance_t): ptr libvlc_media_list_t_520094365 {.
      cdecl, importc: "libvlc_media_list_new".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_new" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_release):
  proc libvlc_media_list_release*(p_ml: ptr libvlc_media_list_t_520094365): void {.
      cdecl, importc: "libvlc_media_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_retain):
  proc libvlc_media_list_retain*(p_ml: ptr libvlc_media_list_t_520094365): void {.
      cdecl, importc: "libvlc_media_list_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_set_media):
  proc libvlc_media_list_set_media*(p_ml: ptr libvlc_media_list_t_520094365;
                                    p_md: ptr libvlc_media_t): void {.
      cdecl, importc: "libvlc_media_list_set_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_set_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_media):
  proc libvlc_media_list_media*(p_ml: ptr libvlc_media_list_t_520094365): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_list_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_add_media):
  proc libvlc_media_list_add_media*(p_ml: ptr libvlc_media_list_t_520094365;
                                    p_md: ptr libvlc_media_t): cint {.
      cdecl, importc: "libvlc_media_list_add_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_add_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_insert_media):
  proc libvlc_media_list_insert_media*(p_ml: ptr libvlc_media_list_t_520094365;
                                       p_md: ptr libvlc_media_t;
                                       i_pos: cint): cint {.cdecl,
      importc: "libvlc_media_list_insert_media".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_insert_media" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_remove_index):
  proc libvlc_media_list_remove_index*(p_ml: ptr libvlc_media_list_t_520094365;
                                       i_pos: cint): cint {.cdecl,
      importc: "libvlc_media_list_remove_index".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_remove_index" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_count):
  proc libvlc_media_list_count*(p_ml: ptr libvlc_media_list_t_520094365): cint {.
      cdecl, importc: "libvlc_media_list_count".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_count" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_item_at_index):
  proc libvlc_media_list_item_at_index*(p_ml: ptr libvlc_media_list_t_520094365;
                                        i_pos: cint): ptr libvlc_media_t {.
      cdecl, importc: "libvlc_media_list_item_at_index".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_item_at_index" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_index_of_item):
  proc libvlc_media_list_index_of_item*(p_ml: ptr libvlc_media_list_t_520094365;
                                        p_md: ptr libvlc_media_t): cint {.
      cdecl, importc: "libvlc_media_list_index_of_item".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_index_of_item" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_is_readonly):
  proc libvlc_media_list_is_readonly*(p_ml: ptr libvlc_media_list_t_520094365): cint {.
      cdecl, importc: "libvlc_media_list_is_readonly".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_is_readonly" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_lock):
  proc libvlc_media_list_lock*(p_ml: ptr libvlc_media_list_t_520094365): void {.
      cdecl, importc: "libvlc_media_list_lock".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_lock" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_unlock):
  proc libvlc_media_list_unlock*(p_ml: ptr libvlc_media_list_t_520094365): void {.
      cdecl, importc: "libvlc_media_list_unlock".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_unlock" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_event_manager):
  proc libvlc_media_list_event_manager*(p_ml: ptr libvlc_media_list_t_520094365): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_media_list_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_new):
  proc libvlc_media_list_player_new*(p_instance: ptr libvlc_instance_t): ptr libvlc_media_list_player_t_520094367 {.
      cdecl, importc: "libvlc_media_list_player_new".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_new" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_release):
  proc libvlc_media_list_player_release*(p_mlp: ptr libvlc_media_list_player_t_520094367): void {.
      cdecl, importc: "libvlc_media_list_player_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_retain):
  proc libvlc_media_list_player_retain*(p_mlp: ptr libvlc_media_list_player_t_520094367): void {.
      cdecl, importc: "libvlc_media_list_player_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_event_manager):
  proc libvlc_media_list_player_event_manager*(
      p_mlp: ptr libvlc_media_list_player_t_520094367): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_media_list_player_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_set_media_player):
  proc libvlc_media_list_player_set_media_player*(
      p_mlp: ptr libvlc_media_list_player_t_520094367;
      p_mi: ptr libvlc_media_player_t_520094283): void {.cdecl,
      importc: "libvlc_media_list_player_set_media_player".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_set_media_player" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_get_media_player):
  proc libvlc_media_list_player_get_media_player*(
      p_mlp: ptr libvlc_media_list_player_t_520094367): ptr libvlc_media_player_t_520094283 {.
      cdecl, importc: "libvlc_media_list_player_get_media_player".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_get_media_player" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_set_media_list):
  proc libvlc_media_list_player_set_media_list*(
      p_mlp: ptr libvlc_media_list_player_t_520094367;
      p_mlist: ptr libvlc_media_list_t_520094365): void {.cdecl,
      importc: "libvlc_media_list_player_set_media_list".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_set_media_list" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_play):
  proc libvlc_media_list_player_play*(p_mlp: ptr libvlc_media_list_player_t_520094367): void {.
      cdecl, importc: "libvlc_media_list_player_play".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_play" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_pause):
  proc libvlc_media_list_player_pause*(p_mlp: ptr libvlc_media_list_player_t_520094367): void {.
      cdecl, importc: "libvlc_media_list_player_pause".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_pause" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_set_pause):
  proc libvlc_media_list_player_set_pause*(
      p_mlp: ptr libvlc_media_list_player_t_520094367; do_pause: cint): void {.
      cdecl, importc: "libvlc_media_list_player_set_pause".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_set_pause" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_is_playing):
  proc libvlc_media_list_player_is_playing*(
      p_mlp: ptr libvlc_media_list_player_t_520094367): cint {.cdecl,
      importc: "libvlc_media_list_player_is_playing".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_is_playing" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_get_state):
  proc libvlc_media_list_player_get_state*(p_mlp: ptr libvlc_media_list_player_t_520094367): libvlc_state_t_520094204 {.
      cdecl, importc: "libvlc_media_list_player_get_state".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_get_state" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_play_item_at_index):
  proc libvlc_media_list_player_play_item_at_index*(
      p_mlp: ptr libvlc_media_list_player_t_520094367; i_index: cint): cint {.
      cdecl, importc: "libvlc_media_list_player_play_item_at_index".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_play_item_at_index" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_play_item):
  proc libvlc_media_list_player_play_item*(
      p_mlp: ptr libvlc_media_list_player_t_520094367; p_md: ptr libvlc_media_t): cint {.
      cdecl, importc: "libvlc_media_list_player_play_item".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_play_item" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_stop):
  proc libvlc_media_list_player_stop*(p_mlp: ptr libvlc_media_list_player_t_520094367): void {.
      cdecl, importc: "libvlc_media_list_player_stop".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_stop" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_next):
  proc libvlc_media_list_player_next*(p_mlp: ptr libvlc_media_list_player_t_520094367): cint {.
      cdecl, importc: "libvlc_media_list_player_next".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_next" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_previous):
  proc libvlc_media_list_player_previous*(p_mlp: ptr libvlc_media_list_player_t_520094367): cint {.
      cdecl, importc: "libvlc_media_list_player_previous".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_previous" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_player_set_playback_mode):
  proc libvlc_media_list_player_set_playback_mode*(
      p_mlp: ptr libvlc_media_list_player_t_520094367;
      e_mode: libvlc_playback_mode_t_520094371): void {.cdecl,
      importc: "libvlc_media_list_player_set_playback_mode".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_player_set_playback_mode" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_new):
  proc libvlc_media_library_new*(p_instance: ptr libvlc_instance_t): ptr libvlc_media_library_t_520094373 {.
      cdecl, importc: "libvlc_media_library_new".}
else:
  static :
    hint("Declaration of " & "libvlc_media_library_new" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_release):
  proc libvlc_media_library_release*(p_mlib: ptr libvlc_media_library_t_520094373): void {.
      cdecl, importc: "libvlc_media_library_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_library_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_retain):
  proc libvlc_media_library_retain*(p_mlib: ptr libvlc_media_library_t_520094373): void {.
      cdecl, importc: "libvlc_media_library_retain".}
else:
  static :
    hint("Declaration of " & "libvlc_media_library_retain" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_load):
  proc libvlc_media_library_load*(p_mlib: ptr libvlc_media_library_t_520094373): cint {.
      cdecl, importc: "libvlc_media_library_load".}
else:
  static :
    hint("Declaration of " & "libvlc_media_library_load" &
        " already exists, not redeclaring")
when not declared(libvlc_media_library_media_list):
  proc libvlc_media_library_media_list*(p_mlib: ptr libvlc_media_library_t_520094373): ptr libvlc_media_list_t_520094365 {.
      cdecl, importc: "libvlc_media_library_media_list".}
else:
  static :
    hint("Declaration of " & "libvlc_media_library_media_list" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_new):
  proc libvlc_media_discoverer_new*(p_inst: ptr libvlc_instance_t;
                                    psz_name: cstring): ptr libvlc_media_discoverer_t_520094383 {.
      cdecl, importc: "libvlc_media_discoverer_new".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_new" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_start):
  proc libvlc_media_discoverer_start*(p_mdis: ptr libvlc_media_discoverer_t_520094383): cint {.
      cdecl, importc: "libvlc_media_discoverer_start".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_start" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_stop):
  proc libvlc_media_discoverer_stop*(p_mdis: ptr libvlc_media_discoverer_t_520094383): void {.
      cdecl, importc: "libvlc_media_discoverer_stop".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_stop" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_release):
  proc libvlc_media_discoverer_release*(p_mdis: ptr libvlc_media_discoverer_t_520094383): void {.
      cdecl, importc: "libvlc_media_discoverer_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_release" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_media_list):
  proc libvlc_media_discoverer_media_list*(p_mdis: ptr libvlc_media_discoverer_t_520094383): ptr libvlc_media_list_t_520094365 {.
      cdecl, importc: "libvlc_media_discoverer_media_list".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_media_list" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_is_running):
  proc libvlc_media_discoverer_is_running*(p_mdis: ptr libvlc_media_discoverer_t_520094383): cint {.
      cdecl, importc: "libvlc_media_discoverer_is_running".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_is_running" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_list_get):
  proc libvlc_media_discoverer_list_get*(p_inst: ptr libvlc_instance_t;
      i_cat: libvlc_media_discoverer_category_t_520094377;
      ppp_services: ptr ptr ptr libvlc_media_discoverer_description_t_520094381): csize_t {.
      cdecl, importc: "libvlc_media_discoverer_list_get".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_list_get" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_list_release):
  proc libvlc_media_discoverer_list_release*(
      pp_services: ptr ptr libvlc_media_discoverer_description_t_520094381;
      i_count: csize_t): void {.cdecl,
                                importc: "libvlc_media_discoverer_list_release".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_list_release" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_set_callbacks):
  proc libvlc_dialog_set_callbacks*(p_instance: ptr libvlc_instance_t;
                                    p_cbs: ptr libvlc_dialog_cbs_520094397;
                                    p_data: pointer): void {.cdecl,
      importc: "libvlc_dialog_set_callbacks".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_set_callbacks" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_set_context):
  proc libvlc_dialog_set_context*(p_id: ptr libvlc_dialog_id_520094389;
                                  p_context: pointer): void {.cdecl,
      importc: "libvlc_dialog_set_context".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_set_context" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_get_context):
  proc libvlc_dialog_get_context*(p_id: ptr libvlc_dialog_id_520094389): pointer {.
      cdecl, importc: "libvlc_dialog_get_context".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_get_context" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_post_login):
  proc libvlc_dialog_post_login*(p_id: ptr libvlc_dialog_id_520094389;
                                 psz_username: cstring; psz_password: cstring;
                                 b_store: bool): cint {.cdecl,
      importc: "libvlc_dialog_post_login".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_post_login" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_post_action):
  proc libvlc_dialog_post_action*(p_id: ptr libvlc_dialog_id_520094389;
                                  i_action: cint): cint {.cdecl,
      importc: "libvlc_dialog_post_action".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_post_action" &
        " already exists, not redeclaring")
when not declared(libvlc_dialog_dismiss):
  proc libvlc_dialog_dismiss*(p_id: ptr libvlc_dialog_id_520094389): cint {.
      cdecl, importc: "libvlc_dialog_dismiss".}
else:
  static :
    hint("Declaration of " & "libvlc_dialog_dismiss" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_release):
  proc libvlc_vlm_release*(p_instance: ptr libvlc_instance_t): void {.
      cdecl, importc: "libvlc_vlm_release".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_release" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_add_broadcast):
  proc libvlc_vlm_add_broadcast*(p_instance: ptr libvlc_instance_t;
                                 psz_name: cstring; psz_input: cstring;
                                 psz_output: cstring; i_options: cint;
                                 ppsz_options: ptr cstring; b_enabled: cint;
                                 b_loop: cint): cint {.cdecl,
      importc: "libvlc_vlm_add_broadcast".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_add_broadcast" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_add_vod):
  proc libvlc_vlm_add_vod*(p_instance: ptr libvlc_instance_t;
                           psz_name: cstring; psz_input: cstring;
                           i_options: cint; ppsz_options: ptr cstring;
                           b_enabled: cint; psz_mux: cstring): cint {.cdecl,
      importc: "libvlc_vlm_add_vod".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_add_vod" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_del_media):
  proc libvlc_vlm_del_media*(p_instance: ptr libvlc_instance_t;
                             psz_name: cstring): cint {.cdecl,
      importc: "libvlc_vlm_del_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_del_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_set_enabled):
  proc libvlc_vlm_set_enabled*(p_instance: ptr libvlc_instance_t;
                               psz_name: cstring; b_enabled: cint): cint {.
      cdecl, importc: "libvlc_vlm_set_enabled".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_set_enabled" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_set_output):
  proc libvlc_vlm_set_output*(p_instance: ptr libvlc_instance_t;
                              psz_name: cstring; psz_output: cstring): cint {.
      cdecl, importc: "libvlc_vlm_set_output".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_set_output" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_set_input):
  proc libvlc_vlm_set_input*(p_instance: ptr libvlc_instance_t;
                             psz_name: cstring; psz_input: cstring): cint {.
      cdecl, importc: "libvlc_vlm_set_input".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_set_input" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_add_input):
  proc libvlc_vlm_add_input*(p_instance: ptr libvlc_instance_t;
                             psz_name: cstring; psz_input: cstring): cint {.
      cdecl, importc: "libvlc_vlm_add_input".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_add_input" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_set_loop):
  proc libvlc_vlm_set_loop*(p_instance: ptr libvlc_instance_t;
                            psz_name: cstring; b_loop: cint): cint {.cdecl,
      importc: "libvlc_vlm_set_loop".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_set_loop" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_set_mux):
  proc libvlc_vlm_set_mux*(p_instance: ptr libvlc_instance_t;
                           psz_name: cstring; psz_mux: cstring): cint {.cdecl,
      importc: "libvlc_vlm_set_mux".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_set_mux" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_change_media):
  proc libvlc_vlm_change_media*(p_instance: ptr libvlc_instance_t;
                                psz_name: cstring; psz_input: cstring;
                                psz_output: cstring; i_options: cint;
                                ppsz_options: ptr cstring; b_enabled: cint;
                                b_loop: cint): cint {.cdecl,
      importc: "libvlc_vlm_change_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_change_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_play_media):
  proc libvlc_vlm_play_media*(p_instance: ptr libvlc_instance_t;
                              psz_name: cstring): cint {.cdecl,
      importc: "libvlc_vlm_play_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_play_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_stop_media):
  proc libvlc_vlm_stop_media*(p_instance: ptr libvlc_instance_t;
                              psz_name: cstring): cint {.cdecl,
      importc: "libvlc_vlm_stop_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_stop_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_pause_media):
  proc libvlc_vlm_pause_media*(p_instance: ptr libvlc_instance_t;
                               psz_name: cstring): cint {.cdecl,
      importc: "libvlc_vlm_pause_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_pause_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_seek_media):
  proc libvlc_vlm_seek_media*(p_instance: ptr libvlc_instance_t;
                              psz_name: cstring; f_percentage: cfloat): cint {.
      cdecl, importc: "libvlc_vlm_seek_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_seek_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_show_media):
  proc libvlc_vlm_show_media*(p_instance: ptr libvlc_instance_t;
                              psz_name: cstring): cstring {.cdecl,
      importc: "libvlc_vlm_show_media".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_show_media" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_get_media_instance_position):
  proc libvlc_vlm_get_media_instance_position*(
      p_instance: ptr libvlc_instance_t; psz_name: cstring;
      i_instance: cint): cfloat {.cdecl, importc: "libvlc_vlm_get_media_instance_position".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_get_media_instance_position" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_get_media_instance_time):
  proc libvlc_vlm_get_media_instance_time*(p_instance: ptr libvlc_instance_t;
      psz_name: cstring; i_instance: cint): cint {.cdecl,
      importc: "libvlc_vlm_get_media_instance_time".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_get_media_instance_time" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_get_media_instance_length):
  proc libvlc_vlm_get_media_instance_length*(p_instance: ptr libvlc_instance_t;
      psz_name: cstring; i_instance: cint): cint {.cdecl,
      importc: "libvlc_vlm_get_media_instance_length".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_get_media_instance_length" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_get_media_instance_rate):
  proc libvlc_vlm_get_media_instance_rate*(p_instance: ptr libvlc_instance_t;
      psz_name: cstring; i_instance: cint): cint {.cdecl,
      importc: "libvlc_vlm_get_media_instance_rate".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_get_media_instance_rate" &
        " already exists, not redeclaring")
when not declared(libvlc_vlm_get_event_manager):
  proc libvlc_vlm_get_event_manager*(p_instance: ptr libvlc_instance_t): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_vlm_get_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_vlm_get_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_fps):
  proc libvlc_media_player_get_fps*(p_mi: ptr libvlc_media_player_t_520094283): cfloat {.
      cdecl, importc: "libvlc_media_player_get_fps".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_fps" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_set_agl):
  proc libvlc_media_player_set_agl*(p_mi: ptr libvlc_media_player_t_520094283;
                                    drawable: uint32): void {.cdecl,
      importc: "libvlc_media_player_set_agl".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_set_agl" &
        " already exists, not redeclaring")
when not declared(libvlc_media_player_get_agl):
  proc libvlc_media_player_get_agl*(p_mi: ptr libvlc_media_player_t_520094283): uint32 {.
      cdecl, importc: "libvlc_media_player_get_agl".}
else:
  static :
    hint("Declaration of " & "libvlc_media_player_get_agl" &
        " already exists, not redeclaring")
when not declared(libvlc_track_description_release):
  proc libvlc_track_description_release*(
      p_track_description: ptr libvlc_track_description_t_520094287): void {.
      cdecl, importc: "libvlc_track_description_release".}
else:
  static :
    hint("Declaration of " & "libvlc_track_description_release" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_height):
  proc libvlc_video_get_height*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_height".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_height" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_width):
  proc libvlc_video_get_width*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_video_get_width".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_width" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_title_description):
  proc libvlc_video_get_title_description*(p_mi: ptr libvlc_media_player_t_520094283): ptr libvlc_track_description_t_520094287 {.
      cdecl, importc: "libvlc_video_get_title_description".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_title_description" &
        " already exists, not redeclaring")
when not declared(libvlc_video_get_chapter_description):
  proc libvlc_video_get_chapter_description*(p_mi: ptr libvlc_media_player_t_520094283;
      i_title: cint): ptr libvlc_track_description_t_520094287 {.cdecl,
      importc: "libvlc_video_get_chapter_description".}
else:
  static :
    hint("Declaration of " & "libvlc_video_get_chapter_description" &
        " already exists, not redeclaring")
when not declared(libvlc_video_set_subtitle_file):
  proc libvlc_video_set_subtitle_file*(p_mi: ptr libvlc_media_player_t_520094283;
                                       psz_subtitle: cstring): cint {.cdecl,
      importc: "libvlc_video_set_subtitle_file".}
else:
  static :
    hint("Declaration of " & "libvlc_video_set_subtitle_file" &
        " already exists, not redeclaring")
when not declared(libvlc_toggle_teletext):
  proc libvlc_toggle_teletext*(p_mi: ptr libvlc_media_player_t_520094283): void {.
      cdecl, importc: "libvlc_toggle_teletext".}
else:
  static :
    hint("Declaration of " & "libvlc_toggle_teletext" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_count):
  proc libvlc_audio_output_device_count*(p_instance: ptr libvlc_instance_t;
      psz_audio_output: cstring): cint {.cdecl,
      importc: "libvlc_audio_output_device_count".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_count" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_longname):
  proc libvlc_audio_output_device_longname*(p_instance: ptr libvlc_instance_t;
      psz_output: cstring; i_device: cint): cstring {.cdecl,
      importc: "libvlc_audio_output_device_longname".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_longname" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_device_id):
  proc libvlc_audio_output_device_id*(p_instance: ptr libvlc_instance_t;
                                      psz_audio_output: cstring; i_device: cint): cstring {.
      cdecl, importc: "libvlc_audio_output_device_id".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_device_id" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_get_device_type):
  proc libvlc_audio_output_get_device_type*(p_mi: ptr libvlc_media_player_t_520094283): cint {.
      cdecl, importc: "libvlc_audio_output_get_device_type".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_get_device_type" &
        " already exists, not redeclaring")
when not declared(libvlc_audio_output_set_device_type):
  proc libvlc_audio_output_set_device_type*(p_mp: ptr libvlc_media_player_t_520094283;
      device_type: cint): void {.cdecl,
                                 importc: "libvlc_audio_output_set_device_type".}
else:
  static :
    hint("Declaration of " & "libvlc_audio_output_set_device_type" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parse):
  proc libvlc_media_parse*(p_md: ptr libvlc_media_t): void {.cdecl,
      importc: "libvlc_media_parse".}
else:
  static :
    hint("Declaration of " & "libvlc_media_parse" &
        " already exists, not redeclaring")
when not declared(libvlc_media_parse_async):
  proc libvlc_media_parse_async*(p_md: ptr libvlc_media_t): void {.
      cdecl, importc: "libvlc_media_parse_async".}
else:
  static :
    hint("Declaration of " & "libvlc_media_parse_async" &
        " already exists, not redeclaring")
when not declared(libvlc_media_is_parsed):
  proc libvlc_media_is_parsed*(p_md: ptr libvlc_media_t): cint {.
      cdecl, importc: "libvlc_media_is_parsed".}
else:
  static :
    hint("Declaration of " & "libvlc_media_is_parsed" &
        " already exists, not redeclaring")
when not declared(libvlc_media_get_tracks_info):
  proc libvlc_media_get_tracks_info*(p_md: ptr libvlc_media_t;
                                     tracks: ptr ptr libvlc_media_track_info_t_520094216): cint {.
      cdecl, importc: "libvlc_media_get_tracks_info".}
else:
  static :
    hint("Declaration of " & "libvlc_media_get_tracks_info" &
        " already exists, not redeclaring")
when not declared(libvlc_media_list_add_file_content):
  proc libvlc_media_list_add_file_content*(p_ml: ptr libvlc_media_list_t_520094365;
      psz_uri: cstring): cint {.cdecl,
                                importc: "libvlc_media_list_add_file_content".}
else:
  static :
    hint("Declaration of " & "libvlc_media_list_add_file_content" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_new_from_name):
  proc libvlc_media_discoverer_new_from_name*(p_inst: ptr libvlc_instance_t;
      psz_name: cstring): ptr libvlc_media_discoverer_t_520094383 {.cdecl,
      importc: "libvlc_media_discoverer_new_from_name".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_new_from_name" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_localized_name):
  proc libvlc_media_discoverer_localized_name*(
      p_mdis: ptr libvlc_media_discoverer_t_520094383): cstring {.cdecl,
      importc: "libvlc_media_discoverer_localized_name".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_localized_name" &
        " already exists, not redeclaring")
when not declared(libvlc_media_discoverer_event_manager):
  proc libvlc_media_discoverer_event_manager*(
      p_mdis: ptr libvlc_media_discoverer_t_520094383): ptr libvlc_event_manager_t_520094166 {.
      cdecl, importc: "libvlc_media_discoverer_event_manager".}
else:
  static :
    hint("Declaration of " & "libvlc_media_discoverer_event_manager" &
        " already exists, not redeclaring")
when not declared(libvlc_wait):
  proc libvlc_wait*(p_instance: ptr libvlc_instance_t): void {.cdecl,
      importc: "libvlc_wait".}
else:
  static :
    hint("Declaration of " & "libvlc_wait" & " already exists, not redeclaring")
when not declared(libvlc_get_log_verbosity):
  proc libvlc_get_log_verbosity*(p_instance: ptr libvlc_instance_t): cuint {.
      cdecl, importc: "libvlc_get_log_verbosity".}
else:
  static :
    hint("Declaration of " & "libvlc_get_log_verbosity" &
        " already exists, not redeclaring")
when not declared(libvlc_set_log_verbosity):
  proc libvlc_set_log_verbosity*(p_instance: ptr libvlc_instance_t;
                                 level: cuint): void {.cdecl,
      importc: "libvlc_set_log_verbosity".}
else:
  static :
    hint("Declaration of " & "libvlc_set_log_verbosity" &
        " already exists, not redeclaring")
when not declared(libvlc_log_open):
  proc libvlc_log_open*(p_instance: ptr libvlc_instance_t): ptr libvlc_log_t_520094176 {.
      cdecl, importc: "libvlc_log_open".}
else:
  static :
    hint("Declaration of " & "libvlc_log_open" &
        " already exists, not redeclaring")
when not declared(libvlc_log_close):
  proc libvlc_log_close*(p_log: ptr libvlc_log_t_520094176): void {.cdecl,
      importc: "libvlc_log_close".}
else:
  static :
    hint("Declaration of " & "libvlc_log_close" &
        " already exists, not redeclaring")
when not declared(libvlc_log_count):
  proc libvlc_log_count*(p_log: ptr libvlc_log_t_520094176): cuint {.cdecl,
      importc: "libvlc_log_count".}
else:
  static :
    hint("Declaration of " & "libvlc_log_count" &
        " already exists, not redeclaring")
when not declared(libvlc_log_clear):
  proc libvlc_log_clear*(p_log: ptr libvlc_log_t_520094176): void {.cdecl,
      importc: "libvlc_log_clear".}
else:
  static :
    hint("Declaration of " & "libvlc_log_clear" &
        " already exists, not redeclaring")
when not declared(libvlc_log_get_iterator):
  proc libvlc_log_get_iterator*(p_log: ptr libvlc_log_t_520094176): ptr libvlc_log_iterator_t_520094399 {.
      cdecl, importc: "libvlc_log_get_iterator".}
else:
  static :
    hint("Declaration of " & "libvlc_log_get_iterator" &
        " already exists, not redeclaring")
when not declared(libvlc_log_iterator_free):
  proc libvlc_log_iterator_free*(p_iter: ptr libvlc_log_iterator_t_520094399): void {.
      cdecl, importc: "libvlc_log_iterator_free".}
else:
  static :
    hint("Declaration of " & "libvlc_log_iterator_free" &
        " already exists, not redeclaring")
when not declared(libvlc_log_iterator_has_next):
  proc libvlc_log_iterator_has_next*(p_iter: ptr libvlc_log_iterator_t_520094399): cint {.
      cdecl, importc: "libvlc_log_iterator_has_next".}
else:
  static :
    hint("Declaration of " & "libvlc_log_iterator_has_next" &
        " already exists, not redeclaring")
when not declared(libvlc_log_iterator_next):
  proc libvlc_log_iterator_next*(p_iter: ptr libvlc_log_iterator_t_520094399;
                                 p_buf: ptr libvlc_log_message_t_520094403): ptr libvlc_log_message_t_520094403 {.
      cdecl, importc: "libvlc_log_iterator_next".}
else:
  static :
    hint("Declaration of " & "libvlc_log_iterator_next" &
        " already exists, not redeclaring")
when not declared(libvlc_playlist_play):
  proc libvlc_playlist_play*(p_instance: ptr libvlc_instance_t;
                             i_id: cint; i_options: cint;
                             ppsz_options: ptr cstring): void {.cdecl,
      importc: "libvlc_playlist_play".}
else:
  static :
    hint("Declaration of " & "libvlc_playlist_play" &
        " already exists, not redeclaring")

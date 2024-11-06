type
    LogMessage = object
    #/** This structure is opaque. It represents a libvlc log iterator */
    #typedef struct libvlc_log_iterator_t libvlc_log_iterator_t;
    #
    #typedef struct libvlc_log_message_t
    #{
    #    int         i_severity;   /* 0=INFO, 1=ERR, 2=WARN, 3=DBG */
    #    const char *psz_type;     /* module type */
    #    const char *psz_name;     /* module name */
    #    const char *psz_header;   /* optional header */
    #    const char *psz_message;  /* message */
    #} libvlc_log_message_t;

proc fps*(mp: MediaPlayer): float = mp.media_player_get_fps() ## deprecated
proc `agl=`*(mp: MediaPlayer; drawable: uint32) = mp.media_player_set_agl(drawable) ## deprecated, use set_nsobject instead
proc `agl`*(mp: MediaPlayer): uint32 = mp.media_player_get_agl() ## deprecated, use get_nsobject instead

proc height*(mp: MediaPlayer): int = mp.video_get_height()
proc width*(mp: MediaPlayer): int = mp.video_get_width()
proc titleDescription*(mp: MediaPlayer): TrackDescription = TrackDescription(impl: mp.video_get_title_description())
proc chapterDescription*(mp: MediaPlayer, title: int): TrackDescription = TrackDescription(impl: mp.video_get_chapter_description(title.cint))
proc `subtitleFile=`*(mp: MediaPlayer, subtitle: string): int = mp.video_set_subtitle_file(subtitle.cstring)
proc toggleTeletext*(mp: MediaPlayer) = mp.impl.toggle_teletext()

## * \ingroup libvlc libvlc_media_player
#float libvlc_media_player_get_fps( libvlc_media_player_t *p_mi ); # * \deprecated Consider using libvlc_media_tracks_get() instead.
#void libvlc_media_player_set_agl ( libvlc_media_player_t *p_mi, uint32_t drawable ); # * \deprecated Use libvlc_media_player_set_nsobject() instead
#uint32_t libvlc_media_player_get_agl ( libvlc_media_player_t *p_mi ); # * \deprecated Use libvlc_media_player_get_nsobject() instead
#void libvlc_track_description_release( libvlc_track_description_t *p_track_description ); # * \deprecated Use libvlc_track_description_list_release() instead
#
## * \ingroup libvlc libvlc_video
#int libvlc_video_get_height( libvlc_media_player_t *p_mi ); # * \deprecated Use libvlc_video_get_size() instead.
#int libvlc_video_get_width( libvlc_media_player_t *p_mi ); # * \deprecated Use libvlc_video_get_size() instead.
#libvlc_track_description_t * libvlc_video_get_title_description( libvlc_media_player_t *p_mi ); # * It must be freed with libvlc_track_description_list_release()
#libvlc_track_description_t * libvlc_video_get_chapter_description( libvlc_media_player_t *p_mi, int i_title ); # * It must be freed with libvlc_track_description_list_release()
#int libvlc_video_set_subtitle_file( libvlc_media_player_t *p_mi, const char *psz_subtitle ); # * \deprecated Use libvlc_media_player_add_slave() instead.
#void libvlc_toggle_teletext( libvlc_media_player_t *p_mi ); # * \deprecated use libvlc_video_set_teletext() instead.
#
## * \ingroup libvlc libvlc_audio
#int libvlc_audio_output_device_count( libvlc_instance_t *p_instance, const char *psz_audio_output ); # * \deprecated Use libvlc_audio_output_device_list_get() instead.
#char *libvlc_audio_output_device_longname( libvlc_instance_t *p_instance, const char *psz_output, int i_device ); # * \deprecated Use libvlc_audio_output_device_list_get() instead.
#char *libvlc_audio_output_device_id( libvlc_instance_t *p_instance, const char *psz_audio_output, int i_device ); # * \deprecated Use libvlc_audio_output_device_list_get() instead.
#
#int libvlc_audio_output_get_device_type( libvlc_media_player_t *p_mi );
#
#void libvlc_audio_output_set_device_type( libvlc_media_player_t *p_mp, int device_type );
#
## * \ingroup libvlc libvlc_media
#void libvlc_media_parse( libvlc_media_t *p_md ); # * \deprecated This function could block indefinitely.
#void libvlc_media_parse_async( libvlc_media_t *p_md ); # * \deprecated You can't be sure to receive the libvlc_MediaParsedChanged event (you can wait indefinitely for this event).  Use libvlc_media_parse_with_options() instead
#int libvlc_media_is_parsed( libvlc_media_t *p_md ); # * \deprecated This can return true in case of failure. Use libvlc_media_get_parsed_status() instead. \see libvlc_MediaParsedChanged
#int libvlc_media_get_tracks_info( libvlc_media_t *p_md, libvlc_media_track_info_t **tracks ); # * \deprecated Use libvlc_media_tracks_get() instead
#LIBVLC_DEPRECATED int libvlc_media_list_add_file_content( libvlc_media_list_t * p_ml, const char * psz_uri ); # * \ingroup libvlc libvlc_media_list
#libvlc_media_discoverer_t * libvlc_media_discoverer_new_from_name( libvlc_instance_t * p_inst, const char * psz_name ); # * \deprecated Use libvlc_media_discoverer_new() and libvlc_media_discoverer_start().  # * \ingroup libvlc libvlc_media_discoverer
#char * libvlc_media_discoverer_localized_name( libvlc_media_discoverer_t * p_mdis ); # * \deprecated Useless, use libvlc_media_discoverer_list_get() to get the longname of the service discovery.
#libvlc_event_manager_t * libvlc_media_discoverer_event_manager( libvlc_media_discoverer_t * p_mdis ); # * \deprecated Useless, media_discoverer events are only triggered when calling libvlc_media_discoverer_start() and libvlc_media_discoverer_stop().
#void libvlc_wait( libvlc_instance_t *p_instance ); # * libvlc_set_exit_handler() should be used instead.
#
## * \ingroup libvlc_core
#unsigned libvlc_get_log_verbosity( const libvlc_instance_t *p_instance ); # * \return always -1
#void libvlc_set_log_verbosity( libvlc_instance_t *p_instance, unsigned level ); # * This function does nothing. It is only provided for backward compatibility.
#libvlc_log_t *libvlc_log_open( libvlc_instance_t *p_instance ); # * This function does nothing useful. It is only provided for backward compatibility.
#void libvlc_log_close( libvlc_log_t *p_log ); # * Frees memory allocated by libvlc_log_open().
#unsigned libvlc_log_count( const libvlc_log_t *p_log ); # * \return always zero
#void libvlc_log_clear( libvlc_log_t *p_log ); # * This function does nothing. It is only provided for backward compatibility.
#libvlc_log_iterator_t *libvlc_log_get_iterator( const libvlc_log_t *p_log ); # * \return an unique pointer or NULL on error or if the parameter was NULL
#void libvlc_log_iterator_free( libvlc_log_iterator_t *p_iter ); # * Frees memory allocated by libvlc_log_get_iterator().
#int libvlc_log_iterator_has_next( const libvlc_log_iterator_t *p_iter ); # * \return always zero
#libvlc_log_message_t *libvlc_log_iterator_next( libvlc_log_iterator_t *p_iter, libvlc_log_message_t *p_buf ); # * \return always NULL
#
## * \ingroup libvlc
## * \defgroup libvlc_playlist LibVLC playlist (legacy)
#void libvlc_playlist_play( libvlc_instance_t *p_instance, int i_id, int i_options, char **ppsz_options ); # * @deprecated Use @ref libvlc_media_list instead.

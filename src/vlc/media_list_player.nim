type
    MediaListPlayer = object
        impl: ptr media_list_player_t
    PlaybackMode = playback_mode_t
destroyImpl(MediaListPlayer, media_list_player_release)
convertImpl(MediaListPlayer, media_list_player_t)
proc newMediaListPlayer*(i: Instance): MediaListPlayer = result.impl = i.media_list_player_new()
proc retain*(mlp: MediaListPlayer) = mlp.media_list_player_retain
proc eventManager*(mlp: MediaListPlayer): EventManager = mlp.media_list_player_event_manager
proc `mediaPlayer=`*(mlp: MediaListPlayer, mp: MediaPlayer) = mlp.media_list_player_set_media_player(mp)
proc mediaPlayer*(mlp: MediaListPlayer): MediaPlayer = mlp.media_list_player_get_media_player()
proc `mediaList=`*(mlp: MediaListPlayer, ml: MediaList) = mlp.media_list_player_set_media_list(ml)
proc play*(mlp: MediaListPlayer) = mlp.media_list_player_play()
proc pause*(mlp: MediaListPlayer) = mlp.media_list_player_pause()
proc `pause=`*(mlp: MediaListPlayer, do_pause: bool) = mlp.media_list_player_set_pause(do_pause.cint)
proc isPlaying*(mlp: MediaListPlayer): bool = mlp.media_list_player_is_playing() == 1
proc state*(mlp: MediaListPlayer): State = mlp.media_list_player_get_state()
proc play*(mlp: MediaListPlayer, index: int): int = mlp.media_list_player_play_item_at_index(index.cint)
proc play*(mlp: MediaListPlayer, m: Media): int = mlp.media_list_player_play_item(m)
proc stop*(mlp: MediaListPlayer) = mlp.media_list_player_stop()
proc next*(mlp: MediaListPlayer): int = mlp.media_list_player_next()
proc previous*(mlp: MediaListPlayer): int = mlp.media_list_player_previous()
proc `playbackMode=`*(mlp: MediaListPlayer, mode: PlaybackMode) = mlp.media_list_player_set_playback_mode(mode)

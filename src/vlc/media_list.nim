#type
    #MediaTracklist = object # opaque # 4.0.0
#proc count*(mtl: MediaTracklist): uint = mtl.media_tracklist_count()
#proc at*(mtl: MediaTracklist): MediaTrack = MediaTrack(impl: mtl.media_tracklist_at(index))
#proc delete*(mtl: MediaTracklist) = mtl.media_tracklist_delete()
#proc `=destroy`(mt: var MediaTrack) = mtl.media_track_release()
#proc hold*(mtl: MediaTrack): MediaTrack = MediaTrack(impl: mt.media_track_hold())
#proc release*(mtl: MediaTrack) = mt.media_track_release()

proc newMediaList(i: Instance ): MediaList = result.impl = i.media_list_new()
destroyImpl(MediaList, media_list_release)
proc retain(ml: MediaList) = ml.impl.media_list_retain()
proc `media=`(ml: MediaList, m: Media ) = ml.media_list_set_media(m)
proc media(ml: MediaList): Media = result.impl = ml.media_list_media()
proc add(ml: MediaList, m: Media ): int = ml.media_list_add_media(m)
proc insert(ml: MediaList, m: Media, pos = 0): int = ml.media_list_insert_media(m, pos.cint)
proc remove(ml: MediaList, pos: int ): int = ml.media_list_remove_index(pos.cint)
proc count(ml: MediaList): int = ml.media_list_count()
proc `[]`(ml: MediaList, pos: int ): Media = result.impl = ml.media_list_item_at_index(pos.cint)
proc find(ml: MediaList, m: Media ): int = ml.media_list_index_of_item(m)
proc isReadonly(ml: MediaList): bool = ml.media_list_is_readonly() == 1
proc lock(ml: MediaList) = ml.media_list_lock()
proc unlock(ml: MediaList) = ml.media_list_unlock()
proc eventManager(ml: MediaList): EventManager = result = ml.media_list_event_manager()

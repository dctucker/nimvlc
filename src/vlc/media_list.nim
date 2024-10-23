#type
    #MediaTracklist = object # opaque # 4.0.0
#proc count*(mtl: MediaTracklist): uint = mtl.media_tracklist_count()
#proc at*(mtl: MediaTracklist): MediaTrack = MediaTrack(impl: mtl.media_tracklist_at(index))
#proc delete*(mtl: MediaTracklist) = mtl.media_tracklist_delete()
#proc `=destroy`(mt: var MediaTrack) = mtl.media_track_release()
#proc hold*(mtl: MediaTrack): MediaTrack = MediaTrack(impl: mt.media_track_hold())
#proc release*(mtl: MediaTrack) = mt.media_track_release()

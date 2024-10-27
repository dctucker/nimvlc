type MediaLibrary* = object
    impl: ptr media_library_t
convertImpl(MediaLibrary, media_library_t)
destroyImpl(MediaLibrary, media_library_release)
proc newMediaLibrary*(i: Instance): MediaLibrary =
    result.impl = i.media_library_new()
proc retain*(ml: MediaLibrary) =
    ml.media_library_retain()
proc load*(ml: MediaLibrary): int =
    ml.media_library_load()
proc mediaList*(ml: MediaLibrary): MediaList =
    ml.media_library_media_list()

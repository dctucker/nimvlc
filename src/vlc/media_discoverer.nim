type
    MediaDiscoverer = object
        impl: ptr media_discoverer_t
    MediaDiscovererCategory = media_discoverer_category_t
    MediaDiscovererDescriptions = ImplSeq[media_discoverer_description_t]

destroyImplSeq(MediaDiscovererDescriptions, media_discoverer_list_release)
proc listGet( i: Instance, cat: MediaDiscovererCategory): MediaDiscovererDescriptions = result.size = i.media_discoverer_list_get(cat, result.initAddr).cuint

destroyImpl(MediaDiscoverer, media_discoverer_release)
converter toBase(md: MediaDiscoverer): ptr media_discoverer_t = md.impl
converter fromBase(p: ptr media_discoverer_t): MediaDiscoverer = result.impl = p
proc newMediaDiscoverer(i: Instance, name: string): MediaDiscoverer = i.media_discoverer_new(name.cstring)
proc start(md: MediaDiscoverer): int = md.media_discoverer_start()
proc stop(md: MediaDiscoverer) = md.media_discoverer_stop()
proc mediaList(md: MediaDiscoverer): MediaList = md.media_discoverer_media_list()
proc isRunning(md: MediaDiscoverer): bool = md.media_discoverer_is_running() == 1

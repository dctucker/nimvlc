type
    MediaDiscovererCategory* {.size: sizeof(cuint).} = enum
        Devices = 0, Lan = 1,
        Podcasts = 2, Localdirs = 3
    MediaDiscoverer* = object
        impl: ptr media_discoverer_t
    MediaDiscovererDescriptions* = ImplSeq[media_discoverer_description_t]

destroyImplSeq(MediaDiscovererDescriptions, media_discoverer_list_release)
proc mediaDiscovererList*(i: Instance, cat: MediaDiscovererCategory): MediaDiscovererDescriptions = result.size = i.media_discoverer_list_get(media_discoverer_category_t(cat.ord), result.initAddr).cuint

destroyImpl(MediaDiscoverer, media_discoverer_release)
convertImpl(MediaDiscoverer, media_discoverer_t)
proc newMediaDiscoverer*(i: Instance, name: string): MediaDiscoverer = i.media_discoverer_new(name.cstring)
proc start*(md: MediaDiscoverer): int = md.media_discoverer_start()
proc stop*(md: MediaDiscoverer) = md.media_discoverer_stop()
proc mediaList*(md: MediaDiscoverer): MediaList = md.media_discoverer_media_list()
proc isRunning*(md: MediaDiscoverer): bool = md.media_discoverer_is_running() == 1

#proc newMediaDiscovererFromName*(i: Instance, name: string): MediaDiscoverer = i.media_discoverer_new_from_name(name.cstring)
#proc localizedName*(md: MediaDiscoverer): string = $md.media_discoverer_localized_name()
#proc eventManager*(md: MediaDiscoverer): EventManager = md.media_discoverer_event_manager()

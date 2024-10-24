type
    RendererFlag* {.size: sizeof(cint).} = enum
        Audio = LIBVLC_RENDERER_CAN_AUDIO
        Video = LIBVLC_RENDERER_CAN_VIDEO
    RendererFlags* = set[RendererFlag]
    RendererItem = object
        impl: ptr renderer_item_t
converter toBase*(ri: RendererItem): ptr renderer_item_t = ri.impl
converter toInt*(rf: RendererFlags): int =
    for f in rf:
        result += f.ord
converter fromInt*(x:int): RendererFlags = cast[RendererFlags](x)
destroyImpl(RendererItem, renderer_item_release)
proc hold*(ri: RendererItem): RendererItem = RendererItem(impl: ri.renderer_item_hold())
proc name*(ri: RendererItem): string = return $ri.renderer_item_name()
proc `type`*(ri: RendererItem): string = return $ri.renderer_item_type()
proc iconURI*(ri: RendererItem): string = return $ri.renderer_item_icon_uri()
proc flags*(ri: RendererItem): RendererFlags =
    return ri.renderer_item_flags().int.RendererFlags

type RdDescription = rd_description_t
type RdDescriptionList = object
    size: csize_t
    services: ptr UncheckedArray[ptr RdDescription]
iterator items*(list: RdDescriptionList): ptr RdDescription =
    if list.size > 0:
        for i in 0..list.size-1:
            yield list.services[i]
proc `=destroy`(list: var RdDescriptionList) =
    var pp_services = cast[ptr ptr rd_description_t](addr list.services)
    pp_services.renderer_discoverer_list_release(list.size)
proc len*(list: RdDescriptionList): csize_t = return list.size

type RendererDiscoverer = object
    impl: ptr renderer_discoverer_t
converter toBase*(rd: RendererDiscoverer): ptr renderer_discoverer_t = rd.impl
destroyImpl(RendererDiscoverer, renderer_discoverer_release)
proc newRendererDiscoverer*(inst: Instance, name: cstring): RendererDiscoverer =
    result.impl = inst.renderer_discoverer_new(name)
proc start*(rd: RendererDiscoverer): int = return rd.renderer_discoverer_start()
proc stop*(rd: RendererDiscoverer) = rd.renderer_discoverer_stop()
proc eventManager*(rd: RendererDiscoverer): EventManager = return rd.renderer_discoverer_event_manager()
proc list*(inst: Instance): RdDescriptionList =
    var pp_services: ptr ptr rd_description_t
    result.size = inst.renderer_discoverer_list_get(addr pp_services)
    result.services = cast[ptr UncheckedArray[ptr RdDescription]](pp_services)

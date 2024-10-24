import libvlc
include "private/platform.nim"

{.passL: "-lvlc"}
when defined(macosx):
    {.passL: "-L" & vlcLibPath.}
    {.passL: "-rpath " & vlcLibPath.}

when NimMajor == 1:
    template destroyImpl(ty, releaseFunc) =
        proc `=destroy`*(a: var ty) =
            a.impl.releaseFunc()
when NimMajor == 2:
    template destroyImpl(ty, releaseFunc) =
        proc `=destroy`*(a: ty) =
            a.impl.releaseFunc()

# libvlc instance

type Instance = object
    impl: ptr instance_t
    args: seq[string]
converter toBase*(i: Instance): ptr instance_t = i.impl
destroyImpl(Instance, instance_release)
proc newInstance*(vargs: varargs[string]): Instance =
    var argc = vargs.len()
    var argv = allocCStringArray(vargs)

    setVlcPluginPath()
    let p = instance_new(argc.cint, cast[ptr cstring](argv))
    if p == nil:
        raise newException(ValueError, "libvlc_new returned null pointer")
    result.impl = p
    deallocCStringArray(argv)

type EventManager = ptr event_manager_t

include "vlc/renderer_discoverer.nim"
include "vlc/media.nim"
include "vlc/media_player.nim"
include "vlc/media_list.nim"
#include "vlc/media_list_player.nim"
#include "vlc/media_library.nim"
#include "vlc/media_discoverer.nim"
#include "vlc/events.nim"
#include "vlc/dialog.nim"
#include "vlc/vlm.nim"

import libvlc
include "private/platform.nim"

{.passL: "-lvlc"}
when defined(macosx):
    {.passL: "-L" & vlcLibPath.}
    {.passL: "-rpath " & vlcLibPath.}

# These types have pointers that need to be freed by release individually
when NimMajor == 1:
    template destroyImpl(ty, releaseFunc) =
        proc `=destroy`*(a: var ty) =
            a.impl.releaseFunc()
when NimMajor == 2:
    template destroyImpl(ty, releaseFunc) =
        proc `=destroy`*(a: ty) =
            a.impl.releaseFunc()

# These types are sequences in which all members are alloc/dealloc'd by release
type
    ImplSeq[T] = object of RootObj
        size: cuint
        impl: ptr UncheckedArray[ptr T]
iterator items*[T](a: ImplSeq[T]): ptr T =
    if a.size > 0:
        for i in 0..a.size-1: yield a.impl[i]
proc len*[T](a: ImplSeq): cuint = return a.size
proc initAddr[T](a: ImplSeq[T]): ptr ptr ptr T = cast[ptr ptr ptr T](a.impl.addr)
proc releaseAddr[T](a: ImplSeq[T]):  ptr ptr T = cast[  ptr ptr   T](a.impl)
when NimMajor == 1:
    template destroyImplSeq(ty, releaseFunc) =
        proc `=destroy`*(a: var ty) =
            if a.size > 0: releaseFunc(a.releaseAddr, a.size)
when NimMajor == 2:
    template destroyImplSeq(ty, releaseFunc) =
        proc `=destroy`*(a: ty) =
            if a.size > 0: releaseFunc(a.releaseAddr, a.size)

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
include "vlc/media_list_player.nim"
include "vlc/media_library.nim"
include "vlc/media_discoverer.nim"
#include "vlc/events.nim"
#include "vlc/dialog.nim"
#include "vlc/vlm.nim"

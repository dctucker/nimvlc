import libvlc
include "private/platform.nim"

{.passL: "-lvlc"}
when defined(macosx):
    {.passL: "-L" & vlcLibPath.}
    {.passL: "-rpath " & vlcLibPath.}

# libvlc instance

type Instance = object
    impl: ptr instance_t
converter toBase*(i: Instance): ptr instance_t = i.impl
proc `=destroy`(i: var Instance) = i.impl.instance_release()
proc newInstance*(args: varargs[string]): Instance =
    var argc = args.len()
    var argv: ptr cstring = nil
    if argc > 0:
        let a = addr args[0]
        argv = cast[ptr cstring](a)

    setVlcPluginPath()
    let p = instance_new( args.len().cint, argv )
    if p == nil:
        raise newException(ValueError, "libvlc_new returned null pointer")
    result = Instance(impl: p)

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

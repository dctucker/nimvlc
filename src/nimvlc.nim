{.passL: "-lvlc"}
import libvlc

# libvlc instance

type Instance = distinct ptr instance_t
converter toBase*(i: Instance): ptr instance_t = cast[ptr instance_t](i)
proc `=destroy`(i: Instance) = i.instance_release()
proc newInstance*(args: varargs[string]): Instance =
    var argc = args.len()
    var p: ptr cstring = nil
    if argc > 0:
        let a = addr args[0]
        p = cast[ptr cstring](a)
    result = Instance( instance_new( args.len().cint, p ) )

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

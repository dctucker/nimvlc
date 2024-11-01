# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest

import nimvlc
import libvlc

test "can create new instance":
    var inst = newInstance("--")
    assert Meta.Title.ord == 0

test "renderer flags convert to/from int":
    let a = {Audio,Video}
    assert a.int == 3
    let b = 3.RendererFlags
    assert Audio in b
    assert Video in b

test "callback definition":
    const cbk1 = nil.newCallback do (event: Event, data: pointer):
        assert event.kind == EventType.MediaMetaChanged
    var ev: libvlc.struct_event_t
    ev.type_field = EventType.MediaStateChanged.cint
    var e = ev.addr.fromBase
    check:
        e.new_state() == State.NothingSpecial
    expect FieldDefect:
        discard e.new_time()

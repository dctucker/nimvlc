# This is just an example to get you started. You may wish to put all of your
# tests into a single file, or separate them into multiple `test1`, `test2`
# etc. files (better names are recommended, just make sure the name starts with
# the letter 't').
#
# To run these tests, simply execute `nimble test`.

import unittest
import std/sequtils
import std/enumutils

import nimvlc
import libvlc

test "can create new instance":
    var inst = newInstance("--")
    assert Meta.Title.ord == 0

test "renderer flags convert to/from int":
    let a = {RendererFlag.Audio, RendererFlag.Video}
    assert a.int == 3
    let b = 3.RendererFlags
    assert RendererFlag.Audio in b
    assert RendererFlag.Video in b

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

template assertSameValues(e1, e2: typed) =
    let v = zip(e1.toSeq, e2.toSeq)
    for (a,b) in v:
        assert a.ord == b.ord, $e1 & " is not compatible with " & $e2
test "enum libvlc/nimvlc compatibility":
    template assertSameRange(a,b: typed) =
        assert a.low.ord == b.low.ord
        assert a.high.ord == b.high.ord

    assertSameValues EventType, enum_event_e
    assertSameValues QuestionType, enum_dialog_question_type
    assertSameValues MediaDiscovererCategory, media_discoverer_category_t

#test "attach callback to object":
#    var inst = newInstance()
#    var mp = inst.newMediaPlayer()
#    let handler1 = mp.attach(MediaFreed, proc(e: Event, p: pointer) =
#        echo $e.kind
#    )
#    handler1.detach()

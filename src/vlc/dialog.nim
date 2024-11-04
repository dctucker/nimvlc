type
    QuestionType* = enum
        Normal = 0,
        Warning = 1,
        Critical = 2
    DialogCallbacks* {.pure, inheritable, bycopy.} = object
        displayError*:    proc(data: pointer, title: string; text: string)
        displayLogin*:    proc(data: pointer, id: DialogId, title: string, text: string, a4: string, a5: bool)
        displayQuestion*: proc(data: pointer, id: DialogId, title: string, text: string, qt: QuestionType, cancel: string, action1: string, action2: string)
        displayProgress*: proc(data: pointer, id: DialogId, title: string, text: string, a4: bool; a5: float, a6: string)
        cancel*:          proc(data: pointer, id: DialogId)
        updateProgress*:  proc(data: pointer, id: DialogId, pos: float, text: string)
    DialogId* = object
        impl: ptr dialog_id
convertImpl(DialogId, dialog_id)
proc convertDialogCallbacks*(cbs: DialogCallbacks): dialog_cbs =
    result = dialog_cbs(
        pf_display_error:    proc(data: pointer, title: cstring, text: cstring) {.cdecl.} =
            cbs.displayError(data, $title, $text),
        pf_display_login:    proc(data: pointer, id: ptr dialog_id, title: cstring, text: cstring, username: cstring, ask_store: bool) {.cdecl.} =
            cbs.displayLogin(data, id, $title, $text, $username, ask_store),
        pf_display_question: proc(data: pointer, id: ptr dialog_id, title: cstring, text: cstring, qt: dialog_question_type, cancel: cstring, action1: cstring, action2: cstring) {.cdecl.} =
            cbs.displayQuestion(data, id, $title, $text, QuestionType(qt.ord), $cancel, $action1, $action2),
        pf_display_progress: proc(data: pointer, id: ptr dialog_id, title: cstring, text: cstring, indeterminate: bool, pos: cfloat, cancel: cstring) {.cdecl.} =
            cbs.displayProgress(data, id, $title, $text, indeterminate, pos.float, $cancel),
        pf_cancel:           proc(data: pointer, id: ptr dialog_id) {.cdecl.} =
            cbs.cancel(data, id),
        pf_update_progress:  proc(data: pointer, id: ptr dialog_id, pos: cfloat, text: cstring) {.cdecl.} =
            cbs.updateProgress(data, id, pos.float, $text),
    )
proc setCallbacks*(i: Instance, dcb: DialogCallbacks, data: pointer) =
    var cbs = convertDialogCallbacks(dcb)
    libvlc.dialog_set_callbacks(i, cbs.addr, data)
proc `context=`*(id: DialogId, ctx: pointer) =
    libvlc.dialog_set_context(id, ctx)
proc context*(id: DialogId): pointer =
    libvlc.dialog_get_context(id)
proc postLogin*(id: DialogId, username: string, password: string, store: bool): int =
    libvlc.dialog_post_login(id, username, password, store)
proc postAction*(id: DialogId, action: int): int =
    libvlc.dialog_post_action(id, action.cint)
proc dismiss*(id: DialogId): int =
    libvlc.dialog_dismiss(id)

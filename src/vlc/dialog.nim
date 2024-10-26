type
    QuestionType = enum_dialog_question_type
    DialogCbs = object
        impl: ptr dialog_cbs
    DialogId = object
        impl: ptr dialog_id
convertImpl(DialogId, dialog_id)
convertImpl(DialogCbs, dialog_cbs)
proc setCallbacks(i: Instance, cbs: DialogCbs, data: pointer) =
    libvlc.dialog_set_callbacks(i, cbs, data)
proc `context=`(id: DialogId, ctx: pointer) = libvlc.dialog_set_context(id, ctx)
proc context(id: DialogId): pointer = libvlc.dialog_get_context(id)
proc postLogin(id: DialogId, username: string, password: string, store: bool): int = libvlc.dialog_post_login(id, username, password, store)
proc postAction(id: DialogId, action: int): int = libvlc.dialog_post_action(id, action.cint)
proc dismiss(id: DialogId): int = libvlc.dialog_dismiss(id)

type
    Meta* {.pure.} = meta_t
    Media = object
        impl: ptr media_t
    MediaOpenCb*  = proc (opaque: pointer; datap: ptr pointer; sizep: ptr uint64): cint {.cdecl.}
    MediaReadCb*  = proc (opaque: pointer; buf: ptr uint8; len: csize_t): ssize_t {.cdecl.}
    MediaSeekCb*  = proc (opaque: pointer; offset: uint64): cint {.cdecl.}
    MediaCloseCb* = proc (opaque: pointer): void {.cdecl.}
converter toBase*(m: Media): ptr media_t = m.impl
proc `=destroy`(m: var Media) = m.impl.media_release()
proc newMediaLocation*(i: var Instance, arg: string): Media = result.impl = i.media_new_location(arg)
proc newMediaPath*(i: var Instance, arg: string): Media = result.impl = i.media_new_path(arg)
proc newMediaFd*(i: var Instance, arg: cint): Media = result.impl = i.media_new_fd(arg)
proc newMediaCallbacks*(i: var Instance, open: MediaOpenCb, read: MediaReadCb,
        seek: MediaSeekCb, close: MediaCloseCb, opaque: pointer): Media =
    result.impl = i.media_new_callbacks(open, read, seek, close, opaque)

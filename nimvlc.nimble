# Package

version       = "0.1.0"
author        = "nimvlc"
description   = "Nim wrapper for libvlc"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.6" # or lower maybe

task examples, "examples":
    exec "nim c examples/tutorial.nim"

task futhark, "futhark":
    exec "nim c -d:useFuthark -d:futharkRebuild src/nimvlc.nim"

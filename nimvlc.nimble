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

task copyIncludes, "copyIncludes":
    rmDir("include")
    mkDir("include")
    let srcdir = getEnv("INCLUDE", "/usr/include")
    cpDir(srcdir & "/vlc", "include/vlc")

task futhark, "futhark":
    exec "nim c -c -d:useFuthark -d:futharkRebuild -d:nodeclguards src/gen.nim"

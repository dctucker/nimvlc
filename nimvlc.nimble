# Package

version       = "0.1.0"
author        = "nimvlc"
description   = "Nim wrapper for libvlc"
license       = "MIT"
srcDir        = "src"

# Dependencies

requires "nim >= 1.6.6" # or lower maybe

# Tasks

include "src/private/platform.nim"

task examples, "examples":
    exec "nim c examples/tutorial.nim"

task copyIncludes, "copyIncludes":
    rmDir("include")
    mkDir("include")
    const srcdir = vlcLibPath & "/../include"
    cpDir(srcdir & "/vlc", "include/vlc")

task futhark, "futhark":
    const arg = futharkCompilerArgs($getCurrentDir())
    exec "nim c " & arg & " -c -d:useFuthark -d:futharkRebuild -d:nodeclguards src/gen.nim"
    echo "post-processing"
    var source = readFile("src/libvlc-new.nim")
    let a = "{.size: sizeof(cuint).} = enum"
    let b = "{.size: sizeof(cuint), pure.} = enum"
    source = source.replace(a, b)
    writeFile("src/libvlc.nim", source)
    rmFile("src/libvlc-new.nim")


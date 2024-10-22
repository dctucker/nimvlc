import std/envvars
const vlcLibPath {.strdefine.}: string = when defined(macosx):
    "/Applications/VLC.app/Contents/MacOS/lib"
else:
    getEnv("VLCLIBDIR", "/usr/lib")

when defined(useFuthark):
    const vlcIncludePath {.strdefine.}: string = "./include"
    const sysIncludePath {.strdefine.}: string = ""

proc futharkCompilerArgs(pwd: string): string =
    when defined(macosx):
        let sdk = "/Library/Developer/CommandLineTools/SDKs/MacOSX14.sdk"
        result = "-d:vlcIncludePath=" & pwd & "/include"
        result = result & " -d:sysIncludePath:" & sdk & "/usr/include"

# libvlc instance
proc setVlcPluginPath() =
    when defined(macosx):
      if not existsEnv("VLC_PLUGIN_PATH"):
          putEnv("VLC_PLUGIN_PATH", vlcLibPath & "/../plugins")

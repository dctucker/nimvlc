# nimvlc

It's a wrapper library for libVLC. C bindings generated using [futhark](https://github.com/PMunch/futhark) and then manually edited a bit to deduplicate. Nim wrapper to facilitate writing idiomatic code.

## Usage

```
import nimvlc

var inst = nimvlc.newInstance()
```

You shouldn't have to worry about freeing resources since this is taken care of by `=destroy` when the variable goes out of scope.

## Examples

[examples/tutorial.nim] is based off of tutorial code available on [VideoLAN's Wiki](https://wiki.videolan.org/LibVLC_Tutorial/).


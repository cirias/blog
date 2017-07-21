+++
categories = ["Blog"]
date = "2016-06-20T14:17:24+08:00"
draft = false
slug = ""
title = "go profiling"

+++

Memo for how to profile go program.

### Modify Code

Use this package: https://github.com/pkg/profile.

Follow the instructions of the package above:

```golang
import "github.com/pkg/profile"

func main() {
    defer profile.Start().Stop()
    ...
}
```


To change profile saving path, use `profile.ProfilePath(".")` as start option.

For example:

```golang
defer profile.Start(profile.ProfilePath(".")).Stop()
```

### Run

Build and execute the binary.


### Analysis

```bash
go tool pprof <path_of_binary_file> <path_of_profile_file>
# To list the top 20 costest functions
> top20
# Show nodes graph with web browser
> web
```

For more `pprof` usage, see http://goog-perftools.sourceforge.net/doc/cpu_profiler.html

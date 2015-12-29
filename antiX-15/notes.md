For enable control GPU FAN speed on NVIDA video cards with NVIDIA driver
add this line

```option         "Coolbits" "4"```

into section

```Section "Screen"```

example:
```
Section "Screen"
    Identifier     "Screen0"
    Device         "Device0"
    Monitor        "Monitor0"
    DefaultDepth    24
    Option         "Coolbits" "4"
    SubSection     "Display"
        Depth       24
    EndSubSection
EndSection
```

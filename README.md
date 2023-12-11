# blinkstick-java-hid4java-poc

I was unable to use arvydas' `blinkstick-processing` to control my blinkstick.
I found that the hidapi library was unable to find BlinkSticks.  With a little
bit of work, I was able to get the blinkstick working with gary-rowe's
`hid4java` library.

Compile the example with
```
./build.sh
```

And run with
```
./run.sh
```

(You may need to run as root.)

This example will set the first led to white. It has been tested on a
blinkstick strip.  The command to control an LED on a different product might
be different--I don't have other BlinkStick products to test with.

Development work on `hid4java` appears to have stopped.  It might be prudent to
investigate other java-hid libraries before committing to `hid4java`. However,
the library is sufficient for my needs.


# My Perfectionist VR Setup
I'm a particular person in reality, so it stands to reason I would be about VR as well. This is a comprehensive guide to my VR setup, including some descriptions of how things work and why some things don't.

## PC Hardware 
While much of this guide is centered around software, we need to first talk about the hardware that goes into your PC. [PC Part Picker](https://pcpartpicker.com/) is essential in making sure that all of your choices are compatible, so I'd recommend you use it (or something similar).

### Graphics Card
Since we're going for the best here, we're going to need the best graphics card. I opt for the top of the line consumer-grade card. For the past decade, that's meant NVIDIA. The 1080 Ti, 2080 Ti, 3090, etc. You can probably get away with whatever the flagship model is for a much better price/performance ratio, but that's not what I'm going for here. Keep in mind that a disturbing amount of VRAM can be relevant in VR; some benchmarks show up to 17GB being used on a Reverb G2 (two 2160x2160 displays) in Half Life: Alyx. 

To figure out what the top of the line is at this moment, look at benchmarks from [Gamers Nexus](https://www.youtube.com/user/GamersNexus). They are the most scientific and methodical players in town.

### Everything else
Your processor, motherboard, RAM, storage, power supply, case, and cooling system should simply be sufficient enough not to bottleneck your graphics card (you can use [this tool](https://pc-builds.com/calculator/) for checking if your CPU causes a bottleneck). This goes for VR gaming just like PC gaming in general. I opt for whatever processor currently has the highest single threaded performance (again, check Gamers Nexus), whatever motherboard is reasonably priced and won't hold me back when overclocking, etc. I'll post a separate guide later on how I choose my components.

My first build from April 2019 can be found [here](https://pcpartpicker.com/user/monstermac77/saved/), if you're interested. 

## VR Hardware

For the best VR experience, you have to use a headset that is tethered to your powerful gaming PC (PCVR). The standalone VR headsets do have some marked advantages over PCVR. But because they will always have the limitation of needing to mount to your head without breaking your neck, they will never be able to match the fidelity of a dedidcated 30 pound computer sitting on your floor.

Since the best headset in a given year might not have the best controllers, getting the best experience may not mean just buying whatever one company is selling. This is where [Mixed VR](https://www.reddit.com/r/MixedVR/) comes into play, since you may have to configure your headset from one company (e.g. Reverb G2 from HP) which relies on one set of tracking hardware/software (visible light/Windows Mixed Reality) to work with your controllers from another company (e.g Knuckles Controllers from Valve) that use another set of tracking hardware/software (infrared light/SteamVR).

### Headset

When choosing a headset, or head-mounted display (HMD), I optimize for photorealism, then visual immersion. Defining these terms is easiest by example:

* Photorealism:
  * Suppose you could alter any HMD to alternate between displaying what's on the panels, and simply showing what's in front of the viewer in reality (matching any losses in peripheral vision). Also suppose you could perfectly capture a 3D space and all lighting in a computer model in real-time. Then, say every 30 seconds, you randomly changed the HMD to display either reality or this 3D space. Each time, you ask the person to look around and guess whether they are seeing reality or a virtual reality. If their correct guess rate converges to 50% as the samples tend to infinity, then full photorealism has been achieved.
* Visual Immersion: 
  * This is effectively Field of View (FoV), which is how much of your peripheral vision (both vertical and horizontal) is not obscured by the HMD. A headset has achieved full visual immersion when a user cannot detect any obstruction to their vision due to the housing or optics in the HMD. A test similar to the one described above could also be designed.

It's important to note that there are ergonomic factors that affect a given HMD's ability to achieve photorealism and visual immersion. This means that a headset that achieves photorealism and visual immersion for one person may fail to do so for another. The most important ergonomic factor is interpupillary distance (IPD), which is simply the distance between the center of the pupils of someone's eyes (the average IPD is 64mm for adult men and 62mm for adult women, with 1st and 99th percentile values at about 54mm and 72mm respectively). The IPD that an HMD was tuned to accomodate can have an impact on both photorealism (e.g. objects appearing blurry) and visual immersion (reduced FoV) if one's IPD does not fall within a couple milimeters of the tuned value. The second is face shape, which includes things like the width of one's face, the specific contours, nose length, etc. The face gasket of an HMD may be better suited for certain face shapes, negatively impacting  visual immersion of others. Certain headsets offer flexibility (via adjustable IPD sliders, interchangeable face gaskets, or face gaskets with more pliability via compressable foam) as features which maximize their photorealism and visual immersion for as large a segment of the population possible.

#### Photorealism

Tragically, there's no objective measure for photorealism. It's a combination of many factors, some of which aren't quantifiable at all or aren't easily comparable between different HMDs. The best one can do is read reviews by trusted reviewers of VR. That said, given ergonomics play a non-trivial role, there's no substitue for trying the HMDs first-face. Here are some of the most notable factors:
* Angular pixel density (also known as pixels per degree)
  * An estimate for this value can be determined by both the resolution of the display(s) inside the HMD as well as the FoV afforded by the optics, as described [here](https://www.roadtovr.com/understanding-pixel-density-retinal-resolution-and-why-its-important-for-vr-and-ar-headsets/). It's important to note, however, that because optical systems vary from HMD to HMD, it's not technically accurate to compare based on this metric. For instance, utilization of the panel can vary across HMDs (that is, the panel may be 2160p (horizontal), but perhaps only light from 1960p actually makes it into the optics and to the retina).
* Optics
  * This is even harder to quantify and compare across HMDs, but issues with optics quality can result in artifacts that detract from photorealism, such as chromatic abberation, god rays, TODO, etc. TODO: elaborate a lot here and do more research, discuss fresnel lenses, etc.
* Contrast ratio 
  * This refers essentially to the brightness range of the display. This is a quantifiable metric that can be compared across HMDs (although the fact that the light passes through different optics could complicate this). Often the display type is a driving factor here (LCD, OLED, etc.). An LCD display requires a backlight that is always emitting light when the display is on. This reduces the peak low brightness from a pitch black to a blackish-gray, because the [LCD filters](https://www.youtube.com/watch?v=jiejNAUwcQ8) aren't able to fully block out the white light from the backlight. Reducing the brightness of the LCD backlight helps achieve darker blacks, but then of course that in turn reduces the brightest whites, thus having a net-zero effect on contrast ratio. This trade-off can be mitigated with what are called "local dimming zones", where the backlight is broken into independently controlled quadrants so that scenes with both dark and light areas (like a lantern in a cave) can achieve a lower backlight for the dark part of the scene, but and a high backlight for the lit part of the scene. A key difference with OLEDs is they usually achieve much higher contrast ratios as no backlight is required. This is because each pixel is can self-emit light when it needs to (in order words, OLEDs are essentially LCDs where each pixel is its own local dimming zone). Much more about how LCD and OLED displays work and how their qualities may impact photorealism can be found from another very thorough reviewer, [HDTVTest](https://www.youtube.com/c/hdtvtest/videos).
* Color gamut
  * A human eye can percieve electromagnetic radiation with wavelengths ranging from 380nm to 750nm. We percieve each wavelength as a different color. Thus, this range of wavelengths is referred to the "visible spectrum". The color gamut of a display refers to the range of this visible spectrum that can be produced by the display. The "wider" the color gamut, the more possible colors can be reproduced with the display. A display can be called "HDR" when it has simply met certain agreed upon standards for both contrast ratio and color gamut. A fully photorealistic display would be able to reproduce the entire visible spectrum.
* Refresh rate
  * The video feed seen in VR and on any display is simply a stream of images (each one called a "frame") displayed in rapid succession. Refresh rate refers to how many times per second the image on the display is refreshed. Fast motion of an object on displays with low refresh rates looks "choppy" as it appears as though the object instantaneously "jumps" from one frame to the next. Most modern TVs and computers monitors refresh 60 times per second (60Hz). Although, 60Hz in VR induces motion sickness in some, so higher refresh rates are usually used. Humans may be able to percieve up to [500Hz in some conditions](https://www.nature.com/articles/srep07861), although more study is needed.
* Display persistence
  * This refers to the length of time each frame is displayed to the viewer. The tendency is to think that this would be the inverse of the refresh rate (e.g. 1/60th of a second for a 60Hz display), however that isn't always the case. Displays may show the frame for only a fraction of the 1/60th of a second their refresh rate would deem, inserting a black frame (known as "black frame insertion") until the next frame is displayed. One side effect of black frame insertion is that it makes the image appear darker, since our retinas sort of average the brightness of a spot in space over a period of time, and the black frame brings that average down, so in order to reduce display persistance you have to compensate by increasing the brightness with which each frame is flashed, which requires more power draw. All of this black frame insertion is done to reduce motion blur, which is important when the viewer is in motion and very relevant in VR. 
* TODO: add any other especially [relevant terms](https://xinreality.com/wiki/Category:Terms).

#### Visual immersion
This almost directly corresponds to Field of View (FoV). Humans have slightly over 210 degrees of horizontal FoV and 150 degrees of vertical FoV. 

### Controllers


### Tracking 
I've used all three major tracking systems: lighthouse (Valve/Vive), infrared light (Oculus), and visible light (Windows Mixed Reality). 

## Platform choice
I've used all three major 

## Matching physical space

## Game cross compatability

## Perfecting Icons/Artwork for non-Steam games in SteamVR

Known issue: Google Earth https://github.com/ValveSoftware/openvr/issues/1421

## Start-up/Shutdown 

Known issue: Bluetooth in SteamVR https://www.reddit.com/r/MixedVR/comments/jz967q/unable_to_auto_shutdown_basestations_via_steamvr/

A collection of misc scripts/tools that I've written to manage using devices from different ecosystems (e.g. Valve and WMR) at the same time

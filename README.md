# My Perfectionist VR Setup
I'm a particular person in reality, so it stands to reason I would be about VR as well. This is a comprehensive guide to my VR setup, including some descriptions of how things work and why some things don't.

## PC Hardware 
While much of this guide is centered around software, we need to first talk about the hardware that goes into your PC. [PC Part Picker](https://pcpartpicker.com/) is essential in making sure that all of your choices are compatible, so I'd recommend you use it (or something similar).

### Graphics Card
Since we're going for the best here, we're going to need the best graphics card. I opt for the top of the line consumer-grade card. For the past decade, that's meant NVIDIA. The 1080 Ti, 2080 Ti, 3090, etc. You can probably get away with whatever the flagship model is for a much better price/performance ratio, but that's not what I'm going for here. Keep in mind that a disturbing amount of VRAM can be relevant in VR; some benchmarks show up to 17GB being used on a Reverb G2 (two 2160x2160 displays) in Half Life: Alyx. 

To figure out what the top of the line is at this moment, look at benchmarks from [Gamers Nexus](https://www.youtube.com/user/GamersNexus). They are the most scientific and methodical players in town.

### Everything else
Your processor, motherboard, RAM, storage, power supply, case, and cooling system should simply be sufficient enough not to bottleneck your graphics card (you can use [this tool](https://pc-builds.com/calculator/) for checking your CPU). This goes for VR gaming just like PC gaming in general. I opt for whatever processor currently has the highest single threaded clock speed (again, check Gamers Nexus), whatever motherboard is reasonably priced and won't hold me back when overclocking, etc. I'll post a separate guide later on how I choose my components.

My first build from April 2019 can be found [here](https://pcpartpicker.com/user/monstermac77/saved/), if you're interested. 

## VR Hardware

For the best VR experience, you have to use a headset that is tethered to your powerful gaming PC (PCVR). The standalone VR headsets do have some marked advantages over PCVR. But because they will always have the limitation of needing to mount to your head without breaking your neck, they will never be able to match the fidelity of a dedidcated 30 pound computer sitting on your floor.

Since the best headset in a given year might not have the best controllers, getting the best experience may not mean just buying whatever one company (usually Valve) is selling. This is where [Mixed VR](https://www.reddit.com/r/MixedVR/) comes into play, since you may have to configure your headset from one company (e.g. Reverb G2 from HP) which relies on one set of tracking hardware/software (visible light/Windows Mixed Reality) to work with your controllers from another company (e.g Knuckles Controllers from Valve) that use another set of tracking hardware/software (infrared light/SteamVR).

### Headset

When choosing a headset, or head-mounted display (HMD), I optimize for photorealism, then visual immersion. Defining these terms is easiest by example. 

* Photorealism: suppose you could alter any HMD to alternate between displaying what's on the panels behind the lenses to a user, and simply showing the user what's in front of them in reality (matching any losses in peripheral vision). Also suppose you could perfectly capture a 3D space and all lighting in a computer model in real-time. Then, say every 30 seconds, you alternated at random the HMD to display reality or this 3D space and asked the person to use their eyes and look around and guess whether they are seeing reality or a virtual reality. If their correct guess rate converges to 50% as the samples tend to infinity, then full photorealism has been achieved.
* Visual Immersion: this is effectively Field of View (FoV), which is how much of your peripheral vision (both vertical and horizontal) is not obscured by the HMD. A headset has achieved full visual immersion when a user cannot detect any obstruction to their view due to the HMD. A test similar to the one described above could also be designed.

#### Photorealism

Tragically, there's no objective measure for photorealism. It's a combination of many factors, some of which aren't quantifiable or aren't easily comparable between different HMDs. The best one can do is read trusted reviews by trusted reviewers of VR, or trying the HMDs first-hand. Here are some of the most notable factors:
* Angular pixel density
  * This is effectively determined by both the resolution of the display(s) inside the HMD as well as the FoV afforded by the optics.
* Optical quality

* Contrast ratio 
  * This refers essentially to the range of the display. Usually the display type is a driving factor here (LCD, OLED, etc.)
* Color gamut
* Refresh rate
* 

#### Visual immersion

This almost directly corresponds to Field of View (FoV). Humans have slightly over 210 degrees of horizontal FoV and 150 degrees of vertical FoV. 

### Controllers
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

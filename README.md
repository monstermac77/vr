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

When choosing a headset (HMD), I optimize for photorealism, then immersion. Defining these terms is easiest by example. 

* Photorealism: suppose you could alter any HMD to alternate between displaying what's on the panels behind the lenses to a user, and simply showing the user what's in front of them in reality (matching any loss in peripheral vision). Then, say every 30 seconds, you were ask someone wearing this display to close and re-open their eyes and look around without moving their head. If their guess rate for whether they were seeing reality, or the virtual reality that was displayed by capturing their environment in 3D and displaying it on the HMD's screen, converges to 50% as the samples tend to infinity, then photorealism has been achieved.
* Immersion: 

#### Photorealism

Tragically, there's no objective measure for photorealism. It's a combination of many factors, some of which aren't quantifiable or aren't easily comparable between different HMDs. A primary component is angular pixel density. 

#### Immersion

This almost directly corresponds to Field of View (FoV).

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

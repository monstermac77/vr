# A Perfectionist's VR Setup
I'm a particular person in reality, so it stands to reason I would be about VR as well. This is a comprehensive guide to my VR setup, including some descriptions of how things work and why some things don't.

## PC Hardware 
While much of this guide is centered around software, we need to first talk about the hardware that goes into your PC. [PC Part Picker](https://pcpartpicker.com/) is essential in making sure that all of your choices are compatible, so I'd recommend you use it (or something similar).

### Graphics Card
Since we're going for the best here, we're going to need the best graphics card. I opt for the top of the line consumer-grade card. For the past decade, that's meant NVIDIA. The 1080 Ti, 2080 Ti, 3090, etc. You can probably get away with whatever the flagship model is for a much better price/performance ratio, but that's not what I'm going for here. Keep in mind that a disturbing amount of VRAM can be relevant in VR; some benchmarks show up to 17GB being used on a Reverb G2 (two 2160x2160 displays) in Half Life: Alyx. 

To figure out what the top of the line is at this moment, look at benchmarks from [Gamers Nexus](https://www.youtube.com/user/GamersNexus). They are the most scientific and methodical players in town.

### Everything else
Your processor, motherboard, RAM, storage, power supply, case, and cooling system should simply be sufficient enough not to bottleneck your graphics card (you can use [this tool](https://pc-builds.com/calculator/) for checking if your CPU causes a bottleneck). This goes for VR gaming just like PC gaming in general. I opt for whatever processor currently has the highest single threaded performance (again, check Gamers Nexus), whatever motherboard is reasonably priced and won't hold me back when overclocking, etc. I'll post a separate guide later on how I choose my components (TODO).

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
  * This is even harder to quantify and compare across HMDs, but issues with optics quality can result in artifacts that detract from photorealism, such as chromatic abberation, god rays, TODO, etc. TODO: elaborate a lot here and do more research, discuss fresnel lenses, sweet spot, etc.
* Contrast ratio 
  * This refers essentially to the brightness range of the display. This is a quantifiable metric that can be compared across HMDs (although the fact that the light passes through different optics could complicate this). Often the display type is a driving factor here (LCD, OLED, etc.). An LCD display requires a backlight that is always emitting light when the display is on. This reduces the peak low brightness from a pitch black to a blackish-gray, because the [LCD filters](https://www.youtube.com/watch?v=jiejNAUwcQ8) aren't able to fully block out the white light from the backlight. Reducing the brightness of the LCD backlight helps achieve darker blacks, but then of course that in turn reduces the brightest whites, thus having a net-zero effect on contrast ratio. This trade-off can be mitigated with what are called "local dimming zones", where the backlight is broken into independently controlled quadrants so that scenes with both dark and light areas (like a lantern in a cave) can achieve a lower backlight for the dark part of the scene, but and a high backlight for the lit part of the scene. A key difference with OLEDs is they usually achieve much higher contrast ratios as no backlight is required. This is because each pixel is can self-emit light when it needs to (in order words, OLEDs are essentially LCDs where each pixel is its own local dimming zone). Much more about how LCD and OLED displays work and how their qualities may impact photorealism can be found from another very thorough reviewer, [HDTVTest](https://www.youtube.com/c/hdtvtest/videos).
* Color gamut
  * A human eye can percieve electromagnetic radiation with wavelengths ranging from 380nm to 750nm. We percieve each wavelength as a different color. Thus, this range of wavelengths is referred to the "visible spectrum". The color gamut of a display refers to the range of this visible spectrum that can be produced by the display. The "wider" the color gamut, the more possible colors can be reproduced with the display. A display can be called "HDR" when it has simply met certain agreed upon standards for both contrast ratio and color gamut. Note that a display may not actually need to be able to reproduce the entire visible spectrum, in order to pass the photorealism test. 
* Refresh rate
  * The video feed seen in VR and on any display is simply a stream of images (each one called a "frame") displayed in rapid succession. Refresh rate refers to how many times per second the image on the display is refreshed. Fast motion of an object on displays with low refresh rates looks "choppy" as it appears as though the object instantaneously "jumps" from one frame to the next. Most modern TVs and computers monitors refresh 60 times per second (60Hz). Although, 60Hz in VR induces motion sickness in some, so higher refresh rates are usually used. Humans may be able to percieve up to [500Hz in some conditions](https://www.nature.com/articles/srep07861), although more study is needed.
* Display persistence
  * This refers to the length of time each frame is displayed to the viewer. The tendency is to think that this would be the inverse of the refresh rate (e.g. 1/60th of a second for a 60Hz display), however that isn't always the case. Displays may show the frame for only a fraction of the 1/60th of a second their refresh rate would deem, inserting a black frame (known as "black frame insertion") until the next frame is displayed. One side effect of black frame insertion is that it makes the image appear darker, since our retinas sort of average the brightness of a spot in space over a period of time, and the black frame brings that average down, so in order to reduce display persistance you have to compensate by increasing the brightness with which each frame is flashed, which requires more power draw. All of this black frame insertion is done to reduce motion blur, which is important when the viewer is in motion and very relevant in VR. Similar to how your retinas average the brightness of a spot in space over a period of time, they also average the color they see. When the display persistence is high and you move your eyes during a frame, the colors sensed by your eye as it pivots blend together to create blur (TODO: figure out if I have this right). This is similar to the motion blur effect achieved by a camera which its exposure set to "long" (usually the camera is stationary, but in the case of VR the camera is your retina and it's your retina that's actually in motion).
* TODO: add any other especially [relevant terms](https://xinreality.com/wiki/Category:Terms).

#### Visual immersion
This almost directly corresponds to the HMD's Field of View (FoV). Humans have slightly over 210 degrees of horizontal FoV and 150 degrees of vertical FoV, although this may vary based on each person's IPD. This is a much easier bar to meet than photorealism: an HMD that is able to match our FoV will have achieved full visual immersion.

### Controllers
There are a few criteria that can be used when judging controllers: 
* Build quality
  * It's unpleasant to hold creaky or noticeably cheap plastic in your hand. Buttons should be satisfying to actuate.
* Intuitiveness
  * When in-game, there should not be ambiguity as to what button or grip needs to be used. Buttons should be within reach for most hand sizes.
* Haptics
  * When interacting with objects in VR, it's critical to receive tactile feedback to provide the sensation that the user's physical space matches their visual space. Controllers do this via small motors that vibrate to provide feedback. These haptics should feel commensurate with the action performed, not overly muted or buzzy.

As of this writing, the Valve Knuckles controllers are without equal on nearly all of these fronts, and offer even more benefits (individual finger tracking, recharging over USB-C, allowing an open-hand without dropping the controllers). In-game when gripping objects, I've struggled with both Windows Mixed Reality (WMR) and Oculus controllers as my reflex is split between clicking the grip button and pulling the trigger button. 

### Tracking 
Tracking technology is what's responsible for adjusting your position in virtual reality to match your movements in the physical world. Software and hardware work together to accomplish this. 

There are multiple hardware sensors that are used for tracking: 
* Gyroscope
* Accelerometer

A gyroscope is a device that's used to establish a device's orientation, and an accelerometer is used to [determine a device's acceleration](https://www.youtube.com/watch?v=KZVgKu6v808). Given a known starting point, one could theroretically trace the position over time of an object using simply precise measurements of acceleration and orientation. However, to do precision limitations of these devices, the controllers and HMD would quickly "flyaway" to infinity in a matter of seconds. Thus, an extra reference point is needed to error correct this data. TODO: improve this section, this is going off of memory and I can't remember where it's frome.

There are currently two mediums that are used for error-correction in tracking: 
* Visible light
* Infrared light (IR)

Although different hardware may use the same medium, their application of that medium may differ drastically: 
* Some HMDs use cameras placed on the HMD to identify landmarks in physical space (such as the corner of a door, or the edge of a carpet) to create a 3D map of landmarks (via physical light). As the user moves around in physical space, software is used to calculate the user's position in physical space based on what the cameras can see. These calculations are then translated to movement in virtual space. This is known as "inside-out tracking", which uses a Simultaneous Location And Mapping (SLAM) algorithm to determine position.
* Some controllers emit visible light from the controllers. The cameras on the HMD then track this visual light to calculate the controllers' position relative to the HMD, and therefore can infer its position in physical space. 
* Some controllers emit infrared light from the controllers. The cameras on the HMD then track this infrared light in the same way the HMDs track controllers using visible light above. 
* Some systems use extra devices called Lighthouses or Basestations. These devices remain stationary in the room at all times and do not communicate with your computer, HMD, or controllers. Much like actual lighthouses, these devices simply emit sweeping beams of IR at regular intervals across your room. Controllers and HMDs tracked by this method are scattered with small openings in the casing that allow the IR to penetrate and hit IR photodiodes (sensors that are sensitive to IR light) embedded into the device. By measuring the time between activations of these photodiodes, the device's position and orientation in space can be deduced with trivial calculation.

There is plenty of [good discussion](https://venturebeat.com/2019/05/05/how-virtual-reality-positional-tracking-works/) comparing tracking mechanisms, but I do want to highlight one very troubling downside to a visible light approach to track both the HMD and controllers in the same setup: since too much environmental light means the HMD will not be able to accurately track the position of the controllers, but too little environmental light means that the HMD will not be able to identify landmarks in physical space, environmental lighting must be controllable in both directions to achieve acceptable tracking; this is a downside that no other method experiences.

## Platform choice
Like much of the PC gaming industry, each hardware manufacturer forces use of their own software (e.g. Windows Mixed Reality Portal, SteamVR, etc) for setting up, configuring, and using their HMDs. This is unfortunate. However, Valve was kind enough to establish and push the industry to adopt their open SDK, called [OpenVR](https://github.com/ValveSoftware/openvr). As of this writing, nearly every VR software is built on top of this SDK. This allows for the portability we enjoy today, such as being able to launch an Oculus exclusive game from SteamVR, or play a game made for Windows Mixed Reality on an HMD created by Valve. 

I have found Valve's SteamVR to be the perfect balance of simplicity, customizeability, community adoption, and ongoing support to accomodate my VR setup.

## Matching physical space

I find it helpful to match my virtual space with my physical space in SteamVR Home. This way, when I want to sit on my couch in physical space, I can simply find my virtual couch and walk toward it. 

The first thing you should do is setup your chaperone bounds to exactly match your physical space. Chaperone bounds are essentially restrictions you self-impose in VR space to prevent you from running into physical walls when in VR. Use SteamVR's room setup to start, but for fine tune adjustments, you'll need to use [Chaperone Tweak](https://github.com/Xavr0k/ChaperoneTweak). 

The next thing you'll want to do is use SteamVR Home's menus to create your physical space in VR. I used the white side of refridgerators stacked high to create the white walls of my room. As you're building, you should work at the very edge of your chaperone bounds to determine exactly where the walls and other items should go. The rest of the setup was straight forward as SteamVR Home had items for them (TV, computer, desk, etc.). You should save very often, and backup your progress regularly as well. As of this writing, the SteamVR Home files are stored in this directory `C:\Program Files (x86)\Steam\steamapps\common\SteamVR\tools\steamvr_environments\game\steamtours\SAVE`. You can simply copy the "SAVE" directory somewhere safe and restore things by copying it back to the original directory.

## Game cross-compatability

As mentioned above, all games are currently built on OpenVR. This means that, although some games may claim to be exclusive to a certain platform (like Oculus), they are technically portable to other HMDs. Sometimes this works without extra configuration, but as of this writing for Oculus-exclusive games you'll need software called [Revive](https://github.com/LibreVR/Revive) to accomplish it.

## Perfecting Icons/Artwork for non-Steam games in SteamVR

Known issue: Google Earth https://github.com/ValveSoftware/openvr/issues/1421

## Start-up/Shutdown 

Known issue: Bluetooth in SteamVR https://www.reddit.com/r/MixedVR/comments/jz967q/unable_to_auto_shutdown_basestations_via_steamvr/

A collection of misc scripts/tools that I've written to manage using devices from different ecosystems (e.g. Valve and WMR) at the same time

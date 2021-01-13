# A Perfectionist's VR Setup
This is a comprehensive guide to my VR setup, including some descriptions of how things work and why some things don't.

## Table of Contents

* [PC Hardware](#pc-hardware)
   * [Graphics Card](#graphics-card)
   * [Everything else](#everything-else)
* [VR Hardware](#vr-hardware)
   * [Headset](#headset)
      * [Photorealism](#photorealism)
      * [Visual immersion](#visual-immersion)
   * [Controllers](#controllers)
   * [Tracking](#tracking)
* [Platform choice](#platform-choice)
* [Matching physical space](#matching-physical-space)
* [Game cross-compatability](#game-cross-compatability)
* [Perfecting Icons/Artwork for non-Steam games in SteamVR](#perfecting-iconsartwork-for-non-steam-games-in-steamvr)
* [MixedVR-Manager](#MixedVR-Manager)

## PC Hardware 
While much of this guide is centered around software, we need to first talk about the hardware that goes into your PC. [PC Part Picker](https://pcpartpicker.com/) is essential in making sure that all of your choices are compatible, so I'd recommend you use it (or something similar).

### Graphics Card
Since we're going for the best here, we're going to need the best graphics card. I opt for the top of the line consumer-grade card. For the past decade, that's meant NVIDIA. The 1080 Ti, 2080 Ti, 3090, etc. You can probably get away with whatever the flagship model is for a much better price/performance ratio, but that's not what I'm going for here. Keep in mind that a disturbing amount of VRAM can be relevant in VR; some benchmarks show up to 17GB being used on a Reverb G2 (two 2160x2160 displays) in Half Life: Alyx. 

To figure out what the top of the line is at this moment, look at benchmarks from [Gamers Nexus](https://www.youtube.com/user/GamersNexus). They are the most scientific and methodical players in town.

### Everything else
Your processor, motherboard, RAM, storage, power supply, case, and cooling system should simply be sufficient enough not to bottleneck your graphics card (you can use [this tool](https://pc-builds.com/calculator/) for checking if your CPU causes a bottleneck). This goes for VR gaming just like PC gaming in general. I opt for whatever processor currently has the highest single threaded performance (again, check Gamers Nexus), whatever motherboard is reasonably priced and won't hold me back when overclocking, etc. I'll post a separate guide later on how I choose my components (TODO).

My first build from April 2019 can be found [here](https://pcpartpicker.com/user/monstermac77/saved/), if you're interested. 

## VR Hardware

For the best VR experience, you have to use a headset that is tethered to your powerful gaming PC (PCVR). The standalone VR headsets do have some marked advantages over PCVR. But because they will always have the limitation of needing to mount to your head without breaking your neck, they will never be able to match the fidelity of a dedicated 30 pound computer sitting on your floor.

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
  * This refers to the length of time each frame is displayed to the viewer. The tendency is to think that this would be the inverse of the refresh rate (e.g. 1/60th of a second for a 60Hz display), however that isn't always the case. Displays may show the frame for only a fraction of the 1/60th of a second their refresh rate would deem, inserting a black frame (known as "black frame insertion") until the next frame is displayed. One side effect of black frame insertion is that it makes the image appear darker, since our retinas sort of average the brightness of a spot in space over a period of time, and the black frame brings that average down, so in order to reduce display persistance you have to compensate by increasing the brightness with which each frame is flashed, which requires more power draw. All of this black frame insertion is done to reduce motion blur, which is important when the viewer is in motion and very relevant in VR. Similar to how your retinas average the brightness of a spot in space over a period of time, they also average the color they see. When the display persistence is high and you move your eyes during a frame, the colors sensed by your eye as it pivots blend together to create blur (TODO: figure out if I have this right). This is similar to the motion blur effect achieved by a camera which its exposure set to "long" (usually the camera is stationary, but in the case of VR the camera is your retina and it's your retina that's actually in motion while the frame is stationary).
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

A gyroscope is a device that's used to establish a device's orientation, and an accelerometer is used to [determine a device's acceleration](https://www.youtube.com/watch?v=KZVgKu6v808). Given a known starting point, one could theroretically trace the position over time of an object using simply precise measurements of acceleration and orientation. However, due to precision limitations of these devices, the controllers and HMD would quickly "flyaway" to infinity in a matter of seconds. Thus, an extra reference point is needed to error correct this data. TODO: improve this section, this is going off of memory and I can't remember where it's frome.

There are currently two mediums that are used for error-correction in tracking: 
* Visible light
* Infrared light (IR)

Although different hardware may use the same medium, their application of that medium may differ drastically: 
* Some HMDs use cameras placed on the HMD to identify landmarks in physical space (such as the corner of a door, or the edge of a carpet) to create a 3D map of landmarks (via physical light). As the user moves around in physical space, software is used to calculate the user's position in physical space based on what the cameras can see. These calculations are then translated to movement in virtual space. This is known as "inside-out tracking", which uses a Simultaneous Location And Mapping (SLAM) algorithm to determine position.
* Some controllers emit visible light from the controllers. The cameras on the HMD then track this visual light to calculate the controllers' position relative to the HMD, and therefore can infer its position in physical space. 
* Some controllers emit infrared light from the controllers. The cameras on the HMD then track this infrared light in the same way the HMDs track controllers using visible light above. 
* Some systems use extra devices called Lighthouses or Basestations. These devices remain stationary in the room at all times and do not communicate with your computer, HMD, or controllers. Much like actual lighthouses, these devices simply emit sweeping beams of IR at regular intervals across your room. Controllers and HMDs tracked by this method are scattered with small openings in the casing that allow the IR to penetrate and hit IR photodiodes (sensors that are sensitive to IR light) embedded into the device. By measuring the time between activations of these photodiodes, the device itself can deduce its position and orientation in space with trivial calculation. A great overview of Lighthouses can be found [here](https://youtu.be/xrsUMEbLtOs) where the original designer discusses how they work and eludes to some interesting facts, such as it being possible to achieve a 20 meter range with them (rather than ~5 meters). 

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

I also add all non-Steam games thate I've purchased from other stores or downloaded directly to Steam so that I can launch and browse my games from within SteamVR with ease.

## Perfecting Icons/Artwork for non-Steam games in SteamVR

**Upshot**: for non-Steam games, SteamVR uses whatever image is specified as the "shortcut icon", which is by default the .exe's ico, every time an icon/artwork needs to be displayed for that game. To override this, you need to specify a tall image (specifically, 600x900px) for that icon, and then follow step "c)" below to specify a wide icon (460×215px). The tall image will be displayed in your SteamVR dashboard, and the wide image will be displayed in "Recent Apps" in SteamVR Home, the loading screen when you first launch a game, and Big Picture Mode if you use it within SteamVR. It's not possible to achieve this setup via the GUI, which I believe is why [so](https://www.reddit.com/r/SteamVR/comments/cbjquw/game_icons_not_appearing_in_steam_vr/). [many](https://www.reddit.com/r/SteamVR/comments/6pqem8/adding_images_within_steamvr_to_nonsteam_games/). [people](https://steamcommunity.com/app/250820/discussions/0/2666627027759705661/). [are](https://www.reddit.com/r/Vive/comments/ce7h6z/has_anyone_found_out_how_to_add_custom_steam_grid/) not able to get it working, and most of the questions about it go unanswered.

**Detail and steps**

One thing that has bothered me more than anything else about SteamVR: the game icons/artwork in SteamVR only work as they should for Steam native games. If you have a lot of non-Steam games like me, at best you have icons that are either too tall or too wide and get stretched, blurred, or cropped to fill the various places Steam displays your games ([example](https://imgur.com/a/PKn9PRI)), or at worst you have dozens of gray boxes with no icons that you have to tap through to figure out what games they are ([example](https://imgur.com/a/qOPQkg8)). 

**a) Getting the images** 

This is a bonus section, which you can skip this if you already have images or know where to get them. Most likely, you should just use [SteamgridDB](https://www.steamgriddb.com/) to find images that are approximately the right aspect ratio you need and proceed to b), but if you're a perfectionist like me and want to exploit my many hours reading through Steam's game developer docs and writing a script to scrape Steam's site to figure this out, you should do the following (Note: your game has to be sold on Steam for this to work) Figure out your game's app ID on Steam (it's the number in the URL, e.g. https://store.steampowered.com/app/620980/Beat_Saber/). Visit these links below, replacing your app ID with Beat Saber's: 

* https://steamcdn-a.akamaihd.net/steam/apps/620980/header.jpg
* https://steamcdn-a.akamaihd.net/steam/apps/620980/logo.png
* https://steamcdn-a.akamaihd.net/steam/apps/620980/library_hero.jpg
* https://steamcdn-a.akamaihd.net/steam/apps/620980/library_600x900.jpg 

(note: you can add "_2x" before the jpg to get double the resolution on that last one). Now save these images, and set them in all the right places in desktop Steam (this part isn't tricky and can be done via the GUI). Basically, every time you know there should be an image somewhere, right click on the empty space and you'll see "Set custom background" or "Set custom logo" or in the case of the collections view: "set custom artwork". I'll type out all the places and how to set the images in the comments if someone's confused.


**b) Setting the "tall" icon** 

This can be any number of ways, but the fastest is to right click on your game in the left sidebar, click properties, then click "choose icon" and select your 600x900px image. This image will be displayed in all "tall" views, most notably when you are using the SteamVR dashboard. Sidenote: SteamVR really _shouldn't_ be the image from here, and should specify another location for the 600x900px image, but this is what we have to do to work around how things are being handled. 

**c) Setting the "wide" icon** 

This was the hardest part to figure out. Right click on your game in the left sidebar, hover over "Manage" and then click "Add Desktop Shortcut". Go to your desktop and right click on the shortcut you created, and then click on the "Details" tab and copy the number you see in the URL. Now go to the directory where Steam is installed (likely "Program Files") and go to userdata, the folder that's just a number (which is your Steam user ID, btw), "config", and then "grid". You'll see a lot of the images you set earlier in step a). Now take your 460×215 image and put it in this directory and name it the number you pulled from that URL at the beginning of step c). Side note: you may notice that this app ID you pulled is _different_ than the app ID in the other images for this same game. Why? No idea, probably so that Valve could enjoy watching me spin my wheels for 4 hours trying to figure out how to get this to work.

Now all you should have to do is quit Steam, re-open it, and launch SteamVR. Enjoy your now beautiful SteamVR library!

**Some improvements are needed** 

i) it seems like there are slightly different wide icon dimensions displayed in SteamVR and I've only figured out how to specify one of them. If your 460×215 image looks stretched where you see it most, use a different image with another aspect ratio that's a better fit until someone can figure out how to get both working simultaneously. 

j) I have not figured out how to get the little tiny icons in desktop Steam to stay squares with this setup. But it's probably possible. Again, someone else hopefully can figure this part out. If them being rectangles bothers you, you can turn them off entirely in "Settings" > "Library" and uncheck "Show game icons in the left column".

k) There is a known issue with the native Steam VR's Google Earth grid icons that I have not been able to override. I've [opened a Github issue](https://github.com/ValveSoftware/openvr/issues/1421).

## MixedVR-Manager

Like many people, I just want to get to SteamVR and start playing as quickly as possible. But there is often a lot of configuration that needs to be done every time a VR session is started or stopped, especially for those using devices from different ecosystems (known as [Mixed VR](https://www.reddit.com/r/MixedVR/)).

MixedVR-Manager performs all of this setup for you, automatically and in the background. With MixedVR-Manager, all you need to do is launch SteamVR on your PC (which can be as easy as turning on an Index controller). MixedVR-Manager handles everything else. 

**Features** ([video](https://www.youtube.com/watch?v=8j3yd5B9If0))
* Manages your lighthouses (a.k.a basestations) so you don't need to use the [Android app](https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm&hl=en_US&gl=US) or smart plugs to turn them off/on each session. Supports all lighthouse versions (v1.0 and v2.0).
* Manages the USB port for your headset so you don't have to unplug/replug it each session (all lights on your headset will be off and your computer won't detect your headset, just as if the cable were actually unplugged)
* Manages Windows Mixed Reality portal, in particular killing it when it's no longer used
* Manages SteamVR Room Setup, in particular killing the process when it launches unnecessarily
* Maintains your SteamVR home so that you can make it perfect once and not worry about [SteamVR deleting it randomly](https://www.reddit.com/r/Vive/comments/6crmf0/steam_vr_home_keeps_resetting_to_default/). 
* Maintains your SteamVR chaperone bounds and playspace (both size and orientation)

**Prerequisites**
* A PC with Bluetooth built in or a Bluetooth dongle (your Vive dongle will not work)
* In the Windows "Settings" app, be sure "User Account Control Settings" is set to ["Never notify"](https://articulate.com/support/article/how-to-turn-user-account-control-on-or-off-in-windows-10). 
  * Note: if you'd rather keep these dialogs on for other apps, just click "Yes" on the dialog every time it comes up OR set `allowHMDToBeDisabled` to `false` in `config.bat`. Please help us figure out [this issue](https://github.com/monstermac77/vr/issues/7) so we can eliminate this prerequisite. 

**Installing**
1) [Click here](https://github.com/monstermac77/vr/releases/latest) to download the latest release (`Source code.zip`).
2) Unzip `vr-[version].zip` and place the folder wherever you'd like. 
2) Edit line 12 in `config.bat` to be your personal basestations' MAC addresses and line 15 to be the version of your basestations (steps to determine your MAC addresses are on lines 5-11).
3) Right click on `mixedvr-manager-launcher.vbs` and click "Copy".
4) Press the `Windows logo key + R`, type `shell:startup`, and click "Ok".
5) Right click inside the window that was opened and select "Paste shortcut" (**not** "Paste"!).
6) Restart your computer

**Optional Features**
* Maintaining SteamVR Home
  * Once you have set up your SteamVR Home exactly as you'd like, take off your headset (don't close SteamVR) and copy the `SAVE` folder in `C:\Program Files (x86)\Steam\steamapps\common\SteamVR\tools\steamvr_environments\game\steamtours\` to the `userdata` directory in MixedVR-Manager. MixedVR-Manager will automatically restore it every time you launch SteamVR. 
* Maintaining SteamVR chaperone bounds and playspace
  * It's recommended you use [Chaperone Tweak](https://github.com/Xavr0k/ChaperoneTweak) to make your chaperone match up exactly with your physical space. More information on how to do so can be found in the [Matching Physical Space](#matching-physical-space) section of this guide. Once you've perfected it, take off your headset (don't close SteamVR) and copy the `chaperone_info.vrchap` file in `C:\Program Files (x86)\Steam\config\` to the `userdata` directory in MixedVR-Manager. MixedVR-Manager will automatically restore it every time you launch SteamVR. 
  * Please note that if you're a MixedVR user (e.g. Oculus or WMR HMD) then any time you redo your HMD's room setup, you'll have to adjust your chaperone and playspace and re-copy the file to keep things lined up perfectly.

**Frequently Asked Questions**
* What happens if I want to run this script but my headset isn't supported yet?
  * The script should be able to perform all of the other functions except it won't enable/disable your HMD, so you'll have to unplug/replug it each session if you want it powered off when not in use. That said, adding support for HMDs only takes me about 10 minutes, so please open an issue by clicking [here](https://github.com/monstermac77/vr/issues/new) and I'll add support for you!
* What happens if I don't have lighthouses or a PC with Bluetooth? 
  * The script should fail gracefully, meaning that all other features will work.
* Why isn't the `discover` command able to determine the MAC addresses of my v1.0 lighthouses? 
  * The v1.0 lighthouses seem to be less reliable at discovery than the v2.0 lighthouses. You may have to run the discover command several times, perhaps with a reboot thrown in between, to figure out the MAC addresses. During the discovery process, once you see a pop-up that says "Add a device", click that and let it pair. Continue for each basestation.
* Why isn't MixedVR Manager turning my v1.0 lighthouses on and off like it's supposed to? 
  * To determine what the issue is, open up "Command Prompt" and input `C:\..\vr\bin\lighthouse-v1-manager.exe discover` (then refer to the question above). If the output repeatedly says "no suitable lighthouses found", make sure that Bluetooth LE shows up in Device Manager on your PC. If it doesn't, you should uninstall all Bluetooth drivers that you may have installed since they usually cause this error; in general you [should only use](https://www.reddit.com/r/windows/comments/7zqktf/need_help_with_bluetooth/duqlnrz/) the Windows bluetooth driver. 
* Why isn't MixedVR Manager starting when my computer boots up? 
  * If this is happening, try double clicking the `mixedvr-manager-launcher.vbs` file and see if a window pops up saying "Do you want to open this file?". If it does, uncheck the "Always ask before opening this file" prompt, click "Open", and then restart your computer. 
  

**Acknowledgements**

Thank you so much to [Tetracyclic](https://www.reddit.com/user/Tetracyclic) for adding support for V1 lighthouses and [PumpkinSpice](https://www.reddit.com/user/PumkinSpiceTrukNuts) for a lot of testing and debugging.

# A Perfectionist's VR Setup
My guide to a perfect VR setup has been moved to my personal website, here: https://joepucc.io/notes/a-perfectionist's-vr-setup.php

## MixedVR Manager

Like many people, I just want to get to SteamVR and start playing as quickly as possible. But there is often a lot of configuration that needs to be done every time a VR session is started or stopped, especially for those using devices from different ecosystems (known as [Mixed VR](https://www.reddit.com/r/MixedVR/)).

MixedVR Manager performs all of this setup for you, automatically and in the background. With MixedVR Manager, all you need to do is launch SteamVR on your PC (which can be as easy as turning on an Index/Vive controller). MixedVR Manager handles everything else. 

**Features** ([video](https://www.youtube.com/watch?v=8j3yd5B9If0))
* Manages your lighthouses (a.k.a basestations) so you don't need to use the [Android app](https://play.google.com/store/apps/details?id=com.jeroen1602.lighthouse_pm&hl=en_US&gl=US) or smart plugs to turn them off/on each session. Supports all lighthouse versions (v1.0 and v2.0).
* Manages the USB port for your headset so you don't have to unplug/replug it each session (all lights on your headset will be off and your computer won't detect your headset, just as if the cable were actually unplugged)
* Manages Windows Mixed Reality portal, in particular preventing it from opening when you boot your computer and killing it when it's no longer used
* Manages SteamVR Room Setup, in particular killing the process when it launches unnecessarily
* Maintains your SteamVR home so that you can make it perfect once and not worry about [SteamVR deleting it randomly](https://www.reddit.com/r/Vive/comments/6crmf0/steam_vr_home_keeps_resetting_to_default/). 
* Maintains your SteamVR chaperone bounds and playspace (both size and orientation)

**Prerequisites**
* A PC with Bluetooth built-in or a Bluetooth dongle (only necessary if you want lighthouse management)

**Installing**
1) [Click here](https://github.com/monstermac77/vr/releases/latest) to download the latest release (`Source code.zip`).
2) Unzip `vr-[version].zip` and place the folder wherever you'd like. 
3) Edit `config.bat` according to what you want MixedVR Manager to manage (e.g. just lighthouses, just HMD, both, etc.) If you want lighthouse management, change line 21 to be your personal basestations' MAC addresses (steps to determine your MAC addresses are on lines 15-20).
4) Right click on `install-mixedvr-manager.bat` and then click "Run as administrator"

**Usage**
* Start-up: Launch SteamVR (which can be done by turning on an Index/Vive controller). Wait 30 seconds (Lighthouses and HMD will turn on automatically).
* Shutdown: Exit SteamVR from within your HMD. Wait 20 seconds (Lighthouses and HMD will turn off automatically).

**Optional Features**
* Maintaining SteamVR chaperone bounds and playspace
  * It's recommended you use [Chaperone Tweak](https://github.com/Xavr0k/ChaperoneTweak) to make your chaperone match up exactly with your physical space. More information on how to do so can be found in the [Matching Physical Space](#matching-physical-space) section of this guide. You should also be sure you [only have one universeID](https://www.reddit.com/r/MixedVR/comments/kr5zgw/new_issue_g2index_controllers_started_today/gia0bwb/?utm_source=reddit&utm_medium=web2x&context=3) in your chaperone file. Once you've perfected it, take off your headset (don't close SteamVR) and copy the `chaperone_info.vrchap` file in `C:\Program Files (x86)\Steam\config\` to the `userdata` directory in MixedVR Manager. MixedVR Manager will automatically restore it every time you launch SteamVR. 
  * Please note that if you're a MixedVR user (e.g. Oculus or WMR HMD) then any time you redo your HMD's room setup, you'll have to adjust your chaperone and playspace and re-copy the file to keep things lined up perfectly.
* Maintaining SteamVR Home
  * Once you have set up your SteamVR Home exactly as you'd like, take off your headset (don't close SteamVR) and copy the `SAVE` folder in `C:\Program Files (x86)\Steam\steamapps\common\SteamVR\tools\steamvr_environments\game\steamtours\` to the `userdata` directory in MixedVR Manager. MixedVR Manager will automatically restore it every time you launch SteamVR. 

**Frequently Asked Questions**
* What happens if I want to run this script but my headset isn't supported yet?
  * The script should be able to perform all of the other functions except it won't enable/disable your HMD. That said, adding support for HMDs is very easy, so please open an issue by clicking [here](https://github.com/monstermac77/vr/issues/new) and we'll add support for you!
* What happens if I don't have lighthouses or a PC with Bluetooth? 
  * All other features should work. Just be sure to set `allowLighthouseManagement` to `false` in `config.bat`
* Why isn't the `discover` command able to determine the MAC addresses of my lighthouses? 
  * You may have to run the discover command several times, perhaps with a reboot thrown in between, to figure out the MAC addresses. During the discovery process, once you see a pop-up that says "Add a device", click that and let it pair. Continue for each basestation.
* Why isn't MixedVR Manager turning my v1.0 lighthouses on and off like it's supposed to? 
  * To determine what the issue is, open up "Command Prompt" and input `C:\..\vr\bin\lighthouse-keeper.exe 1 discover` (then refer to the question above). If the output repeatedly says "no suitable lighthouses found", make sure that Bluetooth LE shows up in Device Manager on your PC. If it doesn't, you should uninstall all Bluetooth drivers that you may have installed since they usually cause this error; in general you [should only use](https://www.reddit.com/r/windows/comments/7zqktf/need_help_with_bluetooth/duqlnrz/) the Windows bluetooth driver. 
  

**Acknowledgements**

Thank you so much to [Tetracyclic](https://www.reddit.com/user/Tetracyclic) for adding support for V1 lighthouses and [PumpkinSpice](https://www.reddit.com/user/PumkinSpiceTrukNuts) for a lot of testing and debugging.

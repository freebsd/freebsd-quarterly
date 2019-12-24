## SoC audio framework and RK3399 audio drivers ##

Link:	 [rk3399_audio](https://github.com/gonzoua/freebsd/tree/rk3399_audio)

Contact: Oleksandr Tymoshenko <gonzo@FreeBSD.org>

Most modern SoCs and devboards have audio support in one form or another, but it's one of the areas that are overlooked by FreeBSD driver developers. The most common architecture for the audio pipeline on a single-board computer consists of two DAIs (digital audio interfaces): CPU and codec, connected by a serial bus.

CPU DAI is an SoC IP block that operates with samples: obtains them from the driver for playback or provides them to the driver for recording through FIFOs or DMA requests. Audio samples leave (or arrive at) SoC through a serial bus, usually I2S, that is connected to Codec DAI. 

Codec DAI is an external (to SoC) chip that packs one or more DAC/ADC blocks along with mixers, amplifiers, and probably more specialized devices like filters and/or sound effects. The analog part of the codec is connected to microphones/headphones/speakers. On SBCs, codec usually communicates with SoC through two interfaces: data path, over which audio samples travel and control one, that is used to read/write chip registers and configure its behavior. The most common choices for these are I2S and I2C buses, respectively.

For FDT-enabled devices, an audio pipeline is described as a virtual DTB node that has links to the CPU device, codec device, specifies the data format, and clock details both CPU and codec chip would use. It also may have more than one CPU/codec pairs.

Using Firefly-RK3399 as a test device, I was able to implement I2S driver for RK3399 SoC (PIO mode, playback only), the driver for Realtek's RT5640 chip (headphones playback only + mixer controls) and a base outline of SoC audio framework. Some bits of `rk_i2s` and the framework were ported from the NetBSD code developed by Jared McNeil. On my WIP branch, I can play mp3 audio and control playback volume.

The primary missing functionalities at the moment are recording support, multi-link audio cards, DMA support. The most critical among these is DMA support. In the current implementation, all buffer management is placed at the ausoc layer, which is not going to work for DMA because only the CPU DAI driver would know about the memory constraints and access mechanisms. The current state of RK3399 support does not allow to implement DMA transfers for `rk_i2s` easily, but I plan to look into this right after adding recording support, which should not be a lot of work.

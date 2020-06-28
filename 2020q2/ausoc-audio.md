## SoC audio framework and more audio drivers ##

Link:	 [rk3399_audio](https://github.com/gonzoua/freebsd/tree/rk3399_audio)

Contact: Oleksandr Tymoshenko <gonzo@FreeBSD.org>

SoC audio framework made a good progress since last report. Support for AUX devices was
added (devices like auxiliary amplifiers that are not part of main CODEC chip). To verify
the framework design following audio drivers were added: recording support for RT5640 CODEC(Firefly-RK3399),
Allwinner I2S, Alwinners sun8i and A64 CODECs (Pine A64+), both recordign and playback. Current work in progress
is RK3328 CODEC (Rock64) and ES8316 CODEC (RockPro64 and Pinebook Pro).

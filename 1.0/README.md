<h1 align="center">Sparta 1.0.0</h1>

<p align="center">GPU based 3D particle system for GameMaker LTS 2026 by theSnidr and modified by <a href="https://alub.dev/" target="_blank">Alun Jones</a>.</p>

<!---------------------------------[ Buttons ]---------------------------------->

<div align = center>

[![Badge License]][License]   [![Badge Download]][Download]

</div>

<!---------------------------------------------------------------------------->

[License]: LICENSE.md
[Download]: https://github.com/AlubJ/Sparta/releases/latest
[Documentation]: https://docs.alub.dev/Sparta


<!---------------------------------[ Badges ]---------------------------------->

[Badge License]: https://img.shields.io/badge/License-MIT-blue
[Badge Download]: https://img.shields.io/badge/Download-.yymps-red
[Badge Documentation]: https://img.shields.io/badge/Read%20the-Docs-purple

<!---------------------------------[ Content ]---------------------------------->

---

Sparta is a 3D particle system for GameMaker and is a heavily modified version of [sPart by theSnidr](https://github.com/TheSnidr/sPart). It is a GPU based particle system where the particles are computed on the GPU via a shader.

## Why did I make this?
There are a couple reasons for this. Firstly, I wanted to update the API for my own reasons and add a couple of new features. Secondly, sPart hasn't been updated in a while and I intend to support this library for as long as I can, so rewriting it in a way that makes it easy for me to maintain was important.

## What's different?
The entire API has been reworked as well as a lot of the backend stuff you don't normally see. The way you interact with the Sparta API is via functions where you pass in the system, emitter or type instead of dotting into them. You can still dot into each of those as internally they are still constructor, however, I usually prefer function calls for this sort of thing.

There is also a couple of added features. For sprite particle types, you can now supply a scale speed value for both the X scale and Y scale. Setting these will have the sprite particle scale along those axis via a sine wave, which can give the illusion that particles are actually 3D and are spinning. You can also serialize and deserialize emitters and types for caching. And finally, there is now a global partical system which you can use. Of course you can still create induvidual particle systems, but the option for a global system is now there.
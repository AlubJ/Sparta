# Architecture

## General Architecture

### Particle Systems
A particle system is a container which holds active emitters. A particle system is responsible for stepping and drawing all active emitters. Most games will only ever need one system, `SpartaSystemGetGlobal()` returns a shared instance for exactly that reason, but you can create your own with `SpartaSystemCreate()` if you want isolated batch sizes, a separate draw order, or the ability to clear or destroy a whole group of effects independently of everything else.

### Emitters
An emitter is what will spawn particles, and decides how, when and where to spawn them. An emitter can only spawn one particle type at a time, from one region in space, using one shape, sector or distribution. If you need particles that behave differently at the same moment, sparks and smoke together for example, would need two emitters.

An emitter is either static or dynamic. A static emitter's region never moves after it's set. A dynamic emitter can be repositioned every frame (`SpartaEmitterSetRegionPosition`, etc.) and the system handles the rest. See [How Movement Works](#how-movement-works) below for what's actually happening when you do this.

### Particle Types
A particle type is the particle itself, how it looks and behaves on an individual level, its sprite or mesh, its life span, speed, color, gravity, and so on. A type is just a definition. It doesn't spawn anything by itself, an emitter has to stream or burst it for any particles to actually appear. In practice, you can build a library of reusable types once, and stream the same type from many different emitters, in many different places, at the same time.

A type can also carry a child type and a death type, particles that spawn from each of its own particles as they live and die. These compose the same way, a child type is itself just a type, and can have its own child and death types.

### Effects
Effects are groups of particle types and instructions that occur over the course of the particle system's time step. They are intended to be used for repeatable effects where managing your own emitters and particle types would be tedious. Effects own their types so types registered through `SpartaEffectAdd*` should not be used with other emitters. Once an effect is destroyed all particle types associated with the effect will also be destroyed.

## How Particles Work
Particles are computed from time, not simulated frame-by-frame. When a particle spawns, nothing is actually created. Every frame, a particle's current position, size, and color are calculated directly from how much time has passed since that spawn moment.

This is what makes the system fast even with very large particle counts, there's no per particle simulation, just a calculation done once per particle per draw. It's also why there's a hard limit on what particles can do, collision, attraction to another particle, anything stateful, isn't something this system can support, because there's no per frame state to react with.

### How Movement Works
This time based model is also why moving an emitter isn't as simple as changing a position value. A particle's position is calculated relative to the transform the emitter had when that particle spawned, so if the emitter's transform just changed to somewhere else, older particles would suddenly recalculate as if they'd always been spawning from the new location.

To avoid this, a dynamic emitter doesn't move in place. Instead, moving it retires the emitter's current segment, freezing its old transform into a copy that keeps aging out its already spawned particles exactly where they were, while the original emitter continues streaming fresh particles from the new position. This retirement is throttled by the system's `dynamicInterval`, so a fast moving emitter doesn't retire a new segment every single frame, instead, particles spawned within one interval interpolate smoothly between the segment's start and end position.

## Ownership
Most things you create in this library fall into one of two categories:

- **References** - a system, a type or an emitter you store in a variable, an effect or an effect instance you plan to replay. You're responsible for calling the matching `Destroy` when you're done with it (`SpartaSystemDestroy`, `SpartaTypeDestroy`, `SpartaEffectDestroy`, etc.).
- **Fire-and-forget** - `SpartaBurst`, a bounded (finite life span) `SpartaStream`, and `SpartaEffectPlay`. These create their own internal emitters, and once they've finished playing out, they clean themselves up automatically, you never get a reference back, and you never need to destroy anything. This only works because the thing playing has a defined end, an unbounded stream (an infinite life span) will never finish on its own, so it isn't something you should fire-and-forget, hold a reference and retire it yourself when it should stop.

### Destroying Things
Calling `Destroy` on something marks the struct itself as destroyed, and removes any memory (aside from sprites and billboard batches) that was referenced. If you try to use a destroyed system, type, or effect after destroying it (streaming from it, adding an instruction to it, playing it), you'll get an error.

## Serialization and Deserialization
Sparta includes functions to be able to serialize and deserialize particle emitters, types and effects to and from structs. Sparta will make no assumptions with how you store that information, and will only expect correct data to be passed into it. Sparta will not serialize sprite data directly but will serialize mesh data. Sprites are always referenced via their name, so any external sprites that are loaded may cause unexpected issues. Meshes are serialized into a base 64 encoded buffer string.

## Functions
All examples in these docs are going to be formatted using the function based API. There is a method based API for all classes which you can use and chain if you please.

```gml
particleType = SpartaTypeCreate();

SpartaTypeSetSprite(particleType, sprParticle, 0, false);
SpartaTypeSetLife(particleType, 2, 5);

particleType.SetSprite(sprParticle, 0, false)
            .SetLife(2, 5);
```

Both of these examples are perfectly valid in this library. The API reference also refers by functions, however, a method equivalent will be documented alongside the function. Any functions, methods or variables which are prefixed with a double underscore (`__`) should be treated as private, they are for the internals of the library only.
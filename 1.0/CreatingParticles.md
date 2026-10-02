# Creating Particles

## Creating a Particle System
You don't have to create a particle system to draw particles, a global system is provided for you which is accessible via `SpartaSystemGetGlobal()`. One particle system is usually good enough for drawing all particles but you can create a bespoke system for specific needs.

Let's create a new particle system.
```gml
/// Create event
var _batchSizes = [256, 512, 1024, 2048, 4096];
particleSystem = SpartaSystemCreate(_batchSizes);
```

You'll notice here that we've passed in `_batchSizes` into the function. This tells the particle system how to batch together particles. The goal is to use as little draw calls as possible, so the more diverse your batch sizes, the better your performance will be for large particle effects.

Alternatively, you can use the global system.

```gml
/// Create event
particleSystem = SpartaSystemGetGlobal();
```

## Creating a Particle Emitter
To be able to draw any particles at all, we need an emitter to spawn them.

```gml
/// Create event
particleEmitter = SpartaEmitterCreate(particleSystem);
SpartaEmitterSetRegion(particleEmitter, 0, 0, 0, 0, 0, 0, 1, 1, 1);
```

We pass the particle system into the emitter so the emitter has the right context. The region we set is a simple box region with the same parameters as `matrix_build`.

## Creating a Particle Type
Our emitter now needs a particle type to be able to spawn. Let's create a simple one.

```gml
/// Create event
// Create the type
particleType = SpartaTypeCreate();

// Set the visual properties
SpartaTypeSetSprite(particleType, sprParticle, 0, false);
SpartaTypeSetSize(particleType, 1, 2, 0, 0, 1, 2);
SpartaTypeSetColor(particleType, c_green, 0, c_yellow, 1, c_blue, 1, c_red, 0, false);

// Set the behavioral properties
SpartaTypeSetLife(particleType, 2, 5);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
```

?> There are a lot more properties that can be set, please take a look at the API reference for everything that can be set.

## Stepping the Particle System
We need to step our particle system for any particles to be able to spawn. In your step event you'll want:

```gml
/// Step event
SpartaSystemStep(particleSystem, 1 / game_get_speed(gamespeed_fps));
```

?> The time increment can be whatever value but generally `1` full timestep should be mapped to `1` real-world second.

## Drawing the Particle System
Next, we need to draw the particle system. You should draw it after your camera has already been applied.

```gml
/// Draw event
SpartaSystemDraw(particleSystem);
```

## Emitting Particles
There are two types of emitting, streaming and bursting. Streaming will emit a constant stream of particles for as long as you set the emitter to stream. Bursting will let out one big burst of particles all at once. We'll just stream them here.

```gml
/// Create event
SpartaEmitterStream(particleEmitter, particleType, 10, -1);
```

?> Setting the lifespan to `-1` will cause the emitter to continuously stream particles out.

[demo](assets/demo/index.html?--demo&0 ':include width=100% frameBorder=0')
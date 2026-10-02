# Effects
Effects are groups of particle types and instructions that occur over the course of the particle systems time step. These are super useful for creating reusable effects.

## Creating an Effect
Creating an effect is quite simple. This returns a struct which contains all of the types and instructions for this effect.

```gml
particleEffect = SpartaEffectCreate();
```

## Added Instructions
To be able to have this effect play we'll need to add instructions to the effect. There are two types of instructions matching the two types of emitters. `SpartaEffectAddBurst()` and `SpartaEffectAddStream()`. We'll also supply a time in particle system time steps. The instructions position, rotation and scale are relative to where the effect is played. 

```gml
SpartaEffectAddBurst(particleEffect, 0, particleType, 500, 0, 0, 0);
```

## Playing an Effect
There are a couple of ways to play an effect. You need to create a new effect instance using `SpartaEffectInstanceCreate()` and play using that instance. Alternatively, you can do a single play which is a fire-and-forget call using `SpartaEffectPlay()` meaning you don't have to store an effect instance. These will clean-up on their own.

```gml
particleEffectInstance = SpartaEffectInstanceCreate(particleSystem, particleEffect);
SpartaEffectInstancePlayAt(particleEffectInstance, 0, 0, 0);
```

## Full Code
This is what a full particle effect creation could look like.

```gml
// Create the effect
particleEffect = SpartaEffectCreate();
SpartaEffectAddBurst(particleEffect, 0, particleType, 500, 0, 0, 0);
SpartaEffectAddBurst(particleEffect, 1, particleType, 200, 5, 5, 5);
SpartaEffectAddBurst(particleEffect, 2, particleType, 100, -5, 0, 5);
SpartaEffectAddBurst(particleEffect, 3, particleType, 50, -5, 0, -5);
SpartaEffectAddStream(particleEffect, 4, particleType, 10, 4, -5, 0, -5);

// Play the effect (this function will return back an effect instance, but you don't need to store it and will clean itself up.)
particleEffectInstance = SpartaEffectPlay(particleSystem, particleEffect, 0, 0, 0);
```

[demo](assets/demo/index.html?--demo&3 ':include width=100% frameBorder=0')
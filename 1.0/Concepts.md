# Architecture

## General Architecture

### Particle Systems
A particle system is a container which holds active emitters. A particle system is responsible for stepping and drawing all active emitters.

### Emitters
An emitter is what will spawn particles, and decides how, when and where to spawn them. An emitter can only spawn one particle type at a time.

### Particle Types
A particle type is the particle itself. How it looks and behaves on an induvidual level.

## How Particles Work
Particles are computed from time and are not simulated per-frame. This makes particles extremely fast to compute however this means that particle collisions or anything that requires stateful particles is never going to be supported.

## Functions
All examples in these docs are going to be format using the function based API. There is a method based API for all classes which you can use and chain if you please.

```gml
particleType = SpartaTypeCreate();

SpartaTypeSetSprite(particleType, sprParticle, 0, false);
SpartaTypeSetLife(particleType, 2, 5);

particleType.SetSprite(sprParticle, 0, false)
            .SetLife(2, 5);
```

Both of these examples are perfectly valid in this library. The API reference also refers by functions however a method equivilent will be document alongside the function. Any functions, methods or variables which are prefixed with a double underscore (`__`) should be treated as private, they are for the internals of the library only.
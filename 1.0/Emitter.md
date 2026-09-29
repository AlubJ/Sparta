# Emitter

## Functions

### ...EmitterCreate
`SpartaEmitterCreate(system)` | `N/A` ➜ `Struct.__SpartaClassEmitter`

<!-- tabs:start -->

#### **Description**

Create a new emitter. An emitter is responsible for emitting a specific particle type. An emitter can only emit one particle type at any given time.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |

#### **Example**

```gml
SpartaEmitterCreate(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterCreateFromStruct
`SpartaEmitterCreateFromStruct(system, struct)` | `N/A` ➜ `Struct.__SpartaClassEmitter`

<!-- tabs:start -->

#### **Description**

Create a new particle type from a struct previously created from `SpartaEmitterSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaEmitterCreateFromStruct(system, struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterBurst
`SpartaEmitterBurst(emitter, type, count)` | `.Burst(type, count)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

A particle burst is a single count of particles being spawned at once.

| Parameter | Type | Description |
| --- | --- | --- |
| `type` | `Struct.__SpartaClassType` |  |
| `count` | `Real` |  |

#### **Example**

```gml
SpartaEmitterBurst(emitter, type, count);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterDeserialize
`SpartaEmitterDeserialize(emitter, struct)` | `.Deserialize(struct)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Deserialize emitter data from a struct previously created from `SpartaEmitterSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaEmitterDeserialize(emitter, struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterMature
`SpartaEmitterMature(emitter)` | `.Mature()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Maturing an emitter will cause the emitter to act like it's been running for a while.

#### **Example**

```gml
SpartaEmitterMature(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterRetire
`SpartaEmitterRetire(emitter)` | `.Retire()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Retiring an emitter will make it stop producing particles.

#### **Example**

```gml
SpartaEmitterRetire(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSerialize
`SpartaEmitterSerialize(emitter)` | `.Serialize()` ➜ `Struct`

<!-- tabs:start -->

#### **Description**

Convert the emitter into a struct that can be read back later.

#### **Example**

```gml
SpartaEmitterSerialize(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterStream
`SpartaEmitterStream(emitter, type, particlesPerStep, lifespan)` | `.Stream(type, particlesPerStep, lifespan)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Stream particles over multiple frames. Setting the lifespan to `-1` will cause the emitter to not retire.

| Parameter | Type | Description |
| --- | --- | --- |
| `type` | `Struct.__SpartaClassType` |  |
| `particlesPerStep` | `Real` |  |
| `lifespan` | `Real` |  |

#### **Example**

```gml
SpartaEmitterStream(emitter, type, particlesPerStep, lifespan);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Setters

### ...EmitterSetDistribution
`SpartaEmitterSetDistribution(emitter, distribution)` | `.SetDistribution(distribution)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters emit distribution pattern.

| Parameter | Type | Description |
| --- | --- | --- |
| `distribution` | `Constant.SPARTA_DISTR_*` |  |

#### **Example**

```gml
SpartaEmitterSetDistribution(emitter, distribution);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetDynamic
`SpartaEmitterSetDynamic(emitter, dynamic)` | `.SetDynamic(dynamic)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This will set whether the emitter is dynamic or not. A dynamic emitter will allow the emitter to be changed while retaining the already spawned particles to remain on their original path. This will incur performance hits so only set the emitter to be dynamic when you need it to be dynamic.

| Parameter | Type | Description |
| --- | --- | --- |
| `dynamic` | `Bool` |  |

#### **Example**

```gml
SpartaEmitterSetDynamic(emitter, dynamic);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetRegion
`SpartaEmitterSetRegion(emitter, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale)` | `.SetRegion(xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters region. The region is the point and bounds in space where a particle can spawn.

| Parameter | Type | Description |
| --- | --- | --- |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |
| `xRotation` | `Real` |  |
| `yRotation` | `Real` |  |
| `zRotation` | `Real` |  |
| `xScale` | `Real` |  |
| `yScale` | `Real` |  |
| `zScale` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetRegion(emitter, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetRegionMatrix
`SpartaEmitterSetRegionMatrix(emitter, matrix, xScale, yScale, zScale)` | `.SetRegionMatrix(matrix, xScale, yScale, zScale)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters emit region from a matrix and scale values.

| Parameter | Type | Description |
| --- | --- | --- |
| `matrix` | `Array.Matrix` |  |
| `xScale` | `Real` |  |
| `yScale` | `Real` |  |
| `zScale` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetRegionMatrix(emitter, matrix, xScale, yScale, zScale);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetRegionPosition
`SpartaEmitterSetRegionPosition(emitter, xPosition, yPosition, zPosition)` | `.SetRegionPosition(xPosition, yPosition, zPosition)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters region position.

| Parameter | Type | Description |
| --- | --- | --- |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetRegionPosition(emitter, xPosition, yPosition, zPosition);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetRegionRotation
`SpartaEmitterSetRegionRotation(emitter, xRotation, yRotation, zRotation)` | `.SetRegionRotation(xRotation, yRotation, zRotation)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters region rotation.

| Parameter | Type | Description |
| --- | --- | --- |
| `xRotation` | `Real` |  |
| `yRotation` | `Real` |  |
| `zRotation` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetRegionRotation(emitter, xRotation, yRotation, zRotation);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetRegionScale
`SpartaEmitterSetRegionScale(emitter, xScale, yScale, zScale)` | `.SetRegionScale(xScale, yScale, zScale)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters region scale.

| Parameter | Type | Description |
| --- | --- | --- |
| `xScale` | `Real` |  |
| `yScale` | `Real` |  |
| `zScale` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetRegionScale(emitter, xScale, yScale, zScale);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetSector
`SpartaEmitterSetSector(emitter, angle)` | `.SetSector(angle)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This will set the sector angle from where particles spawn from within the shape. This only affects the sphere and cylinder shapes.

| Parameter | Type | Description |
| --- | --- | --- |
| `angle` | `Real` |  |

#### **Example**

```gml
SpartaEmitterSetSector(emitter, angle);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterSetShape
`SpartaEmitterSetShape(emitter, shape)` | `.SetShape(shape)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an emitters emit shape.

| Parameter | Type | Description |
| --- | --- | --- |
| `shape` | `Constant.SPARTA_SHAPE_*` |  |

#### **Example**

```gml
SpartaEmitterSetShape(emitter, shape);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Getters

### ...EmitterGetAge
`SpartaEmitterGetAge(emitter)` | `.GetAge()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the age of an emitter.

#### **Example**

```gml
SpartaEmitterGetAge(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetDistribution
`SpartaEmitterGetDistribution(emitter)` | `.GetDistribution()` ➜ `Constant.SPARTA_DISTR_*`

<!-- tabs:start -->

#### **Description**

Get the distribution of an emitter.

#### **Example**

```gml
SpartaEmitterGetDistribution(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetDynamic
`SpartaEmitterGetDynamic(emitter)` | `.GetDynamic()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Reeturn back whether an emitter is dynamic.

#### **Example**

```gml
SpartaEmitterGetDynamic(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetLifeSpan
`SpartaEmitterGetLifeSpan(emitter)` | `.GetLifeSpan()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the life span of an emitter.

#### **Example**

```gml
SpartaEmitterGetLifeSpan(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetParticleType
`SpartaEmitterGetParticleType(emitter)` | `.GetParticleType()` ➜ `Struct.__SpartaClassType`

<!-- tabs:start -->

#### **Description**

Get the particle type of an emitter.

#### **Example**

```gml
SpartaEmitterGetParticleType(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetParticlesPerStep
`SpartaEmitterGetParticlesPerStep(emitter)` | `.GetParticlesPerStep()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the particle per step of an emitter.

#### **Example**

```gml
SpartaEmitterGetParticlesPerStep(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetRegion
`SpartaEmitterGetRegion(emitter)` | `.GetRegion()` ➜ `Array.Matrix`

<!-- tabs:start -->

#### **Description**

Get the region matrix of an emitter.

#### **Example**

```gml
SpartaEmitterGetRegion(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetSector
`SpartaEmitterGetSector(emitter)` | `.GetSector()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the sector angle of an emitter.

#### **Example**

```gml
SpartaEmitterGetSector(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetShape
`SpartaEmitterGetShape(emitter)` | `.GetShape()` ➜ `Constant.SPARTA_SHAPE_*`

<!-- tabs:start -->

#### **Description**

Get the shape of an emitter.

#### **Example**

```gml
SpartaEmitterGetShape(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterGetType
`SpartaEmitterGetType(emitter)` | `.GetType()` ➜ `Constant.SPARTA_EMITTER_*`

<!-- tabs:start -->

#### **Description**

Get the type of an emitter.

#### **Example**

```gml
SpartaEmitterGetType(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterIsActive
`SpartaEmitterIsActive(emitter)` | `.IsActive()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether an emitter is active.

#### **Example**

```gml
SpartaEmitterIsActive(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EmitterIsRetired
`SpartaEmitterIsRetired(emitter)` | `.IsRetired()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether an emitter is retired.

#### **Example**

```gml
SpartaEmitterIsRetired(emitter);  // TODO: replace with a real example
```

<!-- tabs:end -->

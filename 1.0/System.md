# System

## Functions

### ...SystemCreate
`SpartaSystemCreate(batchSizeArray)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Create a new particle system. Each system is responsible for drawing all the emitters the system holds. When creating a new particle system you will need to pass in an array of batch sizes. Each size corrisponds to the number of particles in a single batch. The more batch sizes and the more varied they are will determine how many vertex submit calls will be executed for each emitter that is drawn.

| Parameter | Type | Description |
| --- | --- | --- |
| `batchSizeArray` | `Array.Real` |  |

#### **Example**

```gml
SpartaSystemCreate(batchSizeArray);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemClear
`SpartaSystemClear(system)` | `.Clear()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Clear all the active emitters from a system.

#### **Example**

```gml
SpartaSystemClear(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemDestroy
`SpartaSystemDestroy(system)` | `.Destroy()` ➜ `Struct.__SpartaClassSystem`

<!-- tabs:start -->

#### **Description**

Clear and destroy a system.

#### **Example**

```gml
SpartaSystemDestroy(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemDraw
`SpartaSystemDraw(system)` | `.Draw()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Draw the a particle system. This should be called after already submitting your camera.

#### **Example**

```gml
SpartaSystemDraw(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemRetireAllEmitters
`SpartaSystemRetireAllEmitters(system)` | `.RetireAllEmitters()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Retire all currently active emitters in a system.

#### **Example**

```gml
SpartaSystemRetireAllEmitters(system, force);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemStep
`SpartaSystemStep(system, increment)` | `.Step(increment)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This function will step the particle system. The time increment parameter is used to step each particle. The time increment value is measured in seconds, so the usual formula for stepping the system would be `1/fps` though this can be changed for various reasons.

| Parameter | Type | Description |
| --- | --- | --- |
| `increment` | `Real` |  |

#### **Example**

```gml
SpartaSystemStep(system, increment);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemStopAllEffects
`SpartaSystemStopAllEffects(system)` | `.StopAllEffects()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Stop all currently active effects in a system.

#### **Example**

```gml
SpartaSystemStopAllEffects(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Setters

### ...SystemSetBatchSize
`SpartaSystemSetBatchSize(system, batchSizeArray)` | `.SetBatchSize(batchSizeArray)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the batch size array of a system.

| Parameter | Type | Description |
| --- | --- | --- |
| `batchSizeArray` | `Array.Real` |  |

#### **Example**

```gml
SpartaSystemSetBatchSize(system, batchSizeArray);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemSetDynamicInterval
`SpartaSystemSetDynamicInterval(system, interval)` | `.SetDynamicInterval(interval)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

The dynamic interval is how often a new emitter is created when an emitter is dynamic. Particles interpolate between the last and current emitter. This defaults to `1`.

| Parameter | Type | Description |
| --- | --- | --- |
| `interval` | `Real` |  |

#### **Example**

```gml
SpartaSystemSetDynamicInterval(system, interval);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemSetPause
`SpartaSystemSetPause(system, pause)` | `.SetPause(pause)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the system to be paused or not paused.

| Parameter | Type | Description |
| --- | --- | --- |
| `pause` | `Bool` |  |

#### **Example**

```gml
SpartaSystemSetPause(system, pause);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Getters

### ...SystemGetBatchSize
`SpartaSystemGetBatchSize(system)` | `.GetBatchSize()` ➜ `Array.Real`

<!-- tabs:start -->

#### **Description**

Get the batch size array of a system.

#### **Example**

```gml
SpartaSystemGetBatchSize(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetDrawCalls
`SpartaSystemGetDrawCalls(system)` | `.GetDrawCalls()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the draw calls of a system.

#### **Example**

```gml
SpartaSystemGetDrawCalls(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetDynamicInterval
`SpartaSystemGetDynamicInterval(system)` | `.GetDynamicInterval()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the dynamic interval of a system.

#### **Example**

```gml
SpartaSystemGetDynamicInterval(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetGlobal
`SpartaSystemGetGlobal()` | `N/A` ➜ `Struct.__SpartaClassSystem`

<!-- tabs:start -->

#### **Description**

Return the global particle system that you can use for any particle emitters. This system is created when the library loads.

#### **Example**

```gml
SpartaSystemGetGlobal();  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetParticleCount
`SpartaSystemGetParticleCount(system)` | `.GetParticleCount()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the estimated particle count of a system. This will not get the actual active particle count.

#### **Example**

```gml
SpartaSystemGetParticleCount(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetPause
`SpartaSystemGetPause(system)` | `.GetPause()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether a system is paused or not.

#### **Example**

```gml
SpartaSystemGetPause(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SystemGetTime
`SpartaSystemGetTime(system)` | `.GetTime()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the current time of a system.

#### **Example**

```gml
SpartaSystemGetTime(system);  // TODO: replace with a real example
```

<!-- tabs:end -->

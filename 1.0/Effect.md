# Effect

## Functions

### ...EffectCreate
`SpartaEffectCreate()` | `N/A` ➜ `Struct.__SpartaClassEffect`

<!-- tabs:start -->

#### **Description**

Effects are set instructions and particles types that can play over time, these are useful for reusable effects that you may want to have ready at once. All types that belong to an effect should be added via `SpartaEffectAddType` so memory cleanup can occur.

#### **Example**

```gml
SpartaEffectCreate();  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectCreateFromStruct
`SpartaEffectCreateFromStruct(struct)` | `N/A` ➜ `Struct.__SpartaClassEffect`

<!-- tabs:start -->

#### **Description**

Create an effect from a struct previously created from `SpartaEffectSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaEffectCreateFromStruct(struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectAddBurst
`SpartaEffectAddBurst(effect, time, type, count, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution)` | `.AddBurst(time, type, count, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Add a burst instruction to an effect.

| Parameter | Type | Description |
| --- | --- | --- |
| `time` | `Real` |  |
| `type` | `Struct.__SpartaClassType` |  |
| `count` | `Real` |  |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |
| `[xRotation]` | `Real` |  |
| `[yRotation]` | `Real` |  |
| `[zRotation]` | `Real` |  |
| `[xScale]` | `Real` |  |
| `[yScale]` | `Real` |  |
| `[zScale]` | `Real` |  |
| `[shape]` | `Constant.SPARTA_SHAPE_*` |  |
| `[sector]` | `Real` |  |
| `[distribution]` | `Constant.SPARTA_DISTR_*` |  |

#### **Example**

```gml
SpartaEffectAddBurst(effect, time, type, count, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectAddStream
`SpartaEffectAddStream(effect, time, type, particlesPerStep, duration, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution)` | `.AddStream(time, type, particlesPerStep, duration, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Add a stream instruction to an effect.

| Parameter | Type | Description |
| --- | --- | --- |
| `time` | `Real` |  |
| `type` | `Struct.__SpartaClassType` |  |
| `particlesPerStep` | `Real` |  |
| `duration` | `Real` |  |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |
| `[xRotation]` | `Real` |  |
| `[yRotation]` | `Real` |  |
| `[zRotation]` | `Real` |  |
| `[xScale]` | `Real` |  |
| `[yScale]` | `Real` |  |
| `[zScale]` | `Real` |  |
| `[shape]` | `Constant.SPARTA_SHAPE_*` |  |
| `[sector]` | `Real` |  |
| `[distribution]` | `Constant.SPARTA_DISTR_*` |  |

#### **Example**

```gml
SpartaEffectAddStream(effect, time, type, particlesPerStep, duration, xPosition, yPosition, zPosition, xRotation, yRotation, zRotation, xScale, yScale, zScale, shape, sector, distribution);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectDeserialize
`SpartaEffectDeserialize(effect, struct)` | `.Deserialize(struct)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Deserialize an effect from a struct previously created from `SpartaEffectSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaEffectDeserialize(effect, struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectDestroy
`SpartaEffectDestroy(effect)` | `.Destroy()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Destroy an effect. All types registered to an effect via `SpartaEffectAdd*` are owned by the effect and will be destroyed with the effect. Make sure you are using unique particle types with effects.

#### **Example**

```gml
SpartaEffectDestroy(effect);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectPlay
`SpartaEffectPlay(system, effect, xPosition, yPosition, zPosition)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This will fire-and-forget play an effect. If you need to reuse an effect, consider creating an effect instance and reuse that.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |
| `effect` | `Struct.__SpartaClassEffect` |  |
| `[xPosition]` | `Real` |  |
| `[yPosition]` | `Real` |  |
| `[zPosition]` | `Real` |  |

#### **Example**

```gml
SpartaEffectPlay(system, effect, xPosition, yPosition, zPosition);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectSerialize
`SpartaEffectSerialize(effect)` | `.Serialize()` ➜ `Struct`

<!-- tabs:start -->

#### **Description**

Serialize an effect to a struct. This will also serialize all particle types registered to the effect, alongside those particles children and meshes.

#### **Example**

```gml
SpartaEffectSerialize(effect);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Getters

### ...EffectIsDestroyed
`SpartaEffectIsDestroyed(effect)` | `.IsDestroyed()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Check if an effect has been destroyed.

#### **Example**

```gml
SpartaEffectIsDestroyed(effect);  // TODO: replace with a real example
```

<!-- tabs:end -->

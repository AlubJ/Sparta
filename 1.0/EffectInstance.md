# EffectInstance

## Functions

### ...EffectInstanceCreate
`SpartaEffectInstanceCreate(system, effect)` | `N/A` ➜ `Struct.__SpartaClassEffectInstance`

<!-- tabs:start -->

#### **Description**

Effect instances are containers which are for playing the effect, use one of these if you reuse an effect a lot.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |
| `effect` | `Struct.__SpartaClassEffect` |  |

#### **Example**

```gml
SpartaEffectInstanceCreate(system, effect);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectInstancePlay
`SpartaEffectInstancePlay(instance)` | `.Play()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Play the effect at the already defined coordinates.

#### **Example**

```gml
SpartaEffectInstancePlay(instance);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectInstancePlayAt
`SpartaEffectInstancePlayAt(instance, xPosition, yPosition, zPosition)` | `.PlayAt(xPosition, yPosition, zPosition)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Play the effect at specific coordinates unlike `SpartaEffectInstancePlay()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |

#### **Example**

```gml
SpartaEffectInstancePlayAt(instance, xPosition, yPosition, zPosition);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...EffectInstanceStop
`SpartaEffectInstanceStop(instance)` | `.Stop()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Stop a currently playing effect instance.

#### **Example**

```gml
SpartaEffectInstanceStop(instance);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Setters

### ...EffectInstanceSetPosition
`SpartaEffectInstanceSetPosition(instance, xPosition, yPosition, zPosition)` | `.SetPosition(xPosition, yPosition, zPosition)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set an effect instances position.

| Parameter | Type | Description |
| --- | --- | --- |
| `xPosition` | `Real` |  |
| `yPosition` | `Real` |  |
| `zPosition` | `Real` |  |

#### **Example**

```gml
SpartaEffectInstanceSetPosition(instance, xPosition, yPosition, zPosition);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Getters

### ...EffectInstanceIsPlaying
`SpartaEffectInstanceIsPlaying(instance)` | `.IsPlaying()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether an effect instance is playing.

#### **Example**

```gml
SpartaEffectInstanceIsPlaying(instance);  // TODO: replace with a real example
```

<!-- tabs:end -->

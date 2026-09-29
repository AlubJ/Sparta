# Global

## Functions

### ...CleanUp
`SpartaCleanUp()` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Cleans up the entirety of Sparta and all cached memory and dynamic resources including sprites, meshes and batch vertex buffers. Be mindful when clearing.

#### **Example**

```gml
SpartaCleanUp();  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...Burst
`SpartaBurst(system, type, x, y, z, count)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Fire-and-forget single burst of a particle type. This will create a temporary emitter, and clean itself up afterwards.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |
| `type` | `Struct.__SpartaClassType` |  |
| `x` | `Real` |  |
| `y` | `Real` |  |
| `z` | `Real` |  |
| `count` | `Real` |  |

#### **Example**

```gml
SpartaBurst(system, type, x, y, z, count);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...Stream
`SpartaStream(system, type, x, y, z, particlesPerStep, lifeSpan)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Fire-and-forget stream of a particle type. This will create a temporary emitter, and clean itself up afterwards.

| Parameter | Type | Description |
| --- | --- | --- |
| `system` | `Struct.__SpartaClassSystem` |  |
| `type` | `Struct.__SpartaClassType` |  |
| `x` | `Real` |  |
| `y` | `Real` |  |
| `z` | `Real` |  |
| `particlesPerStep` | `Real` |  |
| `lifeSpan` | `Real` |  |

#### **Example**

```gml
SpartaStream(system, type, x, y, z, particlesPerStep, lifeSpan);  // TODO: replace with a real example
```

<!-- tabs:end -->

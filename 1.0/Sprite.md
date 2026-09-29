# Sprite

## Functions

### ...SpriteAdd
`SpartaSpriteAdd(sprite)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

This function is used to pre-add a sprite to the library of sprites that sparta can use. When a sprite is needed for a particle type, that sprite has to be built into a GPU friendly version for drawing. This function allows you to add a sprite before a particle type needs that sprite.

| Parameter | Type | Description |
| --- | --- | --- |
| `sprite` | `Asset.Sprite` |  |

#### **Example**

```gml
SpartaSpriteAdd(sprite);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SpriteExists
`SpartaSpriteExists(sprite)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Check whether a particle texture has been created for use in the particle system.

| Parameter | Type | Description |
| --- | --- | --- |
| `sprite` | `Asset.Sprite` |  |

#### **Example**

```gml
SpartaSpriteExists(sprite);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...SpriteRemove
`SpartaSpriteRemove(sprite)` | `N/A` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Removes a texture from memory.

| Parameter | Type | Description |
| --- | --- | --- |
| `sprite` | `Asset.Sprite` |  |

#### **Example**

```gml
SpartaSpriteRemove(sprite);  // TODO: replace with a real example
```

<!-- tabs:end -->

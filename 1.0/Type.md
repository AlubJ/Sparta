# Type

## Functions

### ...TypeCreate
`SpartaTypeCreate()` | `N/A` ➜ `Struct.__SpartaClassType`

<!-- tabs:start -->

#### **Description**

Create a new particle type.

#### **Example**

```gml
SpartaTypeCreate();  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeCreateFromStruct
`SpartaTypeCreateFromStruct(struct)` | `N/A` ➜ `Struct.__SpartaClassType`

<!-- tabs:start -->

#### **Description**

Create a new particle type from a struct previous created with `SpartaTypeSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaTypeCreateFromStruct(struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeClone
`SpartaTypeClone(type)` | `.Clone()` ➜ `Struct.__SpartaClassType`

<!-- tabs:start -->

#### **Description**

Cloning a particle type will duplicate the type. It will not duplicate children types or the mesh vertex buffers, those will be the same reference. Destroying a cloned mesh type will destroy all references to that mesh.

#### **Example**

```gml
SpartaTypeClone(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeDeserialize
`SpartaTypeDeserialize(type, struct)` | `.Deserialize(struct)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Deserialize type data from a struct previous created with `SpartaTypeSerialize()`.

| Parameter | Type | Description |
| --- | --- | --- |
| `struct` | `Struct` |  |

#### **Example**

```gml
SpartaTypeDeserialize(type, struct);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeDestroy
`SpartaTypeDestroy(type)` | `.Destroy()` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Destroying a particle type will detatch its children types and free the mesh that it used. You should make sure that no emitters require this particle before destroy it.

#### **Example**

```gml
SpartaTypeDestroy(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSerialize
`SpartaTypeSerialize(type)` | `.Serialize()` ➜ `Struct`

<!-- tabs:start -->

#### **Description**

Convert the type into a struct that can be read back later.

#### **Example**

```gml
SpartaTypeSerialize(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Setters

### ...TypeSetAlphaTest
`SpartaTypeSetAlphaTest(type, testReference)` | `.SetAlphaTest(testReference)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the alpha test reference of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `testReference` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetAlphaTest(type, testReference);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetAngle
`SpartaTypeSetAngle(type, minStartAngle, maxStartAngle, angleSpeed, angleAcceleration, relative)` | `.SetAngle(minStartAngle, maxStartAngle, angleSpeed, angleAcceleration, relative)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the angle of a particle type. The angle is the rotation around its origin and is measured in degrees. When an angle is relative, it will turn towards it's movement direction.

| Parameter | Type | Description |
| --- | --- | --- |
| `minStartAngle` | `Real` |  |
| `maxStartAngle` | `Real` |  |
| `angleSpeed` | `Real` |  |
| `angleAcceleration` | `Real` |  |
| `relative` | `Bool` |  |

#### **Example**

```gml
SpartaTypeSetAngle(type, minStartAngle, maxStartAngle, angleSpeed, angleAcceleration, relative);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetBlend
`SpartaTypeSetBlend(type, enabled, source, destination)` | `.SetBlend(enabled, source, destination)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the blend mode of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `enabled` | `Bool` |  |
| `source` | `Constant.BlendModeFactor` |  |
| `destination` | `Constant.BlendModeFactor` |  |

#### **Example**

```gml
SpartaTypeSetBlend(type, enabled, source, destination);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetChild
`SpartaTypeSetChild(type, childType, count)` | `.SetChild(childType, count)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the child particle type of a particle type. This will spawn child particles every system step for each of the parent particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `childType` | `Struct.__SpartaClassType` |  |
| `count` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetChild(type, childType, count);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetColor
`SpartaTypeSetColor(type, color1, alpha1, color2, alpha2, color3, alpha3, color4, alpha4, choose)` | `.SetColor(color1, alpha1, color2, alpha2, color3, alpha3, color4, alpha4, choose)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the color for a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `color1` | `Constant.Color` |  |
| `alpha1` | `Real` |  |
| `[color2]` | `Constant.Color` |  |
| `[alpha2]` | `Real` |  |
| `[color3]` | `Constant.Color` |  |
| `[alpha3]` | `Real` |  |
| `[color4]` | `Constant.Color` |  |
| `[alpha4]` | `Real` |  |
| `[choose]` | `Bool` |  |

#### **Example**

```gml
SpartaTypeSetColor(type, color1, alpha1, color2, alpha2, color3, alpha3, color4, alpha4, choose);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetCullMode
`SpartaTypeSetCullMode(type, cullmode)` | `.SetCullMode(cullmode)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the cullmode of a particle type. This should only be used for mesh particle types.

| Parameter | Type | Description |
| --- | --- | --- |
| `cullmode` | `Constant.CullMode` |  |

#### **Example**

```gml
SpartaTypeSetCullMode(type, cullmode);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetDeath
`SpartaTypeSetDeath(type, deathType, count)` | `.SetDeath(deathType, count)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the death particle type of a particle type. This will spawn death particles when the parent particle dies.

| Parameter | Type | Description |
| --- | --- | --- |
| `deathType` | `Struct.__SpartaClassType` |  |
| `count` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetDeath(type, deathType, count);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetDirection
`SpartaTypeSetDirection(type, xDirection, yDirection, zDirection, angleVariation, radial)` | `.SetDirection(xDirection, yDirection, zDirection, angleVariation, radial)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the direction of a particle type. Direction is a vector.

| Parameter | Type | Description |
| --- | --- | --- |
| `xDirection` | `Real` |  |
| `yDirection` | `Real` |  |
| `zDirection` | `Real` |  |
| `angleVariation` | `Real` |  |
| `radial` | `Bool` |  |

#### **Example**

```gml
SpartaTypeSetDirection(type, xDirection, yDirection, zDirection, angleVariation, radial);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetGravity
`SpartaTypeSetGravity(type, xDirection, yDirection, zDirection, strength)` | `.SetGravity(xDirection, yDirection, zDirection, strength)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the gravity of a particle type. The direction is a vector.

| Parameter | Type | Description |
| --- | --- | --- |
| `xDirection` | `Real` |  |
| `yDirection` | `Real` |  |
| `zDirection` | `Real` |  |
| `strength` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetGravity(type, xDirection, yDirection, zDirection, strength);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetLife
`SpartaTypeSetLife(type, minLife, maxLife)` | `.SetLife(minLife, maxLife)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the life of a particle type. Life is in step units which is based on the particle systems time increment.

| Parameter | Type | Description |
| --- | --- | --- |
| `minLife` | `Real` |  |
| `maxLife` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetLife(type, minLife, maxLife);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMesh
`SpartaTypeSetMesh(type, meshBuffer, vertexFormat, batchSize)` | `.SetMesh(meshBuffer, vertexFormat, batchSize)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh of a particle type. This will build a new particle mesh which is fairly slow, it is ideal that you serialize mesh particle types. The mesh buffer and vertex format must contain position 3D (float3), normal (float3) and UV (float2) elemnts.

| Parameter | Type | Description |
| --- | --- | --- |
| `meshBuffer` | `Id.Buffer` |  |
| `vertexFormat` | `Id.VertexFormat` |  |
| `batchSize` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetMesh(type, meshBuffer, vertexFormat, batchSize);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMeshAmbientColor
`SpartaTypeSetMeshAmbientColor(type, ambientColor)` | `.SetMeshAmbientColor(ambientColor)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh ambient color of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `ambientColor` | `Constant.Color` |  |

#### **Example**

```gml
SpartaTypeSetMeshAmbientColor(type, ambientColor);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMeshLightColor
`SpartaTypeSetMeshLightColor(type, lightColor)` | `.SetMeshLightColor(lightColor)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh light color of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `lightColor` | `Constant.Color` |  |

#### **Example**

```gml
SpartaTypeSetMeshLightColor(type, lightColor);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMeshLightDirection
`SpartaTypeSetMeshLightDirection(type, xDirection, yDirection, zDirection)` | `.SetMeshLightDirection(xDirection, yDirection, zDirection)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh light direction of a particle type. The direction is a vector.

| Parameter | Type | Description |
| --- | --- | --- |
| `xDirection` | `Real` |  |
| `yDirection` | `Real` |  |
| `zDirection` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetMeshLightDirection(type, xDirection, yDirection, zDirection);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMeshRotationAxis
`SpartaTypeSetMeshRotationAxis(type, xAxis, yAxis, zAxis, angle)` | `.SetMeshRotationAxis(xAxis, yAxis, zAxis, angle)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh rotation axis of a particle type. This is required when using particle rotations otherwise the mesh will not rotate.

| Parameter | Type | Description |
| --- | --- | --- |
| `xAxis` | `Real` |  |
| `yAxis` | `Real` |  |
| `zAxis` | `Real` |  |
| `angle` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetMeshRotationAxis(type, xAxis, yAxis, zAxis, angle);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetMeshTexture
`SpartaTypeSetMeshTexture(type, sprite)` | `.SetMeshTexture(sprite)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the mesh texture of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `sprite` | `Asset.Sprite` |  |

#### **Example**

```gml
SpartaTypeSetMeshTexture(type, sprite);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetScale
`SpartaTypeSetScale(type, xScale, yScale)` | `.SetScale(xScale, yScale)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the scale speed of a particle type. Scale is used for oscilating the scale on a given axis by a speed, and is only used for sprite particles. This can be used to give the particle a 3D effect as if it is spinning.

| Parameter | Type | Description |
| --- | --- | --- |
| `xScale` | `Real` |  |
| `yScale` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetScale(type, xScale, yScale);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetSize
`SpartaTypeSetSize(type, minStartSize, maxStartSize, sizeSpeed, sizeAcceleration, minClamp, maxClamp)` | `.SetSize(minStartSize, maxStartSize, sizeSpeed, sizeAcceleration, minClamp, maxClamp)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the size of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `minStartSize` | `Real` |  |
| `maxStartSize` | `Real` |  |
| `sizeSpeed` | `Real` |  |
| `sizeAcceleration` | `Real` |  |
| `minClamp` | `Real` |  |
| `maxClamp` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetSize(type, minStartSize, maxStartSize, sizeSpeed, sizeAcceleration, minClamp, maxClamp);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetSpeed
`SpartaTypeSetSpeed(type, minStartSpeed, maxStartSpeed, acceleration, jerk)` | `.SetSpeed(minStartSpeed, maxStartSpeed, acceleration, jerk)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the speed of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `minStartSpeed` | `Real` |  |
| `maxStartSpeed` | `Real` |  |
| `acceleration` | `Real` |  |
| `jerk` | `Real` |  |

#### **Example**

```gml
SpartaTypeSetSpeed(type, minStartSpeed, maxStartSpeed, acceleration, jerk);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetSprite
`SpartaTypeSetSprite(type, sprite, speed, randomize)` | `.SetSprite(sprite, speed, randomize)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the sprite of a particle type. When speed is set to `-1`, the sprite will animate its image over the course of the particles life.

| Parameter | Type | Description |
| --- | --- | --- |
| `sprite` | `Asset.Sprite` |  |
| `speed` | `Real` |  |
| `randomize` | `Bool` |  |

#### **Example**

```gml
SpartaTypeSetSprite(type, sprite, speed, randomize);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeSetZWrite
`SpartaTypeSetZWrite(type, zWrite)` | `.SetZWrite(zWrite)` ➜ `N/A`

<!-- tabs:start -->

#### **Description**

Set the depth z write of a particle type.

| Parameter | Type | Description |
| --- | --- | --- |
| `zWrite` | `Bool` |  |

#### **Example**

```gml
SpartaTypeSetZWrite(type, zWrite);  // TODO: replace with a real example
```

<!-- tabs:end -->

## Getters

### ...TypeGetAlphaTest
`SpartaTypeGetAlphaTest(type)` | `.GetAlphaTest()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the alpha test reference of a particle type.

#### **Example**

```gml
SpartaTypeGetAlphaTest(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetAngle
`SpartaTypeGetAngle(type)` | `.GetAngle()` ➜ `Array`
**Returns:** An array of values mapped as `[minStartAngle, maxStartAngle, angleSpeed, angleAcceleration]`.

<!-- tabs:start -->

#### **Description**

Get the angle of a particle type.

#### **Example**

```gml
SpartaTypeGetAngle(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetAngleRelative
`SpartaTypeGetAngleRelative(type)` | `.GetAngleRelative()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether the angle of a particle type is relative.

#### **Example**

```gml
SpartaTypeGetAngleRelative(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetBlend
`SpartaTypeGetBlend(type)` | `.GetBlend()` ➜ `Struct`
**Returns:** A struct with the properties `{enabled, source, destrination}`.

<!-- tabs:start -->

#### **Description**

Get the blend of a particle type.

#### **Example**

```gml
SpartaTypeGetBlend(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetChild
`SpartaTypeGetChild(type)` | `.GetChild()` ➜ `Struct`
**Returns:** A struct with the properties `{particleType, count}`.

<!-- tabs:start -->

#### **Description**

Get the child type of a particle type.

#### **Example**

```gml
SpartaTypeGetChild(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetColor
`SpartaTypeGetColor(type)` | `.GetColor()` ➜ `Array`
**Returns:** An array of values mapped as `[red, green, blue, alpha] * 4`.

<!-- tabs:start -->

#### **Description**

Get the color of a particle type.

#### **Example**

```gml
SpartaTypeGetColor(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetColorType
`SpartaTypeGetColorType(type)` | `.GetColorType()` ➜ `Real`

<!-- tabs:start -->

#### **Description**

Get the color type of a particle type.

#### **Example**

```gml
SpartaTypeGetColorType(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetCullMode
`SpartaTypeGetCullMode(type)` | `.GetCullMode()` ➜ `Constant.CullMode`

<!-- tabs:start -->

#### **Description**

Get the cullmode of a particle type.

#### **Example**

```gml
SpartaTypeGetCullMode(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetDeath
`SpartaTypeGetDeath(type)` | `.GetDeath()` ➜ `Struct`
**Returns:** A struct with the properties `{particleType, count}`.

<!-- tabs:start -->

#### **Description**

Get the death type of a particle type.

#### **Example**

```gml
SpartaTypeGetDeath(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetDirection
`SpartaTypeGetDirection(type)` | `.GetDirection()` ➜ `Array`
**Returns:** An array of values mapped as `[xDirection, yDirection, zDirection, angleVariation]`.

<!-- tabs:start -->

#### **Description**

Get the direction of a particle type.

#### **Example**

```gml
SpartaTypeGetDirection(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetDirectionRadial
`SpartaTypeGetDirectionRadial(type)` | `.GetDirectionRadial()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether the direction of a particle type is radial.

#### **Example**

```gml
SpartaTypeGetDirectionRadial(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetGravity
`SpartaTypeGetGravity(type)` | `.GetGravity()` ➜ `Array`
**Returns:** An array of values mapped as `[xDirection, yDirection, zDirection]`.

<!-- tabs:start -->

#### **Description**

Get the gravity of a particle type.

#### **Example**

```gml
SpartaTypeGetGravity(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetLife
`SpartaTypeGetLife(type)` | `.GetLife()` ➜ `Array`
**Returns:** An array of values mapped as `[minLife, maxLife]`.

<!-- tabs:start -->

#### **Description**

Get the life of a particle type.

#### **Example**

```gml
SpartaTypeGetLife(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetMesh
`SpartaTypeGetMesh(type)` | `.GetMesh()` ➜ `Id.VertexBuffer`

<!-- tabs:start -->

#### **Description**

Get the mesh of a particle type.

#### **Example**

```gml
SpartaTypeGetMesh(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetMeshAmbientColor
`SpartaTypeGetMeshAmbientColor(type)` | `.GetMeshAmbientColor()` ➜ `Array`
**Returns:** An array of values mapped as `[red, green, blue]`.

<!-- tabs:start -->

#### **Description**

Get the mesh ambient color of a particle type.

#### **Example**

```gml
SpartaTypeGetMeshAmbientColor(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetMeshLightColor
`SpartaTypeGetMeshLightColor(type)` | `.GetMeshLightColor()` ➜ `Array`
**Returns:** An array of values mapped as `[red, green, blue]`.

<!-- tabs:start -->

#### **Description**

Get the mesh light color of a particle type.

#### **Example**

```gml
SpartaTypeGetMeshLightColor(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetMeshLightDirection
`SpartaTypeGetMeshLightDirection(type)` | `.GetMeshLightDirection()` ➜ `Array`
**Returns:** An array of values mapped as `[xDirection, yDirection, zDirection]`.

<!-- tabs:start -->

#### **Description**

Get the mesh light direction of a particle type.

#### **Example**

```gml
SpartaTypeGetMeshLightDirection(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetMeshRotationAxis
`SpartaTypeGetMeshRotationAxis(type)` | `.GetMeshRotationAxis()` ➜ `Array`
**Returns:** An array of values mapped as `[xAxis, yAxis, zAxis, axisAngle]`.

<!-- tabs:start -->

#### **Description**

Get the mesh rotation axis of a particle type.

#### **Example**

```gml
SpartaTypeGetMeshRotationAxis(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetScale
`SpartaTypeGetScale(type)` | `.GetScale()` ➜ `Array`
**Returns:** An array of values mapped as `[xScaleSpeed, yScaleSpeed]`.

<!-- tabs:start -->

#### **Description**

Get the scale of a particle type.

#### **Example**

```gml
SpartaTypeGetScale(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetSize
`SpartaTypeGetSize(type)` | `.GetSize()` ➜ `Array`
**Returns:** An array of values mapped as `[minStartSize, maxStartSize, sizeSpeed, sizeAcceleration]`.

<!-- tabs:start -->

#### **Description**

Get the size of a particle type.

#### **Example**

```gml
SpartaTypeGetSize(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetSizeClamp
`SpartaTypeGetSizeClamp(type)` | `.GetSizeClamp()` ➜ `Array`
**Returns:** An array of values mapped as `[minClamp, maxClamp]`.

<!-- tabs:start -->

#### **Description**

Get the size clamp of a particle type.

#### **Example**

```gml
SpartaTypeGetSizeClamp(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetSpeed
`SpartaTypeGetSpeed(type)` | `.GetSpeed()` ➜ `Array`
**Returns:** An array of values mapped as `[minStartSpeed, maxStartSpeed, acceleration, jerk]`.

<!-- tabs:start -->

#### **Description**

Get the speed of a particle type.

#### **Example**

```gml
SpartaTypeGetSpeed(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetSprite
`SpartaTypeGetSprite(type)` | `.GetSprite()` ➜ `Asset.Sprite`

<!-- tabs:start -->

#### **Description**

Get the sprite of a particle type.

#### **Example**

```gml
SpartaTypeGetSprite(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetType
`SpartaTypeGetType(type)` | `.GetType()` ➜ `Struct.__SpartaClassType`

<!-- tabs:start -->

#### **Description**

Get the type of a particle type.

#### **Example**

```gml
SpartaTypeGetType(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeGetZWrite
`SpartaTypeGetZWrite(type)` | `.GetZWrite()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get the z write of a particle type.

#### **Example**

```gml
SpartaTypeGetZWrite(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

### ...TypeIsDestroyed
`SpartaTypeIsDestroyed(type)` | `.IsDestroyed()` ➜ `Bool`

<!-- tabs:start -->

#### **Description**

Get whether a particle type is destroyed.

#### **Example**

```gml
SpartaTypeIsDestroyed(type);  // TODO: replace with a real example
```

<!-- tabs:end -->

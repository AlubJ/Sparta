# Mesh Particles
Typically, particles are flat billboards and do not offer any sort of depth. These are great for performance but there may be times you want mesh based particles. Sparta offers this. All we have to do is create a particle type with a mesh.

## Vertex Format
Before creating a mesh particle, you'll need a valid vertex format to create the mesh from. The order of the vertex format doesn't matter but you will need these properties and associated types in the format.

| Usage | Type |
| --- | ---  |
| `Position` | `Float3` |
| `Normal` | `Float3` |
| `Texcoord` | `Float2` |

```gml
// The order doesn't matter here, only the properties and types.
vertex_format_begin();
vertex_format_add_position_3d();
vertex_format_add_normal();
vertex_format_add_texcoord();
vertexFormat = vertex_format_end();
```

## Loading a Mesh
Your mesh can be loaded however you like, the only thing that matters to Sparta is that the mesh is provided as a raw buffer containing the vertex data. The vertex format is passed in to parse the vertex data correctly. How the mesh is loaded into memory is entirely up to you, they key point is it should be the buffer right before calling `vertex_create_buffer_from_buffer()`

```gml
var _meshBuffer = buffer_load("mesh.vbx");
```

```gml
var _vertexBuffer = LoadOBJ("mesh.obj");
var _meshBuffer = buffer_create_from_vertex_buffer(_vertexBuffer, buffer_fixed, 1);
```

?> These are examples of how to load your mesh data, your game may require different methods.

## Setting a Mesh
We then need to set our mesh to the particle type. We can use the same particle type from the previous guide, but instead of setting the sprite we set the mesh and texture instead. We will also want a batch size for the mesh, which can range from `1` to `255`.

!> It is important to note that `SpartaTypeSetSprite()` and `SpartaTypeSetMeshTexture()` are different functions. You must only use `SpartaTypeSetSprite()` when you want billboard particles as this function will free the mesh buffer that is created. If you want a texture on your mesh particle, use `SpartaTypeSetMeshTexture()`.
!> Remember to call `SpartaTypeDestroy()` to clean up memory when you're done with your mesh particle.

```gml
SpartaTypeSetMesh(particleType, _meshBuffer, vertexFormat, 255);
```

## Full Code
This is what a full mesh particle type creation could look like.

```gml
// Set the mesh
var _meshBuffer = buffer_load("gm.vbx");
SpartaTypeSetMesh(particleType, _meshBuffer, vertexFormat, 255);
buffer_delete(_meshBuffer);

SpartaTypeSetMeshRotationAxis(particleType, 1, 1, -1, 0);
SpartaTypeSetMeshLightDirection(particleType, 1, 1, 1, 0);

// Set the visual properties
SpartaTypeSetSize(particleType, 0.5, 1, 0, -0.01, 0, 1);
SpartaTypeSetColor(particleType, c_green, 0, c_yellow, 1, c_blue, 1, c_red, 0, false);
SpartaTypeSetZWrite(particleType, true);
SpartaTypeSetCullMode(particleType, cull_counterclockwise);

// Set the behavioral properties
SpartaTypeSetLife(particleType, 2, 5);
SpartaTypeSetDirection(particleType, 0, 0, 1, 10, false);
SpartaTypeSetGravity(particleType, 0, 0, -1, 1);
SpartaTypeSetSpeed(particleType, 2, 5, -0.1, 0);
SpartaTypeSetAngle(particleType, 0, 360, 1, 1, false);
```

[demo](assets/demo/index.html?--demo&1 ':include width=100% frameBorder=0')
// Feather disable all

///
/// Set the mesh of a particle type. This will build a new particle
/// mesh which is fairly slow, it is ideal that you serialize mesh
/// particle types. The mesh buffer and vertex format must contain
/// position 3D (float3), normal (float3) and UV (float2) elemnts.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Id.Buffer} meshBuffer
/// @param {Id.VertexFormat} vertexFormat
/// @param {Real} batchSize
function SpartaTypeSetMesh(_type, _meshBuffer, _vertexFormat, _batchSize)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMesh(_meshBuffer, _vertexFormat, _batchSize);
}
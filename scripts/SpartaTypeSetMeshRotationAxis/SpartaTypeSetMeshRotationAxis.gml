// Feather disable all

///
/// Set the mesh rotation axis of a particle type. This is required when using
/// particle rotations otherwise the mesh will not rotate.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} xAxis
/// @param {Real} yAxis
/// @param {Real} zAxis
/// @param {Real} angle
function SpartaTypeSetMeshRotationAxis(_type, _xAxis, _yAxis, _zAxis, _angle)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMeshRotationAxis(_xAxis, _yAxis, _zAxis, _angle);
}
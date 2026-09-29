// Feather disable all

///
/// Set the mesh light direction of a particle type. The direction is a vector.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} xDirection
/// @param {Real} yDirection
/// @param {Real} zDirection
function SpartaTypeSetMeshLightDirection(_type, _xDirection, _yDirection, _zDirection)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMeshLightDirection(_xDirection, _yDirection, _zDirection);
}
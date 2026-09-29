// Feather disable all

///
/// Get the mesh light direction of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetMeshLightDirection(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetMeshLightDirection();
}
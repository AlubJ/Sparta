// Feather disable all

///
/// Get the mesh light color of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetMeshLightColor(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetMeshLightColor();
}
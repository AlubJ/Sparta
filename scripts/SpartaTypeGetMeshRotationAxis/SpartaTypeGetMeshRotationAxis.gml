// Feather disable all

///
/// Get the mesh rotation axis of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetMeshRotationAxis(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetMeshRotationAxis();
}
// Feather disable all

///
/// Destroying a particle type will detatch its children types and free the mesh that it
/// used. You should make sure that no emitters require this particle before destroy it.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeDestroy(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.Destroy();
}
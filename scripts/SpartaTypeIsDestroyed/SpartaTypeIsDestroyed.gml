// Feather disable all

///
/// Get whether a particle type is destroyed.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeIsDestroyed(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.IsDestroyed();
}
// Feather disable all

///
/// Get the direction of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetDirection(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetDirection();
}
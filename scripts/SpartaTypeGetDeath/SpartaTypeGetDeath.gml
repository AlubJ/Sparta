// Feather disable all

///
/// Get the death type of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetDeath(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetDeath();
}
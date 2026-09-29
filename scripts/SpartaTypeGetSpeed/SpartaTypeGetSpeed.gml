// Feather disable all

///
/// Get the speed of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetSpeed(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetSpeed();
}
// Feather disable all

///
/// Get the angle of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetAngle(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetAngle();
}
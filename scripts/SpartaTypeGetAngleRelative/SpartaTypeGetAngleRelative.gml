// Feather disable all

///
/// Get whether the angle of a particle type is relative.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetAngleRelative(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetAngleRelative();
}
// Feather disable all

///
/// Get the size clamp of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetSizeClamp(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetSizeClamp();
}
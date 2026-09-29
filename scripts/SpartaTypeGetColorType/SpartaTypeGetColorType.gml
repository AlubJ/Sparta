// Feather disable all

///
/// Get the color type of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetColorType(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetColorType();
}
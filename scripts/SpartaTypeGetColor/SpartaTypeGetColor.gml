// Feather disable all

///
/// Get the color of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetColor(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetColor();
}
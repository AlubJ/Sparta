// Feather disable all

///
/// Set the depth z write of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Bool} zWrite
function SpartaTypeSetZWrite(_type, _zWrite)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetZWrite(_zWrite);
}
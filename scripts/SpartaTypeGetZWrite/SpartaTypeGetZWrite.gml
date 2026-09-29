// Feather disable all

///
/// Get the z write of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetZWrite(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetZWrite();
}
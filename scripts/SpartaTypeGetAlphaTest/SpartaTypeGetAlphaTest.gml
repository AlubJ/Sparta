// Feather disable all

///
/// Get the alpha test reference of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetAlphaTest(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetAlphaTest();
}
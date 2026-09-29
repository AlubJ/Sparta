// Feather disable all

///
/// Get the cullmode of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetCullMode(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetCullMode();
}
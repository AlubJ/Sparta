// Feather disable all

///
/// Get the size of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetSize(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetSize();
}
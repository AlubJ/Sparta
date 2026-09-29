// Feather disable all

///
/// Get the type of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetType(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetType();
}
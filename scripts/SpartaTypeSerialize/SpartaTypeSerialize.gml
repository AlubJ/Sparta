// Feather disable all

///
/// Convert the type into a struct that can be read back later.
///
/// @param {Struct.__SpartaClassType} type The type
function SpartaTypeSerialize(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.Serialize();
}
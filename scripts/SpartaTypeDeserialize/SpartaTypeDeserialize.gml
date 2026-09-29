// Feather disable all

///
/// Deserialize type data from a struct.
///
/// @param {Struct.__SpartaClassType} type The type
/// @param {Struct} struct
function SpartaTypeDeserialize(_type, _struct)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.Deserialize(_struct);
}
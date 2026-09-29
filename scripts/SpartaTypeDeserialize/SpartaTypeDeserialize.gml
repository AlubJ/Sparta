// Feather disable all

///
/// Deserialize type data from a struct previous created with `SpartaTypeSerialize()`.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Struct} struct
function SpartaTypeDeserialize(_type, _struct)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.Deserialize(_struct);
}
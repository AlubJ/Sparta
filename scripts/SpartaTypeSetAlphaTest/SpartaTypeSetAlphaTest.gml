// Feather disable all

///
/// Set the alpha test reference of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} testReference
function SpartaTypeSetAlphaTest(_type, _testReference)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetAlphaTest(_testReference);
}
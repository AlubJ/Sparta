// Feather disable all

///
/// Get the sprite of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
function SpartaTypeGetSprite(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetSprite();
}
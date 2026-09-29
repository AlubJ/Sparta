// Feather disable all

///
/// Set the death particle type of a particle type. This will spawn death particles
/// when the parent particle dies.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Struct.__SpartaClassType} deathType
/// @param {Real} count
function SpartaTypeSetDeath(_type, _deathType, _count)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetDeath(_deathType, _count);
}
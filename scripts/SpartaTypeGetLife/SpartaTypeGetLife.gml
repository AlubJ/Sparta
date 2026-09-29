// Feather disable all

///
/// Get the life of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetLife(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetLife();
}
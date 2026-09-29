// Feather disable all

///
/// Get the child type of a particle type.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetChild(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetChild();
}
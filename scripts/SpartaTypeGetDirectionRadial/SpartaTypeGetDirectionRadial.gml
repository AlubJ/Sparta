// Feather disable all

///
/// Get whether the direction of a particle type is radial.
///
/// @param {Struct.__SpartaClassType} type
function SpartaTypeGetDirectionRadial(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    return _type.GetDirectionRadial();
}
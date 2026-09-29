// Feather disable all

///
/// Set the child particle type of a particle type. This will spawn child particles
/// every system step for each of the parent particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Struct.__SpartaClassType} childType
/// @param {Real} count
function SpartaTypeSetChild(_type, _childType, _count)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetChild(_childType, _count);
}
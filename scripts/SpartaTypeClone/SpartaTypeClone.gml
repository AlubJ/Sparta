// Feather disable all

///
/// Cloning a particle type will duplicate the entire type apart from the
/// mesh vertex buffer and child particle types.
///
/// @param {Struct.__SpartaClassType} type The type
function SpartaTypeClone(_type)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    var _childType = _type.__childType;
    var _deathType = _type.__deathType;
    
    _type.__childType = undefined;
    _type.__deathType = undefined;
    
    var _clone = variable_clone(_type);
    
    _type.__childType = _childType;
    _type.__deathType = _deathType;
    _clone.__childType = _childType;
    _clone.__deathType = _deathType;
    
    return _clone;
}
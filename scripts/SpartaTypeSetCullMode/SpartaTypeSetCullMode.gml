// Feather disable all

///
/// Set the cullmode of a particle type. This should only be used for mesh
/// particle types.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Constant.CullMode} cullmode
function SpartaTypeSetCullMode(_type, _cullmode)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetCullMode(_cullmode);
}
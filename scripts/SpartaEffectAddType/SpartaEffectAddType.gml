// Feather disable all

/// 
/// Add a particle type to an effect.
///
/// @param {Struct.__SpartaClassEffect} effect
/// @param {Struct.__SpartaClassType} type
function SpartaEffectAddType(_effect, _type)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    _effect.AddType(_type);
}
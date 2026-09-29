// Feather disable all

/// 
/// Serialize an effect to a struct
///
/// @param {Struct.__SpartaClassEffect} effect
function SpartaEffectSerialize(_effect)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    _effect.Serialize();
}
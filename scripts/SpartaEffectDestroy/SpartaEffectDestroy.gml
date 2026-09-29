// Feather disable all

/// 
/// Destroy an effect.
///
/// @param {Struct.__SpartaClassEffect} effect
function SpartaEffectDestroy(_effect)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    _effect.Destroy();
}
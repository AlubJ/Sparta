// Feather disable all

/// 
/// Check if an effect is destroyed.
///
/// @param {Struct.__SpartaClassEffect} effect
function SpartaEffectIsDestroyed(_effect)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    return _effect.IsDestroyed();
}
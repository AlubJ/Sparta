// Feather disable all

/// 
/// Destroy an effect. All types registered to an effect via `SpartaEffectAdd*`
/// are owned by the effect and will be destroyed with the effect. Make sure
/// you are using unique particle types with effects.
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
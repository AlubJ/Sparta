// Feather disable all

/// 
/// Play the effect at the already defined coordinates.
///
/// @param {Struct.__SpartaClassEffectInstance} instance
function SpartaEffectInstancePlay(_instance)
{
    if (!__SpartaEnsureEffectInstance(_instance))
    {
        __SpartaError("Effect instance passed in is invalid.");
    }
    
    _instance.Play();
}
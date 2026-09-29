// Feather disable all

/// 
/// Get whether an effect instance is playing.
///
/// @param {Struct.__SpartaClassEffectInstance} instance
function SpartaEffectInstanceIsPlaying(_instance)
{
    if (!__SpartaEnsureEffectInstance(_instance))
    {
        __SpartaError("Effect instance passed in is invalid.");
    }
    
    return _instance.IsPlaying();
}
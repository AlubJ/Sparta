// Feather disable all

/// 
/// This will stop a currently playing effect instance.
///
/// @param {Struct.__SpartaClassEffectInstance} instance
function SpartaEffectInstanceStop(_instance)
{
    if (!__SpartaEnsureEffectInstance(_instance))
    {
        __SpartaError("Effect instance passed in is invalid.");
    }
    
    _instance.Stop();
}
// Feather disable all

/// 
/// Deserialize an effect from a struct previously created from `SpartaEffectSerialize()`.
///
/// @param {Struct.__SpartaClassEffect} effect
/// @param {Struct} struct
function SpartaEffectDeserialize(_effect, _struct)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    _effect.Deserialize(_struct);
}
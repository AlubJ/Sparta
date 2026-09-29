// Feather disable all

/// 
/// Serialize an effect to a struct. This will also serialize all particle types registered
/// to the effect, alongside those particles children and meshes.
///
/// @param {Struct.__SpartaClassEffect} effect
function SpartaEffectSerialize(_effect)
{
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    return _effect.Serialize();
}
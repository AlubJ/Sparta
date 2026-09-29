// Feather disable all

/// 
/// Effect instances are containers which are for playing the effect,
/// use one of these if you reuse an effect a lot.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Struct.__SpartaClassEffect} effect
function SpartaEffectInstanceCreate(_system, _effect)
{
    return new __SpartaClassEffectInstance(_system, _effect);
}
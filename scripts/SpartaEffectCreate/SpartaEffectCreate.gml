// Feather disable all

/// 
/// Effects are set instructions and particles types that can play over time,
/// these are useful for reusable effects that you may want to have ready at
/// once. All types that belong to an effect should be added via
/// `SpartaEffectAddType` so memory cleanup can occur.
///
function SpartaEffectCreate()
{
    return new __SpartaClassEffect();
}
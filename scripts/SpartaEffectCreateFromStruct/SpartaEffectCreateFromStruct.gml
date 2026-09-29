// Feather disable all

/// 
/// Create an effect from a struct previously created from `SpartaEffectSerialize()`.
///
/// @param {Struct} struct
function SpartaEffectCreateFromStruct(_struct)
{
    return new __SpartaClassEffect().Deserialize(_struct);
}
// Feather disable all

/// 
/// Create an effect from a struct.
///
function SpartaEffectCreateFromStruct(_struct)
{
    return new __SpartaClassEffect().Deserialize(_struct);
}
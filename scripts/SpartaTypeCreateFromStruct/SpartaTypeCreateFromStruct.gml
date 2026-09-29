// Feather disable all

///
/// Create a new particle type from a struct previous created with `SpartaTypeSerialize()`.
///
/// @param {Struct} struct
function SpartaTypeCreateFromStruct(_struct)
{
    var _type = new __SpartaClassType();
    return _type.Deserialize(_struct);
}
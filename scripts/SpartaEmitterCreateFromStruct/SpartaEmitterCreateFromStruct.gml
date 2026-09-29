// Feather disable all

///
/// Create a new particle type from a struct previously created from `SpartaEmitterSerialize()`.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Struct} struct
function SpartaEmitterCreateFromStruct(_system, _struct)
{
    var _emitter = new __SpartaClassEmitter(_system);
    return _emitter.Deserialize(_struct);
}
// Feather disable all

///
/// Create a new particle type from a struct.
///
/// @param {Struct.__SpartaClassSystem} system The system that the emitter will use.
/// @param {Struct} struct
function SpartaEmitterCreateFromStruct(_system, _struct)
{
    var _emitter = new __SpartaClassEmitter(_system);
    return _emitter.Deserialize(_struct);
}
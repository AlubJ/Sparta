// Feather disable all

///
/// Create a new emitter. An emitter is responsible for emitting a specific particle
/// type. An emitter can only emit one particle type at any given time.
///
/// @param {Struct.__SpartaClassSystem} system
function SpartaEmitterCreate(_system)
{
    return new __SpartaClassEmitter(_system);
}
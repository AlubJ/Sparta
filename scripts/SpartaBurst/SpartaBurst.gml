// Feather disable all

///
/// Fire-and-forget single burst of a particle type.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Struct.__SpartaClassType} type
/// @param {Real} x
/// @param {Real} y
/// @param {Real} z
/// @param {Real} count
function SpartaBurst(_system, _type, _x, _y, _z, _count)
{
    var _emitter = SpartaEmitterCreate(_system);
    _emitter.SetRegion(_x, _y, _z, 0, 0, 0, 1, 1, 1);
    _emitter.Burst(_type, _count);
}
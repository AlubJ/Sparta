// Feather disable all

///
/// Fire-and-forget stream of a particle type.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Struct.__SpartaClassType} type
/// @param {Real} x
/// @param {Real} y
/// @param {Real} z
/// @param {Real} particlesPerStep
/// @param {Real} lifeSpan
function SpartaStream(_system, _type, _x, _y, _z, _particlesPerStep, _lifeSpan)
{
    if (_lifeSpan < 0 || _lifeSpan > 1_000)
    {
        __SpartaError($"Fire-and-forget stream with a life span of {_lifeSpan} exceeds the bounds of (0, 1,000)");
    }
    
    var _emitter = SpartaEmitterCreate(_system);
    _emitter.SetRegion(_x, _y, _z, 0, 0, 0, 1, 1, 1);
    _emitter.Stream(_type, _particlesPerStep, _lifeSpan);
}
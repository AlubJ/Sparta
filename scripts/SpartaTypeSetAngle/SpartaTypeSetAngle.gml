// Feather disable all

///
/// Set the angle of a particle type. The angle is the rotation around its
/// origin and is measured in degrees. When an angle is relative, it will
/// turn towards it's movement direction.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} minStartAngle
/// @param {Real} maxStartAngle
/// @param {Real} angleSpeed
/// @param {Real} angleAcceleration
/// @param {Bool} relative
function SpartaTypeSetAngle(_type, _minStartAngle, _maxStartAngle, _angleSpeed, _angleAcceleration, _relative)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetAngle(_minStartAngle, _maxStartAngle, _angleSpeed, _angleAcceleration, _relative);
}
// Feather disable all

///
/// Set the speed of a particle type.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} minStartSpeed
/// @param {Real} maxStartSpeed
/// @param {Real} acceleration
/// @param {Real} jerk
function SpartaTypeSetSpeed(_type, _minStartSpeed, _maxStartSpeed, _acceleration, _jerk)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetSpeed(_minStartSpeed, _maxStartSpeed, _acceleration, _jerk);
}
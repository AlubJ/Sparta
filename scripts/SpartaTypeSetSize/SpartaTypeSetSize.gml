// Feather disable all

///
/// Set the size of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Real} minStartSize
/// @param {Real} maxStartSize
/// @param {Real} sizeSpeed
/// @param {Real} sizeAcceleration
/// @param {Real} minClamp
/// @param {Real} maxClamp
function SpartaTypeSetSize(_type, _minStartSize, _maxStartSize, _sizeSpeed, _sizeAcceleration, _minClamp, _maxClamp)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetSize(_minStartSize, _maxStartSize, _sizeSpeed, _sizeAcceleration, _minClamp, _maxClamp);
}
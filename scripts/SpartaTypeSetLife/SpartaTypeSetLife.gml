// Feather disable all

///
/// Set the life of a particle type. Life is in step units which is based on
/// the particle systems time increment.
///
/// @param {Struct.__SpartaClassType} type The type.
/// @param {Real} minLife
/// @param {Real} maxLife
function SpartaTypeSetLife(_type, _minLife, _maxLife)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetLife(_minLife, _maxLife);
}
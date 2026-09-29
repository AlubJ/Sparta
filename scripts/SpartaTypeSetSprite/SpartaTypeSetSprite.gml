// Feather disable all

///
/// Set the sprite of a particle type. When speed is set to `-1`, the
/// sprite will animate its image over the course of the particles life.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Asset.Sprite} sprite
/// @param {Real} speed
/// @param {Bool} randomize
function SpartaTypeSetSprite(_type, _sprite, _speed, _randomize)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetSprite(_sprite, _speed, _randomize);
}
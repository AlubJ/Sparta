// Feather disable all

/// 
/// Check whether a particle texture has been created for use in the particle system.
/// 
/// @param {Asset.Sprite} sprite The sprite
function SpartaSpriteExists(_sprite)
{
    static _system = __SpartaSystem();
    
    with (_system)
    {
        if (!sprite_exists(_sprite))
        {
            __SpartaError($"Sprite asset `{_sprite}` does not exist.");
        }
        
        return __sprites[$ _sprite] != undefined;
    }
}
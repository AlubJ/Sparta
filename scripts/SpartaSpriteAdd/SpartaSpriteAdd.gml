// Feather disable all

/// 
/// This function is used to pre-add a sprite to the library of sprites that
/// sparta can use. When a sprite is needed for a particle type, that sprite
/// has to be built into a GPU friendly version for drawing. This function
/// allows you to add a sprite before a particle type needs that sprite.
/// 
/// @param {Asset.Sprite} sprite The sprite to use
function SpartaSpriteAdd(_sprite)
{
    static _system = __SpartaSystem();
    
    with (_system)
    {
        if (!sprite_exists(_sprite))
        {
            __SpartaError($"Sprite `{_sprite}` does not exist.");
        }
        
        __SpartaTextureCreate(_sprite, sprite_get_width(_sprite), sprite_get_height(_sprite), sprite_get_number(_sprite));
    }
}
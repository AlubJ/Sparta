// Feather disable all

/// 
/// Removes a texture from memory.
/// 
/// @param {Asset.Sprite} sprite
function SpartaSpriteRemove(_sprite)
{
    static _system = __SpartaSystem();
    
    with (_system)
    {
        if (!sprite_exists(_sprite))
        {
            __SpartaError($"Sprite asset `{_sprite}` does not exist.");
        }
        
        if (__sprites[$ _sprite] != undefined)
        {
            sprite_delete(__sprites[$ _sprite]);
            variable_struct_remove(__sprites, _sprite);
        }
    }
}
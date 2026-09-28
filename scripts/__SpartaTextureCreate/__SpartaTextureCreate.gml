// Feather disable all

/// 
/// This function will create a GPU friendly texture for use
/// in particle types.
///
function __SpartaTextureCreate(_sprite, _spriteWidth, _spriteHeight, _imageCount)
{
    gpu_push_state();
    gpu_set_zwriteenable(false);
    gpu_set_blendmode_ext(bm_one, bm_zero);
    
    var _surfaceWidth = power(2, round(log2(_spriteWidth * _imageCount)));
    var _surfaceHeight = power(2, round(log2(_spriteHeight)));
    var _surface = surface_create(_surfaceWidth, _surfaceHeight);
    
    surface_set_target(_surface);
    draw_clear_alpha(c_white, 0);
    
    var _i = 0;
    repeat(_imageCount)
    {
        draw_sprite_stretched(_sprite, _i, _i / _imageCount * _surfaceWidth, 0, _surfaceWidth / _imageCount, _surfaceHeight);
        _i++;
    }
    
    surface_reset_target();
    
    var _texture = sprite_create_from_surface(_surface, 0, 0, _surfaceWidth, _surfaceHeight, 0, 0, 0, 0);
    surface_free(_surface);
    
    gpu_pop_state();
    
    return _texture;
}
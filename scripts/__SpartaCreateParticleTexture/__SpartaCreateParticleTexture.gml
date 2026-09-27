function __SpartaCreateParticleTexture(_sprite, _spriteWidth, _spriteHeight, _imageCount)
{
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
    }
    
    surface_reset_target();
    
    var _texture = sprite_create_from_surface(_surface, 0, 0, _surfaceWidth, _surfaceHeight, 0, 0, 0, 0);
    surface_free(_surface);
    
    gpu_set_blendmode(bm_normal);
    
    return _texture;
}
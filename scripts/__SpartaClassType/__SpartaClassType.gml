function __SpartaClassType() constructor
{
    static _sprites = __SpartaSystem().__sprites;
    
    __type = SPARTA_TYPE_DEFAULT;
    
    __sprite = undefined;
    __spriteOrigin = [ 0, 0 ];
    __spriteSettings = [ 0, 0, 0, 0 ];
    
    __size = [ 32, 32, 0, 0 ];
    __sizeClamp = [ 0, 10 ];
    __scale = [ 0, 0 ];
    __speed = [ 0, 0, 0, 0 ];
    __direction = [ 0, 0, 1, 0 ];
    __directionRadial = false;
    __gravity = [ 0, 0, 0 ];
    __life = [ 0, 0 ];
    __angle = [ 0, 0, 0, 0 ];
    __angleRelative = false;
    
    __color = array_create(16, 0);
    __colorType = 1;
    
    __blendSource = bm_src_alpha;
    __blendDestination = bm_inv_src_alpha;
    __blendEnable = true;
    __alphaTest = 1 / 255;
    __zWrite = true;
    __cullmode = cull_noculling;
    
    __childType = undefined;
    __deathType = undefined;
    
    __childCount = 0;
    __deathCount = 0;
    
    #region Sprite Setters
    
    static SetSprite = function(_sprite, _speed, _randomize)
    {
        var _spriteWidth = sprite_get_width(_sprite);
        var _spriteHeight = sprite_get_height(_sprite);
        var _imageCount = sprite_get_number(_sprite);
        
        __spriteSettings[0] = _speed;
        __spriteSettings[1] = _randomize;
        __spriteSettings[2] = _imageCount;
        
        __spriteOrigin[0] = -sprite_get_xoffset(_sprite) / _spriteWidth;
        __spriteOrigin[1] = -sprite_get_yoffset(_sprite) / _spriteHeight;
        
        if (_sprites[$ _sprite] != undefined)
        {
            __sprite = _sprites[$ _sprite];
        }
        else
        {
            __sprite = __SpartaCreateParticleTexture(_sprite, _spriteWidth, _spriteHeight, _imageCount);
            _sprites[$ _sprite] = __sprite;
        }
    }
    
    static SetLife = function(_minLife, _maxLife)
    {
        __life[0] = _minLife;
        __life[1] = _maxLife;
    }
    
    static SetSpeed = function(_minStartSpeed, _maxStartSpeed, _acceleration, _jerk)
    {
        if (_minStartSpeed == 0)
        {
            _minStartSpeed = 0.00001;
        }
        
        if (_maxStartSpeed == 0)
        {
            _maxStartSpeed = 0.00001;
        }
        
        __speed[0] = _minStartSpeed;
        __speed[1] = _maxStartSpeed;
        __speed[2] = _acceleration;
        __speed[3] = _jerk;
    }
    
    static SetDirection = function(_xDirection, _yDirection, _zDirection, _angleVariation, _radial)
    {
        var _length = point_distance_3d(_xDirection, _yDirection, _zDirection, 0, 0, 0);
        if (_length != 0 && _length != 1)
        {
            _length = 1 / _length;
            _xDirection *= _length;
            _yDirection *= _length;
            _zDirection *= _length;
        }
        
        __direction[0] = _xDirection;
        __direction[1] = _yDirection;
        __direction[2] = _zDirection;
        __direction[3] = degtorad(_angleVariation);
        __directionRadial = _radial;
    }
    
    static SetGravity = function(_xDirection, _yDirection, _zDirection, _strength)
    {
        var _length = point_distance_3d(_xDirection, _yDirection, _zDirection, 0, 0, 0);
        if (_length != 0)
        {
            _length = _strength / _length;
        }
        
        __gravity[0] = _xDirection * _length;
        __gravity[1] = _yDirection * _length;
        __gravity[2] = _zDirection * _length;
    }
    
    static SetAngle = function(_minStartAngle, _maxStartAngle, _angleSpeed, _angleAcceleration, _relative)
    {
        __angle[0] = _minStartAngle;
        __angle[1] = _maxStartAngle;
        __angle[2] = _angleSpeed;
        __angle[3] = _angleAcceleration;
        __angleRelative = _relative;
    }
    
    static SetSize = function(_minStartSize, _maxStartSize, _sizeSpeed, _sizeAcceleration, _minClamp, _maxClamp)
    {
        __size[0] = _minStartSize;
        __size[1] = _maxStartSize;
        __size[2] = _sizeSpeed;
        __size[3] = _sizeAcceleration;
        __sizeClamp[0] = _minClamp;
        __sizeClamp[1] = _maxClamp;
    }
    
    static SetBlend = function(_source, _destination, _zWrite)
    {
        __zWrite = _zWrite;
        __blendEnable = true;
        __blendSource = _source;
        __blendDestination = _destination;
    }
    
    static SetAlphaTest = function(_testReference)
    {
        __alphaTest = clamp(_testReference / 255, 0, 1);
    }
    
    static SetColor = function(_color1, _alpha1, _color2, _alpha2, _color3, _alpha3, _color4, _alpha4, _choose)
    {
        __colorType = 0;
        
        var _i = 0;
        var _j = 0;
        repeat (4)
        {
            if (argument[_j] == undefined)
            {
                break;
            }
            
            var _color = argument[_j++];
            
            __color[_i++] = color_get_red(_color) / 255;
            __color[_i++] = color_get_green(_color) / 255;
            __color[_i++] = color_get_blue(_color) / 255;
            __color[_i++] = argument[_j++];
            
            __colorType++;
        }
        
        if (_choose != undefined)
        {
            if (_choose)
            {
                __colorType = 0;
            }
        }
    }
    
    static SetChild = function(_particleType, _count)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        if (_particleType.__type == SPARTA_TYPE_MESH)
        {
            __SpartaError($"Child type of particle cannot be a mesh type.");
        }
        
        __childType = _particleType;
        __childCount = _count;
    }
    
    static SetDeath = function(_particleType, _count)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        if (_particleType.__type == SPARTA_TYPE_MESH)
        {
            __SpartaError($"Death type of particle cannot be a mesh type.");
        }
        
        __deathType = _particleType;
        __deathCount = _count;
    }
    
    #endregion
}
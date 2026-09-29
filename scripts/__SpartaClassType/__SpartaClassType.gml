// Feather disable all

function __SpartaClassType() constructor
{
    static _sprites = __SpartaSystem().__sprites;
    static _meshes = __SpartaSystem().__meshes;
    
    __type = SPARTA_TYPE_NONE;
    
    __sprite = undefined;
    __spriteSource = undefined;
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
    
    __blendEnable = true;
    __blendSource = bm_src_alpha;
    __blendDestination = bm_inv_src_alpha;
    __alphaTest = 1 / 255;
    __zWrite = true;
    __cullmode = cull_noculling;
    
    __childType = undefined;
    __deathType = undefined;
    
    __childCount = 0;
    __deathCount = 0;
    
    __mesh = undefined;
    __meshRotationAxis = [ 0, 0, 0, 0 ];
    __meshLightDirection = [ 0, 0, 0 ];
    __meshLightColor = [ 1, 1, 1 ];
    __meshAmbientColor = [ 0.25, 0.25, 0.25 ];
    __meshCountPerBatch = 0;
    
    __destroyed = false;
    
    #region Setters
    
    static SetSprite = function(_sprite, _speed, _randomize)
    {
        if (!sprite_exists(_sprite))
        {
            __SpartaError($"Sprite `{_sprite}` does not exist.");
        }
        
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
            __sprite = __SpartaTextureCreate(_sprite, _spriteWidth, _spriteHeight, _imageCount);
            _sprites[$ _sprite] = __sprite;
        }
        
        __spriteSource = _sprite;
        
        __type = SPARTA_TYPE_SPRITE;
        
        return self;
    }
    
    static SetLife = function(_minLife, _maxLife)
    {
        __life[0] = _minLife;
        __life[1] = _maxLife;
        
        return self;
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
        
        return self;
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
        
        return self;
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
        
        return self;
    }
    
    static SetAngle = function(_minStartAngle, _maxStartAngle, _angleSpeed, _angleAcceleration, _relative)
    {
        __angle[0] = _minStartAngle;
        __angle[1] = _maxStartAngle;
        __angle[2] = _angleSpeed;
        __angle[3] = _angleAcceleration;
        __angleRelative = _relative;
        
        return self;
    }
    
    static SetSize = function(_minStartSize, _maxStartSize, _sizeSpeed, _sizeAcceleration, _minClamp, _maxClamp)
    {
        __size[0] = _minStartSize;
        __size[1] = _maxStartSize;
        __size[2] = _sizeSpeed;
        __size[3] = _sizeAcceleration;
        __sizeClamp[0] = _minClamp;
        __sizeClamp[1] = _maxClamp;
        
        return self;
    }
    
    static SetScale = function(_xScale, _yScale)
    {
        __scale[0] = _xScale;
        __scale[1] = _yScale;
        
        return self;
    }
    
    static SetBlend = function(_enabled, _source, _destination)
    {
        __blendEnable = _enabled;
        __blendSource = _source;
        __blendDestination = _destination;
        
        return self;
    }
    
    static SetZWrite = function(_zWrite)
    {
        __zWrite = _zWrite;
        
        return self;
    }
    
    static SetCullMode = function(_cullmode)
    {
        __cullmode = _cullmode;
        
        return self;
    }
    
    static SetAlphaTest = function(_testReference)
    {
        __alphaTest = clamp(_testReference / 255, 0, 1);
        
        return self;
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
        
        return self;
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
        
        return self;
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
        
        return self;
    }
    
    #endregion
    
    #region Mesh Setters
    
    static SetMesh = function(_meshBuffer, _vertexFormat, _meshCountPerBatch = 255)
    {
        return __SetMesh(__SpartaMeshCreate(_meshBuffer, _vertexFormat, _meshCountPerBatch));
    }
    
    static SetMeshTexture = function(_sprite)
    {
        if (!sprite_exists(_sprite))
        {
            __SpartaError($"Sprite `{_sprite}` does not exist.");
        }
        
        var _spriteWidth = sprite_get_width(_sprite);
        var _spriteHeight = sprite_get_height(_sprite);
        var _imageCount = 0;
        
        __spriteSettings[0] = 0;
        __spriteSettings[1] = false;
        __spriteSettings[2] = _imageCount;
        
        __spriteOrigin[0] = -sprite_get_xoffset(_sprite) / _spriteWidth;
        __spriteOrigin[1] = -sprite_get_yoffset(_sprite) / _spriteHeight;
        
        if (_sprites[$ _sprite] != undefined)
        {
            __sprite = _sprites[$ _sprite];
        }
        else
        {
            __sprite = __SpartaTextureCreate(_sprite, _spriteWidth, _spriteHeight, _imageCount);
            _sprites[$ _sprite] = __sprite;
        }
        
        __spriteSource = _sprite;
        
        return self;
    }
    
    static SetMeshAmbientColor = function(_ambientColor)
    {
        __meshAmbientColor[0] = color_get_red(_ambientColor) / 255;
        __meshAmbientColor[1] = color_get_green(_ambientColor) / 255;
        __meshAmbientColor[2] = color_get_blue(_ambientColor) / 255;
        
        return self;
    }
    
    static SetMeshLightColor = function(_lightColor)
    {
        __meshLightColor[0] = color_get_red(_lightColor) / 255;
        __meshLightColor[1] = color_get_green(_lightColor) / 255;
        __meshLightColor[2] = color_get_blue(_lightColor) / 255;
        
        return self;
    }
    
    static SetMeshLightDirection = function(_xDirection, _yDirection, _zDirection)
    {
        var _length = _xDirection * _xDirection + _yDirection * _yDirection + _zDirection * _zDirection;
        
        if (_length != 0 && _length != 1)
        {
            _length = 1 / sqrt(_length);
            _xDirection *= _length;
            _yDirection *= _length;
            _zDirection *= _length;
        }
        
        __meshLightDirection[0] = _xDirection;
        __meshLightDirection[1] = _yDirection;
        __meshLightDirection[2] = _zDirection;
        
        return self;
    }
    
    static SetMeshRotationAxis = function(_xAxis, _yAxis, _zAxis, _angle)
    {
        var _length = _xAxis * _xAxis + _yAxis * _yAxis + _zAxis * _zAxis;
        
        if (_length != 0 && _length != 1)
        {
            _length = 1 / sqrt(_length);
            _xAxis *= _length;
            _yAxis *= _length;
            _zAxis *= _length;
        }
        
        __meshRotationAxis[0] = _xAxis;
        __meshRotationAxis[1] = _yAxis;
        __meshRotationAxis[2] = _zAxis;
        __meshRotationAxis[3] = degtorad(_angle);
        
        return self;
    }
    
    #endregion
    
    #region Getters

    static GetType = function()
    {
        return __type;
    }
    
    static GetSprite = function()
    {
        return __spriteSource;
    }
    
    static GetLife = function()
    {
        return variable_clone(__life);
    }
    
    static GetSpeed = function()
    {
        return variable_clone(__speed);
    }
    
    static GetDirection = function()
    {
        return variable_clone(__direction);
    }
    
    static GetDirectionRadial = function()
    {
        return __directionRadial;
    }
    
    static GetGravity = function()
    {
        return variable_clone(__gravity);
    }
    
    static GetAngle = function()
    {
        return variable_clone(__angle);
    }
    
    static GetAngleRelative = function()
    {
        return __angleRelative;
    }
    
    static GetSize = function()
    {
        return variable_clone(__size);
    }
    
    static GetSizeClamp = function()
    {
        return variable_clone(__sizeClamp);
    }
    
    static GetScale = function()
    {
        return variable_clone(__scale);
    }
    
    static GetColor = function()
    {
        return variable_clone(__color);
    }
    
    static GetColorType = function()
    {
        return __colorType;
    }
    
    static GetBlend = function()
    {
        return {
            enabled: __blendEnable,
            source: __blendSource,
            destination:
            __blendDestination
        };
    }
    
    static GetAlphaTest = function()
    {
        return __alphaTest;
    }
    
    static GetZWrite = function()
    {
        return __zWrite;
    }
    
    static GetCullMode = function()
    {
        return __cullmode;
    }
    
    static GetChild = function()
    {
        return {
            type: __childType,
            count: __childCount
        };
    }
    
    static GetDeath = function()
    {
        return {
            type: __deathType,
            count: __deathCount
        };
    }
    
    static GetMesh = function()
    {
        return __mesh;
    }
    
    static GetMeshRotationAxis = function()
    {
        return variable_clone(__meshRotationAxis);
    }
    
    static GetMeshLightDirection = function()
    {
        return variable_clone(__meshLightDirection);
    }
    
    static GetMeshLightColor = function()
    {
        return variable_clone(__meshLightColor);
    }
    
    static GetMeshAmbientColor = function()
    {
        return variable_clone(__meshAmbientColor);
    }
    
    #endregion
    
    #region Serialization
    
    static Serialize = function(_serializeChildren = false)
    {
        var _struct = { 
            type: __type,
            
            sprite: __spriteSource != undefined ? sprite_get_name(__spriteSource) : undefined,
            spriteSettings: variable_clone(__spriteSettings),
            
            size: variable_clone(__size),
            sizeClamp: variable_clone(__sizeClamp),
            scale: variable_clone(__scale),
            speed: variable_clone(__speed),
            direction: variable_clone(__direction),
            directionRadial: __directionRadial,
            gravity: variable_clone(__gravity),
            life: variable_clone(__life),
            angle: variable_clone(__angle),
            angleRelative: __angleRelative,
            
            color: variable_clone(__color),
            colorType: __colorType,
            
            blendEnable: __blendEnable,
            blendSource: __blendSource,
            blendDestination: __blendDestination,
            alphaTest: __alphaTest,
            zWrite: __zWrite,
            cullmode: __cullmode,
            
            childType: (__childType != undefined && _serializeChildren) ? __childType.Serialize(false) : undefined,
            deathType: (__deathType != undefined && _serializeChildren) ? __deathType.Serialize(false) : undefined,
            
            childCount: __childCount,
            deathCount: __deathCount,
            
            mesh: (__mesh != undefined && vertex_buffer_exists(__mesh) && SPARTA_RUNNING_FROM_IDE) ? __SpartaMeshToBase64(__mesh, __meshCountPerBatch) : undefined,
            meshRotationAxis: variable_clone(__meshRotationAxis),
            meshLightDirection: variable_clone(__meshLightDirection),
            meshLightColor: variable_clone(__meshLightColor),
            meshAmbientColor: variable_clone(__meshAmbientColor),
            meshCountPerBatch: __meshCountPerBatch,
        };
        
        return _struct;
    }
    
    static Deserialize = function(_struct)
    {
        if (!is_struct(_struct))
        {
            __SpartaError($"Struct parameter must be a struct.");
        }
        
        try
        {
            array_copy(__size, 0, _struct[$ "size"], 0, 4);
            array_copy(__sizeClamp, 0, _struct[$ "sizeClamp"], 0, 2);
            array_copy(__scale, 0, _struct[$ "scale"], 0, 2);
            array_copy(__speed, 0, _struct[$ "speed"], 0, 4);
            array_copy(__direction, 0, _struct[$ "direction"], 0, 4);
            __directionRadial = _struct[$ "directionRadial"];
            array_copy(__gravity, 0, _struct[$ "gravity"], 0, 3);
            array_copy(__life, 0, _struct[$ "life"], 0, 2);
            array_copy(__angle, 0, _struct[$ "angle"], 0, 4);
            __angleRelative = _struct[$ "angleRelative"];
        
            array_copy(__color, 0, _struct[$ "color"], 0, 16);
            __colorType = _struct[$ "colorType"];
        
            __blendEnable = _struct[$ "blendEnable"];
            __blendSource = _struct[$ "blendSource"];
            __blendDestination = _struct[$ "blendDestination"];
            __alphaTest = _struct[$ "alphaTest"];
            __zWrite = _struct[$ "zWrite"];
            __cullmode = _struct[$ "cullmode"];
        
            array_copy(__meshRotationAxis, 0, _struct[$ "meshRotationAxis"], 0, 4);
            array_copy(__meshLightDirection, 0, _struct[$ "meshLightDirection"], 0, 3);
            array_copy(__meshLightColor, 0, _struct[$ "meshLightColor"], 0, 3);
            array_copy(__meshAmbientColor, 0, _struct[$ "meshAmbientColor"], 0, 3);
        }
        catch (_e)
        {
            __SpartaError($"Error deserializing type struct.");
        }
        
        if (_struct[$ "type"] == SPARTA_TYPE_MESH)
        {
            if (_struct[$ "mesh"] == undefined)
            {
                __SpartaError("Cannot deserialize the mesh type, mesh data invalid or not serialized correctly.");
            }
            
            var _meshCountPerBatch = _struct[$ "meshCountPerBatch"];
            __SetMesh(__SpartaBase64ToMesh(_struct[$ "mesh"], _meshCountPerBatch), _meshCountPerBatch);
        }
        
        var _spriteName = _struct[$ "sprite"];
        if (_spriteName != undefined)
        {
            if (asset_get_index(_spriteName) == -1 || asset_get_type(_spriteName) != asset_sprite)
            {
                __SpartaError($"Cannot deserialize sprite `{_spriteName}`, no sprite asset exists.");
            }
            
            var _spriteIndex = asset_get_index(_spriteName);
            
            if (__type == SPARTA_TYPE_MESH)
            {
                SetMeshTexture(_spriteIndex);
            }
            else
            {
                var _spriteSettings = _struct[$ "spriteSettings"];
                SetSprite(_spriteIndex, _spriteSettings[0], _spriteSettings[1]);
            }
        }
        
        var _childStruct = _struct[$ "childType"];
        if (_childStruct != undefined)
        {
            var _childType = new __SpartaClassType();
            _childType.Deserialize(_childStruct);
            SetChild(_childType, _struct[$ "childCount"]);
        }
        
        var _deathStruct = _struct[$ "deathType"];
        if (_deathStruct != undefined)
        {
            var _deathType = new __SpartaClassType();
            _deathType.Deserialize(_deathStruct);
            SetDeath(_deathType, _struct[$ "deathCount"]);
        }
        
        return self;
    }
    
    #endregion
    
    #region Other
    
    static __FreeMesh = function()
    {
        if (__mesh != undefined && vertex_buffer_exists(__mesh))
        {
            var _index = array_get_index(_meshes, __mesh);
            if (_index != -1)
            {
                array_delete(_meshes, _index, 1);
            }
            
            vertex_delete_buffer(__mesh);
        }
    }
    
    static __SetMesh = function(_vertexBuffer, _meshCountPerBatch)
    {
        __FreeMesh();
        
        __mesh = _vertexBuffer;
        __meshCountPerBatch = _meshCountPerBatch;
        __type = SPARTA_TYPE_MESH;
        
        array_push(_meshes, __mesh);
        
        return self;
    }
    
    static Destroy = function()
    {
        __FreeMesh();
        
        __childType = undefined;
        __deathType = undefined;
        
        __childCount = 0;
        __deathCount = 0;
        
        __type = SPARTA_TYPE_NONE;
        __destroyed = true;
    }
    
    static IsDestroyed = function()
    {
        return __destroyed;
    }
    
    #endregion
}
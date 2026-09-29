// Feather disable all

function __SpartaClassEmitter(_particleSystem) constructor
{
    if (!__SpartaEnsureSystem(_particleSystem))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    __id = random(256 * 256);
    __particleSystem = _particleSystem;
    __type = SPARTA_EMITTER_NONE;
    
    __startMatrix = matrix_build_identity();
    __endMatrix = matrix_build_identity();
    
    __sector = 360;
    __shape = SPARTA_SHAPE_SPHERE;
    __distribution = SPARTA_DISTR_LINEAR;
    
    __dynamic = false;
    
    __particleType = undefined;
    __particlesPerStep = 0;
    
    __lifeSpan = 9999999;
    __creationTime = __particleSystem.__time;
    __deathTime = __creationTime + __lifeSpan;
    
    __active = false;
    __activeIndex = -1;
    
    __retired = false;
    
    static __Activate = function()
    {
        if (__active)
        {
            return;
        }
        
        __active = true;
        __activeIndex = array_length(__particleSystem.__activeEmitters);
        array_push(__particleSystem.__activeEmitters, self);
    }
    
    static __Deactivate = function()
    {
        if (!__active)
        {
            return;
        }
        
        var _last = array_pop(__particleSystem.__activeEmitters);
        
        if (_last != self)
        {
            __particleSystem.__activeEmitters[__activeIndex] = _last;
            _last.__activeIndex = __activeIndex;
        }
        
        __active = false;
        __activeIndex = -1;
    }
    
    static __CommitRegion = function(_matrix)
    {
        if (__dynamic)
        {
            if (Retire(true))
            {
                __creationTime = __particleSystem.__time;
                __startMatrix = __endMatrix;
                __id = random(256 * 256);
            }
        }
        else
        {
            __startMatrix = _matrix;
        }
        
        __endMatrix = _matrix;
        
        if (__particleType == undefined)
        {
            return self;
        }
        
        if (__particleSystem.__time < __deathTime)
        {
            __Activate();
        }
        
        return self;
    }
    
    static Stream = function(_particleType, _particlesPerStep, _lifeSpan)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        __retired = false;
        
        if (__dynamic)
        {
            if (Retire())
            {
                __creationTime = __particleSystem.__time;
                __startMatrix = __endMatrix;
                __id = random(256 * 256);
            }
        }
        
        __particleType = _particleType;
        __particlesPerStep = _particlesPerStep;
        __lifeSpan = (_lifeSpan > 0 ? _lifeSpan : 9999999);
        __type = SPARTA_EMITTER_STREAM;
        __deathTime = __ComputeDeathTime();
        
        __Activate();
    }
    
    static Burst = function(_particleType, _count)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        __retired = false;
        
        if (__dynamic)
        {
            Retire();
        }
        
        __startMatrix = __endMatrix;
        __particleType = _particleType;
        __id = random(256 * 256);
        __type = SPARTA_EMITTER_STREAM;
        __creationTime = __particleSystem.__time;
        __particlesPerStep = SPARTA_MAX_BURST_COUNT;
        __lifeSpan = _count / __particlesPerStep;
        __deathTime = __ComputeDeathTime();
        
        __Activate();
    }
    
    static Mature = function()
    {
        __creationTime -= __particleType.__life[1];
        __deathTime = __ComputeDeathTime();
        
        var _childType = __particleType.__childType;
        if (__SpartaEnsureType(_childType))
        {
            __creationTime -= _childType.__life[1];
        }
        
        var _deathType = __particleType.__deathType;
        if (__SpartaEnsureType(_deathType))
        {
            __creationTime -= _deathType.__life[1];
        }
    }
    
    static Retire = function(_force = false)
    {
        if (__retired)
        {
            return true;
        }
        
        if (!__SpartaEnsureType(__particleType))
        {
            return false;
        }
        
        if (__type != SPARTA_EMITTER_STREAM)
        {
            return true;
        }
        
        if (!_force && __particleSystem.__time < __creationTime + min(__lifeSpan, __particleSystem.__dynamicInterval))
        {
            return false;
        }
        
        var _retired = new __SpartaClassEmitter(__particleSystem);
        
        _retired.__type = SPARTA_EMITTER_RETIRED;
        _retired.__id = __id;
        _retired.__sector = __sector;
        _retired.__shape = __shape;
        _retired.__distribution = __distribution;
        _retired.__particleType = __particleType;
        _retired.__particlesPerStep = __particlesPerStep;
        _retired.__lifeSpan = min(__lifeSpan, __particleSystem.__time - __creationTime);
        _retired.__creationTime = __creationTime;
        _retired.__deathTime = _retired.__ComputeDeathTime();
        array_copy(_retired.__startMatrix, 0, __startMatrix, 0, 16);
		array_copy(_retired.__endMatrix, 0, __endMatrix, 0, 16);
        
        var _index = array_get_index(__particleSystem.__activeEmitters, self);
        if (_index != -1)
        {
            __particleSystem.__activeEmitters[_index] = _retired;
        }
        
        __retired = true;
        
        return true;
    }
    
    #region Setters
    
    static SetRegionMatrix = function(_matrix, _xScale, _yScale, _zScale)
    {
        var _regionMatrix = array_create(16);
        array_copy(_regionMatrix, 0, _matrix, 0, 16);
        
        if (!__SpartaMatrixOrthogonalize(_regionMatrix))
        {
            __SpartaError("Bad matrix passed in to `SetRegion`.");
        }
        
        __SpartaMatrixScale(_regionMatrix, __SafeScale(_xScale), __SafeScale(_yScale), __SafeScale(_zScale));
        
        return __CommitRegion(_regionMatrix);
    }
    
    static SetRegion = function(_xPosition, _yPosition, _zPosition, _xRotation, _yRotation, _zRotation, _xScale, _yScale, _zScale)
    {
        return __CommitRegion(matrix_build(_xPosition, _yPosition, _zPosition, _xRotation, _yRotation, _zRotation, __SafeScale(_xScale), __SafeScale(_yScale), __SafeScale(_zScale)));
    }
    
    static SetRegionPosition = function(_xPosition, _yPosition, _zPosition)
    {
        if (__endMatrix[12] == _xPosition && __endMatrix[13] == _yPosition && __endMatrix[14] == _zPosition)
        {
            return self;
        }
        
        var _matrix = array_create(16);
        array_copy(_matrix, 0, __endMatrix, 0, 16);
        
        _matrix[12] = _xPosition;
        _matrix[13] = _yPosition;
        _matrix[14] = _zPosition;
        
        return __CommitRegion(_matrix);
    }
    
    static SetRegionScale = function(_xScale, _yScale, _zScale)
    {
        var _matrix = array_create(16);
        array_copy(_matrix, 0, __endMatrix, 0, 16);
        
        __SpartaMatrixSetAxisLength(_matrix, 0, __SafeScale(_xScale));
        __SpartaMatrixSetAxisLength(_matrix, 4, __SafeScale(_yScale));
        __SpartaMatrixSetAxisLength(_matrix, 8, __SafeScale(_zScale));
        
        return __CommitRegion(_matrix);
    }
    
    static SetRegionRotation = function(_xRotation, _yRotation, _zRotation)
    {
        var _matrix = __endMatrix;
        
        var _xScale = point_distance_3d(0, 0, 0, _matrix[0], _matrix[1], _matrix[2]);
        var _yScale = point_distance_3d(0, 0, 0, _matrix[4], _matrix[5], _matrix[6]);
        var _zScale = point_distance_3d(0, 0, 0, _matrix[8], _matrix[9], _matrix[10]);
        
        return __CommitRegion(matrix_build(_matrix[12], _matrix[13], _matrix[14], _xRotation, _yRotation, _zRotation, _xScale, _yScale, _zScale));
    }
    
    static SetShape = function(_shape)
    {
        __shape = _shape;
        
        return self;
    }
    
    static SetDistribution = function(_distribution)
    {
        __distribution = _distribution;
        
        return self;
    }
    
    static SetDynamic = function(_dynamic)
    {
        __dynamic = _dynamic;
        
        return self;
    }
    
    static SetSector = function(_sectorAngle)
    {
        __sector = _sectorAngle;
        
        return self;
    }
    
    #endregion
    
    #region Getters
    
    static GetShape = function()
    {
        return __shape;
    }
    
    static GetDistribution = function()
    {
        return __distribution;
    }
    
    static GetSector = function()
    {
        return __sector;
    }
    
    static GetDynamic = function()
    {
        return __dynamic;
    }
    
    static GetRegion = function()
    {
        return variable_clone(__endMatrix);
    }
    
    static GetType = function()
    {
        return __type;
    }
    
    static GetParticleType = function()
    {
        return __particleType;
    }
    
    static GetParticlesPerStep = function()
    {
        return __particlesPerStep;
    }
    
    static GetLifeSpan = function()
    {
        return __lifeSpan;
    }
    
    static GetAge = function()
    {
        return __particleSystem.__time - __creationTime;
    }
    
    static GetCreationTime = function()
    {
        return __creationTime;
    }
    
    static GetDeathTime = function()
    {
        return __deathTime;
    }
    
    static IsActive = function()
    {
        return __active;
    }
    
    static IsRetired = function()
    {
        return __retired;
    }
    
    static IsFinished = function()
    {
        if (__type == SPARTA_EMITTER_NONE)
        {
            return true;
        }
        
        return __particleSystem.__time >= __deathTime;
    }
    
    #endregion
    
    #region Serialization
    
    static Serialize = function()
    {
        if (__dynamic)
        {
            __SpartaError("Cannot serialize a dynamic emitter.");
        }
        
        var _struct = { 
            id: __id,
            
            matrix: variable_clone(__startMatrix),
            
            sector: __sector,
            shape: __shape,
            distribution: __distribution,
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
            __id = _struct[$ "id"];
            
            array_copy(__startMatrix, 0, _struct[$ "matrix"], 0, 16);
		    array_copy(__endMatrix, 0, _struct[$ "matrix"], 0, 16);
            
            __sector = _struct[$ "sector"];
            __shape = _struct[$ "shape"];
            __distribution = _struct[$ "distribution"];
        }
        catch (_e)
        {
            __SpartaError($"Error deserializing emitter struct.");
        }
    }
    
    #endregion
    
    #region Helpers
    
    static __SafeScale = function(_size)
    {
        return _size == 0 ? 0.0001 : _size;
    }
    
    static __ComputeDeathTime = function()
    {
        if (!__SpartaEnsureType(__particleType))
        {
            return 0;
        }
        
        var _time = __creationTime + __lifeSpan + __particleType.__life[1];
        
        var _childType = __particleType.__childType;
        if (!__SpartaEnsureType(_childType))
        {
            _time += _childType.__life[1];
        }
        
        var _deathType = __particleType.__deathType;
        if (!__SpartaEnsureType(_deathType))
        {
            _time += _deathType.__life[1];
        }
        
        return _time;
    }
    
    #endregion
}
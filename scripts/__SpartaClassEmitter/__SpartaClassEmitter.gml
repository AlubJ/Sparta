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
    
    __parent = undefined;
    __particleType = undefined;
    __particlesPerStep = 0;
    
    __lifeSpan = 9999999;
    __creationTime = __particleSystem.__time;
    __deathTime = __creationTime + __lifeSpan;
    
    array_push(__particleSystem.__emitters, self);
    
    static __Activate = function()
    {
        if (array_get_index(__particleSystem.__activeEmitters, self) == -1)
        {
            array_push(__particleSystem.__activeEmitters, self);
        }
    }
    
    static Destroy = function()
    {
        var _index = array_get_index(__particleSystem.__activeEmitters, self);
        if (_index != -1)
        {
            array_delete(__particleSystem.__activeEmitters, _index, 1);
        }
        
        var _index = array_get_index(__particleSystem.__emitters, self);
        if (_index != -1)
        {
            array_delete(__particleSystem.__emitters, _index, 1);
        }
    }
    
    static Stream = function(_particleType, _particlesPerStep, _lifeSpan)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        if (__dynamic)
        {
            if (Retire())
            {
                __creationTime = __particleSystem.__time;
                __startMatrix = __endMatrix;
                __id = irandom(256);
            }
        }
        
        __particleType = _particleType;
        __particlesPerStep = _particlesPerStep;
        __lifeSpan = (_lifeSpan > 0 ? _lifeSpan : 9999999);
        __type = SPARTA_EMITTER_STREAM;
        __Activate();
    }
    
    static Burst = function(_particleType, _count)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
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
        __Activate();
    }
    
    static Mature = function()
    {
        __creationTime -= __particleType.__life[1];
        
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
        _retired.__parent = self;
        _retired.__particleType = __particleType;
        _retired.__particlesPerStep = __particlesPerStep;
        _retired.__lifeSpan = min(__lifeSpan, __particleSystem.__time + __particleType.__life[1]);
        _retired.__creationTime = __creationTime;
        _retired.__deathTime = __creationTime + _retired.__lifeSpan + __particleType.__life[1];
        array_copy(_retired.__startMatrix, 0, __startMatrix, 0, 16);
		array_copy(_retired.__endMatrix, 0, __endMatrix, 0, 16);
        
        var _childType = __particleType.__childType;
        if (__SpartaEnsureType(_childType))
        {
            _retired.__deathTime += _childType.__life[1];
        }
        
        var _deathType = __particleType.__deathType;
        if (__SpartaEnsureType(_deathType))
        {
            _retired.__deathTime += _deathType.__life[1];
        }
        
        var _index = array_get_index(__particleSystem.__activeEmitters, self);
        if (_index != -1)
        {
            __particleSystem.__activeEmitters[_index] = _retired;
        }
        
        return true;
    }
    
    #region Setters
    
    static SetRegion = function(_matrix, _xScale, _yScale, _zScale)
    {
        if (!__SpartaMatrixOrthogonalize(_matrix))
        {
            __SpartaError("Bad matrix passed in to `SetRegion`.");
        }
        
        if (_xScale == 0)
        {
            _xScale = 0.0001;
        }
        
        if (_yScale == 0)
        {
            _yScale = 0.0001;
        }
        
        if (_zScale == 0)
        {
            _zScale = 0.0001;
        }
        
        __SpartaMatrixScale(_matrix, _xScale, _yScale, _zScale);
        
        if (__dynamic)
        {
            if (Retire(true))
            {
                __creationTime = __particleSystem.__time;
                __startMatrix = __endMatrix;
                __id = irandom(256);
            }
        }
        else
        {
            __startMatrix = _matrix;
        }
        
        __endMatrix = _matrix;
        
        if (__particleSystem.__time < __deathTime)
        {
            __Activate();
        }
        
        return self;
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
}
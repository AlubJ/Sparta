
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
    
    __parent = undefined;
    __particleType = undefined;
    __particlesPerStep = 0;
    
    __lifeSpan = 9999999;
    __creationTime = __particleSystem.__time;
    __deathTime = __creationTime + __lifeSpan;
    
    array_push(__particleSystem.__emitters, self);
    
    static Destroy = function()
    {
        var _index = array_get_index(__particleSystem.__activeEmitters);
        if (_index != -1)
        {
            array_delete(__particleSystem.__activeEmitters, _index, 1);
        }
        
        var _index = array_get_index(__particleSystem.__emitters);
        if (_index != -1)
        {
            array_delete(__particleSystem.__emitters, _index, 1);
        }
    }
    
    static Stream = function(_particleType, _particlesPerStep, _lifeSpan, _dynamic = false)
    {
        if (_dynamic)
        {
            if (Retire(true))
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
    
    static Burst = function(_particleType, _count, _dynamic = false)
    {
        if (_dynamic)
        {
            Retire(true);
        }
        
        __startMatrix = __endMatrix;
        __particleType = _particleType;
        __id = random(256 * 256);
        __type = SPARTA_EMITTER_STREAM;
        __creationTime = __particleSystem.__time;
        __lifeSpan = _count / __particlesPerStep;
        __Activate();
    }
    
    static __Activate = function()
    {
        if (array_get_index(__particleSystem.__activeEmitters, self) == -1)
        {
            array_push(__particleSystem.__activeEmitters, self);
        }
    }
    
    static SetRegion = function(_matrix, _xScale, _yScale, _zScale, _shape, _distribution, _dynamic = false)
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
        
        if (_dynamic)
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
        __shape = _shape;
        __distribution = _distribution;
        
        if (__particleSystem.__time < __deathTime)
        {
            __Activate();
        }
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
        _retired.__mesh = __mesh;
        _retired.__meshParticleCount = __meshParticleCount;
        _retired.__parent = self;
        _retired.__particleType = __particleType;
        _retired.__particlesPerStep = __particlesPerStep;
        _retired.__lifeSpan = min(__lifeSpan, __particleSystem.__time + __particleType.__life[1]);
        _retired.__creationTime = __creationTime;
        _retired.__deathTime = __creationTime + _retired.__lifeSpan + __particleType.__life[1];
        
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
}
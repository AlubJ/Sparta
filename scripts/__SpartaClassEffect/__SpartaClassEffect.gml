// Feather disable all

function __SpartaClassEffect() constructor
{
    __types = [  ];
    __instructions = [  ];
    __dirty = false;
    __destroyed = false;
    
    static AddType = function(_particleType)
    {
        if (!__SpartaEnsureType(_particleType))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        array_push(__types, _particleType);
        
        return self;
    }
    
    static AddBurst = function(_time, _type, _count, _xPosition, _yPosition, _zPosition, _xRotation = 0, _yRotation = 0, _zRotation = 0, _xScale = 1, _yScale = 1, _zScale = 1, _shape = SPARTA_SHAPE_SPHERE, _sector = 360, _distribution = SPARTA_DISTR_LINEAR)
    {
        if (!__SpartaEnsureType(_type))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        return __AddInstruction({
            time: _time,
            action: SPARTA_EFFECT_BURST,
            type: _type,
            count: _count,
            particlesPerStep: undefined,
            duration: undefined,
            xPosition: _xPosition,
            yPosition: _yPosition,
            zPosition: _zPosition,
            xRotation: _xRotation,
            yRotation: _yRotation,
            zRotation: _zRotation,
            xScale: _xScale,
            yScale: _yScale,
            zScale: _zScale,
            shape: _shape,
            sector: _sector,
            distribution: _distribution,
        });
    }
    
    static AddStream = function(_time, _type, _particlesPerStep, _duration, _xPosition, _yPosition, _zPosition, _xRotation = 0, _yRotation = 0, _zRotation = 0, _xScale = 1, _yScale = 1, _zScale = 1, _shape = SPARTA_SHAPE_SPHERE, _sector = 360, _distribution = SPARTA_DISTR_LINEAR)
    {
        if (_duration <= 0)
        {
            __SpartaError("Effect stream instructions must have a duration that is greater than 0.");
        }
        
        if (!__SpartaEnsureType(_type))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        return __AddInstruction({
            time: _time,
            action: SPARTA_EFFECT_STREAM,
            type: _type,
            count: undefined,
            particlesPerStep: _particlesPerStep,
            duration: _duration,
            xPosition: _xPosition,
            yPosition: _yPosition,
            zPosition: _zPosition,
            xRotation: _xRotation,
            yRotation: _yRotation,
            zRotation: _zRotation,
            xScale: _xScale,
            yScale: _yScale,
            zScale: _zScale,
            shape: _shape,
            sector: _sector,
            distribution: _distribution,
        });
    }
    
    static __AddInstruction = function(_instruction)
    {
        if (!__SpartaEnsureType(_instruction.type))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        array_push(__instructions, _instruction);
        __dirty = true;
        
        return self;
    }
    
    static __Sort = function()
    {
        if (__dirty)
        {
            array_sort(__instructions, function (_a, _b)
            {
                return _a.time - _b.time;
            });
            
            __dirty = false;
        }
    }
    
    static Destroy = function()
    {
        var _i = 0;
        repeat (array_length(__types))
        {
            __types[_i].Destroy();
            _i++;
        }
        
        __types = [ ];
        __instructions = [ ];
        __destroyed = [ ];
    }
    
    static IsDestroyed = function()
    {
        return __destroyed;
    }
}
// Feather disable all

function __SpartaClassEffect() constructor
{
    __types = [  ];
    __instructions = [  ];
    __dirty = false;
    __destroyed = false;
    
    static AddBurst = function(_time, _type, _count, _xPosition, _yPosition, _zPosition, _xRotation = 0, _yRotation = 0, _zRotation = 0, _xScale = 1, _yScale = 1, _zScale = 1, _shape = SPARTA_SHAPE_SPHERE, _sector = 360, _distribution = SPARTA_DISTR_LINEAR)
    {
        if (!__SpartaEnsureType(_type))
        {
            __SpartaError($"Particle type passed in is invalid.");
        }
        
        if (array_get_index(__types, _type) == -1)
        {
            array_push(__types, _type);
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
        
        if (array_get_index(__types, _type) == -1)
        {
            array_push(__types, _type);
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
        __destroyed = true;
    }
    
    static IsDestroyed = function()
    {
        return __destroyed;
    }
    
    static Serialize = function()
    {
        var _struct = { 
            types: [  ],
            instructions: [  ],
        };
        
        var _i = 0;
        repeat (array_length(__types))
        {
            array_push(_struct.types, __types[_i].Serialize(true));
            _i++;
        }
        
        var _i = 0;
        repeat (array_length(__instructions))
        {
            var _typeIndex = array_get_index(__types, __instructions[_i].type);
            
            var _instruction = variable_clone(__instructions[_i], 0);
            _instruction.type = _typeIndex;
            
            array_push(_struct.instructions, _instruction);
            
            _i++;
        }
        
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
            var _i = 0;
            repeat (array_length(_struct[$ "types"]))
            {
                array_push(__types, new __SpartaClassType().Deserialize(_struct[$ "types"][_i]));
                
                _i++;
            }
            
            var _i = 0;
            repeat (array_length(_struct[$ "instructions"]))
            {
                array_push(__instructions, variable_clone(_struct[$ "instructions"][_i]));
                __instructions[_i].type = __types[_struct[$ "instructions"][_i].type];
                
                _i++;
            }
        }
        catch (_e)
        {
            __SpartaError($"Error deserializing effect struct.");
        }
        
        return self;
    }
}
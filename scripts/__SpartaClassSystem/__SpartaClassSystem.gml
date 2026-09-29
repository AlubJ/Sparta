// Feather disable all

function __SpartaClassSystem(_batchSize) constructor
{
    static _vertexBatches = __SpartaSystem().__vertexBatches;
    static _primaryInterface = __SpartaSystem().__primaryInterface;
    static _secondaryInterface = __SpartaSystem().__secondaryInterface;
    static _meshInterface = __SpartaSystem().__meshInterface;
    
    __batchSize = [ 256 ];
    if (is_array(_batchSize))
    {
        __batchSize = _batchSize;
    }
    else if (is_real(_batchSize))
    {
        __batchSize = [ _batchSize ];
    }
    
    __vertexBatches = undefined;
    
    __time = 0;
    __dynamicInterval = 1;
    __paused = false;
    
    __activeEmitters = [  ];
    
    __particleCount = 0;
    __drawCalls = 0;
    
    __UpdateVertexBuffers();
    
    static __UpdateVertexBuffers = function()
    {
        var _batchCount = array_length(__batchSize);
        __vertexBatches = array_create(_batchCount);
        
        var _i = 0;
        repeat(_batchCount)
        {
            var _particlesPerBatch = __batchSize[_i];
            
            if (_vertexBatches[$ _particlesPerBatch] != undefined && vertex_buffer_exists(_vertexBatches[$ _particlesPerBatch]))
            {
                __vertexBatches[_i] = _vertexBatches[$ _particlesPerBatch];
            }
            else
            {
                var _batchBuffer = __SpartaBatchCreate(_particlesPerBatch);
                __vertexBatches[_i] = _batchBuffer;
            }
            
            _i++;
        }
    }
    
    static Step = function(_timeIncrement)
    {
        if (__paused)
        {
            return;
        }
        
        var _emitterCount = array_length(__activeEmitters);
        
        var _i = _emitterCount;
        repeat (--_i >= 0)
        {
            var _emitter = __activeEmitters[_i];
            
            if (_emitter.__type == SPARTA_EMITTER_STREAM && __time >= _emitter.__creationTime + _emitter.__lifeSpan)
            {
                _emitter.Retire(true);
            }
            
            if (_emitter.__type == SPARTA_EMITTER_RETIRED && __time >= _emitter.__deathTime)
            {
                _emitter.__Deactivate();
            }
        }
        
        __time += _timeIncrement;
    }
    
    static Draw = function()
    {
        __particleCount = 0;
        __drawCalls = 0;
        
        var _activeEmitterCount = array_length(__activeEmitters);
        
        gpu_push_state();
        
        if (_activeEmitterCount > 0)
        {
            _secondaryInterface.__SetShader();
            
            var _i = 0;
            repeat (_activeEmitterCount)
            {
                var _emitter = __activeEmitters[_i];
                var _parentType = _emitter.__particleType;
                
                if (_parentType.__childType != undefined && _parentType.__childType.__type == SPARTA_TYPE_SPRITE)
                {
                    var _childType = _parentType.__childType;
                    _secondaryInterface.__SetTypeUniforms(_childType, _parentType, true);
                    var _particlesPerParent = ceil(_parentType.__childCount * min(_parentType.__life[1], _childType.__life[1]));
                    
                    var _parentParticleCount = min(_childType.__life[1] + _parentType.__life[1], _emitter.__lifeSpan, __time - _emitter.__creationTime) * _emitter.__particlesPerStep;
                    var _particleCount = ceil(_particlesPerParent * _parentParticleCount);
                    
                    _secondaryInterface.__SetEmitterUniforms(_emitter);
                    _secondaryInterface.__Submit(_childType, _emitter.__particleSystem, _particleCount);
                }
                else
                {
                    __SpartaWarn($"Attempting to draw a child particle that is not of type sprite.");
                }
                
                if (_parentType.__deathType != undefined && _parentType.__childType.__type == SPARTA_TYPE_SPRITE)
                {
                    var _deathType = _parentType.__deathType;
                    _secondaryInterface.__SetTypeUniforms(_deathType, _parentType, false);
                    var _particlesPerParent = _parentType.__deathCount;
                    
                    var _parentParticleCount = min(_deathType.__life[1] + _parentType.__life[1], _emitter.__lifeSpan, __time - _emitter.__creationTime) * _emitter.__particlesPerStep;
                    var _particleCount = ceil(_particlesPerParent * _parentParticleCount);
                    
                    _secondaryInterface.__SetEmitterUniforms(_emitter);
                    _secondaryInterface.__Submit(_deathType, _emitter.__particleSystem, _particleCount);
                }
                else
                {
                    __SpartaWarn($"Attempting to draw a death particle that is not of type sprite.");
                }
                
                _i++;
            }
            
            var _i = 0;
            repeat(_activeEmitterCount)
            {
                var _emitter = __activeEmitters[_i];
                var _particleType = _emitter.__particleType;
                
                if (_particleType.__type == SPARTA_TYPE_MESH)
                {
                    _meshInterface.__SetShader();
                    _meshInterface.__SetTypeUniforms(_particleType);
                    _meshInterface.__SetEmitterUniforms(_emitter);
                    
                    var _particleCount = ceil(min(_particleType.__life[1], _emitter.__lifeSpan, __time - _emitter.__creationTime) * _emitter.__particlesPerStep);
                    _meshInterface.__Submit(_particleType, _emitter.__particleSystem, _particleCount);
                }
                else if (_parentType.__type == SPARTA_TYPE_SPRITE)
                {
                    _primaryInterface.__SetShader();
                    _primaryInterface.__SetTypeUniforms(_particleType);
                    _primaryInterface.__SetEmitterUniforms(_emitter);
                    
                    var _particleCount = ceil(min(_particleType.__life[1], _emitter.__lifeSpan, __time - _emitter.__creationTime) * _emitter.__particlesPerStep);
                    _primaryInterface.__Submit(_particleType, _emitter.__particleSystem, _particleCount);
                }
                else
                {
                    __SpartaWarn($"Attempting to draw a particle without a type.");
                }
                
                _i++;
            }
        }
        
        shader_reset();
        gpu_pop_state();
    }
    
    static RetireAll = function(_force)
    {
        var _i = array_length(__activeEmitters);
        
        while (--_i >= 0)
        {
            __activeEmitters[_i].Retire(_force);
        }
    }
    
    #region Getters / Setters
    
    static SetDynamicInterval = function(_interval)
    {
        __dynamicInterval = _interval;
    }
    
    static GetDynamicInterval = function()
    {
        return __dynamicInterval;
    }
    
    static SetBatchSize = function(_batchSize)
    {
        __batchSize = [ 256 ];
        if (is_array(_batchSize))
        {
            __batchSize = _batchSize;
        }
        else if (is_real(_batchSize))
        {
            __batchSize = [ _batchSize ];
        }
        
        __UpdateVertexBuffers();
    }
    
    static GetBatchSize = function()
    {
        return variable_clone(__batchSize);
    }
    
    static SetPause = function(_pause)
    {
        __paused = _pause;
    }
    
    static GetPause = function()
    {
        return __paused;
    }
    
    static GetDrawCalls = function()
    {
        return __drawCalls;
    }
    
    static GetParticleCount = function()
    {
        return __particleCount;
    }
    
    static GetTime = function()
    {
        return __time;
    }
    
    #endregion
}
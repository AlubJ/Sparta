// Feather disable all

function __SpartaSecondaryInterface() constructor
{
    __shader = __SecondaryShader;
    
    _uniforms = {
        uBatchIndex: shader_get_uniform(__shader, "uBatchIndex"),
        uParticleCount: shader_get_uniform(__shader, "uParticleCount"),
        
        uEmitterStartMatrix: shader_get_uniform(__shader, "uEmitterStartMatrix"),
        uEmitterEndMatrix: shader_get_uniform(__shader, "uEmitterEndMatrix"),
        uEmitterLifeSpan: shader_get_uniform(__shader, "uEmitterLifeSpan"),
        uEmitterTimeAlive: shader_get_uniform(__shader, "uEmitterTimeAlive"),
        uEmitterShapeDistribution: shader_get_uniform(__shader, "uEmitterShapeDistribution"),
        uEmitterID: shader_get_uniform(__shader, "uEmitterID"),
        uEmitterParticlesPerStep: shader_get_uniform(__shader, "uEmitterParticlesPerStep"),
        uEmitterSector: shader_get_uniform(__shader, "uEmitterSector"),
        
        uParticleDirection: shader_get_uniform(__shader, "uParticleDirection"),
        uParticleSpeed: shader_get_uniform(__shader, "uParticleSpeed"),
        uParticleLife: shader_get_uniform(__shader, "uParticleLife"),
        uParticleSize: shader_get_uniform(__shader, "uParticleSize"),
        uParticleScale: shader_get_uniform(__shader, "uParticleScale"),
        uParticleSizeClamp: shader_get_uniform(__shader, "uParticleSizeClamp"),
        uParticleAngle: shader_get_uniform(__shader, "uParticleAngle"),
        uParticleGravity: shader_get_uniform(__shader, "uParticleGravity"),
        uParticleAngleRelative: shader_get_uniform(__shader, "uParticleAngleRelative"),
        uParticleDirectionRadial: shader_get_uniform(__shader, "uParticleDirectionRadial"),
        uParticleColor: shader_get_uniform(__shader, "uParticleColor"),
        uParticleColorType: shader_get_uniform(__shader, "uParticleColorType"),
        uParticleSpriteOrigin: shader_get_uniform(__shader, "uParticleSpriteOrigin"),
        uParticleSpriteSettings: shader_get_uniform(__shader, "uParticleSpriteSettings"),
        
        uChild: shader_get_uniform(__shader, "uChild"),
        uParentLife: shader_get_uniform(__shader, "uParentLife"),
        uParentSpeed: shader_get_uniform(__shader, "uParentSpeed"),
        uParentDirection: shader_get_uniform(__shader, "uParentDirection"),
        uParentDirectionRadial: shader_get_uniform(__shader, "uParentDirectionRadial"),
        uParentGravity: shader_get_uniform(__shader, "uParentGravity"),
        uParentSpawnCount: shader_get_uniform(__shader, "uParentSpawnCount"),
        
        uParticleAlphaTest: shader_get_uniform(__shader, "uParticleAlphaTest"),
    };
    
    static __SetShader = function()
    {
        shader_set(__shader);
    }
    
    static __SetTypeUniforms = function(_type, _parentType, _child)
    {
        var _uniforms = __uniforms;
        with (_type)
        {
            gpu_set_cullmode(__cullmode);
            gpu_set_zwriteenable(__zWrite);
            gpu_set_blendenable(__blendEnable);
            
            if (__blendEnable)
            {
                gpu_set_blendmode_ext(__blendSource, __blendDestination);
            }
            
            shader_set_uniform_f_array(_uniforms.uParticleLife, __life);
            shader_set_uniform_f_array(_uniforms.uParticleSpriteSettings, __spriteSettings);
            shader_set_uniform_f_array(_uniforms.uParticleSpriteOrigin, __spriteOrigin);
            shader_set_uniform_f_array(_uniforms.uParticleGravity, __gravity);
            shader_set_uniform_f_array(_uniforms.uParticleAngle, __angle);
            shader_set_uniform_f_array(_uniforms.uParticleColor, __color);
            shader_set_uniform_f_array(_uniforms.uParticleSize, __size);
            shader_set_uniform_f_array(_uniforms.uParticleSizeClamp, __sizeClamp);
            shader_set_uniform_f_array(_uniforms.uParticleScale, __scale);
            shader_set_uniform_f_array(_uniforms.uParticleSpeed, __speed);
            shader_set_uniform_f_array(_uniforms.uParticleDirection, __direction);
            shader_set_uniform_i(_uniforms.uParticleAngleRelative, __angleRelative);
            shader_set_uniform_i(_uniforms.uParticleDirectionRadial, __directionRadial);
            shader_set_uniform_f(_uniforms.uParticleColorType, __colorType);
            shader_set_uniform_f(_uniforms.uParticleAlphaTest, __alphaTest);
        }
        
        with (_parentType)
        {
            shader_set_uniform_i(_uniforms.uChild, _child);
            shader_set_uniform_f_array(_uniforms.uParentLife, __life);
            shader_set_uniform_f_array(_uniforms.uParentSpeed, __speed);
            shader_set_uniform_f_array(_uniforms.uParentDirection, __direction);
            shader_set_uniform_f_array(_uniforms.uParentGravity, __gravity);
            shader_set_uniform_i(_uniforms.uParentDirectionRadial, __directionRadial);
            shader_set_uniform_i(_uniforms.uParentSpawnCount, _child ? __stepCount : __deathCount);
        }
    }
    
    static __SetEmitterUniforms = function(_emitter)
    {
        var _uniforms = __uniforms;
        with (_emitter)
        {
            var _time = __particleSystem.__time - __creationTime;
            shader_set_uniform_f_array(_uniforms.uEmitterStartMatrix, __startMatrix);
            shader_set_uniform_f_array(_uniforms.uEmitterEndMatrix, __endMatrix);
            shader_set_uniform_f(_uniforms.uEmitterLifeSpan, min(_time, __lifeSpan));
            shader_set_uniform_f(_uniforms.uEmitterTimeAlive, _time);
            shader_set_uniform_f(_uniforms.uEmitterShapeDistribution, __shape + 4 * __distribution + 12 * (__particlesPerStep != SPARTA_MAX_BURST_COUNT));
            shader_set_uniform_f(_uniforms.uEmitterID, __id);
            shader_set_uniform_f(_uniforms.uEmitterParticlesPerStep, __particlesPerStep);
            shader_set_uniform_f(_uniforms.uEmitterSector, pi * __sector / 360);
        }
    }
    
    static __Submit = function(_type, _particleSystem, _particleCount)
    {
        var _uniforms = __uniforms;
        var _texture = sprite_get_texture(_type.__sprite, 0);
        
        var _batchIndex = __SpartaGetBatchIndex(_particleSystem, _particleCount);
        var _vertexBuffer = _particleSystem.__vertexBatches[_batchIndex];
        var _batchSize = _particleSystem.__batchSize[_batchIndex];
        var _batchCount = ceil(_particleCount / _batchSize);
        
        shader_set_uniform_f(_uniforms.uParticleCount, _batchCount * _batchSize);
        
        var _i = 0;
        repeat (_batchCount)
        {
            shader_set_uniform_f(_uniforms.uBatchIndex, _i * _batchSize);
            vertex_submit(_vertexBuffer, pr_trianglelist, _texture);
        }
        
        _particleSystem.__particleCount += _particleCount;
        _particleSystem.__drawCalls += _batchCount;
    }
}
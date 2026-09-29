// Feather disable all

function __SpartaEffectFireInstruction(_system, _instance, _instruction)
{
    var _emitter = new __SpartaClassEmitter(_system);
    
    _emitter.SetRegion(
        _instance.__xPosition + _instruction.xPosition,
        _instance.__yPosition + _instruction.yPosition,
        _instance.__zPosition + _instruction.zPosition,
        _instruction.xRotation, _instruction.yRotation, _instruction.zRotation,
        _instruction.xScale, _instruction.yScale, _instruction.zScale,
    )
        .SetShape(_instruction.shape)
        .SetSector(_instruction.sector)
        .SetDistribution(_instruction.distribution);
    
    if (_instruction.action == SPARTA_EFFECT_BURST)
    {
        _emitter.Burst(_instruction.type, _instruction.count);
    }
    else if (_instruction.action == SPARTA_EFFECT_STREAM)
    {
        _emitter.Stream(_instruction.type, _instruction.particlesPerStep, _instruction.duration);
    }
}
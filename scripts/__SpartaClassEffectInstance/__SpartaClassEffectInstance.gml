// Feather disable all

function __SpartaClassEffectInstance(_system, _effect) constructor
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError("Particle system passed in is invalid.");
    }
    
    if (!__SpartaEnsureEffect(_effect))
    {
        __SpartaError("Effect passed in is invalid.");
    }
    
    __particleSystem = _system;
    __effect = _effect;
    
    __xPosition = 0;
    __yPosition = 0;
    __zPosition = 0;
    
    __startTime = 0;
    __cursor = 0;
    
    __active = false;
    __activeIndex = -1;
    
    static Play = function()
    {
        __cursor = 0;
        __startTime = __particleSystem.__time;
        
        __effect.__Sort();
        
        if (!__active)
        {
            __active = true;
            __activeIndex = array_length(__particleSystem.__activeEffects);
            array_push(__particleSystem.__activeEffects, self);
        }
        
        return self;
    }
    
    static PlayAt = function(_xPosition, _yPosition, _zPosition)
    {
        __xPosition = _xPosition;
        __yPosition = _yPosition;
        __zPosition = _zPosition;
        
        return Play();
    }
    
    static Stop = function()
    {
        if (!__active)
        {
            return self;
        }
        
        var _effects = __particleSystem.__activeEffects;
        var _last = array_pop(_effects);
        
        if (_last != self)
        {
            _effects[__activeIndex] = _last;
            _last.__activeIndex = __activeIndex;
        }
        
        __active = false;
        __activeIndex = -1;
    }
    
    static SetPosition = function(_xPosition, _yPosition, _zPosition)
    {
        __xPosition = _xPosition;
        __yPosition = _yPosition;
        __zPosition = _zPosition;
        
        return self;
    }
    
    static IsPlaying = function()
    {
        return __active;
    }
}
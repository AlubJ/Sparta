// Feather disable all

/// 
/// Set an effect instances position.
///
/// @param {Struct.__SpartaClassEffectInstance} instance
/// @param {Real} xPosition
/// @param {Real} yPosition
/// @param {Real} zPosition
function SpartaEffectInstanceSetPosition(_instance, _xPosition, _yPosition, _zPosition)
{
    if (!__SpartaEnsureEffectInstance(_instance))
    {
        __SpartaError("Effect instance passed in is invalid.");
    }
    
    _instance.SetPosition(_xPosition, _yPosition, _zPosition);
}
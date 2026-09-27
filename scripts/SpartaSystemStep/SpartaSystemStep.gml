
///
/// This function will step the particle system. The time increment parameter
/// is used to step each particle. Usually, an increment of `1` per frame for
/// 60 frames-per-second is sufficient, however, you may want to use delta time
/// if your game has a variable framerate.
///
/// @param {Struct.__SpartaClassSystem} system The system to step.
/// @param {Real} increment The amount of time to increment this frame.
function SpartaSystemStep(_system, _increment)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.Step(_increment);
}
// Feather disable all

///
/// Return back the batch size array of a system.
///
/// @param {Struct.__SpartaClassSystem} system The system.
function SpartaSystemGetBatchSize(_system)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    return _system.GetBatchSize();
}
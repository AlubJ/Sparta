// Feather disable all

///
/// Set the batch size array of a system.
///
/// @param {Struct.__SpartaClassSystem} system
/// @param {Array.Real} batchSizeArray
function SpartaSystemSetBatchSize(_system, _batchSizeArray)
{
    if (!__SpartaEnsureSystem(_system))
    {
        __SpartaError($"Particle system passed in is invalid.");
    }
    
    _system.SetBatchSize(_batchSizeArray);
}
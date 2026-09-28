// Feather disable all

///
/// Create a new particle system. Each system is responsible for drawing
/// all the emitters the system holds. When creating a new particle system
/// you will need to pass in an array of batch sizes. Each size corrisponds
/// to the number of particles in a single batch. The more batch sizes and
/// the more varied they are will determine how many vertex submit calls
/// will be executed for each emitter that is drawn.
///
/// @param {Array.Real} batchSize An array of batch sizes.
function SpartaSystemCreate(_batchSize)
{
    return new __SpartaClassSystem(_batchSize);
}
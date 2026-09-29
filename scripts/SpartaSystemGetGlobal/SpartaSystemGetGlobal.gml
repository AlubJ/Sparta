// Feather disable all

///
/// Return the global particle system that you can use for any particle emitters.
/// This system is created when the library loads.
///
function SpartaSystemGetGlobal()
{
    static _system = __SpartaSystem();
    return _system.__particleSystem;
}
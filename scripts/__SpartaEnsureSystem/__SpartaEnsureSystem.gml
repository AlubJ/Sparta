// Feather disable all

function __SpartaEnsureSystem(_system)
{
    return is_instanceof(_system, __SpartaClassSystem) && !_system.__destroyed;
}
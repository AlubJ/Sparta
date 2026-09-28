// Feather disable all

function __SpartaEnsureSystem(_system)
{
    if (!is_instanceof(_system, __SpartaClassSystem))
    {
        return false;
    }
    else
    {
        return true;
    }
}
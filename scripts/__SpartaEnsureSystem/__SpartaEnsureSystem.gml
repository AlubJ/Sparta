// Feather disable all

function __SpartaEnsureSystem(_system)
{
    if (!is_struct(_system) || _system.__time == undefined)
    {
        return false;
    }
    else
    {
        return true;
    }
}
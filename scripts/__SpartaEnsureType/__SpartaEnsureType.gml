// Feather disable all

function __SpartaEnsureType(_type)
{
    if (!is_instanceof(_type, __SpartaClassType) && !_type.__destroyed)
    {
        return false;
    }
    else
    {
        return true;
    }
}
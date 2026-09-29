// Feather disable all

function __SpartaEnsureType(_type)
{
    return (is_instanceof(_type, __SpartaClassType) && !_type.__destroyed);
}
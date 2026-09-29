// Feather disable all

function __SpartaEnsureEffect(_effect)
{
    return is_instanceof(_effect, __SpartaClassEffect) && !_effect.__destroyed;
}
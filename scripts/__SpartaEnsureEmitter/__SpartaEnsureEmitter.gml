// Feather disable all

function __SpartaEnsureEmitter(_emitter)
{
    if (!is_instanceof(_emitter, __SpartaClassEmitter))
    {
        return false;
    }
    else
    {
        return true;
    }
}
// Feather disable all

///
/// Set the blend mode of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Bool} enable
/// @param {Constant.BlendModeFactor} source
/// @param {Constant.BlendModeFactor} destination
function SpartaTypeSetBlend(_type, _enabled, _source, _destination)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetBlend(_enabled, _source, _destination);
}
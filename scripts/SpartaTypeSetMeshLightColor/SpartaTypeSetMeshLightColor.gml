// Feather disable all

///
/// Set the mesh light color of a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Constant.Color} ambientColor
function SpartaTypeSetMeshLightColor(_type, _lightColor)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetMeshLightColor(_lightColor);
}
// Feather disable all

///
/// Set the color for a particle type.
///
/// @param {Struct.__SpartaClassType} type
/// @param {Constant.Color} color1
/// @param {Real} alpha1
/// @param {Constant.Color} [color2]
/// @param {Real} [alpha2]
/// @param {Constant.Color} [color3]
/// @param {Real} [alpha3]
/// @param {Constant.Color} [color4]
/// @param {Real} [alpha4]
/// @param {Bool} [choose]
function SpartaTypeSetColor(_type, _color1, _alpha1, _color2 = undefined, _alpha2 = undefined, _color3 = undefined, _alpha3 = undefined, _color4 = undefined, _alpha4 = undefined, _choose = undefined)
{
    if (!__SpartaEnsureType(_type))
    {
        __SpartaError($"Particle type passed in is invalid.");
    }
    
    _type.SetColor(_color1, _alpha1, _color2, _alpha2, _color3, _alpha3, _color4, _alpha4, _choose);
}
// Feather disable all

///
/// This makes sure the three vectors of the givem matrix are all unit length and
/// perpendicular to each other, using the up direction as master. GameMaker does
/// something similar when creating a lookat matrix. People often use [0, 0, 1] as
/// the up durection, but this vector is not used directly for creating the view
/// matrix; rather, it's being used as reference, and the entire view matrix is being
/// orthogonalized to the looking direction.
///
function __SpartaMatrixOrthogonalize(_matrix)
{
    var _length = _matrix[8] * _matrix[8] + _matrix[9] * _matrix[9] + _matrix[10] * _matrix[10];
    
    if (_length == 0)
    {
        return false;
    }
    
    _length = 1 / sqrt(_length);
    _matrix[@ 8]  *= _length;
    _matrix[@ 9]  *= _length;
    _matrix[@ 10] *= _length;
    
    _matrix[@ 4] = _matrix[9] * _matrix[2] - _matrix[10]* _matrix[1];
    _matrix[@ 5] = _matrix[10]* _matrix[0] - _matrix[8] * _matrix[2];
    _matrix[@ 6] = _matrix[8] * _matrix[1] - _matrix[9] * _matrix[0];
    
    var _length = _matrix[4] * _matrix[4] + _matrix[5] * _matrix[5] + _matrix[6] * _matrix[6];
    if (_length == 0)
    {
        return false;
    }
    
    _length = 1 / sqrt(_length);
    _matrix[@ 4] *= _length;
    _matrix[@ 5] *= _length;
    _matrix[@ 6] *= _length;
    
    // The last vector is automatically normalized, since the two other vectors now are perpendicular unit vectors
    _matrix[@ 0] = _matrix[10] * _matrix[5] - _matrix[9]  * _matrix[6];
    _matrix[@ 1] = _matrix[8]  * _matrix[6] - _matrix[10] * _matrix[4];
    _matrix[@ 2] = _matrix[9]  * _matrix[4] - _matrix[8]  * _matrix[5];
    
    return true;
}
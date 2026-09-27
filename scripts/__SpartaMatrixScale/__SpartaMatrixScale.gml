
///
/// Scale the given matrix along its own axis
///
function __SpartaMatrixScale(_matrix, _toScale, _siScale, _upScale)
{
    _matrix[@ 0] *= _toScale;
    _matrix[@ 1] *= _toScale;
    _matrix[@ 2] *= _toScale;
    _matrix[@ 4] *= _siScale;
    _matrix[@ 5] *= _siScale;
    _matrix[@ 6] *= _siScale;
    _matrix[@ 8] *= _upScale;
    _matrix[@ 9] *= _upScale;
    _matrix[@ 10]*= _upScale;
    
    return _matrix;
}
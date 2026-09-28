// Feather disable all

function __SpartaMatrixSetAxisLength(_matrix, _offset, _length)
{
    var _current = point_distance_3d(0, 0, 0, _matrix[_offset], _matrix[_offset + 1], _matrix[_offset + 2]);
    
    if (_current == 0)
    {
        return;
    }
    
    var _factor = _length / _current;
    
    _matrix[@ _offset] *= _factor;
    _matrix[@ _offset + 1] *= _factor;
    _matrix[@ _offset + 2] *= _factor;
}
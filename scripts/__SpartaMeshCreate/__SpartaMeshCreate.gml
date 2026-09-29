// Feather disable all

function __SpartaMeshCreate(_meshBuffer, _vertexFormat, _meshCountPerBatch = 255)
{
    static _system = __SpartaSystem();
    
    var _format = vertex_format_get_info(_vertexFormat);
    buffer_seek(_meshBuffer, buffer_seek_start, 0);
    
    var _formatElementCount = _format.num_elements;
    var _formatElements = _format.elements;
    var _vertexStride = _format.stride;
    
    if (_formatElementCount < 2)
    {
        __SpartaError("Mesh vertex format has too few elements. A correct vertex format must contain position, normal and texcoord.");
    }
    
    var _positionOffset = 0;
    var _normalOffset = 0;
    var _uvOffset = 0;
    
    var _i = 0;
    repeat (_formatElementCount)
    {
        var _element = _formatElements[_i];
        
        if (_element.usage == vertex_usage_position)
        {
            if (_element.type != vertex_type_float3)
            {
                __SpartaError("Vertex position must be of type `vertex_type_float3`.");
            }
            
            _positionOffset = _element.offset;
        }
        else if (_element.usage == vertex_usage_normal)
        {
            if (_element.type != vertex_type_float3)
            {
                __SpartaError("Vertex normal must be of type `vertex_type_float3`.");
            }
            
            _normalOffset = _element.offset;
        }
        else if (_element.usage == vertex_usage_texcoord)
        {
            if (_element.type != vertex_type_float2)
            {
                __SpartaError("Vertex texcoord must be of type `vertex_type_float2`.");
            }
            
            _uvOffset = _element.offset;
        }
        
        _i++;
    }
    
    var _vertexCount = buffer_get_size(_meshBuffer) / _vertexStride;
    
    var _min = [9999999, 9999999, 9999999];
    var _max = [-9999999, -9999999, -9999999];
    
    var _i = 0;
    repeat (_vertexCount)
    {
        var _base = _vertexStride * _i + _positionOffset;
        
        var _j = 0;
        repeat (3)
        {
            var _v = buffer_peek(_meshBuffer, _base + _j * 4, buffer_f32);
            _min[_j] = min(_min[_j], _v);
            _max[_j] = max(_max[_j], _v);
            
            _j++;
        }
        
        _i++;
    }
    
    var _size = max(_max[0] - _min[0], _max[1] - _min[1], _max[2] - _min[2]);
    var _offsetX = (_min[0] + _max[0]) / 2;
    var _offsetY = (_min[1] + _max[1]) / 2;
    var _offsetZ = (_min[2] + _max[2]) / 2;
    
    var _instanceSize = _vertexCount * 8;
    var _instanceBuffer = buffer_create(_instanceSize, buffer_fixed, 1);
    
    var _i = 0;
    repeat (_vertexCount)
    {
        var _posBase = _vertexStride * _i + _positionOffset;
        var _xPosition = buffer_peek(_meshBuffer, _posBase + 0, buffer_f32);
        var _yPosition = buffer_peek(_meshBuffer, _posBase + 4, buffer_f32);
        var _zPosition = buffer_peek(_meshBuffer, _posBase + 8, buffer_f32);
        
        var _normBase = _vertexStride * _i + _normalOffset;
        var _xNormal = buffer_peek(_meshBuffer, _normBase + 0, buffer_f32);
        var _yNormal = buffer_peek(_meshBuffer, _normBase + 4, buffer_f32);
        var _zNormal = buffer_peek(_meshBuffer, _normBase + 8, buffer_f32);
        
        var _uvBase = _vertexStride * _i + _uvOffset;
        var _xUV = buffer_peek(_meshBuffer, _uvBase + 0, buffer_f32);
        var _yUV = buffer_peek(_meshBuffer, _uvBase + 4, buffer_f32);
        
        _xPosition = 255 * (0.5 + (_xPosition - _offsetX) / _size);
        _yPosition = 255 * (0.5 + (_yPosition - _offsetY) / _size);
        _zPosition = 255 * (0.5 + (_zPosition - _offsetZ) / _size);
        _xUV = clamp(round(_xUV * 255), 0, 255);
        _yUV = clamp(round(_yUV * 255), 0, 255);
        
        var _xyNormal = floor(255 * point_direction(0, 0, _xNormal, _yNormal) / 360);
        var _zNormal = floor(255 * point_direction(0, 0, _zNormal, -point_direction(0, 0, _xNormal, _yNormal)) / 180);
        
        buffer_write(_instanceBuffer, buffer_u8, _xPosition);
        buffer_write(_instanceBuffer, buffer_u8, _yPosition);
        buffer_write(_instanceBuffer, buffer_u8, _zPosition);
        buffer_write(_instanceBuffer, buffer_u8, 0);
        buffer_write(_instanceBuffer, buffer_u8, _xUV);
        buffer_write(_instanceBuffer, buffer_u8, _yUV);
        buffer_write(_instanceBuffer, buffer_u8, _xyNormal);
        buffer_write(_instanceBuffer, buffer_u8, _zNormal);
        
        _i++;
    }
    
    var _particleBuffer = __SpartaMeshBatchCreate(_instanceBuffer, _instanceSize, _meshCountPerBatch);
    buffer_delete(_instanceBuffer);
    
    var _vertexBuffer = vertex_create_buffer_from_buffer(_particleBuffer, _system.__meshFormat);
    buffer_delete(_particleBuffer);
    
    return _vertexBuffer;
}
// Feather disable all

function __SpartaMeshToBase64(_vertexBuffer)
{
    var _buffer = buffer_create_from_vertex_buffer(_vertexBuffer, buffer_grow, 1);
    var _base64 = buffer_base64_encode(_buffer, 0, buffer_get_size(_buffer));
    buffer_delete(_buffer);
    
    return _base64;
}
/*
	CalicoWireframePrimitives
	-------------------------------------------------------------------------
	Script:			CalicoWireframePrimitives
	Version:		v1.00
	Created:		
	Description:	CalicoEngine Wireframe Primitives (Taken from Ugg)
	-------------------------------------------------------------------------
	History:
	
	To Do:
	
	Information:
	 - Written by Juju Adams (Ugg).
	 
	MIT License

	Copyright (c) 2025 Julian Adams

	Permission is hereby granted, free of charge, to any person obtaining a copy
	of this software and associated documentation files (the "Software"), to deal
	in the Software without restriction, including without limitation the rights
	to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
	copies of the Software, and to permit persons to whom the Software is
	furnished to do so, subject to the following conditions:

	The above copyright notice and this permission notice shall be included in all
	copies or substantial portions of the Software.

	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
	IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
	LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
	OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
	SOFTWARE.

*/

/// @func CalicoBuildWireframeAABB()
/// @desc Build AABB wireframe primitive.
function CalicoBuildWireframeAABB(_scale = 0.5)
{
	// Positions
	var _x1 = -_scale;
	var _y1 = -_scale;
	var _z1 = -_scale;
	var _x2 =  _scale;
	var _y2 =  _scale;
	var _z2 =  _scale;
	
	// Begin Vertex Format
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    // Bottom
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1);
    
    // Top
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2);
    
    // Columns
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z1);
    vertex_position_3d(_vertexBuffer, _x1, _y1, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y1, _z2);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x1, _y2, _z2);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z1);
    vertex_position_3d(_vertexBuffer, _x2, _y2, _z2);
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeCircle()
/// @desc Build circle wireframe primitive.
function CalicoBuildWireframeCircle()
{
	var _steps = 10;
	
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _x2 = 1;
    var _y2 = 0;
    
    var _i = 0;
    repeat(_steps+1)
    {
        var _x1 = _x2;
        var _y1 = _y2;
        
        var _theta = 360*(_i / _steps);
        _x2 =  dcos(_theta);
        _y2 = -dsin(_theta);
        
        vertex_position_3d(_vertexBuffer, _x1, _y1, 0);
        vertex_position_3d(_vertexBuffer, _x2, _y2, 0);
        
        ++_i;
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeCone()
/// @desc Build cone wireframe primitive.
function CalicoBuildWireframeCone()
{
	var _baseSteps = 16;
	var _slopeSteps = 8;
	
	var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _incr = 360 / _baseSteps;
    var _angle = 0;
    
    var _bx = dcos(_angle);
    var _by = dsin(_angle);
    
    repeat(_baseSteps)
    {
        _angle += _incr;
        
        var _ax =  _bx;
        var _ay =  _by;
        var _bx =  dcos(_angle);
        var _by = -dsin(_angle);
        
        //Cap
        vertex_position_3d(_vertexBuffer, _ax, _ay, 0);
        vertex_position_3d(_vertexBuffer, _bx, _by, 0);
    }
    
    //Slope
    var _incr = 360 / _slopeSteps;
    var _angle = 0;
    repeat(_slopeSteps)
    {
        vertex_position_3d(_vertexBuffer,            0,             0, 1);
        vertex_position_3d(_vertexBuffer, dcos(_angle), -dsin(_angle), 0);
        
        _angle += _incr;
    }

    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeCylinder()
/// @desc Build cylinder wireframe primitive.
function CalicoBuildWireframeCylinder()
{
	var _capSteps = 16;
	var _wallSteps = 8;
	
	var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _x2 = 1;
    var _y2 = 0;
    
    var _i = 0;
    repeat(_capSteps+1)
    {
        var _x1 = _x2;
        var _y1 = _y2;
        
        var _theta = 360*(_i / _capSteps);
        _x2 =  dcos(_theta);
        _y2 = -dsin(_theta);
        
        vertex_position_3d(_vertexBuffer, _x1, _y1, 1);
        vertex_position_3d(_vertexBuffer, _x2, _y2, 1);
        
        vertex_position_3d(_vertexBuffer, _x2, _y2, 0);
        vertex_position_3d(_vertexBuffer, _x1, _y1, 0);
        
        ++_i;
    }
    
    var _i = 0;
    repeat(_wallSteps+1)
    {
        var _theta = 360*(_i / _wallSteps);
        var _x =  dcos(_theta);
        var _y = -dsin(_theta);
        
        vertex_position_3d(_vertexBuffer, _x, _y, 0);
        vertex_position_3d(_vertexBuffer, _x, _y, 1);
        
        ++_i;
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframePlane()
/// @desc Build plane wireframe primitive.
function CalicoBuildWireframePlane()
{
	var _size = 1;
	var _subdivisions = 8;
    _size *= 0.5;
    
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin( _vertexBuffer, global.wireframeVertexFormat);
    
    //Edge
    vertex_position_3d(_vertexBuffer, -_size, -_size, 0);
    vertex_position_3d(_vertexBuffer,  _size, -_size, 0);
    
    vertex_position_3d(_vertexBuffer,  _size, -_size, 0);
    vertex_position_3d(_vertexBuffer,  _size,  _size, 0);
    
    vertex_position_3d(_vertexBuffer,  _size,  _size, 0);
    vertex_position_3d(_vertexBuffer, -_size,  _size, 0);
    
    vertex_position_3d(_vertexBuffer, -_size,  _size, 0);
    vertex_position_3d(_vertexBuffer, -_size, -_size, 0);
    
    if (_subdivisions > 0)
    {
        //Cross
        vertex_position_3d(_vertexBuffer, -_size, -_size, 0);
        vertex_position_3d(_vertexBuffer,  _size,  _size, 0);
        
        vertex_position_3d(_vertexBuffer,  _size, -_size, 0);
        vertex_position_3d(_vertexBuffer, -_size,  _size, 0);
        
        //Hatching
        var _incr =  1 / (1 + _subdivisions);
        var _t = _incr;
        repeat(_subdivisions)
        {
            var _q = _size*(2*_t - 1);
            
            vertex_position_3d(_vertexBuffer,     _q, -_size, 0);
            vertex_position_3d(_vertexBuffer, -_size,     _q, 0);
            
            vertex_position_3d(_vertexBuffer,     _q, -_size, 0);
            vertex_position_3d(_vertexBuffer,  _size,    -_q, 0);
            
            vertex_position_3d(_vertexBuffer,    -_q,  _size, 0);
            vertex_position_3d(_vertexBuffer,  _size,    -_q, 0);
            
            vertex_position_3d(_vertexBuffer,     -_q, _size, 0);
            vertex_position_3d(_vertexBuffer,  -_size,    _q, 0);
            
            _t += _incr;
        }
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeSphere()
/// @desc Build sphere wireframe primitive.
function CalicoBuildWireframeSphere()
{
	var _stripSteps = 12;
	var _stripCount = 4;
	var _bandCount = 1;
	var _bandAccuracy = 3;
	
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _lengthB = 0;
    var _zB      = 1;
    
    var _j = 1;
    repeat(_stripSteps)
    {
        var _lengthA = _lengthB;
        var _zA      = _zB;
        
        var _phi     = 180*(_j / _stripSteps);
        var _lengthB = dsin(_phi);
        var _zB      = dcos(_phi);
        
        var _xA = _lengthA;
        var _yA = 0;
        var _xB = _lengthB;
        var _yB = 0;
        
        var _i = 1;
        repeat(_stripCount)
        {
            var _theta = 360*(_i / _stripCount);
            var _cos = dcos(_theta);
            var _sin = dsin(_theta);
            
            _xA =  _lengthA*_cos;
            _yA = -_lengthA*_sin;
            _xB =  _lengthB*_cos;
            _yB = -_lengthB*_sin;
            
            vertex_position_3d(_vertexBuffer, _xA, _yA, _zA);
            vertex_position_3d(_vertexBuffer, _xB, _yB, _zB);
            
            ++_i;
        }
        
        ++_j;
    }
    
    var _bandSteps = _stripCount*_bandAccuracy;
    
    var _j = 0;
    repeat(_bandCount)
    {
        //var _phi    = 180*((_j + 1) / (_bandCount + 1));
        //var _length = dsin(_phi);
        //var _z      = dcos(_phi);
        
        var _z = 2*((_j + 1) / (_bandCount + 1)) - 1;
        var _length = sqrt(1 - _z*_z);
        
        var _x2 = _length;
        var _y2 = 0;
        
        var _i = 0;
        repeat(_bandSteps+1)
        {
            var _x1 = _x2;
            var _y1 = _y2;
            
            var _theta = 360*(_i / _bandSteps);
            var _cos = dcos(_theta);
            var _sin = dsin(_theta);
            
            _x2 =  _length*_cos;
            _y2 = -_length*_sin;
            
            vertex_position_3d(_vertexBuffer, _x1, _y1, _z);
            vertex_position_3d(_vertexBuffer, _x2, _y2, _z);
            
            ++_i;
        }
        
        ++_j;
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeCapsuleCap()
/// @desc Build capsule cap wireframe primitve.
function CalicoBuildWireframeCapsuleCap()
{
	var _zSteps = 12;
	var _xySteps = 4;
	
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _lengthB = 0;
    var _zB      = 1;
    
    var _j = 1;
    repeat(0.5*_zSteps)
    {
        var _lengthA = _lengthB;
        var _zA      = _zB;
        
        var _phi     = 90*(_j / (0.5*_zSteps));
        var _lengthB = dsin(_phi);
        var _zB      = dcos(_phi);
        
        var _i = 0;
        repeat(_xySteps)
        {
            var _theta = 360*(_i / _xySteps);
            var _cos = dcos(_theta);
            var _sin = dsin(_theta);
            var _xA =  _lengthA*_cos;
            var _yA = -_lengthA*_sin;
            var _xB =  _lengthB*_cos;
            var _yB = -_lengthB*_sin;
            
            vertex_position_3d(_vertexBuffer, _xA, _yA, _zA-1);
            vertex_position_3d(_vertexBuffer, _xB, _yB, _zB-1);
            
            ++_i;
        }
        
        ++_j;
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}

/// @func CalicoBuildWireframeCapsuleBody()
/// @desc Build capsule body wireframe primitive.
function CalicoBuildWireframeCapsuleBody()
{
	var _edgeSteps = 12;
	var _wallSteps = 4;
	
    var _vertexBuffer = vertex_create_buffer();
    vertex_begin(_vertexBuffer, global.wireframeVertexFormat);
    
    var _x2 = 1;
    var _y2 = 0;
    
    var _i = 0;
    repeat(_edgeSteps+1)
    {
        var _x1 = _x2;
        var _y1 = _y2;
        
        var _theta = 360*(_i / _edgeSteps);
        _x2 =  dcos(_theta);
        _y2 = -dsin(_theta);
        
        vertex_position_3d(_vertexBuffer, _x1, _y1,  0.5);
        vertex_position_3d(_vertexBuffer, _x2, _y2,  0.5);
        
        vertex_position_3d(_vertexBuffer, _x2, _y2, -0.5);
        vertex_position_3d(_vertexBuffer, _x1, _y1, -0.5);
        
        ++_i;
    }
    
    var _i = 0;
    repeat(_wallSteps+1)
    {
        var _theta = 360*(_i / _wallSteps);
        var _x =  dcos(_theta);
        var _y = -dsin(_theta);
        
        vertex_position_3d(_vertexBuffer, _x, _y, -0.5);
        vertex_position_3d(_vertexBuffer, _x, _y,  0.5);
        
        ++_i;
    }
    
    vertex_end(_vertexBuffer);
    vertex_freeze(_vertexBuffer);
    
    return _vertexBuffer;
}
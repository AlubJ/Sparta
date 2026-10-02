//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;
varying vec3 vNormal;

void main()
{
    vec4 baseColor = v_vColour * texture2D( gm_BaseTexture, v_vTexcoord );
    
    vec3 lightDirection = vec3(0.0, -0.5, -0.5);
    float NdL = dot(vNormal, normalize(-lightDirection));
    
    if (NdL < 0.25)
    {
        NdL = 0.25;
    }
    else if (NdL > 1.0)
    {
        NdL = 1.0;
    }
    
    gl_FragColor = vec4(baseColor.rgb * NdL, baseColor.a);
}

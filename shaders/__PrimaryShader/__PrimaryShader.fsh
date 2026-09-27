/*/
	This is a shader made for use with the sPart system.
	
	Sindre Hauge Larsen, 2019
	www.TheSnidr.com
/*/
varying vec2 vUV;
varying vec4 vColor;

uniform float uParticleAlphaTest;

void main()
{
	vec4 baseColor = texture2D(gm_BaseTexture, vUV);
    
    gl_FragColor = vec4(1.0);
    
	//if (baseColor.a < uParticleAlphaTest)
    //{
    //    discard;
    //}
    
    //gl_FragColor = vColor * baseColor;
}
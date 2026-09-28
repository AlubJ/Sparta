/*/
	This is a shader made for use with the sPart system.
	This particular shader allows for mesh particles.
	
	Sindre Hauge Larsen, 2019
	www.TheSnidr.com
/*/
//Attributes
attribute vec4 in_Colour;
attribute vec4 in_Colour2;

//Varyings
varying vec2 vUV;
varying vec4 vColor;

//Batch uniforms
uniform float uBatchIndex;
uniform float uParticleCount;

//Emitter uniforms
uniform mat4 uEmitterStartMatrix;
uniform mat4 uEmitterEndMatrix;
uniform float uEmitterLifeSpan;
uniform float uEmitterTimeAlive;
uniform float uEmitterShapeDistribution;
uniform float uEmitterID;
uniform float uEmitterParticlesPerStep;
uniform float uEmitterSector;

//Particle type uniforms
uniform vec4 uParticleDirection;
uniform vec4 uParticleSpeed;
uniform vec2 uParticleLife;
uniform vec4 uParticleSize;
uniform vec2 uParticleSizeClamp;
uniform vec4 uParticleAngle;
uniform vec3 uParticleGravity;
uniform bool uParticleAngleRelative;
uniform bool uParticleDirectionRelative;
uniform vec4 uParticleColor[4];
uniform float uParticleColorType;
uniform vec2 uParticleSpriteOrigin;
uniform vec4 uParticleSpriteSettings;

//Mesh shader particle type uniforms
uniform vec4 uMeshRotationAxis;
uniform vec3 uMeshLightColor;
uniform vec3 uMeshLightDirection;
uniform vec3 uMeshAmbientColor;

//Noise function
highp vec2 seed = vec2(1.0);
float noise()
{
	highp float a = 12.9898;
    highp float b = 78.233;
    highp float c = 43758.5453;
    highp float dt = dot(seed, vec2(a,b));
    highp float sn = mod(dt, 3.14);
	highp float val = fract(sin(sn) * c);
	seed.x += val;
    return val;
}

//Rotation and orientation
vec2 rotate2d(vec2 vec, float angle)
{
	float S = sin(angle);
	float C = cos(angle);
	return mat2(C, -S, S, C) * vec;
}
mat3 axisAngleToMatrix(vec3 axis, float angle) 
{
    float S = sin(angle);
    float C = cos(angle);
    float oc = 1.0 - C;
    return mat3(oc * axis.x * axis.x + C,           oc * axis.x * axis.y - axis.z * S,  oc * axis.z * axis.x + axis.y * S,
                oc * axis.x * axis.y + axis.z * S,  oc * axis.y * axis.y + C,           oc * axis.y * axis.z - axis.x * S,
                oc * axis.z * axis.x - axis.y * S,  oc * axis.y * axis.z + axis.x * S,  oc * axis.z * axis.z + C);
}
vec3 orthogonalize(vec3 vec, vec3 N)
{
	return normalize(vec - N * dot(vec, N));
}

//Simulate particles
float getRadialFactor(float R)
{
	float distr = mod(floor(uEmitterShapeDistribution * .25), 3.);
	if (distr == 0.){return 1.;} //Linear distribution
	if (distr == 1.){return R * R;} //Gaussian distribution (not exactly, but similar)
	return inversesqrt(R); //Inverse gaussian distribution (not exactly, but similar)
}
vec3 PtGetSpawnPos()
{
	#define SPHERE 3.
	#define CYLINDER 2.
	#define CIRCLE 1.
	#define CUBE 0.
	float shape = mod(uEmitterShapeDistribution, 4.);
	vec3 randv = vec3(noise(), noise(), noise()) * 2. - 1.;
	if (shape == SPHERE)
	{
		float R = pow(noise(), 1./3.);
		return R * getRadialFactor(R) * vec3(normalize(randv.xy) * sqrt(1. - randv.z * randv.z), randv.z);
	}
	if (shape == CYLINDER)
	{
		float R = sqrt(randv.y);
		randv.x *= uEmitterSector;
		return vec3(R * getRadialFactor(R) * vec2(cos(randv.x), sin(randv.x)), randv.z);
	}
	if (shape == CIRCLE)
	{
		randv.x *= uEmitterSector;
		return vec3(cos(randv.x), sin(randv.x), randv.z);
	}
	//Cubical if shape == 0
	return getRadialFactor(max(abs(randv.x), max(abs(randv.y), abs(randv.z)))) * randv;
}
vec3 PtGetPosition(float T, vec3 dir0, float spd0, vec4 PtSpeed, vec3 gravVec)
{
	return T * (dir0 * (spd0 + T * (PtSpeed[2] + T * PtSpeed[3])) + T * gravVec);
}
vec3 PtGetDirection(float T, vec3 dir0, float spd0, vec4 PtSpeed, vec3 gravVec)
{
	//Finds the tangent vector of the movement arc at the given time by checking two nearby points. This is more useful than actually using the derived function, since it allows for easily changing the movement function
	vec3 p1 = PtGetPosition(T-.01, dir0, spd0, PtSpeed, gravVec);
	vec3 p2 = PtGetPosition(T+.01, dir0, spd0, PtSpeed, gravVec);
	return normalize(p2 - p1);
}
vec3 PtDeviateVector(vec4 vec)
{
	//Makes a new vector from vec.xyz that may deviate by up to vec.w radians
	vec3 randv = vec3(noise(), noise(), noise()) - .5;
	float randAngle = noise() * vec.w;
	return vec.xyz * cos(randAngle) + sin(randAngle) * orthogonalize(randv, vec.xyz);
}
mat3 PtGetDirMat(vec3 dir)
{
	vec3 toDir = normalize(dir);
	vec3 upDir = orthogonalize(vec3(0.00011, 0.00011, 1.), toDir);
	mat3 dirMat = mat3(toDir, cross(upDir, toDir), upDir);	
	return dirMat;
}
float PtGetRand(vec2 v)
{	//Returns a random value between v.x and v.y
	return mix(v.x, v.y, noise());
}
float PtGetVar(float T, vec3 v)
{	//Returns a random value between v.x and v.y, and increasing by v.z per time
	return mix(v.x, v.y, noise()) + T * v.z;
}
float PtGetVar(float T, vec4 v)
{	//Returns a random value between v.x and v.y, increasing by v.z per time and accelerating by v.w per time
	return mix(v.x, v.y, noise()) + T * (v.z + T * v.w);
}
float PtGetImageIndex(float T, float lifeSpan)
{
	float imgAniSpd = uParticleSpriteSettings.x;
	float imgRandom = uParticleSpriteSettings.y;
	float imgNum = uParticleSpriteSettings.z;
	float imgInd = imgRandom * floor(imgNum * noise());
	if (imgAniSpd < 0.)
	{
		imgInd += floor(T * imgNum / lifeSpan);
	}
	else
	{
		imgInd += floor(T * imgAniSpd);
	}
	return mod(imgInd, imgNum);
}
vec4 PtGetColour(float T)
{
	if (uParticleColorType == 0.)
	{
		int colInd = int(floor(noise() * 3. + .5));
		return uParticleColor[colInd];
	}
	float colProgress = T * max(uParticleColorType - 1., 0.);
	int colInd = int(colProgress);
	return mix(uParticleColor[colInd], uParticleColor[colInd+1], fract(colProgress));
}

void main()
{
	gl_Position = vec4(0.);
	vUV = vec2(0.);
	vColor = vec4(0.);
	
	//Reconstruct the particle index from the vertex alpha value
	float basePtInd = uBatchIndex + in_Colour.a * 255.;
	
	//Particle lifetime
	float stream = mod(floor(uEmitterShapeDistribution / 12.), 2.);
	float PtNum = max(ceil(uParticleLife.y * uEmitterParticlesPerStep), uParticleCount);
	float PtInd = basePtInd + stream * PtNum * floor((uEmitterTimeAlive * uEmitterParticlesPerStep - basePtInd) / PtNum);
	float PtStartTime = PtInd / uEmitterParticlesPerStep;
	float PtTimeAlive = uEmitterTimeAlive - PtStartTime;
	
	//Set the random seed to a 2D vector where the first value is unique for this emitter, and the second value is unique for this particle
	seed = vec2(uEmitterID, mod(PtInd, 100000.));
	float PtLifeSpan = mix(uParticleLife[0], uParticleLife[1], noise());
	
	//If this particle has been spawned and has not died yet
	if ((PtTimeAlive >= 0.) && (PtTimeAlive < PtLifeSpan) && (PtStartTime >= 0.) && (PtStartTime < uEmitterLifeSpan))
	{
		//Find current position of the particle
		vec3 spawnPos = PtGetSpawnPos();
		float amount = PtStartTime / uEmitterLifeSpan;
		mat4 EmMat = uEmitterStartMatrix * (1. - amount) + uEmitterEndMatrix * amount;
		vec3 EmScale = vec3(length(EmMat[0].xyz), length(EmMat[1].xyz), length(EmMat[2].xyz));
		vec3 PtDir = (EmMat * vec4((uParticleDirectionRelative ? PtGetDirMat(EmScale * spawnPos) * uParticleDirection.xyz : uParticleDirection.xyz) / EmScale, 0.)).xyz;
		vec3 startDir = normalize(PtDeviateVector(vec4(PtDir, uParticleDirection.w)));
		float startSpeed = PtGetRand(uParticleSpeed.xy);
		vec3 PtObjSpacePos = (EmMat * vec4(spawnPos, 1.)).xyz + PtGetPosition(PtTimeAlive, startDir, startSpeed, uParticleSpeed, uParticleGravity);
		
		//Find movement and particle matrix
		vec3 rotAxis = PtDeviateVector(uMeshRotationAxis);
		vec3 moveDir = PtGetDirection(PtTimeAlive, startDir, startSpeed, uParticleSpeed, uParticleGravity);
		float PtAngle = PtGetVar(PtTimeAlive, uParticleAngle);
		mat3 PtMat = axisAngleToMatrix(rotAxis, PtAngle);
		PtMat = uParticleAngleRelative ? PtGetDirMat(moveDir) * PtMat : PtMat;
		
		//Construct projection-space position
		float PtSize = PtGetVar(PtTimeAlive, uParticleSize);
		vec3 vertPtSpacePos = PtMat * PtSize * (in_Colour.xyz - .5);
		gl_Position = gm_Matrices[MATRIX_WORLD_VIEW_PROJECTION] * vec4(PtObjSpacePos + vertPtSpacePos, 1.);
		
		//Get normal and do lighting
		float xyAngle = in_Colour2.z * 6.28318;
		float zAngle = in_Colour2.w * 3.14159;
		vec3 normal = PtMat * vec3(vec2(cos(xyAngle), -sin(xyAngle)) * sin(zAngle), cos(zAngle));
		vec4 lightCol = vec4(uMeshAmbientColor + uMeshLightColor * max(0., -dot(uMeshLightDirection, normal)), 1.);
			
		//Texcoord and colour
		float imgInd = PtGetImageIndex(PtTimeAlive,  PtLifeSpan);
		vUV = vec2((imgInd + in_Colour2.x) / uParticleSpriteSettings.z, in_Colour2.y);
		vColor = lightCol * PtGetColour(PtTimeAlive / PtLifeSpan);
	}
}
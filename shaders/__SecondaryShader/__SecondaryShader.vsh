///
/// 
///

// Attributes
attribute vec4 in_Colour;

// Varyings
varying vec2 vUV;
varying vec4 vColor;

// Batch uniforms
uniform float uBatchIndex;
uniform float uParticleCount;

// Emitter uniforms
uniform mat4 uEmitterStartMatrix;
uniform mat4 uEmitterEndMatrix;
uniform float uEmitterLifeSpan;
uniform float uEmitterTimeAlive;
uniform float uEmitterShapeDistribution;
uniform float uEmitterID;
uniform float uEmitterParticlesPerStep;
uniform float uEmitterSector;

// Particle type uniforms
uniform vec4 uParticleDirection;
uniform vec4 uParticleSpeed;
uniform vec2 uParticleLife;
uniform vec4 uParticleSize;
uniform vec2 uParticleSizeClamp;
uniform vec2 uParticleScale;
uniform vec4 uParticleAngle;
uniform vec3 uParticleGravity;
uniform bool uParticleAngleRelative;
uniform bool uParticleDirectionRadial;
uniform vec4 uParticleColor[4];
uniform float uParticleColorType;
uniform vec2 uParticleSpriteOrigin;
uniform vec4 uParticleSpriteSettings;

// Effect and parent particle type uniforms
uniform bool uChild;
uniform vec2 uParentLife;
uniform vec4 uParentSpeed;
uniform vec4 uParentDirection;
uniform bool uParentDirectionRadial;
uniform vec3 uParentGravity;
uniform float uParentSpawnCount;

#region Helper

// Noise function
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

// Rotation and orientation
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

#endregion

#region Particle Simulation

// Simulate particles
float getRadialFactor(float R)
{
	float distr = mod(floor(uEmitterShapeDistribution * .25), 3.);
	if (distr == 0.){return 1.;} // Linear distribution
	if (distr == 1.){return R * R;} // Gaussian distribution (not exactly, but similar)
	return inversesqrt(R); // Inverse gaussian distribution (not exactly, but similar)
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

#endregion

void main()
{
	
	gl_Position = vec4(0.);
	vUV = vec2(0.);
	vColor = vec4(0.);
	
	vec2 childSeed, parSeed;
	bool parExisted, childHasSpawned;
	float PtLifeSpan, PtOffsetTime, PtTimeAlive, parPtStartTime;
		
	//Reconstruct the Pt index from the vertex rgb values
	float basePtInd = dot(vec4(uBatchIndex, in_Colour.rgb), vec4(1., 255., 65280./*(256*255)*/, 16711680./*(256*256*255)*/));
	
	if (uChild)
	{	//////////////////////////////////////////////////////////////
		//These particles are emitted from a parent particle each step
		//////////////////////////////////////////////////////////////
		//Find parent and child base particle indices
		float idealparNum = ceil((uParticleLife[1] + uParentLife[1]) * uEmitterParticlesPerStep);
		float PtsPerpar = ceil(uParentSpawnCount * min(uParticleLife[1], uParentLife[1]));
		float baseparPtInd = floor(basePtInd / PtsPerpar);
		float baseChildPtInd = mod(basePtInd, PtsPerpar);
	
		//Find parent particle index and determine its life span
		float parPtInd = baseparPtInd + max(0.0, floor(1. + uEmitterTimeAlive * uEmitterParticlesPerStep - idealparNum - baseChildPtInd / PtsPerpar));
		parPtStartTime = parPtInd / uEmitterParticlesPerStep;
		float parPtTimeAlive = uEmitterTimeAlive - parPtStartTime;
		seed = vec2(uEmitterID, mod(parPtInd, 100000.));
		float parPtLifeSpan = mix(uParentLife[0], uParentLife[1], noise());
		parSeed = seed;
	
		//Find child particle index and determine its life span
		float childMaxNum = ceil(uParentSpawnCount * uParticleLife[1]);
		float childPtInd = baseChildPtInd + childMaxNum * floor((parPtTimeAlive * uParentSpawnCount - baseChildPtInd) / childMaxNum);
		PtOffsetTime = childPtInd / uParentSpawnCount;
		float PtStartTime = parPtStartTime + PtOffsetTime;
		PtTimeAlive = uEmitterTimeAlive - PtStartTime;
		seed = vec2(uEmitterID, mod(childPtInd, 100000.));
		PtLifeSpan = mix(uParticleLife[0], uParticleLife[1], noise());
		
		childHasSpawned = ((PtTimeAlive > 0.) && (PtTimeAlive < PtLifeSpan) && (parPtStartTime < uEmitterLifeSpan));
		parExisted = ((parPtStartTime >= 0.0) && (parPtStartTime < uEmitterLifeSpan) && (PtOffsetTime > 0. && PtOffsetTime < parPtLifeSpan));
	}
	else
	{	///////////////////////////////////////////////////////////////
		//These particles are emitted from a parent particle upon death
		///////////////////////////////////////////////////////////////
		//Find parent and child particle indices
		float PtsPerpar = uParentSpawnCount;
		float idealparNum = ceil((uParticleLife[1] + uParentLife[1] - uParentLife[0]) * uEmitterParticlesPerStep);
		float parPtNum = min(idealparNum, ceil(uEmitterLifeSpan * uEmitterParticlesPerStep));
		float idealchildNum = idealparNum * PtsPerpar;
		float PtInd = basePtInd + idealchildNum * floor(((uEmitterTimeAlive - uParentLife[0]) * uEmitterParticlesPerStep - floor(basePtInd / PtsPerpar)) / idealparNum);
	
		//Find parent particle index and determine its life span
		float parPtInd = floor(PtInd / PtsPerpar);
		parPtStartTime = parPtInd / uEmitterParticlesPerStep;
		seed = vec2(uEmitterID, mod(parPtInd, 100000.));
		float parPtLifeSpan = PtGetRand(uParentLife);
		parSeed = seed;
	
		//Find child particle index and determine its life span
		float PtStartTime = parPtStartTime + parPtLifeSpan;
		PtOffsetTime = parPtLifeSpan;
		PtTimeAlive = uEmitterTimeAlive - PtStartTime;
		seed = vec2(uEmitterID, mod(basePtInd, 100000.));
		PtLifeSpan = PtGetRand(uParticleLife);
		
		childHasSpawned = ((PtTimeAlive > 0.) && (PtTimeAlive < PtLifeSpan) && (parPtStartTime < uEmitterLifeSpan) && (basePtInd < parPtNum * PtsPerpar));
		parExisted = ((parPtStartTime >= 0.0) && (parPtStartTime < uEmitterLifeSpan));
	}
	if (childHasSpawned && parExisted)
	{
		//Find starting position of the particle by first simulating the parent particle...
		childSeed = seed;
		seed = parSeed;
		vec3 parSpawnPos = PtGetSpawnPos();
		float amount = parPtStartTime / uEmitterLifeSpan;
		mat4 EmMat = uEmitterStartMatrix * (1. - amount) + uEmitterEndMatrix * amount;
		vec3 EmScale = vec3(length(EmMat[0].xyz), length(EmMat[1].xyz), length(EmMat[2].xyz));
		vec3 parPtDir = (EmMat * vec4((uParentDirectionRadial ? PtGetDirMat(EmScale * parSpawnPos) * uParentDirection.xyz : uParentDirection.xyz) / EmScale, 0.)).xyz;
		vec3 parStartDir = normalize(PtDeviateVector(vec4(parPtDir, uParentDirection.w)));
		float parStartSpd = PtGetRand(uParentSpeed.xy);
		vec3 parPos = (EmMat * vec4(parSpawnPos, 1.)).xyz + PtGetPosition(PtOffsetTime, parStartDir, parStartSpd, uParentSpeed, uParentGravity);
		
		//...and then simulating the child particle from the position of the parent particle
		seed = childSeed;
		vec3 PtDir = PtDeviateVector(uParticleDirection);
		if (uParticleDirectionRadial)
		{
			vec3 parMoveDir = PtGetDirection(PtOffsetTime, parStartDir, parStartSpd, uParentSpeed, uParentGravity);
			PtDir = PtGetDirMat(parMoveDir) * PtDir;
		}
		vec3 startDir = normalize(PtDir);
		float startSpeed = PtGetRand(uParticleSpeed.xy);
		vec3 PtObjSpacePos = parPos + PtGetPosition(PtTimeAlive, startDir, startSpeed, uParticleSpeed, uParticleGravity);
		
		//Find particle-space vertex position
		vec2 vertCorner = vec2(mod(in_Colour.a * 255., 2.), floor(in_Colour.a * 127.5));
		vec2 vertNormPos = uParticleSpriteOrigin + vertCorner;
		if (uParticleAngleRelative)
		{
			vec2 viewSpaceDir = normalize((gm_Matrices[MATRIX_VIEW] * vec4(PtGetDirection(PtTimeAlive, startDir, startSpeed, uParticleSpeed, uParticleGravity), 0.)).xy);
			vertNormPos *= mat2(viewSpaceDir.x, -viewSpaceDir.y, viewSpaceDir.y, viewSpaceDir.x);
		}
		float PtAngle = PtGetVar(PtTimeAlive, uParticleAngle);
		float PtSize = PtGetVar(PtTimeAlive, uParticleSize);
        
        vec2 PtScale = vec2(1.0, 1.0);
        
        if (uParticleScale.x != 0.0) PtScale.x = cos(PtTimeAlive * uParticleScale.x * 5.0);
        if (uParticleScale.y != 0.0) PtScale.y = cos(PtTimeAlive * uParticleScale.y * 5.0);
        
        vec2 scaledNormPos = vec2(vertNormPos.x * PtScale.x, vertNormPos.y * PtScale.y);
        
        vec2 vertPtSpacePos = rotate2d(PtSize * scaledNormPos, PtAngle);
		
		//Construct world-view position and transform vertex to projection space
		vec3 PtWorldPos = (gm_Matrices[MATRIX_WORLD] * vec4(PtObjSpacePos, 1.)).xyz;
		vec4 PtWorldViewPos = gm_Matrices[MATRIX_VIEW][3] + gm_Matrices[MATRIX_VIEW] * vec4(PtWorldPos, 0.);
		PtWorldViewPos.xy += vertPtSpacePos;
		gl_Position = gm_Matrices[MATRIX_PROJECTION] * PtWorldViewPos;
		
		//Texcoord and colour
		float imgInd = PtGetImageIndex(PtTimeAlive,  PtLifeSpan);
		vUV = vec2((imgInd + vertCorner.x) / uParticleSpriteSettings.z, vertCorner.y);
		vColor = PtGetColour(PtTimeAlive / PtLifeSpan);
	}
}
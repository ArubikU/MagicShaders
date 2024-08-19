/* CEM-Shader. DartCat25
*  Fragment functional (set right before main function)
*  #moj_import <cem/frag_funcs.glsl>
*/ 

//Able ins and necessary uniforms
in vec4 cem_pos1, cem_pos2, cem_pos3, cem_pos4;
in vec3 cem_uv1, cem_uv2;
in vec3 cem_glPos;
in vec4 cem_lightMapColor;
flat in int cem;
flat in int cem_reverse;
flat in vec4 cem_light;

#define MAX_DEPTH 1000000

#define ADD_SQUARE(p1, p2, p3, uv) { \
color = sSquare(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT, uv);\
}

#define ADD_BOX(pos, size, dSide, uSide, nSide, eSide, sSide, wSide) { \
color = sBox(-center + pos * modelSize, dirTBN, size * modelSize, TBN, color, minT, uSide, dSide, nSide, wSide, sSide, eSide);\
}

#define ADD_BOX_ROTATE(pos, size, Rotation, rotPivot, dSide, uSide, nSide, eSide, sSide, wSide) { \
color = sBox(Rotation * (-center + (pos + rotPivot) * modelSize) - rotPivot * modelSize, Rotation * dirTBN, size * modelSize, TBN * inverse(Rotation), color, minT, uSide, dSide, nSide, wSide, sSide, eSide); \
}

#define ADD_SQUARE_ROTATE(pos, size, Rotation, rotPivot, uv) { \
    color = sSquareWithRotation(Rotation * (-center + (pos + rotPivot) * modelSize) - rotPivot * modelSize, Rotation * dirTBN, size * modelSize, vertexColor, color, minT, uv, rotAngle);\
}

#define ADD_TRIANGLE(p1, p2, p3, uv) { \
    color = sTris(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT, uv);\
}

#define ADD_TRIANGLE_WITH_ROTATION(p1, p2, p3, uv, rotAngle) { \
    color = sTrisWithRotation(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT, uv, rotAngle);\
}
#define ADD_QUAD(p1, p2, p3, p4, uv) { \
    color = sQuad(-center, dirTBN, modelSize, p1 * modelSize, p2 * modelSize, p3 * modelSize, p4 * modelSize, vertexColor, color, minT, uv);\
}
#define ADD_SQUARE_WITH_ROTATION(p1, p2, p3, uv, rotAngle) { \
    color = sSquareWithRotation(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT, uv, rotAngle);\
}

#define ADD_BOX_WITH_ROTATION(pos, size, dSide, uSide, nSide, eSide, sSide, wSide, dSideRotationAngle, uSideRotationAngle, nSideRotationAngle, eSideRotationAngle, sSideRotationAngle, wSideRotationAngle) { \
    color = sBoxWithRotation(-center + pos * modelSize, dirTBN, size * modelSize, TBN, color, minT, uSide, dSide, nSide, wSide, sSide, eSide, dSideRotationAngle, uSideRotationAngle, nSideRotationAngle, eSideRotationAngle, sSideRotationAngle, wSideRotationAngle);\
}

#define ADD_BOX_WITH_ROTATION_ROTATE(pos, size, Rotation, rotPivot, dSide, uSide, nSide, eSide, sSide, wSide, dSideRotationAngle, uSideRotationAngle, nSideRotationAngle, eSideRotationAngle, sSideRotationAngle, wSideRotationAngle) { \
    color = sBoxWithRotation(Rotation * (-center + (pos + rotPivot) * modelSize) - rotPivot * modelSize, Rotation * dirTBN, size * modelSize, TBN * inverse(Rotation), color, minT, uSide, dSide, nSide, wSide, sSide, eSide, dSideRotationAngle, uSideRotationAngle, nSideRotationAngle, eSideRotationAngle, sSideRotationAngle, wSideRotationAngle); \
}

#define ADD_SQUARE_SOLID(p1, p2, p3, color) { \
    color = sSquare_Solid(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT);\
}

#define ADD_BOX_SOLID(pos, size, dSide, uSide, nSide, eSide, sSide, wSide, color) { \
    color = sBox_Solid(-center + pos * modelSize, dirTBN, size * modelSize, TBN, color, minT, uSide, dSide, nSide, wSide, sSide, eSide);\
}

#define ADD_TRIANGLE_SOLID(p1, p2, p3, color) { \
    color = sTris_Solid(-center, dirTBN, p1 * modelSize, p2 * modelSize, p3 * modelSize, vertexColor, color, minT);\
}

#define APPLY_SHADOW(){ \
    color *= cem_light;\
}

vec3 planeIntersect( in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2 )
{
    vec3 v1v0 = v1 - v0;
    vec3 v2v0 = v2 - v0;
    vec3 rov0 = ro - v0;
    vec3  n = cross( v1v0, v2v0 );
    vec3  q = cross( rov0, rd );
    float d = 1.0/dot( rd, n );
    float u = d*dot( -q, v2v0 );
    float v = d*dot(  q, v1v0 );
    float t = d*dot( -n, rov0 );
    return vec3( u, v, t );
}

//Got from https://iquilezles.org/articles/intersectors/
vec3 squareIntersect( in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2 )
{
    vec3 val = planeIntersect(ro, rd, v0, v1, v2);
    if(val.x <0.0 || val.y <0.0 || val.x > 1.0 || val.y > 1.0 || val.z < 0) 
        val.z = MAX_DEPTH;
    return val;
}

vec3 triIntersect( in vec3 ro, in vec3 rd, in vec3 v0, in vec3 v1, in vec3 v2 )
{
    vec3 val = planeIntersect(ro, rd, v0, v1, v2);
    if(val.x <0.0 || val.y <0.0 || val.z < 0 || val.x + val.y > 1)
        val.z = MAX_DEPTH;
    return val;
}

vec3 boxIntersect(vec3 ro, vec3 rd, vec3 size, out vec3 outNormal)
{
    vec3 m = 1.0 / rd;
    vec3 n = m * ro;
    vec3 k = abs(m) * size;
    vec3 t1 = -n - k;
    vec3 t2 = -n + k;
    float tN = max( max( t1.x, t1.y ), t1.z );
    float tF = min( min( t2.x, t2.y ), t2.z );
    if( tN > tF || tF < 0.0) return vec3(MAX_DEPTH);

    outNormal = -sign(rd)*step(t1.yzx,t1.xyz)*step(t1.zxy,t1.xyz);
    
    float t = tN > 0 ? tN : tF;

    vec3 pos = (ro + rd * t) / size;
    vec2 tex = vec2(0);
    if (abs(outNormal.x) > 0.9)
        tex = pos.zy;
    else if (abs(outNormal.y) > 0.9)
        tex = pos.xz;
    else if (abs(outNormal.z) > 0.9)
        tex = pos.xy;

    return vec3(clamp(tex / 2 + 0.5, vec2(0), vec2(1)), t);
}

void writeDepth(vec3 Pos)
{
    if (ProjMat[3][0] == -1)
    {
        vec4 ProjPos = ProjMat * vec4(Pos, 1);
        gl_FragDepth = ProjPos.z / ProjPos.w * 0.5 + 0.5;
 
    }
    else
    {
        vec4 ProjPos = ProjMat * ModelViewMat * vec4(Pos, 1);
        gl_FragDepth = ProjPos.z / ProjPos.w * 0.5 + 0.5;
    }
}

vec4 sSquareWithRotation(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 tint, vec4 color, inout float T, vec4 uv,float rotAngle)
{
    vec3 tris = squareIntersect(ro, rd, p1, p2, p3);


    if (tris.z >= T) return color;
    vec2 rotatedUV = uv.xy + uv.zw * tris.xy;

    if (rotAngle == 1.0) {
        // Rotate UV coordinates 90 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(tris.y, 1.0 - tris.x);
    } else if (rotAngle == 2.0) {
        // Rotate UV coordinates 180 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(1.0 - tris.x, 1.0 - tris.y);
    } else if (rotAngle == 3.0) {
        // Rotate UV coordinates 270 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(1.0 - tris.y, tris.x);
    }
    vec4 col = texelFetch(Sampler0, ivec2(rotatedUV), 0) * tint;

    
    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = tris.z;
    return col;
}

vec4 sSquare(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 tint, vec4 color, inout float T, vec4 uv)
{
    vec3 tris = squareIntersect(ro, rd, p1, p2, p3);

    if (tris.z >= T) return color;

    vec4 col = texelFetch(Sampler0, ivec2(uv.xy + uv.zw * tris.xy), 0) * tint;
    
    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = tris.z;
    return col;
}
vec4 sTrisWithRotation(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 tint, vec4 color, inout float T, vec4 uv, float rotAngle)
{
    vec3 tris = triIntersect(ro, rd, p1, p2, p3);

    if (tris.z >= T) return color;

    vec2 rotatedUV = uv.xy + uv.zw * tris.xy;

    if (rotAngle == 1.0) {
        // Rotate UV coordinates 90 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(tris.y, 1.0 - tris.x);
    } else if (rotAngle == 2.0) {
        // Rotate UV coordinates 180 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(1.0 - tris.x, 1.0 - tris.y);
    } else if (rotAngle == 3.0) {
        // Rotate UV coordinates 270 degrees clockwise
        rotatedUV = uv.xy + uv.zw * vec2(1.0 - tris.y, tris.x);
    }

    vec4 col = texelFetch(Sampler0, ivec2(rotatedUV), 0) * tint;
    
    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = tris.z;
    return col;
}

vec4 sTris(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 color, inout float T, vec4 uv)
{
    vec3 tris = triIntersect(ro, rd, p1, p2, p3);

    if (tris.z >= T) return color;

    vec4 col = texelFetch(Sampler0, ivec2(uv.xy + uv.zw * tris.xy), 0);
    
    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = tris.z;
    return col;
}

vec4 sQuad(vec3 ro, vec3 rd, float modelSize, vec3 p1, vec3 p2, vec3 p3, vec3 p4, vec4 color, inout float T, vec4 uv)
{
    color = sTris(ro, rd, p1 * modelSize, p2 * modelSize, p3 * modelSize, color, T, uv);
    color = sTris(ro, rd, p4 * modelSize, p3 * modelSize, p2 * modelSize, color, T, vec4(uv.xy + uv.zw, -uv.zw));
    return color;
}

vec4 sBox(vec3 ro, vec3 rd, vec3 size, mat3 TBN, vec4 color, inout float T, vec4 dSide, vec4 uSide, vec4 nSide, vec4 eSide, vec4 sSide, vec4 wSide)
{
    vec2 texSize = textureSize(Sampler0, 0);
    vec3 normal = vec3(0);

    vec3 box = boxIntersect(ro, rd, size, normal);

    if (box.z >= T)
        return color;

    vec4 col = vec4(0);

    if (normal.x > 0.9) //East
    {
        col = texture(Sampler0, (eSide.xy + eSide.zw * box.xy) / texSize);
    }
    else if (normal.x < -0.9) //West
    {
        col = texture(Sampler0, (wSide.xy + wSide.zw * vec2(1 - box.x, box.y)) / texSize);
    }
    else if (normal.z > 0.9) //South
    {
        col = texture(Sampler0, (sSide.xy + sSide.zw * vec2(1 - box.x, box.y)) / texSize);
    }
    else if (normal.z < -0.9) //North
    {
        col = texture(Sampler0, (nSide.xy + nSide.zw * box.xy) / texSize);
    }
    else if (normal.y > 0.9) //Up
    {
        col = texture(Sampler0, (uSide.xy + uSide.zw * box.xy) / texSize);
    }
    else if (normal.y < -0.9) //Down
    {
        col = texture(Sampler0, (dSide.xy + dSide.zw * box.xy) / texSize);
    }

    col = minecraft_mix_light(Light0_Direction, Light1_Direction, normalize(TBN * normal), col);

    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = box.z;

    return col;
}

vec4 sBoxWithRotation(vec3 ro, vec3 rd, vec3 size, mat3 TBN, vec4 color, inout float T, vec4 dSide, vec4 uSide, vec4 nSide, vec4 eSide, vec4 sSide, vec4 wSide, float dSideRotationAngle, float uSideRotationAngle, float nSideRotationAngle, float eSideRotationAngle, float sSideRotationAngle, float wSideRotationAngle)
{
    vec2 texSize = textureSize(Sampler0, 0);
    vec3 normal = vec3(0);

    vec3 box = boxIntersect(ro, rd, size, normal);

    if (box.z >= T)
        return color;

    vec4 col = vec4(0);

    if (normal.x > 0.9) //East
    {
        vec2 rotatedUV = eSide.xy + eSide.zw * box.xy;

        if (eSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = eSide.xy + eSide.zw * box.yx;
        } else if (eSideRotationAngle == 2.0) {
            // Rotate UV coordinates 180 degrees clockwise
            rotatedUV = eSide.xy + eSide.zw * vec2(1.0 - box.x, 1.0 - box.y);
        } else if (eSideRotationAngle == 3.0) {
            // Rotate UV coordinates 270 degrees clockwise
            rotatedUV = eSide.xy + eSide.zw * vec2(1.0 - box.y, box.x);
        }
        col = texture(Sampler0, (rotatedUV) / texSize);
    }
    else if (normal.x < -0.9) //West
    {
        vec2 rotatedUV = wSide.xy + wSide.zw * vec2(1 - box.x, box.y);
        if (wSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = wSide.xy + wSide.zw * vec2(box.y, 1.0 - box.x);
        } else if (wSideRotationAngle == 2.0) {
            // Rotate UV coordinates 180 degrees clockwise
            rotatedUV = wSide.xy + wSide.zw * vec2(1.0 - box.x, 1.0 - box.y);
        } else if (wSideRotationAngle == 3.0) {
            // Rotate UV coordinates 270 degrees clockwise
            rotatedUV = wSide.xy + wSide.zw * vec2(1.0 - box.y, box.x);
        }
        col = texture(Sampler0, (rotatedUV) / texSize);
    }
    else if (normal.z > 0.9) //South
    {
        vec2 rotatedUV = sSide.xy + sSide.zw * vec2(1 - box.x, box.y);
        if (sSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = sSide.xy + sSide.zw * vec2(box.y, 1.0 - box.x);
        } else if (sSideRotationAngle == 2.0) {
            // Rotate UV coordinates 180 degrees clockwise
            rotatedUV = sSide.xy + sSide.zw * vec2(1.0 - box.x, 1.0 - box.y);
        } else if (sSideRotationAngle == 3.0) {
            // Rotate UV coordinates 270 degrees clockwise
            rotatedUV = sSide.xy + sSide.zw * vec2(1.0 - box.y, box.x);
        }
        col = texture(Sampler0, (rotatedUV) / texSize);
    }
    else if (normal.z < -0.9) //North
    {
        vec2 rotatedUV = nSide.xy + nSide.zw * box.xy;
        if (nSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = nSide.xy + nSide.zw * box.yx;
        } else if (nSideRotationAngle == 2.0) {
            // Rotate UV coordinates 180 degrees clockwise
            rotatedUV = nSide.xy + nSide.zw * vec2(1.0 - box.x, 1.0 - box.y);
        } else if (nSideRotationAngle == 3.0) {
            // Rotate UV coordinates 270 degrees clockwise
            rotatedUV = nSide.xy + nSide.zw * vec2(1.0 - box.y, box.x);
        }
        col = texture(Sampler0, (rotatedUV) / texSize);
    }
    else if (normal.y > 0.9) //Up
    {
        vec2 rotatedUV = uSide.xy + uSide.zw * box.xy;
        if (uSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = uSide.xy + uSide.zw * box.yx;
        } 
        col = texture(Sampler0, (rotatedUV) / texSize);
    }
    else if (normal.y < -0.9) //Down
    {
        vec2 rotatedUV = dSide.xy + dSide.zw * box.xy;
        if (dSideRotationAngle == 1.0) {
            // Rotate UV coordinates 90 degrees clockwise
            rotatedUV = dSide.xy + dSide.zw * box.yx;
        } 
        col = texture(Sampler0, (rotatedUV) / texSize);
    }

    col = minecraft_mix_light(Light0_Direction, Light1_Direction, normalize(TBN * normal), col);

    if (col.a < 0.1) return color;

    if (col.rgb == vec3(0,0,0)){
        return color;
    }

    T = box.z;

    return col;
}

vec4 sSquare_Solid(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 color, inout float T)
{
    // Compute the intersection of the ray with the square
    vec3 normal = normalize(cross(p2 - p1, p3 - p1));
    float denominator = dot(normal, rd);
    
    // Check if the ray is parallel to the square
    if (abs(denominator) < 0.0001) {
        return color; // Ray is parallel, no intersection
    }
    
    // Compute intersection point
    float t = dot(normal, p1 - ro) / denominator;
    if (t < 0.0 || t >= T) {
        return color; // Intersection point is behind the ray origin or farther than previous intersections
    }
    
    // Calculate intersection point
    vec3 intersectionPoint = ro + rd * t;

    // Check if the intersection point is inside the square
    vec3 v1 = p2 - p1;
    vec3 v2 = p3 - p1;
    vec3 v3 = intersectionPoint - p1;
    float dot00 = dot(v1, v1);
    float dot01 = dot(v1, v2);
    float dot02 = dot(v1, v3);
    float dot11 = dot(v2, v2);
    float dot12 = dot(v2, v3);
    float invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);
    float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    float v = (dot00 * dot12 - dot01 * dot02) * invDenom;
    
    if (u >= 0.0 && v >= 0.0 && u + v <= 1.0) {
        // Point is inside the triangle
        T = t; // Update the minimum intersection distance
        return color;
    }
    
    return color; // Point is outside the triangle
}

vec4 sTris_Solid(vec3 ro, vec3 rd, vec3 p1, vec3 p2, vec3 p3, vec4 color, inout float T)
{
    // Compute the intersection of the ray with the triangle
    vec3 normal = normalize(cross(p2 - p1, p3 - p1));
    float denominator = dot(normal, rd);
    
    // Check if the ray is parallel to the triangle
    if (abs(denominator) < 0.0001) {
        return color; // Ray is parallel, no intersection
    }
    
    // Compute intersection point
    float t = dot(normal, p1 - ro) / denominator;
    if (t < 0.0 || t >= T) {
        return color; // Intersection point is behind the ray origin or farther than previous intersections
    }
    
    // Calculate intersection point
    vec3 intersectionPoint = ro + rd * t;

    // Check if the intersection point is inside the triangle
    vec3 v1 = p2 - p1;
    vec3 v2 = p3 - p1;
    vec3 v3 = intersectionPoint - p1;
    float dot00 = dot(v1, v1);
    float dot01 = dot(v1, v2);
    float dot02 = dot(v1, v3);
    float dot11 = dot(v2, v2);
    float dot12 = dot(v2, v3);
    float invDenom = 1.0 / (dot00 * dot11 - dot01 * dot01);
    float u = (dot11 * dot02 - dot01 * dot12) * invDenom;
    float v = (dot00 * dot12 - dot01 * dot02) * invDenom;
    
    if (u >= 0.0 && v >= 0.0 && u + v <= 1.0) {
        // Point is inside the triangle
        T = t; // Update the minimum intersection distance
        return color;
    }
    
    return color; // Point is outside the triangle
}

vec4 sBox_Solid(vec3 ro, vec3 rd, vec3 size, mat3 TBN, vec4 color, inout float T)
{
    // Compute the intersection of the ray with the box
    vec3 halfSize = size * 0.5;
    vec3 tMin = (halfSize - ro) / rd;
    vec3 tMax = (-halfSize - ro) / rd;
    
    vec3 t1 = min(tMin, tMax);
    vec3 t2 = max(tMin, tMax);
    
    float tNear = max(max(t1.x, t1.y), t1.z);
    float tFar = min(min(t2.x, t2.y), t2.z);
    
    if (tNear > tFar || tFar < 0.0) {
        return color; // No intersection or intersection is behind the ray origin
    }
    
    // Calculate intersection point
    vec3 intersectionPoint = ro + rd * tNear;

    // Update minimum intersection distance
    T = tNear;

    return color;
}

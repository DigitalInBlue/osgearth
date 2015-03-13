// This is an include file.

// the follow def may be replaced by BumpMapTerrainEffect.cpp:
#undef OE_USE_NORMAL_MAP

#ifdef OE_USE_NORMAL_MAP

// normal map version:
uniform sampler2D oe_nmap_normalTex;
in vec4 oe_nmap_normalCoords;

float oe_bumpmap_getSlope()
{
    vec4 encodedNormal = texture2D(oe_nmap_normalTex, oe_nmap_normalCoords.st);
    vec3 normalTangent = normalize(encodedNormal.xyz*2.0-1.0);
    return clamp((1.0-normalTangent.z)/0.8, 0.0, 1.0);
}

#else

// non- normal map version:
in float oe_bumpmap_slope;

float oe_bumpmap_getSlope()
{
    return oe_bumpmap_slope;
}
#endif

//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "TextMeshPro/Sprite" {
Properties {
_MainTex ("Sprite Texture", 2D) = "white" { }
_Color ("Tint", Color) = (1,1,1,1)
_StencilComp ("Stencil Comparison", Float) = 8
_Stencil ("Stencil ID", Float) = 0
_StencilOp ("Stencil Operation", Float) = 0
_StencilWriteMask ("Stencil Write Mask", Float) = 255
_StencilReadMask ("Stencil Read Mask", Float) = 255
_CullMode ("Cull Mode", Float) = 0
_ColorMask ("Color Mask", Float) = 15
_ClipRect ("Clip Rect", Vector) = (-32767,-32767,32767,32767)
[Toggle(UNITY_UI_ALPHACLIP)] _UseUIAlphaClip ("Use Alpha Clip", Float) = 0
}
SubShader {
 Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
 Pass {
  Tags { "CanUseSpriteAtlas" = "true" "IGNOREPROJECTOR" = "true" "PreviewType" = "Plane" "QUEUE" = "Transparent" "RenderType" = "Transparent" }
  ZTest Off
  ZWrite Off
  Cull Off
  GpuProgramID 55233
Program "vp" {
SubProgram "gles3 hw_tier00 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 45
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %38 %42 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %38 RelaxedPrecision 
                                             OpDecorate %38 Location 38 
                                             OpDecorate %39 RelaxedPrecision 
                                             OpDecorate %42 RelaxedPrecision 
                                             OpDecorate %42 Location 42 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %37 = OpTypePointer Input %7 
                        Input f32_4* %38 = OpVariable Input 
                                     %41 = OpTypePointer Output %7 
                       Output f32_4* %42 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                               f32_4 %36 = OpLoad %25 
                               f32_4 %39 = OpLoad %38 
                               f32_4 %40 = OpFMul %36 %39 
                                             OpStore %25 %40 
                               f32_4 %43 = OpLoad %25 
                                             OpStore %42 %43 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump vec4 u_xlat16_0;
bool u_xlatb0;
mediump float u_xlat16_1;
void main()
{
    u_xlat16_0 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat0 = u_xlat16_0 + _TextureSampleAdd;
    u_xlat16_1 = u_xlat0.w * vs_COLOR0.w + -0.00100000005;
    u_xlat0 = u_xlat0 * vs_COLOR0;
    SV_Target0 = u_xlat0;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0 = !!(u_xlat16_1<0.0);
#else
    u_xlatb0 = u_xlat16_1<0.0;
#endif
    if(u_xlatb0){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 72
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %22 %43 %54 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate %9 RelaxedPrecision 
                                             OpDecorate %12 RelaxedPrecision 
                                             OpDecorate %12 DescriptorSet 12 
                                             OpDecorate %12 Binding 12 
                                             OpDecorate %13 RelaxedPrecision 
                                             OpDecorate %16 RelaxedPrecision 
                                             OpDecorate %16 DescriptorSet 16 
                                             OpDecorate %16 Binding 16 
                                             OpDecorate %17 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 22 
                                             OpDecorate %23 RelaxedPrecision 
                                             OpDecorate %24 RelaxedPrecision 
                                             OpDecorate %26 RelaxedPrecision 
                                             OpMemberDecorate %27 0 RelaxedPrecision 
                                             OpMemberDecorate %27 0 Offset 27 
                                             OpDecorate %27 Block 
                                             OpDecorate %29 DescriptorSet 29 
                                             OpDecorate %29 Binding 29 
                                             OpDecorate %34 RelaxedPrecision 
                                             OpDecorate %35 RelaxedPrecision 
                                             OpDecorate %37 RelaxedPrecision 
                                             OpDecorate %43 RelaxedPrecision 
                                             OpDecorate %43 Location 43 
                                             OpDecorate %46 RelaxedPrecision 
                                             OpDecorate %51 RelaxedPrecision 
                                             OpDecorate %54 RelaxedPrecision 
                                             OpDecorate %54 Location 54 
                                             OpDecorate %59 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeFloat 32 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                       Private f32_4* %9 = OpVariable Private 
                                     %10 = OpTypeImage %6 Dim2D 0 0 0 1 Unknown 
                                     %11 = OpTypePointer UniformConstant %10 
UniformConstant read_only Texture2D* %12 = OpVariable UniformConstant 
                                     %14 = OpTypeSampler 
                                     %15 = OpTypePointer UniformConstant %14 
            UniformConstant sampler* %16 = OpVariable UniformConstant 
                                     %18 = OpTypeSampledImage %10 
                                     %20 = OpTypeVector %6 2 
                                     %21 = OpTypePointer Input %20 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %25 = OpVariable Private 
                                     %27 = OpTypeStruct %7 
                                     %28 = OpTypePointer Uniform %27 
            Uniform struct {f32_4;}* %29 = OpVariable Uniform 
                                     %30 = OpTypeInt 32 1 
                                 i32 %31 = OpConstant 0 
                                     %32 = OpTypePointer Uniform %7 
                                     %36 = OpTypePointer Private %6 
                        Private f32* %37 = OpVariable Private 
                                     %38 = OpTypeInt 32 0 
                                 u32 %39 = OpConstant 3 
                                     %42 = OpTypePointer Input %7 
                        Input f32_4* %43 = OpVariable Input 
                                     %44 = OpTypePointer Input %6 
                                 f32 %48 = OpConstant 3.674022E-40 
                                     %53 = OpTypePointer Output %7 
                       Output f32_4* %54 = OpVariable Output 
                                     %56 = OpTypeBool 
                                     %57 = OpTypePointer Private %56 
                       Private bool* %58 = OpVariable Private 
                                 f32 %60 = OpConstant 3.674022E-40 
                                 i32 %63 = OpConstant 1 
                                 i32 %65 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                 read_only Texture2D %13 = OpLoad %12 
                             sampler %17 = OpLoad %16 
          read_only Texture2DSampled %19 = OpSampledImage %13 %17 
                               f32_2 %23 = OpLoad vs_TEXCOORD0 
                               f32_4 %24 = OpImageSampleImplicitLod %19 %23 
                                             OpStore %9 %24 
                               f32_4 %26 = OpLoad %9 
                      Uniform f32_4* %33 = OpAccessChain %29 %31 
                               f32_4 %34 = OpLoad %33 
                               f32_4 %35 = OpFAdd %26 %34 
                                             OpStore %25 %35 
                        Private f32* %40 = OpAccessChain %25 %39 
                                 f32 %41 = OpLoad %40 
                          Input f32* %45 = OpAccessChain %43 %39 
                                 f32 %46 = OpLoad %45 
                                 f32 %47 = OpFMul %41 %46 
                                 f32 %49 = OpFAdd %47 %48 
                                             OpStore %37 %49 
                               f32_4 %50 = OpLoad %25 
                               f32_4 %51 = OpLoad %43 
                               f32_4 %52 = OpFMul %50 %51 
                                             OpStore %25 %52 
                               f32_4 %55 = OpLoad %25 
                                             OpStore %54 %55 
                                 f32 %59 = OpLoad %37 
                                bool %61 = OpFOrdLessThan %59 %60 
                                             OpStore %58 %61 
                                bool %62 = OpLoad %58 
                                 i32 %64 = OpSelect %62 %63 %31 
                                 i32 %66 = OpIMul %64 %65 
                                bool %67 = OpINotEqual %66 %31 
                                             OpSelectionMerge %69 None 
                                             OpBranchConditional %67 %68 %69 
                                     %68 = OpLabel 
                                             OpKill
                                     %69 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %112 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %112 RelaxedPrecision 
                                             OpDecorate %112 Location 112 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                                    %111 = OpTypePointer Output %11 
                      Output f32_4* %112 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %105 = OpAccessChain %40 %42 
                                f32 %106 = OpLoad %105 
                       Private f32* %107 = OpAccessChain %95 %61 
                                f32 %108 = OpLoad %107 
                                f32 %109 = OpFMul %106 %108 
                       Private f32* %110 = OpAccessChain %95 %61 
                                             OpStore %110 %109 
                              f32_4 %113 = OpLoad %95 
                                             OpStore %112 %113 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %112 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %112 RelaxedPrecision 
                                             OpDecorate %112 Location 112 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                                    %111 = OpTypePointer Output %11 
                      Output f32_4* %112 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %105 = OpAccessChain %40 %42 
                                f32 %106 = OpLoad %105 
                       Private f32* %107 = OpAccessChain %95 %61 
                                f32 %108 = OpLoad %107 
                                f32 %109 = OpFMul %106 %108 
                       Private f32* %110 = OpAccessChain %95 %61 
                                             OpStore %110 %109 
                              f32_4 %113 = OpLoad %95 
                                             OpStore %112 %113 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 115
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %112 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %112 RelaxedPrecision 
                                             OpDecorate %112 Location 112 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                                    %111 = OpTypePointer Output %11 
                      Output f32_4* %112 = OpVariable Output 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %105 = OpAccessChain %40 %42 
                                f32 %106 = OpLoad %105 
                       Private f32* %107 = OpAccessChain %95 %61 
                                f32 %108 = OpLoad %107 
                                f32 %109 = OpFMul %106 %108 
                       Private f32* %110 = OpAccessChain %95 %61 
                                             OpStore %110 %109 
                              f32_4 %113 = OpLoad %95 
                                             OpStore %112 %113 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2<0.0);
#else
    u_xlatb0.x = u_xlat16_2<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2<0.0);
#else
    u_xlatb0.x = u_xlat16_2<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
uniform 	mediump vec4 _Color;
in highp vec4 in_POSITION0;
in highp vec4 in_COLOR0;
in highp vec2 in_TEXCOORD0;
out mediump vec4 vs_COLOR0;
out mediump vec2 vs_TEXCOORD0;
out highp vec4 vs_TEXCOORD1;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = in_POSITION0.yyyy * hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[0] * in_POSITION0.xxxx + u_xlat0;
    u_xlat0 = hlslcc_mtx4x4unity_ObjectToWorld[2] * in_POSITION0.zzzz + u_xlat0;
    u_xlat0 = u_xlat0 + hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    u_xlat0 = in_COLOR0 * _Color;
    vs_COLOR0 = u_xlat0;
    vs_TEXCOORD0.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD1 = in_POSITION0;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	mediump vec4 _TextureSampleAdd;
uniform 	vec4 _ClipRect;
UNITY_LOCATION(0) uniform mediump sampler2D _MainTex;
in mediump vec4 vs_COLOR0;
in mediump vec2 vs_TEXCOORD0;
in highp vec4 vs_TEXCOORD1;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
bvec4 u_xlatb0;
vec4 u_xlat1;
mediump vec4 u_xlat16_1;
mediump float u_xlat16_2;
void main()
{
    u_xlatb0.xy = greaterThanEqual(vs_TEXCOORD1.xyxx, _ClipRect.xyxx).xy;
    u_xlatb0.zw = greaterThanEqual(_ClipRect.zzzw, vs_TEXCOORD1.xxxy).zw;
    u_xlat0.x = u_xlatb0.x ? float(1.0) : 0.0;
    u_xlat0.y = u_xlatb0.y ? float(1.0) : 0.0;
    u_xlat0.z = u_xlatb0.z ? float(1.0) : 0.0;
    u_xlat0.w = u_xlatb0.w ? float(1.0) : 0.0;
;
    u_xlat0.xy = u_xlat0.zw * u_xlat0.xy;
    u_xlat0.x = u_xlat0.y * u_xlat0.x;
    u_xlat16_1 = texture(_MainTex, vs_TEXCOORD0.xy);
    u_xlat1 = u_xlat16_1 + _TextureSampleAdd;
    u_xlat1 = u_xlat1 * vs_COLOR0;
    u_xlat16_2 = u_xlat1.w * u_xlat0.x + -0.00100000005;
    u_xlat1.w = u_xlat0.x * u_xlat1.w;
    SV_Target0 = u_xlat1;
#ifdef UNITY_ADRENO_ES3
    u_xlatb0.x = !!(u_xlat16_2<0.0);
#else
    u_xlatb0.x = u_xlat16_2<0.0;
#endif
    if(u_xlatb0.x){discard;}
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %120 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %105 RelaxedPrecision 
                                             OpDecorate %120 RelaxedPrecision 
                                             OpDecorate %120 Location 120 
                                             OpDecorate %122 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                       Private f32* %105 = OpVariable Private 
                                f32 %111 = OpConstant 3.674022E-40 
                                    %119 = OpTypePointer Output %11 
                      Output f32_4* %120 = OpVariable Output 
                                i32 %128 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %106 = OpAccessChain %95 %61 
                                f32 %107 = OpLoad %106 
                       Private f32* %108 = OpAccessChain %40 %42 
                                f32 %109 = OpLoad %108 
                                f32 %110 = OpFMul %107 %109 
                                f32 %112 = OpFAdd %110 %111 
                                             OpStore %105 %112 
                       Private f32* %113 = OpAccessChain %40 %42 
                                f32 %114 = OpLoad %113 
                       Private f32* %115 = OpAccessChain %95 %61 
                                f32 %116 = OpLoad %115 
                                f32 %117 = OpFMul %114 %116 
                       Private f32* %118 = OpAccessChain %95 %61 
                                             OpStore %118 %117 
                              f32_4 %121 = OpLoad %95 
                                             OpStore %120 %121 
                                f32 %122 = OpLoad %105 
                               bool %123 = OpFOrdLessThan %122 %47 
                      Private bool* %124 = OpAccessChain %9 %42 
                                             OpStore %124 %123 
                      Private bool* %125 = OpAccessChain %9 %42 
                               bool %126 = OpLoad %125 
                                i32 %127 = OpSelect %126 %20 %97 
                                i32 %129 = OpIMul %127 %128 
                               bool %130 = OpINotEqual %129 %97 
                                             OpSelectionMerge %132 None 
                                             OpBranchConditional %130 %131 %132 
                                    %131 = OpLabel 
                                             OpKill
                                    %132 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %120 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %105 RelaxedPrecision 
                                             OpDecorate %120 RelaxedPrecision 
                                             OpDecorate %120 Location 120 
                                             OpDecorate %122 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                       Private f32* %105 = OpVariable Private 
                                f32 %111 = OpConstant 3.674022E-40 
                                    %119 = OpTypePointer Output %11 
                      Output f32_4* %120 = OpVariable Output 
                                i32 %128 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %106 = OpAccessChain %95 %61 
                                f32 %107 = OpLoad %106 
                       Private f32* %108 = OpAccessChain %40 %42 
                                f32 %109 = OpLoad %108 
                                f32 %110 = OpFMul %107 %109 
                                f32 %112 = OpFAdd %110 %111 
                                             OpStore %105 %112 
                       Private f32* %113 = OpAccessChain %40 %42 
                                f32 %114 = OpLoad %113 
                       Private f32* %115 = OpAccessChain %95 %61 
                                f32 %116 = OpLoad %115 
                                f32 %117 = OpFMul %114 %116 
                       Private f32* %118 = OpAccessChain %95 %61 
                                             OpStore %118 %117 
                              f32_4 %121 = OpLoad %95 
                                             OpStore %120 %121 
                                f32 %122 = OpLoad %105 
                               bool %123 = OpFOrdLessThan %122 %47 
                      Private bool* %124 = OpAccessChain %9 %42 
                                             OpStore %124 %123 
                      Private bool* %125 = OpAccessChain %9 %42 
                               bool %126 = OpLoad %125 
                                i32 %127 = OpSelect %126 %20 %97 
                                i32 %129 = OpIMul %127 %128 
                               bool %130 = OpINotEqual %129 %97 
                                             OpSelectionMerge %132 None 
                                             OpBranchConditional %130 %131 %132 
                                    %131 = OpLabel 
                                             OpKill
                                    %132 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 103
; Schema: 0
                                                     OpCapability Shader 
                                              %1 = OpExtInstImport "GLSL.std.450" 
                                                     OpMemoryModel Logical GLSL450 
                                                     OpEntryPoint Vertex %4 "main" %11 %72 %82 %87 %91 %93 %95 
                                                     OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                     OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                                     OpDecorate %11 Location 11 
                                                     OpDecorate %16 ArrayStride 16 
                                                     OpDecorate %17 ArrayStride 17 
                                                     OpMemberDecorate %18 0 Offset 18 
                                                     OpMemberDecorate %18 1 Offset 18 
                                                     OpMemberDecorate %18 2 RelaxedPrecision 
                                                     OpMemberDecorate %18 2 Offset 18 
                                                     OpDecorate %18 Block 
                                                     OpDecorate %20 DescriptorSet 20 
                                                     OpDecorate %20 Binding 20 
                                                     OpMemberDecorate %70 0 BuiltIn 70 
                                                     OpMemberDecorate %70 1 BuiltIn 70 
                                                     OpMemberDecorate %70 2 BuiltIn 70 
                                                     OpDecorate %70 Block 
                                                     OpDecorate %82 Location 82 
                                                     OpDecorate %85 RelaxedPrecision 
                                                     OpDecorate %87 RelaxedPrecision 
                                                     OpDecorate %87 Location 87 
                                                     OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                                     OpDecorate vs_TEXCOORD0 Location 91 
                                                     OpDecorate %93 Location 93 
                                                     OpDecorate vs_TEXCOORD1 Location 95 
                                              %2 = OpTypeVoid 
                                              %3 = OpTypeFunction %2 
                                              %6 = OpTypeFloat 32 
                                              %7 = OpTypeVector %6 4 
                                              %8 = OpTypePointer Private %7 
                               Private f32_4* %9 = OpVariable Private 
                                             %10 = OpTypePointer Input %7 
                                Input f32_4* %11 = OpVariable Input 
                                             %14 = OpTypeInt 32 0 
                                         u32 %15 = OpConstant 4 
                                             %16 = OpTypeArray %7 %15 
                                             %17 = OpTypeArray %7 %15 
                                             %18 = OpTypeStruct %16 %17 %7 
                                             %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4]; f32_4;}* %20 = OpVariable Uniform 
                                             %21 = OpTypeInt 32 1 
                                         i32 %22 = OpConstant 0 
                                         i32 %23 = OpConstant 1 
                                             %24 = OpTypePointer Uniform %7 
                                         i32 %35 = OpConstant 2 
                                         i32 %44 = OpConstant 3 
                              Private f32_4* %48 = OpVariable Private 
                                         u32 %68 = OpConstant 1 
                                             %69 = OpTypeArray %6 %68 
                                             %70 = OpTypeStruct %7 %6 %69 
                                             %71 = OpTypePointer Output %70 
        Output struct {f32_4; f32; f32[1];}* %72 = OpVariable Output 
                                             %80 = OpTypePointer Output %7 
                                Input f32_4* %82 = OpVariable Input 
                               Output f32_4* %87 = OpVariable Output 
                                             %89 = OpTypeVector %6 2 
                                             %90 = OpTypePointer Output %89 
                      Output f32_2* vs_TEXCOORD0 = OpVariable Output 
                                             %92 = OpTypePointer Input %89 
                                Input f32_2* %93 = OpVariable Input 
                      Output f32_4* vs_TEXCOORD1 = OpVariable Output 
                                             %97 = OpTypePointer Output %6 
                                         void %4 = OpFunction None %3 
                                              %5 = OpLabel 
                                       f32_4 %12 = OpLoad %11 
                                       f32_4 %13 = OpVectorShuffle %12 %12 1 1 1 1 
                              Uniform f32_4* %25 = OpAccessChain %20 %22 %23 
                                       f32_4 %26 = OpLoad %25 
                                       f32_4 %27 = OpFMul %13 %26 
                                                     OpStore %9 %27 
                              Uniform f32_4* %28 = OpAccessChain %20 %22 %22 
                                       f32_4 %29 = OpLoad %28 
                                       f32_4 %30 = OpLoad %11 
                                       f32_4 %31 = OpVectorShuffle %30 %30 0 0 0 0 
                                       f32_4 %32 = OpFMul %29 %31 
                                       f32_4 %33 = OpLoad %9 
                                       f32_4 %34 = OpFAdd %32 %33 
                                                     OpStore %9 %34 
                              Uniform f32_4* %36 = OpAccessChain %20 %22 %35 
                                       f32_4 %37 = OpLoad %36 
                                       f32_4 %38 = OpLoad %11 
                                       f32_4 %39 = OpVectorShuffle %38 %38 2 2 2 2 
                                       f32_4 %40 = OpFMul %37 %39 
                                       f32_4 %41 = OpLoad %9 
                                       f32_4 %42 = OpFAdd %40 %41 
                                                     OpStore %9 %42 
                                       f32_4 %43 = OpLoad %9 
                              Uniform f32_4* %45 = OpAccessChain %20 %22 %44 
                                       f32_4 %46 = OpLoad %45 
                                       f32_4 %47 = OpFAdd %43 %46 
                                                     OpStore %9 %47 
                                       f32_4 %49 = OpLoad %9 
                                       f32_4 %50 = OpVectorShuffle %49 %49 1 1 1 1 
                              Uniform f32_4* %51 = OpAccessChain %20 %23 %23 
                                       f32_4 %52 = OpLoad %51 
                                       f32_4 %53 = OpFMul %50 %52 
                                                     OpStore %48 %53 
                              Uniform f32_4* %54 = OpAccessChain %20 %23 %22 
                                       f32_4 %55 = OpLoad %54 
                                       f32_4 %56 = OpLoad %9 
                                       f32_4 %57 = OpVectorShuffle %56 %56 0 0 0 0 
                                       f32_4 %58 = OpFMul %55 %57 
                                       f32_4 %59 = OpLoad %48 
                                       f32_4 %60 = OpFAdd %58 %59 
                                                     OpStore %48 %60 
                              Uniform f32_4* %61 = OpAccessChain %20 %23 %35 
                                       f32_4 %62 = OpLoad %61 
                                       f32_4 %63 = OpLoad %9 
                                       f32_4 %64 = OpVectorShuffle %63 %63 2 2 2 2 
                                       f32_4 %65 = OpFMul %62 %64 
                                       f32_4 %66 = OpLoad %48 
                                       f32_4 %67 = OpFAdd %65 %66 
                                                     OpStore %48 %67 
                              Uniform f32_4* %73 = OpAccessChain %20 %23 %44 
                                       f32_4 %74 = OpLoad %73 
                                       f32_4 %75 = OpLoad %9 
                                       f32_4 %76 = OpVectorShuffle %75 %75 3 3 3 3 
                                       f32_4 %77 = OpFMul %74 %76 
                                       f32_4 %78 = OpLoad %48 
                                       f32_4 %79 = OpFAdd %77 %78 
                               Output f32_4* %81 = OpAccessChain %72 %22 
                                                     OpStore %81 %79 
                                       f32_4 %83 = OpLoad %82 
                              Uniform f32_4* %84 = OpAccessChain %20 %35 
                                       f32_4 %85 = OpLoad %84 
                                       f32_4 %86 = OpFMul %83 %85 
                                                     OpStore %9 %86 
                                       f32_4 %88 = OpLoad %9 
                                                     OpStore %87 %88 
                                       f32_2 %94 = OpLoad %93 
                                                     OpStore vs_TEXCOORD0 %94 
                                       f32_4 %96 = OpLoad %11 
                                                     OpStore vs_TEXCOORD1 %96 
                                 Output f32* %98 = OpAccessChain %72 %22 %68 
                                         f32 %99 = OpLoad %98 
                                        f32 %100 = OpFNegate %99 
                                Output f32* %101 = OpAccessChain %72 %22 %68 
                                                     OpStore %101 %100 
                                                     OpReturn
                                                     OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 135
; Schema: 0
                                             OpCapability Shader 
                                      %1 = OpExtInstImport "GLSL.std.450" 
                                             OpMemoryModel Logical GLSL450 
                                             OpEntryPoint Fragment %4 "main" %13 %92 %102 %120 
                                             OpExecutionMode %4 OriginUpperLeft 
                                             OpName vs_TEXCOORD1 "vs_TEXCOORD1" 
                                             OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                             OpDecorate vs_TEXCOORD1 Location 13 
                                             OpMemberDecorate %16 0 RelaxedPrecision 
                                             OpMemberDecorate %16 0 Offset 16 
                                             OpMemberDecorate %16 1 Offset 16 
                                             OpDecorate %16 Block 
                                             OpDecorate %18 DescriptorSet 18 
                                             OpDecorate %18 Binding 18 
                                             OpDecorate %80 RelaxedPrecision 
                                             OpDecorate %83 RelaxedPrecision 
                                             OpDecorate %83 DescriptorSet 83 
                                             OpDecorate %83 Binding 83 
                                             OpDecorate %84 RelaxedPrecision 
                                             OpDecorate %87 RelaxedPrecision 
                                             OpDecorate %87 DescriptorSet 87 
                                             OpDecorate %87 Binding 87 
                                             OpDecorate %88 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 RelaxedPrecision 
                                             OpDecorate vs_TEXCOORD0 Location 92 
                                             OpDecorate %93 RelaxedPrecision 
                                             OpDecorate %94 RelaxedPrecision 
                                             OpDecorate %96 RelaxedPrecision 
                                             OpDecorate %99 RelaxedPrecision 
                                             OpDecorate %100 RelaxedPrecision 
                                             OpDecorate %102 RelaxedPrecision 
                                             OpDecorate %102 Location 102 
                                             OpDecorate %103 RelaxedPrecision 
                                             OpDecorate %105 RelaxedPrecision 
                                             OpDecorate %120 RelaxedPrecision 
                                             OpDecorate %120 Location 120 
                                             OpDecorate %122 RelaxedPrecision 
                                      %2 = OpTypeVoid 
                                      %3 = OpTypeFunction %2 
                                      %6 = OpTypeBool 
                                      %7 = OpTypeVector %6 4 
                                      %8 = OpTypePointer Private %7 
                      Private bool_4* %9 = OpVariable Private 
                                     %10 = OpTypeFloat 32 
                                     %11 = OpTypeVector %10 4 
                                     %12 = OpTypePointer Input %11 
               Input f32_4* vs_TEXCOORD1 = OpVariable Input 
                                     %16 = OpTypeStruct %11 %11 
                                     %17 = OpTypePointer Uniform %16 
     Uniform struct {f32_4; f32_4;}* %18 = OpVariable Uniform 
                                     %19 = OpTypeInt 32 1 
                                 i32 %20 = OpConstant 1 
                                     %21 = OpTypePointer Uniform %11 
                                     %26 = OpTypeVector %6 2 
                                     %39 = OpTypePointer Private %11 
                      Private f32_4* %40 = OpVariable Private 
                                     %41 = OpTypeInt 32 0 
                                 u32 %42 = OpConstant 0 
                                     %43 = OpTypePointer Private %6 
                                 f32 %46 = OpConstant 3.674022E-40 
                                 f32 %47 = OpConstant 3.674022E-40 
                                     %49 = OpTypePointer Private %10 
                                 u32 %51 = OpConstant 1 
                                 u32 %56 = OpConstant 2 
                                 u32 %61 = OpConstant 3 
                                     %66 = OpTypeVector %10 2 
                      Private f32_4* %80 = OpVariable Private 
                                     %81 = OpTypeImage %10 Dim2D 0 0 0 1 Unknown 
                                     %82 = OpTypePointer UniformConstant %81 
UniformConstant read_only Texture2D* %83 = OpVariable UniformConstant 
                                     %85 = OpTypeSampler 
                                     %86 = OpTypePointer UniformConstant %85 
            UniformConstant sampler* %87 = OpVariable UniformConstant 
                                     %89 = OpTypeSampledImage %81 
                                     %91 = OpTypePointer Input %66 
               Input f32_2* vs_TEXCOORD0 = OpVariable Input 
                      Private f32_4* %95 = OpVariable Private 
                                 i32 %97 = OpConstant 0 
                       Input f32_4* %102 = OpVariable Input 
                       Private f32* %105 = OpVariable Private 
                                f32 %111 = OpConstant 3.674022E-40 
                                    %119 = OpTypePointer Output %11 
                      Output f32_4* %120 = OpVariable Output 
                                i32 %128 = OpConstant -1 
                                 void %4 = OpFunction None %3 
                                      %5 = OpLabel 
                               f32_4 %14 = OpLoad vs_TEXCOORD1 
                               f32_4 %15 = OpVectorShuffle %14 %14 0 1 0 0 
                      Uniform f32_4* %22 = OpAccessChain %18 %20 
                               f32_4 %23 = OpLoad %22 
                               f32_4 %24 = OpVectorShuffle %23 %23 0 1 0 0 
                              bool_4 %25 = OpFOrdGreaterThanEqual %15 %24 
                              bool_2 %27 = OpVectorShuffle %25 %25 0 1 
                              bool_4 %28 = OpLoad %9 
                              bool_4 %29 = OpVectorShuffle %28 %27 4 5 2 3 
                                             OpStore %9 %29 
                      Uniform f32_4* %30 = OpAccessChain %18 %20 
                               f32_4 %31 = OpLoad %30 
                               f32_4 %32 = OpVectorShuffle %31 %31 2 2 2 3 
                               f32_4 %33 = OpLoad vs_TEXCOORD1 
                               f32_4 %34 = OpVectorShuffle %33 %33 0 0 0 1 
                              bool_4 %35 = OpFOrdGreaterThanEqual %32 %34 
                              bool_2 %36 = OpVectorShuffle %35 %35 2 3 
                              bool_4 %37 = OpLoad %9 
                              bool_4 %38 = OpVectorShuffle %37 %36 0 1 4 5 
                                             OpStore %9 %38 
                       Private bool* %44 = OpAccessChain %9 %42 
                                bool %45 = OpLoad %44 
                                 f32 %48 = OpSelect %45 %46 %47 
                        Private f32* %50 = OpAccessChain %40 %42 
                                             OpStore %50 %48 
                       Private bool* %52 = OpAccessChain %9 %51 
                                bool %53 = OpLoad %52 
                                 f32 %54 = OpSelect %53 %46 %47 
                        Private f32* %55 = OpAccessChain %40 %51 
                                             OpStore %55 %54 
                       Private bool* %57 = OpAccessChain %9 %56 
                                bool %58 = OpLoad %57 
                                 f32 %59 = OpSelect %58 %46 %47 
                        Private f32* %60 = OpAccessChain %40 %56 
                                             OpStore %60 %59 
                       Private bool* %62 = OpAccessChain %9 %61 
                                bool %63 = OpLoad %62 
                                 f32 %64 = OpSelect %63 %46 %47 
                        Private f32* %65 = OpAccessChain %40 %61 
                                             OpStore %65 %64 
                               f32_4 %67 = OpLoad %40 
                               f32_2 %68 = OpVectorShuffle %67 %67 2 3 
                               f32_4 %69 = OpLoad %40 
                               f32_2 %70 = OpVectorShuffle %69 %69 0 1 
                               f32_2 %71 = OpFMul %68 %70 
                               f32_4 %72 = OpLoad %40 
                               f32_4 %73 = OpVectorShuffle %72 %71 4 5 2 3 
                                             OpStore %40 %73 
                        Private f32* %74 = OpAccessChain %40 %51 
                                 f32 %75 = OpLoad %74 
                        Private f32* %76 = OpAccessChain %40 %42 
                                 f32 %77 = OpLoad %76 
                                 f32 %78 = OpFMul %75 %77 
                        Private f32* %79 = OpAccessChain %40 %42 
                                             OpStore %79 %78 
                 read_only Texture2D %84 = OpLoad %83 
                             sampler %88 = OpLoad %87 
          read_only Texture2DSampled %90 = OpSampledImage %84 %88 
                               f32_2 %93 = OpLoad vs_TEXCOORD0 
                               f32_4 %94 = OpImageSampleImplicitLod %90 %93 
                                             OpStore %80 %94 
                               f32_4 %96 = OpLoad %80 
                      Uniform f32_4* %98 = OpAccessChain %18 %97 
                               f32_4 %99 = OpLoad %98 
                              f32_4 %100 = OpFAdd %96 %99 
                                             OpStore %95 %100 
                              f32_4 %101 = OpLoad %95 
                              f32_4 %103 = OpLoad %102 
                              f32_4 %104 = OpFMul %101 %103 
                                             OpStore %95 %104 
                       Private f32* %106 = OpAccessChain %95 %61 
                                f32 %107 = OpLoad %106 
                       Private f32* %108 = OpAccessChain %40 %42 
                                f32 %109 = OpLoad %108 
                                f32 %110 = OpFMul %107 %109 
                                f32 %112 = OpFAdd %110 %111 
                                             OpStore %105 %112 
                       Private f32* %113 = OpAccessChain %40 %42 
                                f32 %114 = OpLoad %113 
                       Private f32* %115 = OpAccessChain %95 %61 
                                f32 %116 = OpLoad %115 
                                f32 %117 = OpFMul %114 %116 
                       Private f32* %118 = OpAccessChain %95 %61 
                                             OpStore %118 %117 
                              f32_4 %121 = OpLoad %95 
                                             OpStore %120 %121 
                                f32 %122 = OpLoad %105 
                               bool %123 = OpFOrdLessThan %122 %47 
                      Private bool* %124 = OpAccessChain %9 %42 
                                             OpStore %124 %123 
                      Private bool* %125 = OpAccessChain %9 %42 
                               bool %126 = OpLoad %125 
                                i32 %127 = OpSelect %126 %20 %97 
                                i32 %129 = OpIMul %127 %128 
                               bool %130 = OpINotEqual %129 %97 
                                             OpSelectionMerge %132 None 
                                             OpBranchConditional %130 %131 %132 
                                    %131 = OpLabel 
                                             OpKill
                                    %132 = OpLabel 
                                             OpReturn
                                             OpFunctionEnd
"
}
}
Program "fp" {
SubProgram "gles3 hw_tier00 " {
""
}
SubProgram "gles3 hw_tier01 " {
""
}
SubProgram "gles3 hw_tier02 " {
""
}
SubProgram "vulkan hw_tier00 " {
""
}
SubProgram "vulkan hw_tier01 " {
""
}
SubProgram "vulkan hw_tier02 " {
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "gles3 hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier00 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier01 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
SubProgram "vulkan hw_tier02 " {
Keywords { "UNITY_UI_ALPHACLIP" "UNITY_UI_CLIP_RECT" }
""
}
}
}
}
}
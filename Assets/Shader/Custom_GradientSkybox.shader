//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/GradientSkybox" {
Properties {
_Color1 ("Color 1", Color) = (1,0.5,0.5,1)
_Color2 ("Color 2", Color) = (0.5,0.5,1,1)
_Scale ("Scale", Float) = 1
_OffsetY ("OffsetY", Float) = 0
}
SubShader {
 Tags { "PreviewType" = "Skybox" "QUEUE" = "Geometry" }
 Pass {
  Tags { "PreviewType" = "Skybox" "QUEUE" = "Geometry" }
  ZWrite Off
  Cull Off
  GpuProgramID 52717
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat0;
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
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _Scale;
uniform 	float _OffsetY;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
float u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_TEXCOORD0.y / vs_TEXCOORD0.w;
    u_xlat0 = u_xlat0 + _OffsetY;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = vec4(u_xlat0) * u_xlat1 + _Color1;
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat0;
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
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _Scale;
uniform 	float _OffsetY;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
float u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_TEXCOORD0.y / vs_TEXCOORD0.w;
    u_xlat0 = u_xlat0 + _OffsetY;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = vec4(u_xlat0) * u_xlat1 + _Color1;
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
in highp vec4 in_POSITION0;
out highp vec4 vs_TEXCOORD0;
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
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[3] * u_xlat0.wwww + u_xlat1;
    gl_Position = u_xlat0;
    vs_TEXCOORD0 = u_xlat0;
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
uniform 	vec4 _Color1;
uniform 	vec4 _Color2;
uniform 	float _Scale;
uniform 	float _OffsetY;
in highp vec4 vs_TEXCOORD0;
layout(location = 0) out highp vec4 SV_TARGET0;
float u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0 = vs_TEXCOORD0.y / vs_TEXCOORD0.w;
    u_xlat0 = u_xlat0 + _OffsetY;
#ifdef UNITY_ADRENO_ES3
    u_xlat0 = min(max(u_xlat0, 0.0), 1.0);
#else
    u_xlat0 = clamp(u_xlat0, 0.0, 1.0);
#endif
    u_xlat0 = u_xlat0 * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = vec4(u_xlat0) * u_xlat1 + _Color1;
    return;
}

#endif
"
}
SubProgram "vulkan hw_tier00 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 Location 83 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Output %6 
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
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %84 = OpLoad %9 
                                              OpStore vs_TEXCOORD0 %84 
                          Output f32* %86 = OpAccessChain %79 %22 %75 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                          Output f32* %89 = OpAccessChain %79 %22 %75 
                                              OpStore %89 %88 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %52 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 11 
                                                  OpMemberDecorate %22 0 Offset 22 
                                                  OpMemberDecorate %22 1 Offset 22 
                                                  OpMemberDecorate %22 2 Offset 22 
                                                  OpMemberDecorate %22 3 Offset 22 
                                                  OpDecorate %22 Block 
                                                  OpDecorate %24 DescriptorSet 24 
                                                  OpDecorate %24 Binding 24 
                                                  OpDecorate %52 Location 52 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypePointer Private %6 
                              Private f32* %8 = OpVariable Private 
                                           %9 = OpTypeVector %6 4 
                                          %10 = OpTypePointer Input %9 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %12 = OpTypeInt 32 0 
                                      u32 %13 = OpConstant 1 
                                          %14 = OpTypePointer Input %6 
                                      u32 %17 = OpConstant 3 
                                          %22 = OpTypeStruct %9 %9 %6 %6 
                                          %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4; f32; f32;}* %24 = OpVariable Uniform 
                                          %25 = OpTypeInt 32 1 
                                      i32 %26 = OpConstant 3 
                                          %27 = OpTypePointer Uniform %6 
                                      f32 %32 = OpConstant 3.674022E-40 
                                      f32 %33 = OpConstant 3.674022E-40 
                                      i32 %36 = OpConstant 2 
                                          %40 = OpTypePointer Private %9 
                           Private f32_4* %41 = OpVariable Private 
                                      i32 %42 = OpConstant 0 
                                          %43 = OpTypePointer Uniform %9 
                                      i32 %47 = OpConstant 1 
                                          %51 = OpTypePointer Output %9 
                            Output f32_4* %52 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                      f32 %16 = OpLoad %15 
                               Input f32* %18 = OpAccessChain vs_TEXCOORD0 %17 
                                      f32 %19 = OpLoad %18 
                                      f32 %20 = OpFDiv %16 %19 
                                                  OpStore %8 %20 
                                      f32 %21 = OpLoad %8 
                             Uniform f32* %28 = OpAccessChain %24 %26 
                                      f32 %29 = OpLoad %28 
                                      f32 %30 = OpFAdd %21 %29 
                                                  OpStore %8 %30 
                                      f32 %31 = OpLoad %8 
                                      f32 %34 = OpExtInst %1 43 %31 %32 %33 
                                                  OpStore %8 %34 
                                      f32 %35 = OpLoad %8 
                             Uniform f32* %37 = OpAccessChain %24 %36 
                                      f32 %38 = OpLoad %37 
                                      f32 %39 = OpFMul %35 %38 
                                                  OpStore %8 %39 
                           Uniform f32_4* %44 = OpAccessChain %24 %42 
                                    f32_4 %45 = OpLoad %44 
                                    f32_4 %46 = OpFNegate %45 
                           Uniform f32_4* %48 = OpAccessChain %24 %47 
                                    f32_4 %49 = OpLoad %48 
                                    f32_4 %50 = OpFAdd %46 %49 
                                                  OpStore %41 %50 
                                      f32 %53 = OpLoad %8 
                                    f32_4 %54 = OpCompositeConstruct %53 %53 %53 %53 
                                    f32_4 %55 = OpLoad %41 
                                    f32_4 %56 = OpFMul %54 %55 
                           Uniform f32_4* %57 = OpAccessChain %24 %42 
                                    f32_4 %58 = OpLoad %57 
                                    f32_4 %59 = OpFAdd %56 %58 
                                                  OpStore %52 %59 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "vulkan hw_tier01 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 Location 83 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Output %6 
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
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %84 = OpLoad %9 
                                              OpStore vs_TEXCOORD0 %84 
                          Output f32* %86 = OpAccessChain %79 %22 %75 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                          Output f32* %89 = OpAccessChain %79 %22 %75 
                                              OpStore %89 %88 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %52 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 11 
                                                  OpMemberDecorate %22 0 Offset 22 
                                                  OpMemberDecorate %22 1 Offset 22 
                                                  OpMemberDecorate %22 2 Offset 22 
                                                  OpMemberDecorate %22 3 Offset 22 
                                                  OpDecorate %22 Block 
                                                  OpDecorate %24 DescriptorSet 24 
                                                  OpDecorate %24 Binding 24 
                                                  OpDecorate %52 Location 52 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypePointer Private %6 
                              Private f32* %8 = OpVariable Private 
                                           %9 = OpTypeVector %6 4 
                                          %10 = OpTypePointer Input %9 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %12 = OpTypeInt 32 0 
                                      u32 %13 = OpConstant 1 
                                          %14 = OpTypePointer Input %6 
                                      u32 %17 = OpConstant 3 
                                          %22 = OpTypeStruct %9 %9 %6 %6 
                                          %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4; f32; f32;}* %24 = OpVariable Uniform 
                                          %25 = OpTypeInt 32 1 
                                      i32 %26 = OpConstant 3 
                                          %27 = OpTypePointer Uniform %6 
                                      f32 %32 = OpConstant 3.674022E-40 
                                      f32 %33 = OpConstant 3.674022E-40 
                                      i32 %36 = OpConstant 2 
                                          %40 = OpTypePointer Private %9 
                           Private f32_4* %41 = OpVariable Private 
                                      i32 %42 = OpConstant 0 
                                          %43 = OpTypePointer Uniform %9 
                                      i32 %47 = OpConstant 1 
                                          %51 = OpTypePointer Output %9 
                            Output f32_4* %52 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                      f32 %16 = OpLoad %15 
                               Input f32* %18 = OpAccessChain vs_TEXCOORD0 %17 
                                      f32 %19 = OpLoad %18 
                                      f32 %20 = OpFDiv %16 %19 
                                                  OpStore %8 %20 
                                      f32 %21 = OpLoad %8 
                             Uniform f32* %28 = OpAccessChain %24 %26 
                                      f32 %29 = OpLoad %28 
                                      f32 %30 = OpFAdd %21 %29 
                                                  OpStore %8 %30 
                                      f32 %31 = OpLoad %8 
                                      f32 %34 = OpExtInst %1 43 %31 %32 %33 
                                                  OpStore %8 %34 
                                      f32 %35 = OpLoad %8 
                             Uniform f32* %37 = OpAccessChain %24 %36 
                                      f32 %38 = OpLoad %37 
                                      f32 %39 = OpFMul %35 %38 
                                                  OpStore %8 %39 
                           Uniform f32_4* %44 = OpAccessChain %24 %42 
                                    f32_4 %45 = OpLoad %44 
                                    f32_4 %46 = OpFNegate %45 
                           Uniform f32_4* %48 = OpAccessChain %24 %47 
                                    f32_4 %49 = OpLoad %48 
                                    f32_4 %50 = OpFAdd %46 %49 
                                                  OpStore %41 %50 
                                      f32 %53 = OpLoad %8 
                                    f32_4 %54 = OpCompositeConstruct %53 %53 %53 %53 
                                    f32_4 %55 = OpLoad %41 
                                    f32_4 %56 = OpFMul %54 %55 
                           Uniform f32_4* %57 = OpAccessChain %24 %42 
                                    f32_4 %58 = OpLoad %57 
                                    f32_4 %59 = OpFAdd %56 %58 
                                                  OpStore %52 %59 
                                                  OpReturn
                                                  OpFunctionEnd
"
}
SubProgram "vulkan hw_tier02 " {
"; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 91
; Schema: 0
                                              OpCapability Shader 
                                       %1 = OpExtInstImport "GLSL.std.450" 
                                              OpMemoryModel Logical GLSL450 
                                              OpEntryPoint Vertex %4 "main" %11 %79 %83 
                                              OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                              OpDecorate %11 Location 11 
                                              OpDecorate %16 ArrayStride 16 
                                              OpDecorate %17 ArrayStride 17 
                                              OpMemberDecorate %18 0 Offset 18 
                                              OpMemberDecorate %18 1 Offset 18 
                                              OpDecorate %18 Block 
                                              OpDecorate %20 DescriptorSet 20 
                                              OpDecorate %20 Binding 20 
                                              OpMemberDecorate %77 0 BuiltIn 77 
                                              OpMemberDecorate %77 1 BuiltIn 77 
                                              OpMemberDecorate %77 2 BuiltIn 77 
                                              OpDecorate %77 Block 
                                              OpDecorate vs_TEXCOORD0 Location 83 
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
                                      %18 = OpTypeStruct %16 %17 
                                      %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4[4]; f32_4[4];}* %20 = OpVariable Uniform 
                                      %21 = OpTypeInt 32 1 
                                  i32 %22 = OpConstant 0 
                                  i32 %23 = OpConstant 1 
                                      %24 = OpTypePointer Uniform %7 
                                  i32 %35 = OpConstant 2 
                                  i32 %44 = OpConstant 3 
                       Private f32_4* %48 = OpVariable Private 
                                  u32 %75 = OpConstant 1 
                                      %76 = OpTypeArray %6 %75 
                                      %77 = OpTypeStruct %7 %6 %76 
                                      %78 = OpTypePointer Output %77 
 Output struct {f32_4; f32; f32[1];}* %79 = OpVariable Output 
                                      %81 = OpTypePointer Output %7 
               Output f32_4* vs_TEXCOORD0 = OpVariable Output 
                                      %85 = OpTypePointer Output %6 
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
                       Uniform f32_4* %68 = OpAccessChain %20 %23 %44 
                                f32_4 %69 = OpLoad %68 
                                f32_4 %70 = OpLoad %9 
                                f32_4 %71 = OpVectorShuffle %70 %70 3 3 3 3 
                                f32_4 %72 = OpFMul %69 %71 
                                f32_4 %73 = OpLoad %48 
                                f32_4 %74 = OpFAdd %72 %73 
                                              OpStore %9 %74 
                                f32_4 %80 = OpLoad %9 
                        Output f32_4* %82 = OpAccessChain %79 %22 
                                              OpStore %82 %80 
                                f32_4 %84 = OpLoad %9 
                                              OpStore vs_TEXCOORD0 %84 
                          Output f32* %86 = OpAccessChain %79 %22 %75 
                                  f32 %87 = OpLoad %86 
                                  f32 %88 = OpFNegate %87 
                          Output f32* %89 = OpAccessChain %79 %22 %75 
                                              OpStore %89 %88 
                                              OpReturn
                                              OpFunctionEnd
; SPIR-V
; Version: 1.0
; Generator: Khronos Glslang Reference Front End; 6
; Bound: 61
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %11 %52 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 11 
                                                  OpMemberDecorate %22 0 Offset 22 
                                                  OpMemberDecorate %22 1 Offset 22 
                                                  OpMemberDecorate %22 2 Offset 22 
                                                  OpMemberDecorate %22 3 Offset 22 
                                                  OpDecorate %22 Block 
                                                  OpDecorate %24 DescriptorSet 24 
                                                  OpDecorate %24 Binding 24 
                                                  OpDecorate %52 Location 52 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypePointer Private %6 
                              Private f32* %8 = OpVariable Private 
                                           %9 = OpTypeVector %6 4 
                                          %10 = OpTypePointer Input %9 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %12 = OpTypeInt 32 0 
                                      u32 %13 = OpConstant 1 
                                          %14 = OpTypePointer Input %6 
                                      u32 %17 = OpConstant 3 
                                          %22 = OpTypeStruct %9 %9 %6 %6 
                                          %23 = OpTypePointer Uniform %22 
Uniform struct {f32_4; f32_4; f32; f32;}* %24 = OpVariable Uniform 
                                          %25 = OpTypeInt 32 1 
                                      i32 %26 = OpConstant 3 
                                          %27 = OpTypePointer Uniform %6 
                                      f32 %32 = OpConstant 3.674022E-40 
                                      f32 %33 = OpConstant 3.674022E-40 
                                      i32 %36 = OpConstant 2 
                                          %40 = OpTypePointer Private %9 
                           Private f32_4* %41 = OpVariable Private 
                                      i32 %42 = OpConstant 0 
                                          %43 = OpTypePointer Uniform %9 
                                      i32 %47 = OpConstant 1 
                                          %51 = OpTypePointer Output %9 
                            Output f32_4* %52 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %15 = OpAccessChain vs_TEXCOORD0 %13 
                                      f32 %16 = OpLoad %15 
                               Input f32* %18 = OpAccessChain vs_TEXCOORD0 %17 
                                      f32 %19 = OpLoad %18 
                                      f32 %20 = OpFDiv %16 %19 
                                                  OpStore %8 %20 
                                      f32 %21 = OpLoad %8 
                             Uniform f32* %28 = OpAccessChain %24 %26 
                                      f32 %29 = OpLoad %28 
                                      f32 %30 = OpFAdd %21 %29 
                                                  OpStore %8 %30 
                                      f32 %31 = OpLoad %8 
                                      f32 %34 = OpExtInst %1 43 %31 %32 %33 
                                                  OpStore %8 %34 
                                      f32 %35 = OpLoad %8 
                             Uniform f32* %37 = OpAccessChain %24 %36 
                                      f32 %38 = OpLoad %37 
                                      f32 %39 = OpFMul %35 %38 
                                                  OpStore %8 %39 
                           Uniform f32_4* %44 = OpAccessChain %24 %42 
                                    f32_4 %45 = OpLoad %44 
                                    f32_4 %46 = OpFNegate %45 
                           Uniform f32_4* %48 = OpAccessChain %24 %47 
                                    f32_4 %49 = OpLoad %48 
                                    f32_4 %50 = OpFAdd %46 %49 
                                                  OpStore %41 %50 
                                      f32 %53 = OpLoad %8 
                                    f32_4 %54 = OpCompositeConstruct %53 %53 %53 %53 
                                    f32_4 %55 = OpLoad %41 
                                    f32_4 %56 = OpFMul %54 %55 
                           Uniform f32_4* %57 = OpAccessChain %24 %42 
                                    f32_4 %58 = OpLoad %57 
                                    f32_4 %59 = OpFAdd %56 %58 
                                                  OpStore %52 %59 
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
}
}
}
}
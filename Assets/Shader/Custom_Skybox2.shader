//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "Custom/Skybox2" {
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
  GpuProgramID 50280
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
vec2 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y + _OffsetY;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = u_xlat0.xxxx * u_xlat1 + _Color1;
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
vec2 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y + _OffsetY;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = u_xlat0.xxxx * u_xlat1 + _Color1;
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
vec2 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.y = vs_TEXCOORD0.y + _OffsetY;
    u_xlat0.x = vs_TEXCOORD0.x;
    u_xlat0.xy = u_xlat0.xy / vs_TEXCOORD0.ww;
    u_xlat0.x = dot(u_xlat0.xy, u_xlat0.xy);
    u_xlat0.x = sqrt(u_xlat0.x);
    u_xlat0.x = u_xlat0.x * _Scale;
    u_xlat1 = (-_Color1) + _Color2;
    SV_TARGET0 = u_xlat0.xxxx * u_xlat1 + _Color1;
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
; Bound: 73
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %12 %64 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 12 
                                                  OpMemberDecorate %18 0 Offset 18 
                                                  OpMemberDecorate %18 1 Offset 18 
                                                  OpMemberDecorate %18 2 Offset 18 
                                                  OpMemberDecorate %18 3 Offset 18 
                                                  OpDecorate %18 Block 
                                                  OpDecorate %20 DescriptorSet 20 
                                                  OpDecorate %20 Binding 20 
                                                  OpDecorate %64 Location 64 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 2 
                                           %8 = OpTypePointer Private %7 
                            Private f32_2* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 4 
                                          %11 = OpTypePointer Input %10 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %13 = OpTypeInt 32 0 
                                      u32 %14 = OpConstant 1 
                                          %15 = OpTypePointer Input %6 
                                          %18 = OpTypeStruct %10 %10 %6 %6 
                                          %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32; f32;}* %20 = OpVariable Uniform 
                                          %21 = OpTypeInt 32 1 
                                      i32 %22 = OpConstant 3 
                                          %23 = OpTypePointer Uniform %6 
                                          %27 = OpTypePointer Private %6 
                                      u32 %29 = OpConstant 0 
                                      i32 %47 = OpConstant 2 
                                          %52 = OpTypePointer Private %10 
                           Private f32_4* %53 = OpVariable Private 
                                      i32 %54 = OpConstant 0 
                                          %55 = OpTypePointer Uniform %10 
                                      i32 %59 = OpConstant 1 
                                          %63 = OpTypePointer Output %10 
                            Output f32_4* %64 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                      f32 %17 = OpLoad %16 
                             Uniform f32* %24 = OpAccessChain %20 %22 
                                      f32 %25 = OpLoad %24 
                                      f32 %26 = OpFAdd %17 %25 
                             Private f32* %28 = OpAccessChain %9 %14 
                                                  OpStore %28 %26 
                               Input f32* %30 = OpAccessChain vs_TEXCOORD0 %29 
                                      f32 %31 = OpLoad %30 
                             Private f32* %32 = OpAccessChain %9 %29 
                                                  OpStore %32 %31 
                                    f32_2 %33 = OpLoad %9 
                                    f32_4 %34 = OpLoad vs_TEXCOORD0 
                                    f32_2 %35 = OpVectorShuffle %34 %34 3 3 
                                    f32_2 %36 = OpFDiv %33 %35 
                                                  OpStore %9 %36 
                                    f32_2 %37 = OpLoad %9 
                                    f32_2 %38 = OpLoad %9 
                                      f32 %39 = OpDot %37 %38 
                             Private f32* %40 = OpAccessChain %9 %29 
                                                  OpStore %40 %39 
                             Private f32* %41 = OpAccessChain %9 %29 
                                      f32 %42 = OpLoad %41 
                                      f32 %43 = OpExtInst %1 31 %42 
                             Private f32* %44 = OpAccessChain %9 %29 
                                                  OpStore %44 %43 
                             Private f32* %45 = OpAccessChain %9 %29 
                                      f32 %46 = OpLoad %45 
                             Uniform f32* %48 = OpAccessChain %20 %47 
                                      f32 %49 = OpLoad %48 
                                      f32 %50 = OpFMul %46 %49 
                             Private f32* %51 = OpAccessChain %9 %29 
                                                  OpStore %51 %50 
                           Uniform f32_4* %56 = OpAccessChain %20 %54 
                                    f32_4 %57 = OpLoad %56 
                                    f32_4 %58 = OpFNegate %57 
                           Uniform f32_4* %60 = OpAccessChain %20 %59 
                                    f32_4 %61 = OpLoad %60 
                                    f32_4 %62 = OpFAdd %58 %61 
                                                  OpStore %53 %62 
                                    f32_2 %65 = OpLoad %9 
                                    f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                    f32_4 %67 = OpLoad %53 
                                    f32_4 %68 = OpFMul %66 %67 
                           Uniform f32_4* %69 = OpAccessChain %20 %54 
                                    f32_4 %70 = OpLoad %69 
                                    f32_4 %71 = OpFAdd %68 %70 
                                                  OpStore %64 %71 
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
; Bound: 73
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %12 %64 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 12 
                                                  OpMemberDecorate %18 0 Offset 18 
                                                  OpMemberDecorate %18 1 Offset 18 
                                                  OpMemberDecorate %18 2 Offset 18 
                                                  OpMemberDecorate %18 3 Offset 18 
                                                  OpDecorate %18 Block 
                                                  OpDecorate %20 DescriptorSet 20 
                                                  OpDecorate %20 Binding 20 
                                                  OpDecorate %64 Location 64 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 2 
                                           %8 = OpTypePointer Private %7 
                            Private f32_2* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 4 
                                          %11 = OpTypePointer Input %10 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %13 = OpTypeInt 32 0 
                                      u32 %14 = OpConstant 1 
                                          %15 = OpTypePointer Input %6 
                                          %18 = OpTypeStruct %10 %10 %6 %6 
                                          %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32; f32;}* %20 = OpVariable Uniform 
                                          %21 = OpTypeInt 32 1 
                                      i32 %22 = OpConstant 3 
                                          %23 = OpTypePointer Uniform %6 
                                          %27 = OpTypePointer Private %6 
                                      u32 %29 = OpConstant 0 
                                      i32 %47 = OpConstant 2 
                                          %52 = OpTypePointer Private %10 
                           Private f32_4* %53 = OpVariable Private 
                                      i32 %54 = OpConstant 0 
                                          %55 = OpTypePointer Uniform %10 
                                      i32 %59 = OpConstant 1 
                                          %63 = OpTypePointer Output %10 
                            Output f32_4* %64 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                      f32 %17 = OpLoad %16 
                             Uniform f32* %24 = OpAccessChain %20 %22 
                                      f32 %25 = OpLoad %24 
                                      f32 %26 = OpFAdd %17 %25 
                             Private f32* %28 = OpAccessChain %9 %14 
                                                  OpStore %28 %26 
                               Input f32* %30 = OpAccessChain vs_TEXCOORD0 %29 
                                      f32 %31 = OpLoad %30 
                             Private f32* %32 = OpAccessChain %9 %29 
                                                  OpStore %32 %31 
                                    f32_2 %33 = OpLoad %9 
                                    f32_4 %34 = OpLoad vs_TEXCOORD0 
                                    f32_2 %35 = OpVectorShuffle %34 %34 3 3 
                                    f32_2 %36 = OpFDiv %33 %35 
                                                  OpStore %9 %36 
                                    f32_2 %37 = OpLoad %9 
                                    f32_2 %38 = OpLoad %9 
                                      f32 %39 = OpDot %37 %38 
                             Private f32* %40 = OpAccessChain %9 %29 
                                                  OpStore %40 %39 
                             Private f32* %41 = OpAccessChain %9 %29 
                                      f32 %42 = OpLoad %41 
                                      f32 %43 = OpExtInst %1 31 %42 
                             Private f32* %44 = OpAccessChain %9 %29 
                                                  OpStore %44 %43 
                             Private f32* %45 = OpAccessChain %9 %29 
                                      f32 %46 = OpLoad %45 
                             Uniform f32* %48 = OpAccessChain %20 %47 
                                      f32 %49 = OpLoad %48 
                                      f32 %50 = OpFMul %46 %49 
                             Private f32* %51 = OpAccessChain %9 %29 
                                                  OpStore %51 %50 
                           Uniform f32_4* %56 = OpAccessChain %20 %54 
                                    f32_4 %57 = OpLoad %56 
                                    f32_4 %58 = OpFNegate %57 
                           Uniform f32_4* %60 = OpAccessChain %20 %59 
                                    f32_4 %61 = OpLoad %60 
                                    f32_4 %62 = OpFAdd %58 %61 
                                                  OpStore %53 %62 
                                    f32_2 %65 = OpLoad %9 
                                    f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                    f32_4 %67 = OpLoad %53 
                                    f32_4 %68 = OpFMul %66 %67 
                           Uniform f32_4* %69 = OpAccessChain %20 %54 
                                    f32_4 %70 = OpLoad %69 
                                    f32_4 %71 = OpFAdd %68 %70 
                                                  OpStore %64 %71 
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
; Bound: 73
; Schema: 0
                                                  OpCapability Shader 
                                           %1 = OpExtInstImport "GLSL.std.450" 
                                                  OpMemoryModel Logical GLSL450 
                                                  OpEntryPoint Fragment %4 "main" %12 %64 
                                                  OpExecutionMode %4 OriginUpperLeft 
                                                  OpName vs_TEXCOORD0 "vs_TEXCOORD0" 
                                                  OpDecorate vs_TEXCOORD0 Location 12 
                                                  OpMemberDecorate %18 0 Offset 18 
                                                  OpMemberDecorate %18 1 Offset 18 
                                                  OpMemberDecorate %18 2 Offset 18 
                                                  OpMemberDecorate %18 3 Offset 18 
                                                  OpDecorate %18 Block 
                                                  OpDecorate %20 DescriptorSet 20 
                                                  OpDecorate %20 Binding 20 
                                                  OpDecorate %64 Location 64 
                                           %2 = OpTypeVoid 
                                           %3 = OpTypeFunction %2 
                                           %6 = OpTypeFloat 32 
                                           %7 = OpTypeVector %6 2 
                                           %8 = OpTypePointer Private %7 
                            Private f32_2* %9 = OpVariable Private 
                                          %10 = OpTypeVector %6 4 
                                          %11 = OpTypePointer Input %10 
                    Input f32_4* vs_TEXCOORD0 = OpVariable Input 
                                          %13 = OpTypeInt 32 0 
                                      u32 %14 = OpConstant 1 
                                          %15 = OpTypePointer Input %6 
                                          %18 = OpTypeStruct %10 %10 %6 %6 
                                          %19 = OpTypePointer Uniform %18 
Uniform struct {f32_4; f32_4; f32; f32;}* %20 = OpVariable Uniform 
                                          %21 = OpTypeInt 32 1 
                                      i32 %22 = OpConstant 3 
                                          %23 = OpTypePointer Uniform %6 
                                          %27 = OpTypePointer Private %6 
                                      u32 %29 = OpConstant 0 
                                      i32 %47 = OpConstant 2 
                                          %52 = OpTypePointer Private %10 
                           Private f32_4* %53 = OpVariable Private 
                                      i32 %54 = OpConstant 0 
                                          %55 = OpTypePointer Uniform %10 
                                      i32 %59 = OpConstant 1 
                                          %63 = OpTypePointer Output %10 
                            Output f32_4* %64 = OpVariable Output 
                                      void %4 = OpFunction None %3 
                                           %5 = OpLabel 
                               Input f32* %16 = OpAccessChain vs_TEXCOORD0 %14 
                                      f32 %17 = OpLoad %16 
                             Uniform f32* %24 = OpAccessChain %20 %22 
                                      f32 %25 = OpLoad %24 
                                      f32 %26 = OpFAdd %17 %25 
                             Private f32* %28 = OpAccessChain %9 %14 
                                                  OpStore %28 %26 
                               Input f32* %30 = OpAccessChain vs_TEXCOORD0 %29 
                                      f32 %31 = OpLoad %30 
                             Private f32* %32 = OpAccessChain %9 %29 
                                                  OpStore %32 %31 
                                    f32_2 %33 = OpLoad %9 
                                    f32_4 %34 = OpLoad vs_TEXCOORD0 
                                    f32_2 %35 = OpVectorShuffle %34 %34 3 3 
                                    f32_2 %36 = OpFDiv %33 %35 
                                                  OpStore %9 %36 
                                    f32_2 %37 = OpLoad %9 
                                    f32_2 %38 = OpLoad %9 
                                      f32 %39 = OpDot %37 %38 
                             Private f32* %40 = OpAccessChain %9 %29 
                                                  OpStore %40 %39 
                             Private f32* %41 = OpAccessChain %9 %29 
                                      f32 %42 = OpLoad %41 
                                      f32 %43 = OpExtInst %1 31 %42 
                             Private f32* %44 = OpAccessChain %9 %29 
                                                  OpStore %44 %43 
                             Private f32* %45 = OpAccessChain %9 %29 
                                      f32 %46 = OpLoad %45 
                             Uniform f32* %48 = OpAccessChain %20 %47 
                                      f32 %49 = OpLoad %48 
                                      f32 %50 = OpFMul %46 %49 
                             Private f32* %51 = OpAccessChain %9 %29 
                                                  OpStore %51 %50 
                           Uniform f32_4* %56 = OpAccessChain %20 %54 
                                    f32_4 %57 = OpLoad %56 
                                    f32_4 %58 = OpFNegate %57 
                           Uniform f32_4* %60 = OpAccessChain %20 %59 
                                    f32_4 %61 = OpLoad %60 
                                    f32_4 %62 = OpFAdd %58 %61 
                                                  OpStore %53 %62 
                                    f32_2 %65 = OpLoad %9 
                                    f32_4 %66 = OpVectorShuffle %65 %65 0 0 0 0 
                                    f32_4 %67 = OpLoad %53 
                                    f32_4 %68 = OpFMul %66 %67 
                           Uniform f32_4* %69 = OpAccessChain %20 %54 
                                    f32_4 %70 = OpLoad %69 
                                    f32_4 %71 = OpFAdd %68 %70 
                                                  OpStore %64 %71 
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
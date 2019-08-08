Shader "PlanetShader"
{
	Properties 
	{
		_MainTex("_MainTex", 2D) = "black" {}
		_AtmosFalloff("_AtmosFalloff", Float) = 3
		_AtmosNear("_AtmosNear", Color) = (0.8041958,1,0,1)
		_AtmosFar("_AtmosFar", Color) = (0.1328669,0,1,1)
		_TimeScale("_TimeScale", Float) = 0.01
		_Normals("_Normals", 2D) = "black" {}
		_ColorSpec("_ColorSpec", Color) = (1,1,1,1)
		_Mask("_Mask", 2D) = "white" {}
		_AnisoCloudPower("_AnisoCloudPower", Range(0,0.1) ) = 0
		_Clouds("_Clouds", 2D) = "black" {}
		_Roughness("_Roughness", Float) = 0
		_CloudHeight("_CloudHeight", Range(0,-0.1) ) = 0

	}
	
	SubShader 
	{
		Tags
		{
			"Queue"="Geometry"
			"IgnoreProjector"="False"
			"RenderType"="Opaque"

		}

		
			Cull Back
			ZWrite On
			ZTest LEqual
			ColorMask RGBA
			Fog{
			}


			CGPROGRAM
			#pragma surface surf BlinnPhongEditor  vertex:vert
			#pragma target 3.0
			
			
			sampler2D _MainTex;
			float _AtmosFalloff;
			float4 _AtmosNear;
			float4 _AtmosFar;
			float _TimeScale;
			sampler2D _Normals;
			float4 _ColorSpec;
			sampler2D _Mask;
			float _AnisoCloudPower;
			sampler2D _Clouds;
			float _Roughness;
			float _CloudHeight;

			struct EditorSurfaceOutput {
				half3 Albedo;
				half3 Normal;
				half3 Emission;
				half3 Gloss;
				half Specular;
				half Alpha;
				half4 Custom;
			};
			
			inline half4 LightingBlinnPhongEditor_PrePass (EditorSurfaceOutput s, half4 light)
			{
				half3 spec = light.a * s.Gloss;
				half4 c;
				c.rgb = (s.Albedo * light.rgb + light.rgb * spec);
				c.a = s.Alpha;
				return c;

			}

			inline half4 LightingBlinnPhongEditor (EditorSurfaceOutput s, half3 lightDir, half3 viewDir, half atten)
			{
				half3 h = normalize (lightDir + viewDir);
				
				half diff = max (0, dot ( lightDir, s.Normal ));
				
				float nh = max (0, dot (s.Normal, h));
				float spec = pow (nh, s.Specular*128.0);
				
				half4 res;
				res.rgb = _LightColor0.rgb * diff;
				res.w = spec * Luminance (_LightColor0.rgb);
				res *= atten * 2.0;

				return LightingBlinnPhongEditor_PrePass( s, res );
			}
			
			struct Input {
			float3 viewDir;
			float2 uv_MainTex;
			float2 uv_Clouds;
			float2 uv_Normals;
			float2 uv_Mask;

			};

			void vert (inout appdata_full v, out Input o) {
			UNITY_INITIALIZE_OUTPUT(Input,o);
				float4 VertexOutputMaster0_0_NoInput = float4(0,0,0,0);
				float4 VertexOutputMaster0_1_NoInput = float4(0,0,0,0);
				float4 VertexOutputMaster0_2_NoInput = float4(0,0,0,0);
				float4 VertexOutputMaster0_3_NoInput = float4(0,0,0,0);
			}
			

			void surf (Input IN, inout EditorSurfaceOutput o) {
				o.Normal = float3(0.0,0.0,1.0);
				o.Alpha = 1.0;
				o.Albedo = 0.0;
				o.Emission = 0.0;
				o.Gloss = 0.0;
				o.Specular = 0.0;
				o.Custom = 0.0;
				
			float4 Fresnel0_1_NoInput = float4(0,0,1,1);
			float4 Fresnel0=(1.0 - dot( normalize( float4( IN.viewDir.x, IN.viewDir.y,IN.viewDir.z,1.0 ).xyz), normalize( Fresnel0_1_NoInput.xyz ) )).xxxx;
			float4 Pow0=pow(Fresnel0,_AtmosFalloff.xxxx);
			float4 Saturate0=saturate(Pow0);
			float4 Lerp0=lerp(_AtmosNear,_AtmosFar,Saturate0);
			float4 Multiply1=Lerp0 * Saturate0;
			float4 Sampled2D0=tex2D(_MainTex,IN.uv_MainTex.xy);
			float4 Add0=Multiply1 + Sampled2D0;
			float4 Multiply2=_Time * _TimeScale.xxxx;
			float4 UV_Pan0=float4((IN.uv_Clouds.xyxy).x + Multiply2.y,(IN.uv_Clouds.xyxy).y,(IN.uv_Clouds.xyxy).z,(IN.uv_Clouds.xyxy).w);
			float4 ParallaxOffset0_2_NoInput = float4(0,0,0,0);
			float4 ParallaxOffset0= ParallaxOffset( _CloudHeight.xxxx.x, ParallaxOffset0_2_NoInput.x, float4( IN.viewDir.x, IN.viewDir.y,IN.viewDir.z,1.0 ).xyz).xyxy;
			float4 Add1=UV_Pan0 + ParallaxOffset0;
			float4 Tex2D0=tex2D(_Clouds,Add1.xy);
			float4 Lerp1=lerp(Add0,Tex2D0,Tex2D0);
			float4 Sampled2D1=tex2D(_Normals,IN.uv_Normals.xy);
			float4 UnpackNormal0=float4(UnpackNormal(Sampled2D1).xyz, 1.0);
			float4 Normalize0=normalize(float4( IN.viewDir.x, IN.viewDir.y,IN.viewDir.z,1.0 ));
			float4 Negative0= -Normalize0; 
			 float4 Invert1= float4(1.0, 1.0, 1.0, 1.0) - _AnisoCloudPower.xxxx;
			float4 Lerp4=lerp(Negative0,float4( 0,0,1,0),Invert1);
			float4 Lerp3=lerp(UnpackNormal0,Lerp4,Tex2D0);
			float4 Sampled2D3=tex2D(_Mask,IN.uv_Mask.xy);
			float4 Invert0= float4(1.0, 1.0, 1.0, 1.0) - Tex2D0;
			float4 Multiply4=Sampled2D3 * Invert0;
			float4 Multiply3=Multiply4 * _ColorSpec;
			float4 Master0_5_NoInput = float4(1,1,1,1);
			float4 Master0_7_NoInput = float4(0,0,0,0);
			float4 Master0_6_NoInput = float4(1,1,1,1);
			o.Albedo = Lerp1;
			o.Normal = Lerp3;
			o.Emission = Tex2D0;
			o.Specular = _Roughness.xxxx;
			o.Gloss = Multiply3;

				o.Normal = normalize(o.Normal);
			}
		ENDCG
	}
	Fallback "Diffuse"
}
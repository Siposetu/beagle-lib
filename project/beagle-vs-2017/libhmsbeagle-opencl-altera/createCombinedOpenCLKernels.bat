::
:: windows script to create a OpenCL kernel files
:: for each state/precision combination
:: @author Daniel Ayres
:: @author Aaron Darling
:: 
cd ..\..\..\libhmsbeagle\GPU\kernels

echo #define STATE_COUNT 4 > kernels4.cl
type ..\GPUImplDefs.h >> kernels4.cl
type kernelsAll.cu >> kernels4.cl
type kernels4.cu >> kernels4.cl

FOR %%G IN (16 32 48 64 80 128 192) DO (

echo #define STATE_COUNT %%G> kernels%%G.cl
type ..\GPUImplDefs.h >> kernels%%G.cl
type kernelsAll.cu >> kernels%%G.cl
type kernelsX.cu >> kernels%%G.cl

)

echo #define STATE_COUNT 4 > kernels_dp_4.cl
echo #define DOUBLE_PRECISION>> kernels_dp_4.cl
type ..\GPUImplDefs.h >> kernels_dp_4.cl
type kernelsAll.cu >> kernels_dp_4.cl
type kernels4.cu >> kernels_dp_4.cl

FOR %%G IN (16 32 48 64 80 128 192) DO (

echo #define STATE_COUNT %%G> kernels_dp_%%G.cl
echo #define DOUBLE_PRECISION>> kernels_dp_%%G.cl
type ..\GPUImplDefs.h >> kernels_dp_%%G.cl
type kernelsAll.cu >> kernels_dp_%%G.cl
type kernelsX.cu >> kernels_dp_%%G.cl

) 



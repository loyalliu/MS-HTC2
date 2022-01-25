# Calibrationless Multi-Slice Cartesian MRI via Orthogonally Alternating Phase Encoding Direction and Joint Low-Rank Tensor Completion

## Suggested setup
- The demo scripts were tested on Matlab 2019b (installed on Windows 10). 

## Demo and sample data
- One demo script is provided for MS-HTC reconstruction.
  + demo_MSHTC: MS-HTC reconstruction for 2D multi-slice data acquired with uniform undersampling while orthogonally alternating PE direction among adjacent slices.
  
- One sample data are available.
  + T2w_TSE_AlterPE.mat: 2-slice 8-channel fully sampled T2w data acquired with alternating LR/AP PE direction for odd/even slice.
  + 4x1D_Regular240_dir1.mat: uniform undersampling mask at R = 4.

## Reference
Zhao, Yujiao, et al. "Calibrationless Multi-Slice Cartesian MRI via Orthogonally Alternating Phase Encoding Direction and Joint Low-Rank Tensor Completion." NMR in Biomedicine (2022). https://doi.org/10.1002/nbm.4695
Liu, Yilong, et al. "Calibrationless parallel imaging reconstruction for multislice MR data using low‐rank tensor completion." Magnetic Resonance in Medicine 85.2 (2021): 897-911. https://doi.org/10.1002/mrm.28480

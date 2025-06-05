@echo off
echo AI Training Environment Setup
echo ==============================
echo This script will clean and reinstall all required packages.
echo.

echo Removing existing PyTorch installations...
pip uninstall torch torchvision torchaudio triton -y >nul 2>&1
pip uninstall nvidia-ml-py3 nvidia-cublas-cu12 nvidia-cuda-cupti-cu12 -y >nul 2>&1
pip uninstall nvidia-cuda-nvrtc-cu12 nvidia-cuda-runtime-cu12 nvidia-cudnn-cu12 -y >nul 2>&1
pip uninstall nvidia-cufft-cu12 nvidia-curand-cu12 nvidia-cusolver-cu12 -y >nul 2>&1
pip uninstall nvidia-cusparse-cu12 nvidia-nccl-cu12 nvidia-nvtx-cu12 -y >nul 2>&1
pip uninstall transformers tiktoken accelerate datasets tensorboard -y >nul 2>&1
pip uninstall jupyter notebook ipython jupyterlab -y >nul 2>&1

echo Clearing pip cache...
pip cache purge >nul 2>&1

echo.
echo Installing core packages...
pip install ipython
pip install jupyter notebook
pip install numpy

echo.
echo Checking for NVIDIA GPU...
nvidia-smi >nul 2>&1
if %errorlevel% == 0 (
    echo NVIDIA GPU detected. Installing PyTorch with CUDA 11.8 support...
    pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
) else (
    echo No NVIDIA GPU detected. Installing CPU-only PyTorch...
    pip install torch torchvision torchaudio
)

echo.
echo Installing additional packages...
pip install tiktoken
pip install transformers

echo.
echo Installation complete.
echo.
echo To start Jupyter Notebook:
echo 1. Open command prompt in your project folder
echo 2. Type: jupyter notebook
echo 3. Open the notebook file in your browser
echo.
pause
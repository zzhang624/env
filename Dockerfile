# Use a base image with Conda pre-installed
FROM continuumio/miniconda3

# Set the working directory in the container
WORKDIR /app

# Update Conda and install PyTorch and CUDA
RUN conda update -n base -c defaults conda && \
    conda install pytorch=1.13.0 pytorch-cuda=11.6 -c pytorch -c nvidia

# Install PyTorch Geometric and other dependencies
RUN pip install --no-cache-dir \
    torch-scatter==2.0.9 \
    torch-sparse==0.6.15 \
    torch-cluster \
    torch-spline-conv \
    torch-geometric -f https://data.pyg.org/whl/torch-1.13.0+cu116.html && \
    pip install numpy dill tqdm pyyaml pandas biopandas scikit-learn biopython e3nn wandb tensorboard tensorboardX matplotlib

# Additional Dockerfile commands here (COPY, CMD, etc.) as needed


# Refer to https://zero-to-jupyterhub.readthedocs.io/en/latest/user-environment.html#customize-an-existing-docker-image
# Get the latest image tag at:
#   https://hub.docker.com/r/jupyter/minimal-notebook/tags/
# Inspect the Dockerfile at:
#   https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook/Dockerfile
FROM jupyter/minimal-notebook:4cdbc9cdb7d1
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT
RUN pip install --no-cache-dir nbgitpuller
RUN pip install awscli \
    arcgis==v1.6.2-post1 \
    workalendar \
    envbash
RUN conda config --set channel_priority strict
RUN conda update -n base conda
RUN conda install --quiet --yes -n base -c conda-forge\
    notebook=6.0.0 \
    jupyterhub=1.0.0 \
    vim \
    nbconvert \
    nbformat \
    jupyterlab=1.1.2 \
	boto3=1.9.179 \
    geopandas=0.5.0 \
	descartes=1.1.0 \
	ipyleaflet \
	matplotlib=3.1.0 \
	plotly=4.1.0 \
	scikit-learn=0.21.2 \
	scipy=1.3.0 \
	s3fs \
    statsmodels \
	seaborn=0.9.0 \
	shapely=1.6.4
RUN conda clean -a -y && \
	fix-permissions $CONDA_DIR && \
	fix-permissions /home/$NB_USER
RUN conda install -n base -c plotly jupyterlab-dash
RUN conda install -n base -c plotly plotly_express
RUN conda clean -a -y && \
	fix-permissions $CONDA_DIR && \
	fix-permissions /home/$NB_USER
# not sure why conda is not setting this https://github.com/conda-forge/pyproj-feedstock/issues/29
ENV PROJ_LIB=/opt/conda/share/proj
RUN export PYTHONPATH=$PYTHONPATH:/home/jovyan/demos
# Enable Lab extensions

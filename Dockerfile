# Refer to https://zero-to-jupyterhub.readthedocs.io/en/latest/user-environment.html#customize-an-existing-docker-image
# Get the latest image tag at:
#   https://hub.docker.com/r/jupyter/minimal-notebook/tags/
# Inspect the Dockerfile at:
#   https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook/Dockerfile
FROM jupyter/minimal-notebook:4cdbc9cdb7d1
ARG GIT_COMMIT=unspecified
LABEL git_commit=$GIT_COMMIT

# Enable Lab extensions
RUN jupyter labextension install arcgis-map-ipywidget@v1.6.2-post1 
RUN pip install arcgis==v1.6.2-post1

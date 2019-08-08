FROM jupyter/minimal-notebook:177037d09156
# Get the latest image tag at:
# https://hub.docker.com/r/jupyter/minimal-notebook/tags/
# Inspect the Dockerfile at:
# https://github.com/jupyter/docker-stacks/tree/master/minimal-notebook/Dockerfile

# install additional package...
RUN pip install --no-cache-dir astropy
ENTRYPOINT ["tini", "-g", "--"]
CMD ["jupyter-labhub"]

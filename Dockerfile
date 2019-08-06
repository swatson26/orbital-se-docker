FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install --upgrade setuptools
RUN pip install fiona 
RUN pip install geopandas
RUN pip install rtree
RUN pip install shapely
RUN pip install pyshp
RUN pip install plotly
RUN pip install cufflinks
# Install this lab extension
jupyter labextension install @johnkit/jupyterlab_geojs
# Also need to install the widget-manager extension
jupyter labextension install @jupyter-widgets/jupyterlab-manager
# Install the python package
pip install jupyterlab_geojs

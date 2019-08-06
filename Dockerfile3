FROM jupyter/base-notebook:notebook-6.0.0

RUN pip install --upgrade setuptools
RUN pip install fiona 
RUN pip install geopandas
RUN pip install rtree
RUN pip install shapely
RUN pip install pyshp
RUN pip install plotly
RUN pip install cufflinks
RUN pip install s3fs
RUN conda install -c esri arcgis=1.6.2 
# RUN jupyter labextension install @jupyter-widgets/jupyterlab-manager
# RUN jupyter labextension install arcgis-map-ipywidget@1.6.2

FROM jupyter/minimal-notebook


ARG NOTEBOOK_USER=jovyan
ENV NOTEBOOK_PATH $HOME/notebooks
ENV CLOJUPYTER_PATH $HOME/clojupyter
ENV PORT 8888
ENV CLOJUPYTER_VERSION "0.2.2"
USER root
ENV LEIN_ROOT true
RUN apt update && apt install -y openjdk-11-jdk leiningen

USER $NOTEBOOK_USER

RUN mkdir -p $NOTEBOOK_PATH && \
    git clone https://github.com/clojupyter/clojupyter $CLOJUPYTER_PATH

WORKDIR $CLOJUPYTER_PATH
RUN git checkout $CLOJUPYTER_VERSION && make install

WORKDIR $NOTEBOOK_PATH
EXPOSE $PORT
VOLUME $NOTEBOOK_PATH
COPY notebooks/*.ipynb $NOTEBOOK_PATH/
USER root
RUN chown -R $NOTEBOOK_USER $NOTEBOOK_PATH
USER $NOTEBOOK_USER
CMD ["jupyter", "notebook", "--log-level=INFO"]

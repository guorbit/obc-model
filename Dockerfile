FROM ubuntu

ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -qq && apt-get install -qq \
    wget unzip libgtk-3-dev xvfb dbus-x11 && \
    rm -rf /var/lib/apt/lists/*

# This x11 stuff we apparently don't need:
#RUN apt-get install -qq x11vnc x11-xkb-utils xfonts-100dpi xfonts-75dpi xfonts-scalable xfonts-cyrillic x11-apps

ARG CAPELLA_VER=6.0.0
ARG CAPELLA_TAR=https://download.eclipse.org/capella/core/products/releases/6.0.0/capella-6.0.0.202209090800-linux-gtk-x86_64.tar.gz
ARG HTML_EX_ZIP=https://download.eclipse.org/capella/addons/xhtmldocgen/dropins/releases/6.0.0/CapellaXHTMLDocGen-dropins-6.0.0.202208241534.zip
ARG REQT_VP_ZIP=https://download.eclipse.org/capella/addons/requirements/dropins/releases/0.13.0/Requirements-dropins-0.13.0.202208241053.zip

# download and install Capella
WORKDIR /opt/capella-${CAPELLA_VER}
RUN wget -nv -c ${CAPELLA_TAR} -O capella.tar.gz
RUN tar -xzf capella.tar.gz && rm capella.tar.gz

# download and install the HTML Export drop-in
WORKDIR /opt/capella-${CAPELLA_VER}/capella/dropins
RUN wget -nv -c ${HTML_EX_ZIP} -O capella-html-export.zip
RUN unzip capella-html-export.zip && rm capella-html-export.zip

# download and install the Requirements VP drop-in
WORKDIR /opt/capella-${CAPELLA_VER}/capella/dropins
RUN wget -nv -c ${REQT_VP_ZIP} -O capella-requirements-vp.zip
RUN unzip capella-requirements-vp.zip && rm capella-requirements-vp.zip

ENV PATH="/opt/capella-${CAPELLA_VER}/capella/:${PATH}"

WORKDIR /workdir
ENTRYPOINT ["./entrypoint.sh"]


# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.192.0/containers/codespaces-linux/.devcontainer/base.Dockerfile

# there is a bug in the latest version 1.7.0 and can be tracked at https://github.com/microsoft/Oryx/issues/1199
# temporary solution is to use Java 8 in pom.xml 
FROM mcr.microsoft.com/vscode/devcontainers/universal:1-focal

# ** [Optional] Uncomment this section to install additional packages. **
USER root

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install --no-install-recommends python3.8-venv

RUN RELEASE=$(curl https://api.github.com/repos/k3d-io/k3d/releases/latest | jq -r .tag_name) \
  && curl -L "https://github.com/k3d-io/k3d/releases/download/${RELEASE}/k3d-linux-amd64" -o /usr/local/bin/k3d \
  && chmod +x /usr/local/bin/k3d

RUN RELEASE=$(curl https://api.github.com/repos/vmware-tanzu/octant/releases/latest | jq -r .tag_name[1:]) \
  && curl -LO "https://github.com/vmware-tanzu/octant/releases/download/v${RELEASE}/octant_${RELEASE}_Linux-64bit.tar.gz" \
  && tar xvf "octant_${RELEASE}_Linux-64bit.tar.gz" \
  && mv "./octant_${RELEASE}_Linux-64bit/octant" /usr/local/bin/octant

USER codespace

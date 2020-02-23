FROM node:13.8.0-alpine3.11
ENV KUBECTL_VER 1.15.9
ENV KUSTOMIZE_VER 3.2.1
ENV SKAFFOLD_VER 1.4.0

RUN apk --no-cache add curl gettext

RUN mkdir /working
WORKDIR /working

RUN curl -L https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VER}/bin/linux/amd64/kubectl -o /usr/bin/kubectl \
    && chmod +x /usr/bin/kubectl

RUN curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/v${KUSTOMIZE_VER}/kustomize_${KUSTOMIZE_VER}_linux_amd64  -o /usr/bin/kustomize \
    && chmod +x /usr/bin/kustomize

RUN curl -L https://storage.googleapis.com/skaffold/releases/v${SKAFFOLD_VER}/skaffold-linux-amd64 -o /usr/bin/skaffold \
    && chmod +x /usr/bin/skaffold

CMD ["/usr/bin/skaffold"]

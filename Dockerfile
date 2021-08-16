FROM maven2.it.volvo.net:18443/devtools/llvm-toolset-7-rhel7
MAINTAINER EDB Team <edb@volvo.com>
ENV HTTP_PROXY="http://pxgot5.srv.volvo.com:8080"
ENV HTTPS_PROXY="http://pxgot5.srv.volvo.com:8080"
USER root
RUN yum-config-manager --add-repo https://copr.fedorainfracloud.org/coprs/vbatts/bazel/repo/epel-7/vbatts-bazelepel-
7.repo
RUN yum -y install bazel4; yum clean all
COPY application/ /volvo/edb/dev/
RUN chgrp -Rf root /volvo/edb/dev && chmod -Rf g+w /volvo/edb/dev && chmod +x /volvo/edb/dev/app/go.sh
WORKDIR /volvo/edb/dev
ENTRYPOINT [ "/volvo/edb/dev/app/go.sh" ]

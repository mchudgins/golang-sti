# springboot-sti
FROM library/golang:1.6
MAINTAINER Mike Hudgins <mchudgins@yahoo.com>

ENV GO_VERSION 1.6

ENV PATH=/opt/maven/bin/:/opt/gradle/bin/:$PATH


ENV BUILDER_VERSION 1.0

LABEL io.k8s.description="Platform for building golang applications" \
      io.k8s.display-name="Go builder 1.0" \
      io.openshift.expose-services="8080:http" \
      io.openshift.tags="builder,golang"

# TODO (optional): Copy the builder files into /opt/openshift
# COPY ./<builder_folder>/ /opt/openshift/
# COPY Additional files,configurations that we want to ship by default, like a default setting.xml

LABEL io.openshift.s2i.scripts-url=image:///usr/local/sti
COPY ./.sti/bin/ /usr/local/sti

RUN chown -R 1001:1001 /opt/openshift

# This default user is created in the openshift/base-centos7 image
USER 1001

# Set the default port for applications built using this image
EXPOSE 8080

# Set the default CMD for the image
# CMD ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/opt/openshift/app.jar"]
CMD ["usage"]

FROM tomcat:8.0-alpine

LABEL maintainer="earl.waud@gmail.com"

RUN apk update && \
	apk upgrade && \
	apk --no-cache add tar curl tini && \
	apk --no-cache add --virtual wget unzip ca-certificates

#	apk --no-cache add --virtual devs gcc make python wget unzip ca-certificates
#  	apk del devs gcc make python wget unzip ca-certificates && \
#	npm cache clean && \
#	rm -rf /tmp/npm*

WORKDIR /usr/local/tomcat/webapps

RUN wget --no-check-certificate -O master.zip https://codeload.github.com/EarlWaud/html_demos/zip/master
RUN unzip ./master.zip -d ./
RUN mv ./html_demos-master ./myapp
RUN rm master.zip

WORKDIR /usr/local/tomcat/webapps/myapp
EXPOSE 8080

CMD ["catalina.sh", "run"]

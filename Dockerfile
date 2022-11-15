FROM alpine:3.16
RUN apk --no-cache add curl ca-certificates bash
# $(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)
RUN curl -Lo /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/v1.23.10/bin/linux/amd64/kubectl
RUN chmod +x /usr/local/bin/kubectl
COPY update.sh /bin/
ENTRYPOINT ["/bin/bash"]
CMD ["/bin/update.sh"]

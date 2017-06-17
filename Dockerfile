FROM golang

ADD . /go/src/kubelab.com/john/kube-runner

WORKDIR /go/src/kubelab.com/john/kube-runner

RUN go get -v &&\
    go install kubelab.com/john/kube-runner

ENTRYPOINT /go/bin/kube-runner

EXPOSE 8080


build:
	@docker build -t kube-runner .
.PHONY: build

run:
	@docker run -d -p 8080:8080 --name kube-runner kube-runner:latest
.PHONY: run

deploy-runners:
	@kubectl --namespace gitlab delete configmap gitlab-runner
	@kubectl --namespace gitlab delete deployment gitlab-runner
	@kubectl create -f runner-configmap.yaml
	@kubectl create -f runner-deploment.yaml
.PHONY: update-config

helm-install:
	@helm install --name gitlab-runner -f runner-values.yaml gitlab/gitlab-runner
.PHONY: helm-install

helm-upgrade:
	@helm upgrade -f runner-values.yaml gitlab-runner gitlab/gitlab-runner
.PHONY: helm-install

helm-delete:
	@helm delete gitlab-runner --purge
.PHONY: helm-delete

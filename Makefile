IMAGE     := myersc6535/hunter-portfolio
HELM_FILE := helm/hunter/values.yaml

.PHONY: build push update-helm release deploy

guard-TAG:
	@[ -n "$(TAG)" ] || (echo "Error: TAG is required -- usage: make <target> TAG=0.1.0" && exit 1)

build: guard-TAG
	docker build -t $(IMAGE):$(TAG) --platform=linux/amd64 .

push: guard-TAG
	docker push $(IMAGE):$(TAG)

update-helm: guard-TAG
	sed -i '' 's/  tag: .*/  tag: "$(TAG)"/' $(HELM_FILE)
	@echo "Updated $(HELM_FILE) to tag: $(TAG)"

release: build push update-helm
	@echo "Released $(IMAGE):$(TAG) and updated helm values"

deploy:
	cd ../homelab && helmfile sync -l name=hunter-portfolio

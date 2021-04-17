
# VARIABLES
IMAGE_NAME = bygui86/gcloud-sdk
CONTAINER_NAME = gcloud-sdk


# CONFIG
.PHONY: help print-variables
.DEFAULT_GOAL = help


# ACTIONS

## cointaier

__check-container-tag :
	@[ "$(CONTAINER_TAG)" ] || ( echo "Missing container tag (CONTAINER_TAG), please define it and retry"; exit 1 )

container-build : __check-container-tag		## Build container
	docker build . -t $(IMAGE_NAME):$(CONTAINER_TAG)

container-push : __check-container-tag		## Push container to container registry
	docker push $(IMAGE_NAME):$(CONTAINER_TAG)

container-run : __check-container-tag		## Run container
	docker run -d --rm --name $(CONTAINER_NAME) $(IMAGE_NAME):$(CONTAINER_TAG)

container-exec :		## Open bash in container
	docker exec -ti $(CONTAINER_NAME) bash

container-stop :		## Stop container
	docker container stop $(CONTAINER_NAME)


## helpers

help :		## Help
	@echo ""
	@echo "*** \033[33mMakefile help\033[0m ***"
	@echo ""
	@echo "Targets list:"
	@grep -E '^[a-zA-Z_-]+ :.*?## .*$$' $(MAKEFILE_LIST) | sort -k 1,1 | awk 'BEGIN {FS = ":.*?## "}; {printf "\t\033[36m%-30s\033[0m %s\n", $$1, $$2}'
	@echo ""

print-variables :		## Print variables values
	@echo ""
	@echo "*** \033[33mMakefile variables\033[0m ***"
	@echo ""
	@echo "- - - makefile - - -"
	@echo "MAKE: $(MAKE)"
	@echo "MAKEFILES: $(MAKEFILES)"
	@echo "MAKEFILE_LIST: $(MAKEFILE_LIST)"
	@echo "- - -"
	@echo ""

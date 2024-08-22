# version from poetry
VERSION = $(shell poetry version -s)
# used by release-drafter
TAG_PREFIX = testing-release-drafter/v
ENV ?= development

ifeq ($(ENV), production)
DOCKER_IMAGE_TAG ?= ${ENV}_v${VERSION}
else
DOCKER_IMAGE_TAG ?= $(shell echo ${ENV}_v${VERSION}-$$(git log -1 --pretty=format:"%ct" --date=short)_$$(git log -1 --pretty=format:"%h" --abbrev=8))
endif


version:
	@echo ${TAG_PREFIX}${VERSION}

tag_prefix:
	@echo ${TAG_PREFIX}

# use with ENV=production make docker_image_tag for prod images, or ENV=staging
docker_image_tag:
	@echo ${DOCKER_IMAGE_TAG}

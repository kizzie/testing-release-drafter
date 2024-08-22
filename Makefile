VERSION=$(shell poetry version -s)
TAG_PREFIX=testing-release-drafter/

version:
	@echo ${TAG_PREFIX}${VERSION}

tag_prefix:
	@echo ${TAG_PREFIX}

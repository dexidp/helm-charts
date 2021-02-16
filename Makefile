HELM_DOCS_VERSION = 1.5.0

bin/helm-docs: bin/helm-docs-${HELM_DOCS_VERSION}
	@ln -sf helm-docs-${HELM_DOCS_VERSION} bin/helm-docs
bin/helm-docs-${HELM_DOCS_VERSION}:
	@mkdir -p bin
	curl -L https://github.com/norwoodj/helm-docs/releases/download/v${HELM_DOCS_VERSION}/helm-docs_${HELM_DOCS_VERSION}_$(shell uname)_x86_64.tar.gz | tar -zOxf - helm-docs > ./bin/helm-docs-${HELM_DOCS_VERSION} && chmod +x ./bin/helm-docs-${HELM_DOCS_VERSION}

.PHONY: docs
docs: bin/helm-docs
	bin/helm-docs -s file -c charts/ -t ../docs/templates/overrides.gotmpl -t README.md.gotmpl

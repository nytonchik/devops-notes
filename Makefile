.PHONY: deploy

# TAG по умолчанию — latest, можно переопределить: make deploy TAG=sha-7317f84
TAG ?= latest
IMAGE = nyton/echo:$(TAG)
NS    = echo-review
DEP   = echo-review

deploy:
    @echo "🔄 Обновляем Deployment '$(DEP)' в Namespace '$(NS)' на образ $(IMAGE)"
    kubectl set image deployment/$(DEP) echo=$(IMAGE) -n $(NS)
    @echo "⏳ Ждём, пока новый Pod станет Ready…"
    kubectl rollout status deployment/$(DEP) -n $(NS)

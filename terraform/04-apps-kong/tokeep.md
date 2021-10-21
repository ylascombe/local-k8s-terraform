kubectl create configmap kong-spec-expose --from-file=kong-spec-expose/src/ -n ingress-kong --dry-run -oyaml > config-map-kong-spec-expose.yaml

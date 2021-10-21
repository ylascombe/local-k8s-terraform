
# How to build Kong Plugin Config Map

```sh
git clone git@github.com:Optum/kong-spec-expose.git
kubectl create configmap kong-spec-expose --from-file=kong-spec-expose/src/ -n ingress-kong --dry-run -oyaml > config-map-kong-spec-expose.yaml
```

# Example usage

```yaml
apiVersion: configuration.konghq.com/v1
kind: KongPlugin
metadata:
  name: kong-spec-expose
config:
  spec_url: https://github.com/OAI/OpenAPI-Specification/blob/master/examples/v2.0/json/petstore.json
plugin: kong-spec-expose
```


kubectl create namespace crapi
kubectl create secret generic impart-demo-inspector-token --from-file=accessToken=./accessToken.secret -n crapi
helm repo add impart https://helm.impartsecurity.net
helm repo update
helm install --namespace crapi impart impart/sidecar-injector --set inspector.auth.accessToken==impart-demo-inspector-token --set inspector.version=="0.13.0"
helm install --namespace crapi crapi . --values values.yaml

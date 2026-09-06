# MicroK8s Kafka + OpenTelemetry + Prometheus + Grafana + Alertmanager

Apply the manifests with:

```bash
kubectl create ns kafka
kubectl create ns monitoring
kubectl apply -f kafka/
kubectl apply -f otel/
kubectl apply -f prometheus/
kubectl apply -f grafana/
```

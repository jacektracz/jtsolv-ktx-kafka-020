provider "kubernetes" {
  config_path = "~/.kube/config"
}

resource "kubernetes_namespace" "observability" {
  metadata {
    name = "observability"
  }
}

resource "kubernetes_manifest" "kafka" {
  manifest = yamldecode(file("${path.module}/k8s/kafka-kraft.yaml"))
}

resource "kubernetes_manifest" "otel_collector" {
  manifest = yamldecode(file("${path.module}/k8s/otel-collector.yaml"))
}

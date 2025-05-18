terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "~> 2.0"
    }
  }
}

provider "kubernetes" {
  config_path    = "/home/nyton/.kube/config" # абсолютный путь до kubeconfig
  config_context = "minikube"                 # имя контекста для Minikube
}

resource "kubernetes_namespace" "echo_dev" {
  metadata { name = "echo-dev" }
}

resource "kubernetes_deployment" "echo_api" {
  metadata {
    name      = "echo-api"
    namespace = "echo-dev"
    labels    = { app = "echo-api" }
  }
  spec {
    replicas = 1
    selector {
      match_labels = { app = "echo-api" }
    }
    template {
      metadata { labels = { app = "echo-api" } }
      spec {
        container {
          name  = "echo-api"
          image = "echo:0.6"
          port {
            container_port = 5000
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "echo_svc" {
  metadata {
    name      = "echo-svc"
    namespace = "echo-dev"
    labels    = { app = "echo-api" }
  }
  spec {
    selector = { app = "echo-api" }
    port {
      port        = 5000
      target_port = 5000
    }
    type = "ClusterIP"
  }
}


local image = import '../utils/utils.libsonnet';

{
  components: {
    ingressNginx: {
      namespace: "dev",
      values: {
        fullnameOverride: "dev",
        controller: {
          podLabels: {
            "app/version": "0.0.0"
          },
          image: {
            registry: "k8s.gcr.io",
            image: "ingress-nginx/controller",
            tag: "v1.1.1"
          },
          resources: {
            limits: {
              cpu: "100m",
              memory: "90Mi"
            },
            requests: {
              cpu: "100m",
              memory: "90Mi"
            }
          },
          containerName: "controller",
          hostNetwork: false,
        }
      }
    }
  },
}

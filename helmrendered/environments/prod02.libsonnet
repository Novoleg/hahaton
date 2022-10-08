local base = import '_.libsonnet';

base {
  components+: {
    ingressNginx+:{
      values+: {
        fullnameOverride: "prod02",
        controller+: {
          podLabels+: {
            "app/version": "0.0.3"
          },
          image+: {
            tag: "v1.1.3",
            digest: "sha256:31f47c1e202b39fadecf822a9b76370bd4baed199a005b3e7d4d1455f4fd3fe2"
          },
          resources+:{
            limits+:{
              cpu: "110m",
              memory: "100Mi"
            },
          requests+:{
            cpu: "110m",
            memory: "100Mi"
            }
          },
          containerName: "controller-prod02",
        }
      }
    }
  },
}


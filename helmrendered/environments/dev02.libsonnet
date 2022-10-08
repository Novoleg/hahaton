local base = import '_.libsonnet';

base {
  components+: {
    ingressNginx+:{
      values+: {
        fullnameOverride: "dev02",
        controller+: {
          podLabels+: {
            "app/version": "0.0.2"
          },
          image+: {
            tag: "v1.1.3",
            digest: "sha256:31f47c1e202b39fadecf822a9b76370bd4baed199a005b3e7d4d1455f4fd3fe2"
          },
          containerName: "controller-dev02",
        }
      }
    }
  },
}
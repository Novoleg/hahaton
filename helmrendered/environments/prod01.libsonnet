local base = import '_.libsonnet';

base {
  components+: {
    ingressNginx+:{
      values+: {
        fullnameOverride: "prod01",
        controller+: {
          podLabels+: {
            "app/version": "0.0.4"
          },
          image+: {
            tag: "v1.1.2",
            digest: "sha256:28b11ce69e57843de44e3db6413e98d09de0f6688e33d4bd384002a44f78405c"
          },
          containerName: "controller-prod01",
        }
      }
    }
  },
}

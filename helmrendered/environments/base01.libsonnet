local base = import 'base.libsonnet';


base {
  components+: {
    novolegStateless+:{
      values+: {
        controller+: {
          name: "controller-base01",
          image+: {
            registry: "k8s.gcr.io",
            image: "ingress-nginx/controller",
            tag: "v1.1.3"
          }
        }
      }
    }
  },
}

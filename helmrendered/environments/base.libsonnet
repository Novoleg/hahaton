{
  components: {
    novolegStateless: {
      values: {
        controller: {
          name: "controller",
          image: {
            registry: "k8s.gcr.io",
            image: "ingress-nginx/controller",
            tag: "v1.1.2"
          }
        }
      }
    }
  },
}

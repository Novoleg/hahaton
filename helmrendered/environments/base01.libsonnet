local base = import 'base.libsonnet';


base {
  components+: {
    novolegStateless+:{
      values+: {
        controller+: {
          name: "controller-base01",
          image+: {
            tag: "v1.1.3"
          }
        }
      }
    }
  },
}

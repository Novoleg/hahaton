local utils = import '../utils/utils.libsonnet';

{
  components: {
    novolegStateless: {
      values: {
        deployments: [{
          name: "dep-default",
          replicaCount: 1,
          containers: [
            utils.container("test01","nginx","1.23")
          ],
        },]
      }
    },
  },
}
local utils = import '../utils/utils.libsonnet';

{
  components: {
    novolegStateless: {
      values: {
        deployments: {
          name: "dep-base",
          replicaCount: 1,
          containers: [
            utils.container("test01","nginx","1.23")
          ],
        },
        services: [{
          name: "dep-base",
          type: "ClusterIP",
          port: 80,
          targetPort: 8080,
          }],
        ingress: {
          enabled: true,
        }
      }
    },
  },
}


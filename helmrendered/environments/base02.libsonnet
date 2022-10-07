local utils = import '../utils/utils.libsonnet';

{
  components: {
    novolegStateless: {
      values: {
        fullnameOverride: "dep-base",
        deployments: {
          replicaCount: 1,
          containers: [
            utils.container("test01","nginx","1.23")
          ],
        },
        service: {
          type: "ClusterIP",
          port: 80,
          targetPort: 80,
          },
        ingress: {
          enabled: true,
          hosts: [{
            host: "base.hahaton.com",
            paths: [{
              path: "/",
              pathType: "ImplementationSpecific"
            }]
          }]
        }
      }
    },
  },
}


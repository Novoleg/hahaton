local appV = std.extVar('appVersion');
local base = import '_.libsonnet';


// define parameters per environment
local paramsByAppVersion = {

    v1: base {
        components+: {
          ingressNginx+:{
            values+: {
              fullnameOverride: "dev01",
              controller+: {
                podLabels+: {
                  "app/version": "0.0.1"
                },
                image+: {
                  tag: "v1.1.2",
                  digest: "sha256:28b11ce69e57843de44e3db6413e98d09de0f6688e33d4bd384002a44f78405c"
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
                containerName: "controller-dev01",
          }
        }
      }
    },
  },
    v2: base {
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
};

// return value for correct environment
if std.objectHas(paramsByAppVersion, appV) then paramsByAppVersion[appV]
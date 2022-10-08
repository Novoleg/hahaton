
local p = import '../params.libsonnet';

local chart = importstr 'data://ingress-nginx/Users/novoleg/git/novoleg/novoleg-devops/hackatons/hahaton/vendor/ingress-nginx';
std.native('parseYaml')(chart)
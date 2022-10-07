
local p = import '../params.libsonnet';
local params = p.components.novolegStateless;

local chart = importstr 'data://novoleg-stateless/Users/novoleg/git/novoleg/novoleg-devops/hackatons/hahaton/vendor/ingress-nginx';
std.native('parseYaml')(chart)
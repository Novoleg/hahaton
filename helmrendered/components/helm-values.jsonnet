
local p = import '../params.libsonnet';
local params = p.components.novolegStateless;

local chart = importstr 'data://novoleg-stateless/Users/novoleg/git/novoleg/novoleg-devops/hahaton/vendor';
std.native('parseYaml')(chart)
# QBEC

## TL;DR

Qbec - отвратительный инструмент для шаблонизации манифестов/values.yaml чартов, под капотом использует ```jsonnet```

Его убогость заключается в:

- отвратительной документации;
- нету примеров для шаблонизации ```values.yaml```. Есть только парочка примеров: [пример1](https://gist.github.com/Andor/34accb711dbfd531f0982d11019015da)[пример2](https://github.com/splunk/qbec/pull/217#issuecomment-816014153);
- он просто сам по себе убогий, не понимаю зачем его юзать в 2к22 году, просто, кринж🫠

## Параметризация values.yaml

Имеем такой ```qbec.yaml``` файл:

```yaml
apiVersion: qbec.io/v1alpha1
kind: App
metadata:
  name: <your_name>
spec:
  environments:
    base:
      defaultNamespace: test
      server: https://<kube_api_address>
  vars:
    computed:
      - name: <name>
        code: |
          {
            local p = (import './params.libsonnet').components.novolegStateless,
            command: 'sh',
            args: [
              '-c',
              ('/opt/homebrew/bin/helm template "${__DS_NAME__}" "${__DS_PATH__}" -n test -f-')
            ],
            stdin: std.manifestJson(p.values),
          }
  dataSources:
    - exec://novoleg-stateless?configVar=novolegStateless
```

Вся соль в:

```yaml
vars:
  computed:
    - name: <name>
      code: |
        {
          local p = (import './params.libsonnet').components.novolegStateless,
          command: 'sh',
          args: [
            '-c',
            ('/opt/homebrew/bin/helm template "${__DS_NAME__}" "${__DS_PATH__}" -n test -f-')
          ],
          stdin: std.manifestJson(p.values),
        }
dataSources:
  - exec://novoleg-stateless?configVar=novolegStateless
```

Тут используется ```exec``` метод вызова ```helm```, т.е. ```qbec``` ТУПА экзекает бинарь ```helm``` и передает туда ключи. В моем случае я был вынужден указывать полный путь до бинаря, потому что если указать относительный, то у меня появлялась ошибка...

В данном примере параметризация получается за счет того, что хельму на вход передается поток ввода ```stdin```, а в нем содержится отрендеренный файл ```values.yaml``` в формате ```json```

## command

```bash
# показывает как будет срендерено (конкретно для значения v2)
qbec show dev --vm:ext-str appVersion=v2

# деплой в кластер
qbec apply dev --vm:ext-str appVersion=v2

# показывает diff 
qbec diff dev --vm:ext-str appVersion=v2
```
можно менять appVersion на v1

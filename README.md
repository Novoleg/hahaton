# Хакатон

## command

```bash
# показывает как будет срендерено (конкретно для значения v2)
qbec show dev --vm:ext-str appVersion=v2 --app-tag v2

# деплой в кластер
qbec apply dev --vm:ext-str appVersion=v2 --app-tag v2

# показывает diff 
qbec diff dev --vm:ext-str appVersion=v2 --app-tag v2
```

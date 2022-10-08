# Чарт для деплоя stateless приложения

## TL;DR

Чарт является сборной солянкой нескольких чартов:
- дефолтный чарт, создающийся helm
- чарт моих коллег с РСХБ
- чарт для ЕВРАЗа

## Функционал

* можно создавать deployment с несколькими контейнерами и инит контейнерами;
* возможность выставления ресурсов;
* возможность включения liveness и readiness probe. Пробы ходят на uri /health;
* добавил создание переменных окружения в контейнерах (в initContainers пока нет такого функционала) через secrets и configmap.

## TODO
* сделать, чтобы можно было создавать несколько deployment;
* сделать создание переменных окружения в initContainers;
* подумать как сделать создание ConfigMap и Secret более элегантно, на данный момент для каждого контейнера создаются свои ConfigMap и Secret;
* сделать создание различных volume.
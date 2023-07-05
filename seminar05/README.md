# Урок 5. Основы компьютерных сетей. Транспортный уровень. UDP и TCP.

## В приложенном файле “The Ultimate PCAP.pcap” (из раздаточного материала) найти e-mail.

![filter-mail](./img/filter-mail.png)

Что внутри письма и для кого оно?

![e-mail](./img/e-mail.png)

Внутри письма много раз повторяется строка символов

```
AABBCCDDEEFFGGHHIIJJKKLLMMNNOOPPQQRRSSTTUUVVWWXXYYZZ00112233445566778899
```

Письмо для адресата **<johannes@webertest.net>**

См. файл письма [SMTP_Ping.eml](./SMTP_Ping.eml)

## Запустите трейс до 8.8.8.8.

И перехватите его в Wireshark. Проанализируйте.

## Найдите еще один сайт без шифрования с возможностью ввода логина/пароля.

(можно в гугл настроить соответствующую выдачу по запросу с ключом “-inurl:https” в конце).

**http://wm-site.ru/login/**

Перехватите их в Wiresharke, построив фильтр.

Сначала в Wiresharke надо включить захват, кнопка с плавником "Start capturing packets".
Затем выполнить действия в браузере.
После этого в Wiresharke можно отфильтровать http POST-запросы

```
http.request.method == POST
```

БЕЗ кавычек!!! на MacOS m2

![http-no-secure](./img/http-passwd.png)

## На сайте https://launchpad.net/ubuntu/+archivemirrors

представлены зеркала с образами Убунту по странам. Скачайте файл ls-lR.gz из Чили и с Яндекса. Снимите два дампа для каждого скачивания. Проанализируйте скорость скачивания и посмотрите tcptrace. Прикиньте средний RTT и поищите максимальный RWND для скачивающего.
Предоставить скриншоты графиков скорости и tcptrace. Есть ли разница? В чем она?
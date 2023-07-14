# Урок 7. NAT. GRE.

## Условие:

Настроить сеть согласно схеме в файле
https://disk.yandex.ru/d/hegGC7woXSjz0g где:
Office 1 - cеть 10.1.1.0/24
Office 2 - cеть 10.0.0.0/16
Office 3 - cеть 172.16.0.0/16
Office 4 - cеть 192.168.145.0/24
Где “Интернет” - там имитация Интернета с помощью OSPF, выберите сами публичные сети между роутерами.

## Задача 1. Настроить на Port Forwarding на сервера в Office 2.

Server0 должен предоставлять HTTP по 80му порту, а Server1 должен предоставлять HTTPS по 443 порту. Странички должны быть разные.

## Задача 2. Настроить PAT в Office 3 для компьютеров,

чтобы они выходили в интернет под одним публичным IP адресом на Router1.

Предоставить скриншот открытых страниц по HTTP и HTTPS по публичному адресу Router3 в веб-браузере клиентов Office3 (с РС1 и РС0)

После чего предоставить вывод show ip nat translation c Router1.

## Задача 3. Связать сети Office 1 и Office 4 с помощью GRE.

Предоставит трейс с Laptop0 до Server2.

## Задача 4. Доделать OpenVPN (или Wireguard) если не успели.

Предоставить скриншот публичного IP до и после подключения через VPN + скриншот вывода команды ip addr.

Вывод **ifconfig** с терминала компьютера

Видим две строчки **inet**

настоящий приватный IP в локалке **192.168.3.239**

и тунельный **172.27.232.10**

```bash
➜  ~
➜  ~ ifconfig -a | grep inet
	inet 127.0.0.1 netmask 0xff000000
	inet6 ::1 prefixlen 128
	inet6 fe80::1%lo0 prefixlen 64 scopeid 0x1
	inet6 fe80::2c56:57ff:fe44:1458%anpi0 prefixlen 64 scopeid 0x4
	inet6 fe80::2c56:57ff:fe44:1459%anpi1 prefixlen 64 scopeid 0x5
	inet6 fe80::a88f:d9ff:fe43:2cc4%ap1 prefixlen 64 scopeid 0xa
	inet6 fe80::18be:2c4c:1a68:929%en0 prefixlen 64 secured scopeid 0xb
	inet 192.168.3.239 netmask 0xfffffc00 broadcast 192.168.3.255
	inet6 fe80::9870:3bff:fed7:2f01%awdl0 prefixlen 64 scopeid 0xc
	inet6 fe80::9870:3bff:fed7:2f01%llw0 prefixlen 64 scopeid 0xd
	inet6 fe80::ca78:e150:75b5:3b52%utun0 prefixlen 64 scopeid 0xf
	inet6 fe80::a29f:fd09:5cf5:2e99%utun1 prefixlen 64 scopeid 0x10
	inet6 fe80::ce81:b1c:bd2c:69e%utun2 prefixlen 64 scopeid 0x11
	inet 172.27.232.10 --> 172.27.232.1 netmask 0xfffff800
➜  ~
```

Вывод по ssh с сервера, где крутится OpenVPN

Видим интерфейс **as0t1** с нашим gateway **172.27.232.1**

и интерфейс **eth0** с настоящим голландским IP **89.19.215.64**

```bash
root@1728999-cs05976:~#
root@1728999-cs05976:~# ifconfig
as0t0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 172.27.224.1  netmask 255.255.248.0  destination 172.27.224.1
        inet6 fe80::2d0c:9b35:65f0:d983  prefixlen 64  scopeid 0x20<link>
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 200  (UNSPEC)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 76  bytes 3648 (3.6 KB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

as0t1: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 172.27.232.1  netmask 255.255.248.0  destination 172.27.232.1
        inet6 fe80::c4dc:949:c2b8:a558  prefixlen 64  scopeid 0x20<link>
        unspec 00-00-00-00-00-00-00-00-00-00-00-00-00-00-00-00  txqueuelen 200  (UNSPEC)
        RX packets 206020  bytes 24423460 (24.4 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 861783  bytes 1052321048 (1.0 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

eth0: flags=4163<UP,BROADCAST,RUNNING,MULTICAST>  mtu 1500
        inet 89.19.215.64  netmask 255.255.255.0  broadcast 89.19.215.255
        inet6 fe80::e016:deff:fe9f:cd43  prefixlen 64  scopeid 0x20<link>
        ether e2:16:de:9f:cd:43  txqueuelen 1000  (Ethernet)
        RX packets 1772874  bytes 1674316845 (1.6 GB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 1936346  bytes 1241052484 (1.2 GB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1000  (Local Loopback)
        RX packets 14038  bytes 2033172 (2.0 MB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 14038  bytes 2033172 (2.0 MB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

root@1728999-cs05976:~#
```

Скрин с сайта **https://2ip.ru/** без включенного VPN

![Moscow](./img/Moscow.png)

Включили VPN

![OpenVPN_connect](./img/OpenVPN_connect.png)

Скрин с сайта **https://2ip.ru/**

![Amsterdam](./img/Amsterdam.png)

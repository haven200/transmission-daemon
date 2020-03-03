# Minimal Docker Image of Transmission-daemon

Added Transmisison-Daemon program to the alpine image. The size of final image is about 10.2MB.

# Instructions

Only tested under x86 / x64, the arm architecture is unknown.

## 1. Clone The Repo

```sh
git clone https://github.com/haven200/transmission-daemon.git transmission-daemon
```
## 2. Compile

```sh
cd transmission-daemon && docker build -t haven200/transmission-daemon .
```

## 3. Run docker
```sh
docker run -d --name transmission-daemon \
       -p 12345:12345/tcp \
       -p 12345:12345/udp \
       -p 80:80 \
       -v /mnt/bt:/mnt/bt/kodi \
       haven200/transmission-daemon
```
- \-p：Open the port to other computers for access.
- \-v：Map the download folder of trasnsmission-daemon to the host `/mnt/bt/` directory , so that the downloaded files are saved directly on the host instead of in the image.

If the host IP where the image is located is `192.168.1.2`, then we can use browser to open WebPage ` http: // 192.168.1.2` 

**The default** login user name is `Transmission` and the password is `password`.

## 4. Login Docker

```sh
docker exec -it transmission-daemon /bin/sh
```

## 5. Configure web management page username and password

```sh
docker run -d --name transmission-daemon \
       -p 12345:12345/tcp \
       -p 12345:12345/udp \
       -p 80:8080 \
       -v /mnt/bt:/mnt/bt/kodi \
       --env USERNAME=myname \
       --env PASSWORD=mypassword \
       haven200/transmission-daemon
```
- `USERNAME` Variable is the username of the login
- `PASSWORD` Variable is the password for login

# Transmission-Daemon 的最小Docker镜像

在 alpine 镜像的基础上添加了Transmisison-Daemon程序。最终镜像大小为10.2MB左右。

# 使用方法

只在 x86/x64 下进行过测试，arm架构未知。

## 1. 首先下载文件

```sh
git clone https://github.com/haven200/transmission-daemon.git transmission-daemon
```

## 2. 编译镜像

```sh
cd transmission-daemon && docker build -t haven200/transmission-daemon .
```

## 3. 运行镜像
```sh
docker run -d --name transmission-daemon \
       -p 12345:12345/tcp \
       -p 12345:12345/udp \
       -p 80:80 \
       -v /mnt/bt:/mnt/bt/kodi \
       haven200/transmission-daemon
```
- \-p：把transmission-daemon的端口对外打开，以供其它计算机访问。
- \-v：将trasnsmission-daemon 的下载文件夹映射至主机`/mnt/bt/`目录，这样下载的文件直接保存在主机上而非镜像中。

假如镜像所在主机的 IP 为 `192.168.1.2`，那么我们用浏览器打开`http://192.168.1.2`即可登 transmission-daemon 的录管理页面。
默认登录用户名为 `Transmission`，密码为 `password`。

## 4. 进入镜像
```sh
docker exec -it transmission-daemon /bin/sh
```

## 5. 配置 Web 管理页面用户名及密码
```sh
docker run -d --name transmission-daemon \
       -p 12345:12345/tcp \
       -p 12345:12345/udp \
       -p 80:8080 \
       -v /mnt/bt:/mnt/bt/kodi \
       --env USERNAME=myname \
       --env PASSWORD=mypassword \
       haven200/transmission-daemon
```
- `USERNAME` 变量为登录的用户名
- `PASSWORD` 变量为登录的密码

#### 简介
gitblog的docker build项目
在dockerxman/docker-gitblog的Dockerfile基础进行了修改，取消blog文件夹的卷共享，改成由宿主机选择直接mount网站根目录。

#### docker-compose配置

```
version: '3.1'

services:

  gitblog:
    image: b1b2b3b4b5b6/gitblog
    restart: always
    ports:
      - 80:80
    volumes:
      - /home/blog/vhost:/www/gitblog-master
```

- /home/blog/vhost：宿主机上的gitblog根目录，自行修改
- /www/gitblog-master：容器内gitblog要挂载到的目录，不修改

#### 简介
[GitBlog](https://github.com/jockchou/gitblog.git)是一个简单易用的Markdown博客系统，它不需要数据库，没有管理后台功能，更新博客只需要添加你写好的Markdown文件即可。它摆脱了在线编辑器排版困难，无法实时预览的缺点，一切都交给Markdown来完成，一篇博客就是一个Markdown文件。同时也支持评论，代码高亮，数学公式，页面PV统计等常用功能。GitBlog提供了不同的主题样式，你可以根据自己的喜好配置，如果你想自己制作博客主题，也是非常容易的。GitBlog还支持整站静态导出，你完全可以导出整站静态网页部署到Github Pages。


#### 改动
此项目为gitblog的docker build项目
在[dockerxman/docker-gitblog](https://hub.docker.com/r/dockerxman/docker-gitblog)的Dockerfile基础上进行了修改，取消blog文件夹的卷共享，改成由宿主机选择直接mount网站根目录。

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

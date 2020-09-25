# ubuntu install samba
```
/************************ (C) COPYLEFT 2018 Merafour *************************
* File Name          : README.md
* Author             : Merafour
* Last Modified Date : September 25, 2020
* Description        : ubuntu samba 服务器搭建.
********************************************************************************
* https://merafour.blog.163.com
* merafour@163.com
* https://github.com/merafour
******************************************************************************/
```

1、安装samba
============
使用下面的命令安装samba软件包：
~~~
sudo apt-get install samba samba-common
~~~
2、创建共享目录
------------
~~~
cd ~
mkdir share
~~~
有些人会在这里修改权限，但其实 share 在用户的主目录，仅供用户自己使用，所以不必修改权限。

3、添加用户
------------
~~~
sudo smbpasswd -a ocean
~~~
我这里ocean为home目录下已经存在的用户。
4、配置samba
------------
配置文件为：/etc/samba/smb.conf，注意使用超级用户权限编辑。
~~~
[share]
   comment=This is samba dir
   path=/home/ocean/share
   create mask=0755
   directory mask=0755
   writeable=yes
   valid users=ocean
   browseable=yes
~~~
这里制定有效用户为 ocean ，即只有 ocean可以访问共享目录share，而share又存在于ocean的主目录下，因此在smb中配置为可读可写就不存在权限问题。
而且从window中操作就会像在本地操作一样所有的权限都是ocean这个用户的。

5、重启samba服务器
------------
~~~
sudo /etc/init.d/samba-ad-dc restart
~~~
我用的是 18.4系统，samba装完之后名字叫做 "samba-ad-dc"，所以命令中使用的是samba-ad-dc。

6、windows下访问共享目录：
============
window下访问samba共享目录使用快捷键“Win+R”然后输入"\\192.168.56.101"即可看到共享目录，192.168.56.101为Ubuntu主机IP。
然后双击输入用户名和密码即可访问。
最后可以在双击访问共享目录的时候右键映射网络驱动，这样以后就跟访问本地磁盘一样了。 
参考:
[ubuntu下Samba服务器的搭建](https://blog.csdn.net/u012478275/article/details/78876181)



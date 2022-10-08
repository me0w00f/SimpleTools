# SimpleTools
一些简单的小脚本



# `AttackWebForm.py`

用来爆破四位数字密码的 GET 表单。

# `g4pass.py` 、 `g5pass.py` 、 `g6pass.py`

生成纯数字密码。


# `base64deocde.py`

base64 字符串解码

# `serveit.py`
在当前目录搭建一个简易web服务
## 使用方法
```shell
python2 serveit.py 端口
```
或可以在你的用户终端个性化配置文件(比如`~/.bashrc`或`~/.zshrc`)中写入
```shell
alias web="python2 /path/to/file/serveit.py"
```
之后需要用时直接
```shell
web 端口
```

# `msf.sh`
一个同时能够生成`msf`木马和开启`msfconsole`的脚本
## 安装依赖`gum`
```shell
# macOS or Linux
brew install gum

# Arch Linux (btw)
pacman -S gum

# Nix
nix-env -iA nixpkgs.gum

# Debian/Ubuntu
echo "deb https://repo.charm.sh/apt/ * *" | sudo tee /etc/apt/sources.list.d/charm.list
curl https://repo.charm.sh/apt/gpg.key | sudo apt-key add -
sudo apt update && sudo apt install gum

# Fedora
echo '[charm]
name=Charm
baseurl=https://repo.charm.sh/yum/
enabled=1
gpgcheck=1
gpgkey=https://repo.charm.sh/yum/gpg.key' | sudo tee /etc/yum.repos.d/charm.repo
sudo yum install gum
```
## 使用方法
```shell
sh msf.sh 
```

# `AXMLPrinter2.jar`
一个安卓反编译小工具
## 使用方法
```shell
#举个栗子
java -jar AXMLPrinter2.jar AndroidManifest.xml
```

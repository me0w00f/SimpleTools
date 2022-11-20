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

# `Batch域名归属查询.py`
批量域名归属查询
## 使用方法
从鹰图平台上申请自己的apikey,并放进脚本
```python
apikey="你的apikey"
```
新建一个`input.txt`
把你想要搜索的域名一行一个放进去
然后运行脚本即可
```shell
python3 Batch域名归属查询.py
```
结果会放在`result.txt`里

# `portscan.sh`
批量端口扫描  
## 安装依赖
```shell
sudo apt install masscan
sudo apt install nmap
```
## 使用方法
在脚本同一目录中创建一个目标文件，一行一个目标ip   
然后
```shell
sudo sh portscan.sh
```

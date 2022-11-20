echo "请使用root权限运行"
nmap --version
echo "请不要在有nmap 7.92的机器上用这个脚本，否则会segfault"
echo "请输入你想要扫描的目标(文件)"
read target
masscan -p 1-65535 -iL $target --rate=2000 >>ports.txt
cat ports.txt |awk '{print($6":"$4)}'|sed 's#/tcp##g'|sort|uniq >>ipport.txt
echo "请在ipport.txt内去除不需要继续nmap扫描的端口"
echo "输入任意字符并回车继续"
read qwq
echo nmap! > temp.txt
while read line; 
do 
    port=$(cat ipport.txt | grep $line | awk -F ":" '{print($2)}');
    ip=$(cat ipport.txt | grep $line | awk -F ":" '{print($1)}');
    echo "[INFO] 扫描"$ip":"$port"中..."
    nmap -sV -p $port $ip >> temp.txt;
done < ipport.txt
cat temp.txt | grep -E "report for | open | Service Info | MAC" > result.txt
awk '!a[$0]++' result.txt >result.txt.tmp && mv -f result.txt.tmp result.txt
rm -rf ports.txt
rm -rf temp.txt

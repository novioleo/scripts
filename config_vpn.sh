# ssh相关配置
cat >> /etc/ssh/sshd_config <<EOF
ClientAliveInterval 60
ClientAliveCountMax 1
PermitRootLogin no
EOF
# 用户添加
useradd novio
# 用户密码更改
echo 'novioleo' |passwd --stdin novio
# 重启ssh服务
service sshd restart
# 配置自动化安装ss-server脚本
yum -y install unzip
wget https://github.com/flyzy2005/ss-fly/archive/master.zip -O ss.zip
unzip ss.zip
cd ss-fly-master/
./ss-fly.sh -i novioleo 8989
./ss-fly.sh -bbr
# 增加自启动为服务
cat > /etc/init.d/ss-server <<EOF
#!/bin/sh

start(){
        ssserver -c /etc/shadowsocks.json -d start
}

stop(){
        ssserver -c /etc/shadowsocks.json -d stop
}

case "$1" in
start)
        start        
        ;;
stop)
        stop        
        ;;
reload)
        stop
        start        
        ;;
*)
        echo "Usage: $0 {start|reload|stop}"
        exit 1        
        ;;
esac
EOF
chmod +x /etc/init.d/ss-server
reboot

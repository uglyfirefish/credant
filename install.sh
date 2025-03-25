#!/bin/bash
DOWNLOAD_URL_PREFIX="https://uglyfirefish.github.io/credant/downloads/"
SERVICE_NAME="cred_ant"
SERVICE_FILE="/etc/systemd/system/${SERVICE_NAME}.service"
EXECUTABLE="/usr/local/bin/${SERVICE_NAME}"

install_service() {
    echo "🔹 installing ${SERVICE_NAME} 服务..."
    # 生成 service 文件
    cat <<EOF | sudo tee $SERVICE_FILE >/dev/null
[Unit]
Description=cred_ant node agent
Wants=network-pre.target

[Service]
Environment=HOME=/root
ExecStart=/usr/local/bin/cred_ant start 

Restart=on-failure
Type=simple

[Install]
WantedBy=multi-user.target
EOF

}
trap 'echo exiting && rm -rf "$TMPDIR"' EXIT

TMPDIR=$(mktemp -d) || exit 1
LOGFILE=${TMPDIR}/cred_ant_install.log
cd $TMPDIR
echo "working in $TMPDIR"
exec > >(tee -a "$LOGFILE") 2>&1

wget $DOWNLOAD_URL_PREFIX/cred_ant -O cred_ant
chmod +x cred_ant
echo "killing existing cred_ant process..."
sudo killall cred_ant
while true
do
    ps -ef|grep "[c]red_ant start"
    num=$(ps -ef|grep "[c]red_ant start"|wc -l)
    echo "cred_ant process number is: $num"
    if [ "$num" = "0" ]
    then
	echo 'process killed'
	break
    else
	echo 'waitting process to be killed...'
    fi;
    sleep 2
done

sudo cp cred_ant /usr/local/bin/

install_service

echo "success installation"
cred_ant version
#!/bin/sh

# 脚本所在目录（common）
SHELL_PATH=$(cd `dirname $0`; pwd)

if [[ -f "${SHELL_PATH}/conf.d/frps.ini" ]]; then
	echo "找到conf.d/frps.ini，将运行Server模式。"
	chmod u+x ./frps;
	./frps -c conf.d/frps.ini
	exit 0;
fi

if [[ -f "${SHELL_PATH}/conf.d/frpc.ini" ]]; then
	echo "找到conf.d/frpc.ini，将运行Client模式。"
	chmod u+x ./frpc;
	./frpc -c conf.d/frpc.ini
	exit 0;
fi

echo "未提供配置文件，将直接将配置模板拷贝到conf.d。";
cp ${SHELL_PATH}/conf/*full.ini ${SHELL_PATH}/conf.d;
echo "希望运行server时，请修改模板文件并改名为'frps.ini'，发现该文件时将按照server模式运行。";
echo "希望运行client时，请修改模板文件并改名为'frpc.ini'，未找到'frps.ini'时，若发现该文件将按照client模式运行。";
echo "进程挂起1小时，避免docker在有restart时反复重启。";
sleep 1h;


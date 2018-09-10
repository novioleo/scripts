if [! -d "~/.pip"] ; then
	mkdir ~/.pip
fi
cat > ~/.pip/pip.conf <<EOF
[global]
index-url = https://pypi.tuna.tsinghua.edu.cn/simple
EOF

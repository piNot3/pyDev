if [ $EUID = 0 ]
    then echo "DON'T RUN THIS SCRIPT AS ROOT !"
elif ! sudo -h &> /dev/null
    then echo "YOU DON'T HAVE SUDO ON YOUR SYSTEM !"
else
	sudo apt-get update
	sudo apt-get install -y nginx python3 python3-dev
	V=15.0.2
	BASE=$HOME/web
	mkdir $BASE
	cd $BASE
	mkdir log static
	wget https://raw.githubusercontent.com/piNot3/pyDev/master/webapp.py -q
	wget https://raw.githubusercontent.com/piNot3/pyDev/master/uwsgi.ini -q
	sudo wget https://raw.githubusercontent.com/piNot3/pyDev/master/uwsgi -qP /etc/nginx/sites-available
	wget https://pypi.python.org/packages/5c/79/5dae7494b9f5ed061cff9a8ab8d6e1f02db352f3facf907d9eb614fb80e9/virtualenv-$V.tar.gz -q
	tar -xf virtualenv-$V.tar.gz
	python3 virtualenv-$V/virtualenv.py env
	rm -R virtualenv-$V virtualenv-$V.tar.gz
	env/bin/pip install cython uwsgi
	sudo rm /etc/nginx/sites-enabled/*
	sudo ln -s /etc/nginx/sites-available/uwsgi /etc/nginx/sites-enabled
	sudo ln -s $BASE /var/web
	sudo service nginx restart
	printf "\n Your workspace is » \33[1;34m$BASE\33[m\n"
	case `ps -p 1 -o comm=` in
		init)
			sudo wget https://raw.githubusercontent.com/piNot3/pyDev/master/uwsgi.conf -qP /etc/init
			echo -e "\n Run » \e[1;31msudo start uwsgi\e[m\n"
		;;
		systemd)
			sudo wget https://raw.githubusercontent.com/piNot3/pyDev/master/uwsgi.service -qP /etc/systemd/system
			echo -e "\n Run » \e[1;31msudo systemctl start uwsgi\e[m\n"
		;;
	esac
	exit 0
fi
exit 1

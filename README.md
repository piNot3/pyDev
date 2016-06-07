# One-Command — uWSGI on Python 3

**Simple** and **Fast** way to set an environment for python 3.
Virtualenv, Cython and uWSGI are installed by this configuration.
This repo is intended for server with only one site.
It SHOULD work only on Debian based distro.

This script comes with ABSOLUTELY NO WARRANTY.

## Instructions

**One-Command Install**

Run this perfect command.

```
bash <(curl -s https://raw.githubusercontent.com/piNot3/pyDev/master/script.sh)
```

That's it!

**To get in the environment workspace**

To use *python*, *pip*, you have to run this command.

```
source /var/web/env/bin/activate
```

To exit, just type *deactivate*

**To install your package without activating the environment workspace**

Use pip from virtualenv to achieve it.

```
/var/web/env/bin/pip install django                   # Django
/var/web/env/bin/pip install flask                    # Flask
/var/web/env/bin/pip install --no-binary :all: falcon # Falcon
```

Other Python Web Frameworks [here](https://www.fullstackpython.com/other-web-frameworks.html "Python Web Frameworks")

**For Koding**

If you're using Koding, you have to stop and disable apache BEFORE executing the One-Command Install.

```
sudo service apache2 stop
sudo update-rc.d apache2 disable
```

My Two Cents

➜ Right click on folder "web" » Workspace from here

**For NitrousIO**

If you're using Nitrous.io, you have to change your port to **3000**.

```
sudo nano /etc/nginx/sites-enabled/uwsgi
sudo service nginx restart
```

My Two Cents

➜ Right click on folder "web" » Set "web" As Root

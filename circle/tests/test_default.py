import testinfra


##### Check Packages
def test_nginx_is_installed(Package):
    nginx = Package("nginx")
    assert nginx.is_installed

def test_fail2ban_is_installed(Package):
    fail2ban = Package("fail2ban")
    assert fail2ban.is_installed

def test_epel_is_installed(Package):
    epel = Package("epel-release")
    assert epel.is_installed

##### Check Services
def test_nginx_is_running(Service):
    nginx = Service("nginx")
    assert nginx.is_running
    assert nginx.is_enabled


### Check users
def test_for_dropshare_user(User):
    dropshare_user = User("dropshare")
    assert dropshare_user.exists

### Check groups
def test_for_www_data_group(Group):
    www_data = Group("www-data")
    assert www_data.exists


#### Check Files
def test_server_crt(File):
    server_crt = File("/etc/nginx/ssl/server.crt")
    assert server_crt.exists
    assert server_crt.user == "root"
    assert server_crt.group == "nginx"
    assert server_crt.mode == 0640

def test_server_key(File):
    server_key = File("/etc/nginx/ssl/server.key")
    assert server_key.exists
    assert server_key.user == "root"
    assert server_key.group == "nginx"
    assert server_key.mode == 0640

def test_nginx_conf(File):
    nginx_conf = File("/etc/nginx/nginx.conf")
    assert nginx_conf.exists
    assert nginx_conf.contains("worker_connections")

def test_dropshare_conf(File):
    dropshare_conf = File("/etc/nginx/sites-available/dropshare.conf")
    assert dropshare_conf.exists
    assert dropshare_conf.contains("443")

def test_dropshare_link(File):
    dropshare_link = File("/etc/nginx/sites-enabled/dropshare.conf")
    assert dropshare_link.exists
    assert dropshare_link.is_symlink
    assert dropshare_link.linked_to == "/etc/nginx/sites-available/dropshare.conf"

def test_public_html_directory(File):
    public_html = File("/public_html")
    assert public_html.exists
    assert public_html.is_directory
    assert public_html.user == "dropshare"
    assert public_html.group == "www-data"
    assert public_html.mode == "0770"

def test_dropshare_ssh_key(File):
    dropshare_key = File("/home/dropshare/.ssh/authorized_keys")
    assert dropshare_key.exists

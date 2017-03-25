resource "digitalocean_droplet" "dropshare_test" {
  name = "drophare_test_server"
  image = "centos-7-x64"
  region = "nyc3"
  size = "512mb"
  ###ssh_keys = ["${digitalocean_ssh_key.test.id}"]

  #provisioner "local-exec" {
  #  command = "ansible-playbook -i '${self.ipv4_address},' ~/git/personal/ansible-repo/playbooks/dropshare.yml -u root --extra-vars 'ip_address=${self.ipv4_address}'"
  #}
}

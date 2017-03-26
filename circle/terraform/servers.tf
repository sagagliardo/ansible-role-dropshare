resource "digitalocean_droplet" "dropshare_test" {
  name = "drophare_test_server"
  image = "centos-7-x64"
  region = "nyc3"
  size = "512mb"
  ssh_keys = ["7582189"]

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.ipv4_address},' circle/playbook.yml -u root --extra-vars 'ip_address=${self.ipv4_address}'"
  }
}

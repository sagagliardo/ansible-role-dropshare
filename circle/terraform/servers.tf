resource "digitalocean_droplet" "dropshare_test" {
  name = "dropshare_test_server_${var.build_num}"
  image = "centos-7-x64"
  region = "nyc3"
  size = "512mb"
  ssh_keys = ["${var.pubkey}"]

  provisioner "local-exec" {
    command = "ansible-playbook -i '${self.ipv4_address},' circle/playbook.yml -u root --extra-vars 'ip_address=${self.ipv4_address}'"
  }
}

resource "aws_key_pair" "splunk-key" {
  key_name   = "splunk-key"
  public_key = file("~/.ssh/id_rsa.pub")
}

resource "aws_instance" "splunk_server" {
  ami                         = "ami-0df612970f825f04c"
  instance_type               = "t2.micro"
  key_name                    = aws_key_pair.splunk-key.key_name
  associate_public_ip_address = true

  tags = {
    Name="splunk_tf"
  }

  provisioner "remote-exec" {
    inline = [
      "wget -O splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz 'https://d7wz6hmoaavd0.cloudfront.net/products/universalforwarder/releases/8.2.1/linux/splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz'",
      "tar -xzvf splunkforwarder-8.2.1-ddff1c41e5cf-Linux-x86_64.tgz",
      "splunkforwarder/bin/splunk start --accept-license --answer-yes --no-prompt"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/id_rsa")
    }
  }
}

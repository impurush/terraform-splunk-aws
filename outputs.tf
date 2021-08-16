output "key_pair"{
    description = ""
    value       = "${aws_key_pair.splunk-key.public_key}"
    sensitive   = true
}

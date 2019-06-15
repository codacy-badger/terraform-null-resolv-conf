output "content" {
  value = data.template_file.resolv_conf.rendered
}

output "update" {
  value = null_resource.update[*].id
}

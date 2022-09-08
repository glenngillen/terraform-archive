output "output_file" {
  value = abspath(var.output_file)
}

output "source_code_hash" {
  value = local.source_sha
}

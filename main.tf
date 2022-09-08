locals {
  source_sha = base64sha256(join("", [for f in fileset(var.source_dir, "/**") : filebase64sha256("${var.source_dir}/${f}")]))
  triggers = (length(var.triggers) > 0 ? var.triggers : { always_run = timestamp() })
}
resource "null_resource" "compress" {
  triggers = local.triggers
  
  provisioner "local-exec" {
    working_dir = var.working_dir 
    command = "mkdir -p ${abspath(dirname(var.output_file))}"
  }
  provisioner "local-exec" {
    working_dir = var.source_dir
    command = "zip -r -9 -q ${abspath(var.output_file)} *"
  }
}
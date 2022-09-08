# Terraform Archive Module

I needed more control of the way archive files were generated, how the
directories within them were mapped, and the compression level. So I 
wrote this module that will shell out to `zip` to produce a compressed
file.

## Usage

```hcl
module "archive" {
  source            = "glenngillen/archive/module"
  version           = "1.0.0"
  output_file       = "${path.cwd}/${random_id.this.hex}.zip"
  working_dir       = "my/working/dir"
  source_dir        = "my/source/dir"
}
```

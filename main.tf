terraform {
  required_providers {
    render = {
      source  = "render.com/terraform/render"
      version = "1.4.0"
    }
  }
}

provider "render" {}

resource "render_service" "client" {
  name = "client"
  repo = "https://github.com/render-examples/nextjs-hello-world"
  type = "static_site"

  static_site_details = {
    build_command = "yarn; yarn build; yarn next export"
    publish_path  = "out"
  }
}

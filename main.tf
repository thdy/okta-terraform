terraform {
  required_version = ">= 1.0.0"

  # terraform.tfstate の保存先に、前のページで作成した AWS S3 バケットを指定します。
  backend "s3" {
    bucket  = "thdy-terraform"
    region  = "ap-northeast-1"
    key     = "okta/terraform.tfstate"
    encrypt = true
  }

  required_providers {
    okta = {
      source  = "okta/okta"
      version = "~> 3.11.1"
    }
  }
}

# Configure the Okta Provider
provider "okta" {
  org_name = "oie-3573589" # Okta のテナント名(サブドメイン)を入力します。 ex) xxxxxxxx.okta.com
  base_url = "oktapreview.com"
  # api_token = "xxxx"  # ドキュメントでは API トークンの指定が書いてありますが、このファイルは Git 管理されるためトークンは記述しません。
}
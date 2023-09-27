# 変数の設定
variable "aws_access_key" {
    description = "AWSのアクセスキー"
    type        = string
}
variable "aws_secret_key" {
    description = "AWSのシークレットキー"
    type        = string
}
variable "region"{
    description = "リージョン"
    type        = string
}
variable "profile"{
    description = "プロファイル"
    type        = string
}

# network関連
variable "vpc_id"{
    description = "vpc_id"
    type        = string
}

# 概要
`Terraform`の`import`について理解を深める

# version1.5のimport
## コマンド
1. 初期化
```sh
$ terraform init
```

2. ファイルの出力
```sh
$ terraform plan -generate-config-out=generated.tf
```

# コード
```tf
import {
  to = Resource Type.Resource Name
  id = "ARN (Amazon Resource Name) または Resource Name"
}

resource "Resource Type" "Resource Name" {
  # 何も記載しない。但し、必須入力項目がある場合は、記載する必要がある
}

/*
aws_vpc        : Resource Type(リソース タイプ)
test_vpc       : Resource Name(リソース ネーム)
"vpc-a01106c2" : ARN or Resource Name
id に関しては、terraformの公式ドキュメントとAWSのコンソール画面を良く確認して、値を貼り付ける
*/
```

# 旧式のimport
## コマンド

1. `import`コマンド使用して、AWSの設定内容を`.tfstate`ファイルに登録する
```sh
# 構文1
$ terraform import module.[module Name].[Resource Type].[Resource Name] [ARN or Resource Name]

# 構文2(main.tfにresourceの記述がある場合のコマンド)
$ terraform import [Resource Type].[Resource Name] [ARN (Amazon Resource Name)]
```

2. `.tfstate`ファイルの一覧を表示する。その際、importした内容が一覧にあるか確認する
```sh
$ terraform state list
```

3. `import`した内容を表示
```sh
$ terraform state show RESOURCE_TYPE.NAME
```

## コード
- ディレクトリー構成
```sh
.
├── .terraform
├── network/
│   └── vpc.tf
├── main.tf
# 以下省略
```
- `tf`ファイル
```terraform
# main.tf
module "network" {
  source = "./network"
}
```
```terraform
# vpc.tf
resource "aws_vpc" "test_vpc" {

}
```

- `.tfstate`ファイルの内容を消去するコマンド
```sh
terraform state rm [消去するmodule or resource]
```
- `.tfstate`ファイルを更新する方法
```sh
terraform state mv [消去するmodule or resource]
```

# 詳細資料
- [Terraformの最新と旧式のimportコマンドの使用方法](https://qiita.com/kengo-sk8/items/e94ae5c2fa11391e02d0)

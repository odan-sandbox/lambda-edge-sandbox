# lambda-edge-sandbox

## Setup
### terraform
`terraform/components/{lambda-edge,static-site}` で以下のコマンドを実行して初期化する
```bash
$ AWS_PROFILE=root terraform init -backend-config=./backend.tfvars
```

## Build
`lambda-edge` で以下のコマンドを実行して build する
```bash
$ yarn build
```

## Deploy
`terraform/components/{lambda-edge,static-site}` で以下のコマンドを実行してデプロイする
```bash
$ AWS_PROFILE=root terraform apply
```
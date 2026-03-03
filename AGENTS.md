## ⚙️ Terraform コマンドは Podman で実行

すべての Terraform 実行 ( `init`, `plan`, `apply` など ) は **Podman コンテナ内** で行うことを推奨します。コンテナのイメージは公式 HashiCorpイメージ(例: `hashicorp/terraform:1.4.5`) を使用します。

例:
```bash
podman run --rm \
  -v $(pwd):/src -w /src \
  docker.io/hashicorp/terraform:1.4.5 \
  terraform init
```

実際には `$(pwd)` の部分は対象ディレクトリに置き換えてください ( たとえば `terraform/aws` )。同様に `plan` や `apply` も同じ構文で実行します。

これらのコマンドは `AGENTS.md` のビルド/テスト/デプロイセクションで**上記 Podman コマンド**を使用していることを明記してください。

---

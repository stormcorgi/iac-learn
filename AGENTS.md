# AGENTS

このファイルは、リポジトリ上で作業するすべてのエージェント（私を含む）が従うべき規約とコマンドをまとめたものです。開発者、CI/CD、そして自動化ツールが参照する想定です。

## 📦 Build / Test / Deploy

| ステップ | コマンド | 備考 |
|------|---------|-------|
| **初期化** | `terraform init -upgrade` | モジュールを取得し、プロバイダプラグインをインストールします |
| **Lint** | `terraform fmt -check` | HCL のフォーマットをチェック。変更が必要なら失敗します |
| **Validate** | `terraform validate` | 構文チェック（API コールは行わない） |
| **TFLint** | `tflint` | ベストプラクティス違反を検知します |
| **YAML Lint** | `yamllint .` | すべての`.yml/.yaml`を検証 |
| **Apply** | `terraform apply -auto-approve` | インフラを適用 |
| **単一テスト実行** | `terraform validate -var-file=tests/test.tfvars`
` tflint --module -f tests/test.yml` | 特定のtfvarsまたはTFLint設定を対象にします |

> **単一テスト実行** – 特定のモジュールのみ検証したい場合は、Terraform の `-target=` オプションか `tflint --only=module_name` を使います。例：
> ```bash
> terraform validate -var-file=tests/db.tfvars
> tflint --only=modules/db
> ```
> 
> **Pre‑commit hooks**（`.pre-commit-config.yaml` で定義） はコミット前に上記コマンドを自動実行します。

## 🧩 コードスタイルガイドライン

| 項目 | 規約 | 例 |
|------|------------|---------|
| **Terraform HCL** | リソース名・変数は `snake_case`、モジュール名は `PascalCase` | `resource "aws_instance" "db"` |
| **変数** | 型・デフォルト・説明を必ず記載 | `variable "instance_type" { type = string default = "t3.micro" description = "EC2 instance type" }` |
| **出力** | 敏感情報には `public_key` など大文字を使う | `output "public_key" { value = aws_key_pair.main.public_key }` |
| **フォーマット** | `terraform fmt` の 2 スペースインデントを守る | タブは使用しない |
| **インポート / モジュール** | `module` ブロックはアルファベット順に配置 |
| **エラーハンドリング** | Terraform のエラーは CI で捕捉し、サイレント失敗を避ける |
| **コメント** | 複雑なロジックを説明するコメントは必ず付ける |
| **ファイル構成** | 各リソースタイプは専用フォルダに格納（例：`modules/ec2/`） |
| **YAML** | `yamllint` のルール（2 スペースインデント、末尾空白無し） |
| **ドキュメント** | すべてのモジュールは `README.md` に入力・出力・使用例を記載 |
| **セキュリティ** | 秘密情報はハードコーディングせず、`var.*` で渡し、Terraform で `sensitive = true` を付与 |
| **命名** | 短くて説明的な名前を使う。頭字語は業界標準のみ |

## 🔍 Cursor & Copilot ルール

- このリポジトリには **Cursor** または **Copilot** の設定は存在しません。もし `.cursor/rules/` や `.cursorrules/` を後から追加した場合、こちらのガイドラインをオーバーライドします。
- Copilot を使う場合は、`.github/copilot-instructions.md` を作成して任意の指示を記載できます。エージェントはこれらの指示を優先します。

## 📄 このファイルの使い方

1. ファイルをリポジトリルート（`/home/mot/repos/stormcorgi-iac-learn/`）に配置します。
2. PR を作成する前に必ず確認し、規約に従っているかチェックします。
3. 新しいツール（例：`ansible-lint` や Python のリント）を追加したら、ここに追記します。
4. CI では以下のように `Build / Test / Deploy` テーブルのコマンドをそのまま使用できます。

--- 

### CI スクリプト例

```yaml
jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Terraform フォーマットチェック
        run: terraform fmt -check
      - name: Terraform 構文チェック
        run: terraform validate
      - name: TFLint 実行
        run: tflint
      - name: YAML Lint 実行
        run: yamllint .
```

--- 

## 📌 クイックリファレンス

| コマンド | 目的 |
|---------|---------|
| `terraform init -upgrade` | プロバイダプラグインをインストール |
| `terraform fmt -check` | HCL フォーマットチェック |
| `terraform validate` | 構文チェック |
| `tflint` | IaC のベストプラクティスチェック |
| `yamllint` | YAML のフォーマットチェック |
| `terraform apply -auto-approve` | インフラデプロイ |

## 🛠 ツール仕様

このリポジトリでは、各エージェントが使用できるツールの JSON スキーマを `.opencode/tools` ディレクトリに格納しています。例えば、`question` ツールの仕様は

* パス: `.opencode/tools/question.md`
* ファイルに記載された JSON 構造を参照してください。

これらの定義はツールの引数検証に利用され、ユーザー入力のバリデーションを簡易に行うためのものです。

--- 

**AGENTS.md はこれで完成です**

## ⚙️ Terraform コマンドは Podman で実行

すべての Terraform 実行 ( `init`, `plan`, `apply` など ) は **Podman コンテナ内** で行うことを推奨します。コンテナのイメージは公式 HashiCorpイメージ(例: `hashicorp/terraform:1.4.5`) を使用します。

例：
```bash
podman run --rm \
  -v $(pwd):/src -w /src \
  docker.io/hashicorp/terraform:1.4.5 \
  terraform init
```

実際には `$(pwd)` の部分は対象ディレクトリに置き換えてください ( たとえば `terraform/aws` )。同様に `plan` や `apply` も同じ構文で実行します。

これらのコマンドは `AGENTS.md` のビルド/テスト/デプロイセクションで**上記 Podman コマンド**を使用していることを明記してください。

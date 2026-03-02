## question

ユーザーの入力を受け取るためのツール。要件の明確化、オプションの選択、動的データの取得などに使用。

### JSON構造

```json
{
  "questions": [
    {
      "header": "<オプションのヘッダー>",
      "question": "<プロンプトテキスト>",
      "options": [
        {"label": "Option 1", "description": "説明文"},
        {"label": "Option 2", "description": "説明文"}
      ],
      "multiple": false,
      "custom": true
    }
  ]
}
```

### 戻り値

選択したラベルの配列を返す（例: `['production']`）。ユーザーが「Type your own answer」を選択した場合は、そのカスタム入力文字列が返される。

### 使用例

```json
{
  "questions": [
    {
      "header": "Environment",
      "question": "Choose deployment environment:",
      "options": [
        {"label": "staging", "description": "Staging environment"},
        {"label": "production", "description": "Production environment"}
      ],
      "multiple": false
    }
  ]
}
```

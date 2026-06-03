# 27. CI/CD(GitHub Actions)

## 目的

GitHub Actionsを使い、Strutsアプリケーションのビルドとテストを自動化する方法を学びます。

## CI/CDとは

| 用語 | 意味 |
|---|---|
| CI | 継続的インテグレーション。pushやPR時にビルド・テストを自動実行する |
| CD | 継続的デリバリー/デプロイ。成果物を自動で配布・配置する |

## Struts教材でのCI対象

- Mavenビルド
- JUnitテスト
- 依存関係チェック
- WARファイル生成
- 静的解析

## ワークフロー例

`.github/workflows/maven.yml`

```yaml
name: Java CI with Maven

on:
  push:
    branches: [ "main" ]
  pull_request:
    branches: [ "main" ]

jobs:
  build:
    runs-on: ubuntu-latest

    steps:
      - uses: actions/checkout@v4

      - name: Set up JDK 17
        uses: actions/setup-java@v4
        with:
          java-version: '17'
          distribution: 'temurin'
          cache: maven

      - name: Build with Maven
        run: mvn -f sample-struts-app/pom.xml clean test package
```

## 成果物の保存

```yaml
      - name: Upload WAR
        uses: actions/upload-artifact@v4
        with:
          name: sample-struts-app-war
          path: sample-struts-app/target/*.war
```

## 注意点

- テストが失敗したらマージしない
- mainへの直接pushを避ける
- PRレビューとCIを組み合わせる
- 秘密情報はGitHub Secretsに保存する
- 本番デプロイは承認フローを入れる

## 演習

1. Mavenビルド用workflowを作成する
2. push時にテストを実行する
3. WARファイルをartifactとして保存する
4. テスト失敗時にCIが失敗することを確認する

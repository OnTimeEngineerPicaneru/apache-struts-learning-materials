# 06. Struts からの移行

## なぜ移行が必要か

Struts は現在も利用されていますが、新規開発では Spring Boot などが選択されることが多くなっています。

特に Struts 1.x は EOL のため、継続利用には大きなリスクがあります。

## 移行先の候補

| 移行先 | 特徴 |
|---|---|
| Struts 6系 | Struts の考え方を維持しやすい |
| Spring MVC | Java Web 開発で広く利用されている |
| Spring Boot | 設定が簡潔で新規開発に向く |
| Jakarta EE | 標準仕様ベースで構築できる |

## 移行時に確認するもの

- 画面数
- Action 数
- JSP 数
- 共通部品
- 認証・認可
- DB アクセス方式
- 外部連携
- バッチ処理
- ファイルアップロード
- セッション利用箇所

## 段階的移行の考え方

一度にすべてを移行するとリスクが高くなります。

```text
1. 現行調査
2. 依存関係の整理
3. 共通処理の抽出
4. 小さい機能から移行
5. 新旧機能を並行稼働
6. テスト
7. 本番切り替え
```

## Struts Action と Spring Controller の対応

| Struts | Spring MVC |
|---|---|
| Action | Controller |
| struts.xml | @RequestMapping |
| result | view name |
| JSP | JSP / Thymeleaf |
| interceptor | HandlerInterceptor / Filter |

## 移行で注意する点

- URL を変えるか維持するか
- セッション構造をどう扱うか
- JSP を再利用するか作り直すか
- バリデーション仕様をどう移すか
- 権限チェックをどこで行うか
- 既存テストがあるか

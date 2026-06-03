# 21. Ajax連携編

## 目的

StrutsアプリケーションでAjaxを利用し、画面遷移なしで部分更新する方法を学びます。

## Ajaxを使う場面

- 入力補完
- 郵便番号から住所取得
- 商品検索
- 在庫数確認
- 非同期バリデーション
- カート数量更新

## 基本構成

```text
JavaScript fetch
  ↓
Struts Action
  ↓
Service
  ↓
JSONレスポンス
```

## JavaScript例

```javascript
fetch('/sample-struts-app/api/products')
  .then(response => response.json())
  .then(data => {
    console.log(data);
  });
```

## JSONを返すActionの考え方

画面遷移用ActionとAPI用Actionは役割を分けます。

```text
ProductListAction       → JSPを返す
ProductListApiAction    → JSONを返す
```

## 注意点

- CSRF対策を行う
- 認証が必要なAPIはInterceptorで保護する
- 入力値検証をサーバー側でも行う
- JSONに不要な個人情報を含めない
- HTTPステータスコードを適切に使う

## 演習

1. 商品検索APIを設計する
2. JavaScriptからfetchで呼び出す
3. 検索結果を画面に表示する
4. 未ログイン時は401相当のレスポンスにする

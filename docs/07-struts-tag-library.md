# 07. Strutsタグライブラリ編

## 目的

Strutsタグライブラリを使い、JSP上でフォーム、リンク、メッセージ、繰り返し表示を実装できるようにします。

## Strutsタグとは

Strutsタグは、JSPでStrutsの機能を利用するためのタグです。

代表的なタグは以下です。

| タグ | 用途 |
|---|---|
| `<s:form>` | フォーム作成 |
| `<s:textfield>` | テキスト入力 |
| `<s:password>` | パスワード入力 |
| `<s:submit>` | 送信ボタン |
| `<s:property>` | 値の表示 |
| `<s:iterator>` | 繰り返し表示 |
| `<s:url>` | URL生成 |
| `<s:a>` | リンク生成 |
| `<s:if>` / `<s:else>` | 条件分岐 |

## JSPでの宣言

```jsp
<%@ taglib prefix="s" uri="/struts-tags" %>
```

## 値の表示

```jsp
<s:property value="message" />
```

Actionに `getMessage()` がある場合、`message` として参照できます。

## フォームの作成

```jsp
<s:form action="login" method="post">
    <s:textfield name="userId" label="ユーザーID" />
    <s:password name="password" label="パスワード" />
    <s:submit value="ログイン" />
</s:form>
```

## 繰り返し表示

```jsp
<s:iterator value="users">
    <p><s:property value="name" /></p>
</s:iterator>
```

Action側には `getUsers()` を用意します。

## 条件分岐

```jsp
<s:if test="loginUser != null">
    <p>ログイン中です</p>
</s:if>
<s:else>
    <p>ログインしていません</p>
</s:else>
```

## 実務上の注意

- JSPにJavaコードを書かない
- 表示ロジックを複雑にしすぎない
- 画面表示用データはActionで整える
- HTMLエスケープを意識する
- 共通レイアウトは別ファイル化する

## 演習

1. 名前入力フォームをStrutsタグで作成する
2. Actionで受け取った名前を画面に表示する
3. ユーザー一覧を `<s:iterator>` で表示する
4. ログイン状態に応じて表示を切り替える

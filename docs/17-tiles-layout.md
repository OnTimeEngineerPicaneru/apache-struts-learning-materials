# 17. Tilesレイアウト編

## 目的

Apache Tilesを使い、ヘッダー、メニュー、フッターなどの共通レイアウトを管理する考え方を学びます。

## Tilesとは

Tilesは、JSP画面を部品化し、共通レイアウトを定義するための仕組みです。

例:

```text
layout.jsp
├── header.jsp
├── menu.jsp
├── body
└── footer.jsp
```

## Tilesを使う理由

- 画面ごとの重複を削減する
- レイアウト変更を一箇所に集約する
- 大規模開発で画面構成を統一する
- JSPの見通しをよくする

## レイアウト例

```jsp
<html>
<head>
    <title><tiles:insertAttribute name="title" /></title>
</head>
<body>
    <header><tiles:insertAttribute name="header" /></header>
    <nav><tiles:insertAttribute name="menu" /></nav>
    <main><tiles:insertAttribute name="body" /></main>
    <footer><tiles:insertAttribute name="footer" /></footer>
</body>
</html>
```

## 定義例

```xml
<definition name="baseLayout" template="/WEB-INF/layouts/layout.jsp">
    <put-attribute name="header" value="/WEB-INF/layouts/header.jsp" />
    <put-attribute name="menu" value="/WEB-INF/layouts/menu.jsp" />
    <put-attribute name="footer" value="/WEB-INF/layouts/footer.jsp" />
</definition>
```

## 注意点

- 画面固有処理をレイアウトに書かない
- 共通メニューは権限と連動させる
- JSPの役割を明確にする
- 新規案件ではThymeleaf等との比較も行う

## 演習

1. 共通ヘッダーを作成する
2. 共通メニューを作成する
3. 会員管理画面を共通レイアウトに組み込む
4. 管理者用メニューと一般ユーザー用メニューを分ける

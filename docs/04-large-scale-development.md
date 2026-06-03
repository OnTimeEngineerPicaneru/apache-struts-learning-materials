# 04. Apache Struts の大規模開発

## 大規模開発で重要な観点

Struts を大規模開発で使用する場合、単に Action と JSP を作るだけでは不十分です。

重要なのは以下です。

- パッケージ設計
- Action の責務分離
- Service 層の設計
- DAO 層の設計
- 入力値検証
- 共通処理
- 例外処理
- ログ出力
- セキュリティ対策
- 画面遷移の整理
- テスト容易性

## 推奨するレイヤー構成

```text
controller / action
  ↓
service
  ↓
repository / dao
  ↓
database
```

## パッケージ構成例

```text
com.example.app
├── action
│   ├── user
│   │   ├── UserListAction.java
│   │   ├── UserCreateAction.java
│   │   └── UserUpdateAction.java
│   └── auth
│       ├── LoginAction.java
│       └── LogoutAction.java
├── service
│   ├── UserService.java
│   └── AuthService.java
├── repository
│   ├── UserRepository.java
│   └── JdbcUserRepository.java
├── model
│   └── User.java
├── form
│   └── UserForm.java
└── exception
    └── ApplicationException.java
```

## Action に書いてよい処理

Action に書いてよい処理は、画面制御に関する処理です。

例:

- リクエストパラメータの受け取り
- Service の呼び出し
- 結果名の返却
- 画面表示用データの保持

## Action に書くべきでない処理

以下は Action に直接書かないようにします。

- SQL
- 複雑な業務ロジック
- ファイル操作
- メール送信処理
- 外部 API 呼び出し
- トランザクション制御

## struts.xml の分割

大規模開発では、すべての設定を 1 つの `struts.xml` に書くと保守が困難です。

機能ごとに設定ファイルを分割します。

```xml
<struts>
    <include file="struts-user.xml"/>
    <include file="struts-auth.xml"/>
    <include file="struts-admin.xml"/>
</struts>
```

## 画面遷移設計

| URL | Action | 成功時 | 失敗時 |
|---|---|---|---|
| /user/list | UserListAction | user-list.jsp | error.jsp |
| /user/create | UserCreateAction | user-complete.jsp | user-form.jsp |
| /login | LoginAction | menu.jsp | login.jsp |

## 大規模開発で避けるべき設計

- 1 つの Action に複数画面の処理を詰め込む
- JSP に Java コードを書く
- SQL を Action に直接書く
- 画面遷移を口頭管理する
- 共通処理をコピー＆ペーストする
- 例外を握りつぶす
- 入力値検証を画面側だけに依存する

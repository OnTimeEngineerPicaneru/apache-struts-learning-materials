# 10. JDBC実践編

## 目的

StrutsアプリからJDBCを利用し、データベースと連携する基本を学びます。

## 構成

```text
Action
  ↓
Service
  ↓
Repository / DAO
  ↓
JDBC
  ↓
Database
```

## DAOを分離する理由

ActionにSQLを書くと、画面制御とデータアクセスが混在します。

悪い例:

```java
public String execute() throws Exception {
    Connection con = DriverManager.getConnection(...);
    PreparedStatement ps = con.prepareStatement("select * from users");
    return SUCCESS;
}
```

良い構成:

```text
UserListAction → UserService → UserRepository
```

## Entity例

```java
public class User {
    private int id;
    private String name;
    private String email;

    // getter / setter
}
```

## Repository例

```java
public class UserRepository {

    public List<User> findAll() throws SQLException {
        List<User> users = new ArrayList<>();

        String sql = "select id, name, email from users order by id";

        try (Connection con = DriverManager.getConnection("jdbc:h2:mem:test", "sa", "");
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                User user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
                users.add(user);
            }
        }

        return users;
    }
}
```

## SQLインジェクション対策

文字列連結でSQLを作ってはいけません。

悪い例:

```java
String sql = "select * from users where name = '" + name + "'";
```

良い例:

```java
String sql = "select * from users where name = ?";
PreparedStatement ps = con.prepareStatement(sql);
ps.setString(1, name);
```

## トランザクション

登録・更新・削除ではトランザクションを意識します。

```java
con.setAutoCommit(false);
try {
    // update処理
    con.commit();
} catch (Exception e) {
    con.rollback();
    throw e;
}
```

## 演習

1. usersテーブルを設計する
2. ユーザー一覧をJDBCで取得する
3. ユーザー登録処理を実装する
4. PreparedStatementで検索処理を実装する
5. ServiceとRepositoryを分離する

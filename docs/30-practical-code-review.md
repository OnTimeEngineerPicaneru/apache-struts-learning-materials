# 30. 実務コードレビュー演習

## 目的

Strutsアプリケーションのコードレビュー観点を学び、保守性・安全性・拡張性を評価できるようにします。

## レビュー観点

| 観点 | 確認内容 |
|---|---|
| 責務分離 | Actionに業務ロジックが集中していないか |
| セキュリティ | 入力値検証、認可、SQLインジェクション対策があるか |
| 保守性 | 命名、重複、メソッド長、クラス分割 |
| テスト | ServiceやRepositoryのテストがあるか |
| 例外処理 | 例外を握りつぶしていないか |
| ログ | 必要なログがあり、機密情報を出していないか |

## 悪いコード例

```java
public class MemberAction {
    public String execute() throws Exception {
        Connection con = DriverManager.getConnection("jdbc:postgresql://localhost/db", "user", "pass");
        String sql = "select * from members where name = '" + name + "'";
        ResultSet rs = con.createStatement().executeQuery(sql);
        return "success";
    }
}
```

## 指摘例

- ActionにDBアクセスが直接書かれている
- SQLが文字列連結されている
- DB接続情報がソースコードに直書きされている
- ConnectionやResultSetをcloseしていない
- 例外処理方針が不明
- 入力値検証がない

## 改善方針

```text
MemberAction
  ↓
MemberService
  ↓
MemberRepository
  ↓
DataSource
```

## レビューコメント例

```text
このActionはDBアクセスを直接行っているため、画面制御とデータアクセスの責務が混在しています。
MemberServiceとMemberRepositoryへ分離してください。
また、SQLは文字列連結ではなくPreparedStatementを使用してください。
```

## 演習

1. 悪いコード例から問題点を10個挙げる
2. レビューコメントを書く
3. 改善後のクラス構成を設計する
4. SQLインジェクション対策を実装する
5. レビュー観点表を自分で拡張する

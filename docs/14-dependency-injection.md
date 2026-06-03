# 14. DI(Dependency Injection)編

## 目的

依存性注入の考え方を理解し、Action、Service、Repositoryの結合度を下げる設計を学びます。

## DIとは

DIとは、クラス内で依存オブジェクトを直接生成せず、外部から渡す設計です。

悪い例:

```java
public class UserService {
    private UserRepository repository = new UserRepository();
}
```

良い例:

```java
public class UserService {
    private final UserRepository repository;

    public UserService(UserRepository repository) {
        this.repository = repository;
    }
}
```

## DIのメリット

- テストしやすい
- 実装を差し替えやすい
- クラス間の結合度を下げられる
- 責務が明確になる
- 大規模開発で保守しやすい

## StrutsでのDI方針

Struts単体でも設計上のDIは可能です。さらにSpringと連携することで、ActionやServiceをSpring Beanとして管理できます。

## コンストラクタインジェクション

```java
public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }
}
```

## インターフェース分離

```java
public interface MemberRepository {
    List<Member> findAll();
}
```

```java
public class JdbcMemberRepository implements MemberRepository {
    public List<Member> findAll() {
        // JDBC処理
    }
}
```

## テスト用実装への差し替え

```java
public class FakeMemberRepository implements MemberRepository {
    public List<Member> findAll() {
        return List.of(new Member(1, "テスト太郎"));
    }
}
```

## 実務上の注意

- Actionで `new` を多用しない
- ServiceとRepositoryをインターフェースで分離する
- 依存関係の生成場所を限定する
- 循環依存を作らない
- DIコンテナを導入する場合は設計ルールを統一する

## 演習

1. GreetingServiceをインターフェース化する
2. ActionにServiceを外部から渡せる設計にする
3. Repositoryをインターフェース化する
4. テスト用Repositoryを作成する

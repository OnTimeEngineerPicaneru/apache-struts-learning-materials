# 15. テスト(JUnit/Mockito)編

## 目的

StrutsアプリケーションにおけるService、Repository、Actionのテスト方針を学びます。

## テスト対象の分類

| 対象 | テスト内容 |
|---|---|
| Service | 業務ロジック |
| Repository | SQLとDBアクセス |
| Action | 入力、Service呼び出し、遷移結果 |
| Interceptor | 共通処理 |

## JUnitの基本

```java
import static org.junit.jupiter.api.Assertions.*;
import org.junit.jupiter.api.Test;

class GreetingServiceTest {

    @Test
    void メッセージを返す() {
        GreetingService service = new GreetingService();
        assertEquals("Hello, Apache Struts!", service.createMessage());
    }
}
```

## Mockitoの基本

Mockitoを使うと、依存クラスをモックに置き換えられます。

```java
MemberRepository repository = mock(MemberRepository.class);
when(repository.findAll()).thenReturn(List.of(new Member(1, "山田太郎")));
```

## Serviceテスト例

```java
class MemberServiceTest {

    @Test
    void 会員一覧を取得できる() {
        MemberRepository repository = mock(MemberRepository.class);
        when(repository.findAll()).thenReturn(List.of(new Member(1, "山田太郎")));

        MemberService service = new MemberService(repository);
        List<Member> members = service.findAll();

        assertEquals(1, members.size());
        verify(repository).findAll();
    }
}
```

## テストしにくい設計

```java
public class MemberService {
    private MemberRepository repository = new JdbcMemberRepository();
}
```

この設計ではテスト時にRepositoryを差し替えにくくなります。

## テストしやすい設計

```java
public class MemberService {
    private final MemberRepository repository;

    public MemberService(MemberRepository repository) {
        this.repository = repository;
    }
}
```

## 演習

1. GreetingServiceTestを作成する
2. MemberServiceTestを作成する
3. RepositoryをMockitoでモック化する
4. 異常系テストを作成する
5. Actionの戻り値が `success` になることをテストする

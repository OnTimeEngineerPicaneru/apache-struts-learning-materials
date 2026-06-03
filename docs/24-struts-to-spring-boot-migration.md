# 24. Struts→Spring Boot移行演習

## 目的

既存のStrutsアプリケーションをSpring Bootへ段階的に移行するための考え方と演習を行います。

## 移行対象の整理

まず現行Strutsアプリを棚卸しします。

| 対象 | 確認内容 |
|---|---|
| Action | 数、URL、責務 |
| JSP | 画面数、共通部品 |
| Service | 業務ロジックの場所 |
| DAO | SQL、DB接続方式 |
| struts.xml | 画面遷移、例外設定 |
| Interceptor | 認証、ログ、共通処理 |
| セッション | 保存している値 |

## 移行方針

一括移行はリスクが高いため、機能単位で段階的に移行します。

```text
1. 現行調査
2. URL・画面遷移一覧作成
3. 業務ロジックをServiceへ抽出
4. Spring Bootプロジェクト作成
5. 小さい画面から移行
6. テスト
7. 本番切り替え
```

## 対応関係

| Struts | Spring Boot |
|---|---|
| Action | Controller |
| struts.xml | `@RequestMapping` |
| result | return view名 |
| JSP | Thymeleaf / JSP |
| Interceptor | HandlerInterceptor / Filter |
| Service | Service |
| DAO | Repository |

## 移行演習: HelloAction

Struts:

```java
public class HelloAction {
    public String execute() {
        return "success";
    }
}
```

Spring Boot:

```java
@Controller
public class HelloController {

    @GetMapping("/hello")
    public String hello(Model model) {
        model.addAttribute("message", "Hello, Spring Boot!");
        return "hello";
    }
}
```

## 移行時の注意点

- URL互換性を保つか決める
- セッション名を整理する
- JSPを再利用するか判断する
- 入力チェックを移行する
- Interceptorを移行する
- テストを先に作る

## 演習

1. StrutsのURL一覧を作成する
2. ActionとControllerの対応表を作成する
3. HelloActionをSpring Controllerへ移行する
4. 会員一覧画面をSpring Bootへ移行設計する
5. StrutsとSpring Bootを並行稼働する移行計画を作る

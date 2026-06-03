# 08. Validation Framework編

## 目的

StrutsのValidation Frameworkを使い、入力値チェックをActionから分離して管理できるようにします。

## 入力値検証が必要な理由

Webアプリでは、画面から送られてくる値を信用してはいけません。

必要な検証例:

- 必須入力
- 文字数
- 数値範囲
- メールアドレス形式
- パスワード強度
- 日付形式
- 業務ルール

## validateメソッドによる検証

Actionに `validate()` を実装すると、execute前に検証できます。

```java
public class LoginAction extends ActionSupport {

    private String userId;
    private String password;

    public void validate() {
        if (userId == null || userId.isBlank()) {
            addFieldError("userId", "ユーザーIDは必須です。");
        }
        if (password == null || password.isBlank()) {
            addFieldError("password", "パスワードは必須です。");
        }
    }

    public String execute() {
        return SUCCESS;
    }
}
```

## XMLによる検証

Actionクラス名に対応したXMLを配置することで、検証ルールを外出しできます。

例:

```text
LoginAction-validation.xml
```

```xml
<!DOCTYPE validators PUBLIC
    "-//Apache Struts//XWork Validator 1.0.3//EN"
    "https://struts.apache.org/dtds/xwork-validator-1.0.3.dtd">

<validators>
    <field name="userId">
        <field-validator type="requiredstring">
            <message>ユーザーIDは必須です。</message>
        </field-validator>
    </field>
</validators>
```

## エラー表示

```jsp
<s:fielderror />
```

またはフォーム部品ごとに表示します。

```jsp
<s:textfield name="userId" label="ユーザーID" />
```

## 設計方針

| 検証内容 | 推奨配置 |
|---|---|
| 必須、文字数、形式 | Validation Framework |
| DB重複チェック | Service |
| 認可チェック | Interceptor / Service |
| 複雑な業務ルール | Service |

## 演習

1. ユーザーID必須チェックを実装する
2. パスワード8文字以上チェックを実装する
3. メールアドレス形式チェックを実装する
4. 入力エラー時にフォーム画面へ戻す

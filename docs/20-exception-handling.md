# 20. 例外ハンドリング編

## 目的

Strutsアプリケーションで例外を適切に扱い、保守しやすく安全なエラー処理を設計します。

## 例外処理の基本方針

- 想定内エラーと想定外エラーを分ける
- ユーザーに内部情報を見せない
- ログには調査に必要な情報を残す
- 例外を握りつぶさない
- 共通エラー画面を用意する

## 例外の分類

| 種類 | 例 | 対応 |
|---|---|---|
| 入力エラー | 必須未入力 | フォームへ戻す |
| 業務エラー | 在庫不足 | メッセージ表示 |
| 認可エラー | 権限不足 | エラー画面 |
| システムエラー | DB障害 | 共通エラー画面 |

## 独自例外

```java
public class ApplicationException extends RuntimeException {
    public ApplicationException(String message) {
        super(message);
    }
}
```

## Serviceでの例外例

```java
if (stock < quantity) {
    throw new ApplicationException("在庫が不足しています。");
}
```

## struts.xmlでのエラー遷移

```xml
<global-results>
    <result name="error">/WEB-INF/jsp/error.jsp</result>
</global-results>

<global-exception-mappings>
    <exception-mapping exception="java.lang.Exception" result="error" />
</global-exception-mappings>
```

## 注意点

- `catch (Exception e) {}` のような空catchをしない
- 画面にスタックトレースを表示しない
- DB例外をそのままユーザーに見せない
- 業務エラーはユーザーが理解できるメッセージにする

## 演習

1. ApplicationExceptionを作成する
2. 在庫不足時に業務例外を発生させる
3. 共通エラー画面を作成する
4. 例外発生時にERRORログを出す

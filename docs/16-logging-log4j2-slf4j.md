# 16. ログ(Log4j2/SLF4J)編

## 目的

Strutsアプリケーションで適切なログを出力し、障害調査と運用保守に役立てる方法を学びます。

## ログの役割

- 障害調査
- 操作履歴確認
- 性能調査
- 不正アクセス検知
- バッチや外部連携の追跡

## ログレベル

| レベル | 用途 |
|---|---|
| ERROR | 処理継続が困難なエラー |
| WARN | 想定外だが処理継続可能 |
| INFO | 業務上重要な処理結果 |
| DEBUG | 開発時の詳細情報 |
| TRACE | より詳細な追跡情報 |

## SLF4Jを使う理由

SLF4JはログAPIのFacadeです。実装をLog4j2などに差し替えやすくなります。

## 実装例

```java
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class LoginAction {

    private static final Logger logger = LoggerFactory.getLogger(LoginAction.class);

    public String execute() {
        logger.info("login process started");
        return "success";
    }
}
```

## 悪いログ

```java
logger.info("password=" + password);
```

パスワードや個人情報をログに出してはいけません。

## 良いログ

```java
logger.info("login failed. userId={}", userId);
```

ただし、ユーザーIDも要件によってはマスキングします。

## ログ設計の観点

- いつ
- 誰が
- どの機能で
- 何をしたか
- 成功したか失敗したか
- 例外情報はあるか

## 演習

1. ActionにINFOログを追加する
2. ServiceにDEBUGログを追加する
3. 例外発生時にERRORログを出す
4. パスワードをログに出さない理由を説明する
5. ログ出力方針を表にまとめる

# 22. REST API連携編

## 目的

Strutsアプリケーションから外部REST APIを呼び出す設計を学びます。

## REST API連携の利用例

- 郵便番号API
- 決済API
- 配送会社API
- 認証API
- 社内マスタAPI

## 設計方針

外部API呼び出しはActionに直接書きません。

```text
Action
  ↓
Service
  ↓
ApiClient
  ↓
External API
```

## 悪い例

```java
public String execute() {
    HttpClient client = HttpClient.newHttpClient();
    // API呼び出し処理を直接書く
    return SUCCESS;
}
```

## 良い例

```java
public class AddressService {
    private final ZipCodeApiClient apiClient;

    public AddressService(ZipCodeApiClient apiClient) {
        this.apiClient = apiClient;
    }
}
```

## タイムアウト

外部APIには必ずタイムアウトを設定します。

```java
HttpClient client = HttpClient.newBuilder()
    .connectTimeout(Duration.ofSeconds(5))
    .build();
```

## エラー処理

- タイムアウト
- 4xxエラー
- 5xxエラー
- JSON解析エラー
- ネットワーク障害

を想定します。

## 注意点

- APIキーをソースコードに書かない
- リトライ回数を制限する
- 障害時の代替動作を決める
- ログに機密情報を出さない
- レート制限を考慮する

## 演習

1. 郵便番号API連携を設計する
2. ApiClientクラスを作成する
3. タイムアウトを設定する
4. API障害時のエラー画面を設計する

# sample-struts-app

Apache Struts 学習教材用の最小構成サンプルアプリです。

## 構成

- Maven WAR プロジェクト
- Struts 6 系
- Java 17
- JSP
- Tomcat 10 系想定

## Eclipse での起動

1. Eclipse を開く
2. `File` → `Import` → `Maven` → `Existing Maven Projects`
3. この `sample-struts-app` ディレクトリを選択
4. `Maven` → `Update Project`
5. Tomcat に追加して起動
6. 以下へアクセス

```text
http://localhost:8080/sample-struts-app/hello
```

## 学習ポイント

- `web.xml` で Struts Filter を登録する
- `struts.xml` で URL と Action を対応付ける
- Action から Service を呼び出す
- JSP で Action のプロパティを表示する

# 02. Eclipse 開発環境構築

## 使用する開発環境

- Eclipse IDE for Enterprise Java and Web Developers
- Java 17 以上
- Maven
- Apache Tomcat
- Apache Struts 6 系

## 1. Eclipse をインストールする

Eclipse の公式サイトから `Eclipse IDE for Enterprise Java and Web Developers` をインストールします。

通常の Java 開発用 Eclipse ではなく、Web 開発機能を含む Enterprise 版を使用します。

## 2. JDK を設定する

```text
Window
  → Preferences
  → Java
  → Installed JREs
```

JDK 17 以上を登録し、チェックを入れます。

## 3. Tomcat を登録する

```text
Window
  → Preferences
  → Server
  → Runtime Environments
  → Add
  → Apache Tomcat
```
<img width="1288" height="925" alt="image" src="https://github.com/user-attachments/assets/5b1e1243-097b-4703-8661-2acafb1e9b90" />
<img width="633" height="677" alt="image" src="https://github.com/user-attachments/assets/69f8459e-38ab-4f89-b433-aa9201952e77" />
<img width="1289" height="930" alt="image" src="https://github.com/user-attachments/assets/3c97b64c-a38d-4cbb-aa72-97bb8c3960b6" />


Tomcat のインストール先を指定します。

## 4. Maven プロジェクトをインポートする

```text
File
  → Import
  → Maven
  → Existing Maven Projects
```

`sample-struts-app` を選択します。

## 5. Maven 依存関係を更新する

プロジェクトを右クリックします。

```text
Maven
  → Update Project
```

## 6. Tomcat で実行する

プロジェクトを右クリックします。

```text
Run As
  → Run on Server
```

## 7. 動作確認

ブラウザで以下にアクセスします。

```text
http://localhost:8080/sample-struts-app/hello
```

## よくあるエラー

### 404 Not Found

原因例:

- `web.xml` のフィルター設定が誤っている
- `struts.xml` が `src/main/resources` に存在しない
- コンテキストパスが想定と違う

### ClassNotFoundException

原因例:

- Maven 依存関係が取得できていない
- Tomcat のバージョンと Jakarta / Javax 系の依存が合っていない

### JSP が表示されない

原因例:

- JSP の配置場所が誤っている
- result のパスが間違っている
- サーバーにプロジェクトが正しくデプロイされていない

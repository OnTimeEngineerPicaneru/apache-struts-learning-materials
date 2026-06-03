# 18. ファイルアップロード編

## 目的

Strutsでファイルアップロードを実装する際の基本と、セキュリティ上の注意点を学びます。

## ファイルアップロードのリスク

- 不正な実行ファイルのアップロード
- 巨大ファイルによるDoS
- パストラバーサル
- ファイル名の偽装
- マルウェア混入
- 個人情報の漏えい

## フォーム例

```jsp
<s:form action="upload" method="post" enctype="multipart/form-data">
    <s:file name="upload" label="ファイル" />
    <s:submit value="アップロード" />
</s:form>
```

## Action例

```java
public class UploadAction extends ActionSupport {

    private File upload;
    private String uploadFileName;
    private String uploadContentType;

    public String execute() {
        // ファイル保存処理
        return SUCCESS;
    }

    public void setUpload(File upload) {
        this.upload = upload;
    }

    public void setUploadFileName(String uploadFileName) {
        this.uploadFileName = uploadFileName;
    }

    public void setUploadContentType(String uploadContentType) {
        this.uploadContentType = uploadContentType;
    }
}
```

## 保存時の注意

- 元のファイル名をそのまま使わない
- 拡張子を検証する
- MIMEタイプだけを信用しない
- 保存先をWeb公開ディレクトリ外にする
- 実行権限を付与しない
- サイズ制限を設ける

## ファイル名の生成例

```java
String extension = getExtension(uploadFileName);
String safeFileName = UUID.randomUUID().toString() + extension;
```

## 演習

1. 画像アップロード画面を作成する
2. 拡張子チェックを実装する
3. サイズ制限を実装する
4. 保存ファイル名をUUIDにする
5. Web公開ディレクトリ外に保存する理由を説明する

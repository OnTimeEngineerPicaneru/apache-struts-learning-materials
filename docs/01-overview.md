# 01. Apache Struts の概要

## Apache Struts とは

Apache Struts は、Java で Web アプリケーションを開発するための MVC フレームワークです。

Struts は、リクエストを受け取り、対応する処理クラスを実行し、結果に応じて画面へ遷移する仕組みを提供します。

## MVC との関係

Struts では、主に以下の役割に分かれます。

| 役割 | Struts における要素 | 説明 |
|---|---|---|
| Model | Service / DAO / Entity | 業務処理やデータアクセス |
| View | JSP | 画面表示 |
| Controller | Struts Filter / Action | リクエスト制御 |

## Struts の基本的な処理の流れ

```text
ブラウザ
  ↓
Struts Filter
  ↓
Action クラス
  ↓
Service クラス
  ↓
JSP
  ↓
ブラウザへレスポンス
```

## Struts の特徴

- 設定ファイル `struts.xml` による画面遷移管理
- Action クラスによるリクエスト処理
- JSP と連携した画面表示
- インターセプターによる共通処理
- バリデーション機能
- 業務システムでの利用実績

## Struts 1 と Struts 2 の違い

| 項目 | Struts 1 | Struts 2 / 6系 |
|---|---|---|
| 状態 | EOL | 現行系 |
| Action | ActionForm と密結合 | POJO ベース |
| 設定 | struts-config.xml | struts.xml |
| 新規開発 | 非推奨 | 学習対象 |
| 保守 | 公式サポートなし | バージョンにより対応 |

## 現在 Struts を学ぶ意味

現在の Java Web 開発では Spring Boot が主流です。しかし、業務システムでは今も Struts ベースのアプリケーションが残っています。

Struts を学ぶことで、以下を理解できます。

- Java Web アプリケーションの古典的な MVC 構造
- レガシーシステムの保守方法
- 設定ファイル中心の画面遷移設計
- Spring MVC との設計思想の違い
- 既存 Struts アプリからの移行方針

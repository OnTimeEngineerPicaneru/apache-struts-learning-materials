# 在庫管理システム設計書

## 画面一覧

| 画面 | URL |
|---|---|
| 商品一覧 | /product/list |
| 倉庫一覧 | /warehouse/list |
| 在庫一覧 | /stock/list |
| 入庫 | /stock/in |
| 出庫 | /stock/out |
| 在庫移動 | /stock/transfer |
| 在庫履歴 | /stock/movement/list |

## 主要Service

| Service | 役割 |
|---|---|
| ProductService | 商品管理 |
| WarehouseService | 倉庫管理 |
| StockService | 入庫、出庫、移動 |
| OperationLogService | 操作ログ記録 |

## 排他制御

在庫更新では、同時更新による不整合を防ぐため、以下のいずれかを採用します。

- `select ... for update` による悲観ロック
- `version` カラムによる楽観ロック

## 業務エラー

- 在庫不足
- 存在しない商品
- 存在しない倉庫
- 停止中商品の更新

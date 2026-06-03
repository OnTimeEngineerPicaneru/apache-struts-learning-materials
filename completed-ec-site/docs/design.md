# ECサイト設計書

## 画面一覧

| 画面 | URL |
|---|---|
| 商品一覧 | /product/list |
| 商品詳細 | /product/detail |
| カート | /cart |
| 注文確認 | /order/confirm |
| 注文完了 | /order/complete |
| 注文履歴 | /order/history |
| 商品管理 | /admin/product/list |

## 主要Service

| Service | 役割 |
|---|---|
| ProductService | 商品検索、商品詳細 |
| CartService | カート操作 |
| OrderService | 注文確定、履歴取得 |
| AdminProductService | 管理者商品管理 |

## トランザクション境界

注文確定処理は、在庫確認、注文登録、注文明細登録、在庫更新を1トランザクションで実行します。

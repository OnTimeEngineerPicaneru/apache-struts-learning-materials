# 会員管理システム設計書

## 画面一覧

| 画面 | URL | JSP |
|---|---|---|
| ログイン | /login | login.jsp |
| 会員一覧 | /member/list | member-list.jsp |
| 会員詳細 | /member/detail | member-detail.jsp |
| 会員登録 | /member/create | member-form.jsp |
| 会員編集 | /member/edit | member-form.jsp |
| 会員削除確認 | /member/delete-confirm | member-delete-confirm.jsp |
| 完了 | /member/complete | complete.jsp |

## Action一覧

| Action | 役割 |
|---|---|
| LoginAction | ログイン処理 |
| LogoutAction | ログアウト処理 |
| MemberListAction | 会員一覧・検索 |
| MemberDetailAction | 会員詳細 |
| MemberCreateAction | 会員登録 |
| MemberEditAction | 会員編集 |
| MemberDeleteAction | 会員削除 |

## 入力チェック

| 項目 | チェック |
|---|---|
| name | 必須、100文字以内 |
| email | 必須、メール形式、一意制約 |
| phone | 30文字以内 |
| status | ACTIVE / INACTIVE |

## 権限

| ロール | 操作 |
|---|---|
| ADMIN | 全操作 |
| STAFF | 一覧、詳細、登録、編集 |
| VIEWER | 一覧、詳細 |

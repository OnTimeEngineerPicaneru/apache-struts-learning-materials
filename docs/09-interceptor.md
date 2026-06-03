# 09. Interceptor編

## 目的

Interceptorを使い、ログ出力、認証チェック、共通処理をActionから分離できるようにします。

## Interceptorとは

Interceptorは、Actionの前後に共通処理を差し込む仕組みです。

例:

```text
リクエスト
  ↓
Interceptor
  ↓
Action
  ↓
Interceptor
  ↓
レスポンス
```

## 利用例

- ログ出力
- 認証チェック
- 権限チェック
- トランザクション管理
- パラメータ変換
- 例外処理

## Interceptorの実装例

```java
package com.example.struts.interceptor;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.Interceptor;

public class LoggingInterceptor implements Interceptor {

    public void init() {
    }

    public String intercept(ActionInvocation invocation) throws Exception {
        String actionName = invocation.getAction().getClass().getName();
        System.out.println("Before: " + actionName);

        String result = invocation.invoke();

        System.out.println("After: " + actionName + ", result=" + result);
        return result;
    }

    public void destroy() {
    }
}
```

## struts.xmlへの登録

```xml
<package name="default" namespace="/" extends="struts-default">

    <interceptors>
        <interceptor name="logging" class="com.example.struts.interceptor.LoggingInterceptor" />
        <interceptor-stack name="appStack">
            <interceptor-ref name="logging" />
            <interceptor-ref name="defaultStack" />
        </interceptor-stack>
    </interceptors>

    <default-interceptor-ref name="appStack" />

</package>
```

## 認証チェックの設計

認証チェックは各Actionに書かず、Interceptorへ集約します。

```text
未ログイン → login画面へ
ログイン済 → Action実行
```

## 注意点

- Interceptorに業務ロジックを書かない
- 共通処理だけを扱う
- 実行順序を意識する
- 例外処理方針を統一する

## 演習

1. LoggingInterceptorを作成する
2. Action実行前後にログを出力する
3. ログインチェックInterceptorを設計する
4. 管理者権限チェックInterceptorを設計する

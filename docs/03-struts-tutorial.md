# 03. Apache Struts 開発チュートリアル

## この章の目標

簡単な Struts アプリケーションを作成し、以下を理解します。

- Struts のリクエスト処理
- Action クラス
- `struts.xml`
- JSP への遷移
- Service クラスとの分離

## 完成イメージ

ブラウザで `/hello` にアクセスすると、次のメッセージを表示します。

```text
Hello, Apache Struts!
```

## 1. pom.xml に Struts を追加する

```xml
<dependency>
    <groupId>org.apache.struts</groupId>
    <artifactId>struts2-core</artifactId>
    <version>6.10.0</version>
</dependency>
```

## 2. web.xml を作成する

```xml
<filter>
    <filter-name>struts2</filter-name>
    <filter-class>org.apache.struts2.dispatcher.filter.StrutsPrepareAndExecuteFilter</filter-class>
</filter>

<filter-mapping>
    <filter-name>struts2</filter-name>
    <url-pattern>/*</url-pattern>
</filter-mapping>
```

## 3. Service クラスを作成する

```java
package com.example.struts.service;

public class GreetingService {

    public String createMessage() {
        return "Hello, Apache Struts!";
    }
}
```

## 4. Action クラスを作成する

```java
package com.example.struts.action;

import com.example.struts.service.GreetingService;

public class HelloAction {

    private String message;

    public String execute() {
        GreetingService service = new GreetingService();
        this.message = service.createMessage();
        return "success";
    }

    public String getMessage() {
        return message;
    }
}
```

## 5. struts.xml を作成する

`src/main/resources/struts.xml` を作成します。

```xml
<!DOCTYPE struts PUBLIC
    "-//Apache Software Foundation//DTD Struts Configuration 6.0//EN"
    "https://struts.apache.org/dtds/struts-6.0.dtd">

<struts>
    <package name="default" namespace="/" extends="struts-default">

        <action name="hello" class="com.example.struts.action.HelloAction">
            <result name="success">/index.jsp</result>
        </action>

    </package>
</struts>
```

## 6. JSP を作成する

```jsp
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Struts Tutorial</title>
</head>
<body>
    <h1>Apache Struts Tutorial</h1>
    <p>${message}</p>
</body>
</html>
```

## 7. 実行する

Eclipse で Tomcat を起動し、以下にアクセスします。

```text
http://localhost:8080/sample-struts-app/hello
```

## 学習ポイント

### Action は Controller の役割

Action クラスは、リクエストを受け取り、処理結果に応じて画面遷移を決定します。

### Service に業務処理を分離する

Action にすべての処理を書くと、大規模化したときに保守が困難になります。

悪い例:

```java
public String execute() {
    // DBアクセス、計算、画面制御をすべてここに書く
    return "success";
}
```

良い例:

```java
public String execute() {
    message = greetingService.createMessage();
    return "success";
}
```

## 追加演習

1. `/goodbye` にアクセスすると `Goodbye, Struts!` と表示する
2. 名前を入力し、`Hello, 〇〇!` と表示する
3. Service クラスをインターフェース化する
4. Action に入力値チェックを追加する

<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>会員一覧</title>
</head>
<body>
    <h1>会員一覧</h1>

    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>氏名</th>
                <th>メールアドレス</th>
                <th>電話番号</th>
                <th>ステータス</th>
                <th>詳細</th>
            </tr>
        </thead>
        <tbody>
            <s:iterator value="members">
                <tr>
                    <td><s:property value="id" /></td>
                    <td><s:property value="name" /></td>
                    <td><s:property value="email" /></td>
                    <td><s:property value="phone" /></td>
                    <td><s:property value="status" /></td>
                    <td><a href="member/detail?id=<s:property value='id' />">詳細</a></td>
                </tr>
            </s:iterator>
        </tbody>
    </table>

    <p><a href="hello">Helloサンプルへ戻る</a></p>
</body>
</html>

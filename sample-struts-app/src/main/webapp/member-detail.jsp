<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html>
<html lang="ja">
<head>
    <meta charset="UTF-8">
    <title>会員詳細</title>
</head>
<body>
    <h1>会員詳細</h1>

    <dl>
        <dt>ID</dt>
        <dd><s:property value="member.id" /></dd>
        <dt>氏名</dt>
        <dd><s:property value="member.name" /></dd>
        <dt>メールアドレス</dt>
        <dd><s:property value="member.email" /></dd>
        <dt>電話番号</dt>
        <dd><s:property value="member.phone" /></dd>
        <dt>ステータス</dt>
        <dd><s:property value="member.status" /></dd>
    </dl>

    <p><a href="list">一覧へ戻る</a></p>
</body>
</html>

# 23. Spring連携編

## 目的

StrutsとSpringを連携し、DIコンテナによるService管理やRepository管理を行う設計を学びます。

## なぜSpringと連携するか

StrutsはWeb MVC部分を担当し、SpringはDI、トランザクション管理、Service管理を担当できます。

```text
Struts Action
  ↓
Spring Bean Service
  ↓
Spring Bean Repository
```

## 連携のメリット

- DIが使いやすい
- ServiceをBean管理できる
- トランザクション管理を統一できる
- テストしやすくなる
- StrutsからSpring Bootへの移行準備になる

## 設計方針

- Actionは薄くする
- 業務ロジックはSpring管理のServiceに置く
- RepositoryもSpring管理にする
- トランザクションはService層で扱う

## Actionの役割

```java
public class MemberListAction {

    private MemberService memberService;
    private List<Member> members;

    public String execute() {
        members = memberService.findAll();
        return "success";
    }

    public void setMemberService(MemberService memberService) {
        this.memberService = memberService;
    }
}
```

## 注意点

- StrutsとSpringの責務を混ぜない
- Actionに業務ロジックを書かない
- Bean名とAction設定の対応を明確にする
- トランザクション境界をServiceに寄せる

## 演習

1. ServiceをSpring Beanとして設計する
2. ActionからServiceを呼び出す
3. RepositoryをSpring Bean化する
4. トランザクション境界をServiceに置く理由を説明する

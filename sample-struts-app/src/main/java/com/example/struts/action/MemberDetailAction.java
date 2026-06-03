package com.example.struts.action;

import com.example.struts.model.Member;
import com.example.struts.service.MemberService;

public class MemberDetailAction {

    private final MemberService memberService = new MemberService();
    private int id;
    private Member member;

    public String execute() {
        member = memberService.findById(id);
        if (member == null) {
            return "notFound";
        }
        return "success";
    }

    public void setId(int id) {
        this.id = id;
    }

    public Member getMember() {
        return member;
    }
}

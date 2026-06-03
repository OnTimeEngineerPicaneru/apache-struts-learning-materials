package com.example.struts.action;

import java.util.List;

import com.example.struts.model.Member;
import com.example.struts.service.MemberService;

public class MemberListAction {

    private final MemberService memberService = new MemberService();
    private List<Member> members;

    public String execute() {
        members = memberService.findAll();
        return "success";
    }

    public List<Member> getMembers() {
        return members;
    }
}

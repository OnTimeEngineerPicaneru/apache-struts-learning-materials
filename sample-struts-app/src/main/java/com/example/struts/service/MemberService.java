package com.example.struts.service;

import java.util.List;

import com.example.struts.model.Member;
import com.example.struts.repository.InMemoryMemberRepository;
import com.example.struts.repository.MemberRepository;

public class MemberService {

    private final MemberRepository memberRepository;

    public MemberService() {
        this(new InMemoryMemberRepository());
    }

    public MemberService(MemberRepository memberRepository) {
        this.memberRepository = memberRepository;
    }

    public List<Member> findAll() {
        return memberRepository.findAll();
    }

    public Member findById(int id) {
        return memberRepository.findById(id);
    }
}

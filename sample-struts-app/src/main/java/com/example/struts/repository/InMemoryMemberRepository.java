package com.example.struts.repository;

import java.util.ArrayList;
import java.util.List;

import com.example.struts.model.Member;

public class InMemoryMemberRepository implements MemberRepository {

    private final List<Member> members = new ArrayList<>();

    public InMemoryMemberRepository() {
        members.add(new Member(1, "山田太郎", "yamada@example.com", "090-1111-1111", "ACTIVE"));
        members.add(new Member(2, "佐藤花子", "sato@example.com", "090-2222-2222", "ACTIVE"));
        members.add(new Member(3, "鈴木一郎", "suzuki@example.com", "090-3333-3333", "INACTIVE"));
    }

    @Override
    public List<Member> findAll() {
        return new ArrayList<>(members);
    }

    @Override
    public Member findById(int id) {
        return members.stream()
                .filter(member -> member.getId() == id)
                .findFirst()
                .orElse(null);
    }
}

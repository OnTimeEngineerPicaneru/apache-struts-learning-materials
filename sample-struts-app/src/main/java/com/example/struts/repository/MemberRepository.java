package com.example.struts.repository;

import java.util.List;

import com.example.struts.model.Member;

public interface MemberRepository {

    List<Member> findAll();

    Member findById(int id);
}

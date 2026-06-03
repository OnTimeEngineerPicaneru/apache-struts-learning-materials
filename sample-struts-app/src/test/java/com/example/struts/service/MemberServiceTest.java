package com.example.struts.service;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNull;
import static org.mockito.Mockito.mock;
import static org.mockito.Mockito.verify;
import static org.mockito.Mockito.when;

import java.util.List;

import org.junit.jupiter.api.Test;

import com.example.struts.model.Member;
import com.example.struts.repository.MemberRepository;

class MemberServiceTest {

    @Test
    void findAll_returnsMembersFromRepository() {
        MemberRepository repository = mock(MemberRepository.class);
        when(repository.findAll()).thenReturn(List.of(
                new Member(1, "山田太郎", "yamada@example.com", "090-1111-1111", "ACTIVE")));

        MemberService service = new MemberService(repository);

        List<Member> members = service.findAll();

        assertEquals(1, members.size());
        assertEquals("山田太郎", members.get(0).getName());
        verify(repository).findAll();
    }

    @Test
    void findById_returnsNull_whenMemberDoesNotExist() {
        MemberRepository repository = mock(MemberRepository.class);
        when(repository.findById(999)).thenReturn(null);

        MemberService service = new MemberService(repository);

        Member member = service.findById(999);

        assertNull(member);
        verify(repository).findById(999);
    }
}

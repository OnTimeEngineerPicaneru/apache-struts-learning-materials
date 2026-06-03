package com.example.struts.repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.example.struts.model.Member;

public class JdbcMemberRepository implements MemberRepository {

    private static final String URL = "jdbc:postgresql://localhost:5432/struts_db";
    private static final String USER = "struts_user";
    private static final String PASSWORD = "struts_pass";

    @Override
    public List<Member> findAll() {
        String sql = "select id, name, email, phone, status from members order by id";
        List<Member> members = new ArrayList<>();

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql);
             ResultSet resultSet = statement.executeQuery()) {

            while (resultSet.next()) {
                members.add(mapToMember(resultSet));
            }
        } catch (SQLException e) {
            throw new IllegalStateException("会員一覧の取得に失敗しました。", e);
        }

        return members;
    }

    @Override
    public Member findById(int id) {
        String sql = "select id, name, email, phone, status from members where id = ?";

        try (Connection connection = DriverManager.getConnection(URL, USER, PASSWORD);
             PreparedStatement statement = connection.prepareStatement(sql)) {

            statement.setInt(1, id);

            try (ResultSet resultSet = statement.executeQuery()) {
                if (resultSet.next()) {
                    return mapToMember(resultSet);
                }
            }
        } catch (SQLException e) {
            throw new IllegalStateException("会員詳細の取得に失敗しました。", e);
        }

        return null;
    }

    private Member mapToMember(ResultSet resultSet) throws SQLException {
        Member member = new Member();
        member.setId(resultSet.getInt("id"));
        member.setName(resultSet.getString("name"));
        member.setEmail(resultSet.getString("email"));
        member.setPhone(resultSet.getString("phone"));
        member.setStatus(resultSet.getString("status"));
        return member;
    }
}

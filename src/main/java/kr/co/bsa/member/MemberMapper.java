package kr.co.bsa.member;

import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MemberMapper {
    public void insert(Member member);
    public List<Member> selectAll();
    public Member select(Member member);
    public void update(Member member);
}
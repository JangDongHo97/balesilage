package kr.co.bsa.member;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberMapper {
    public void insert(Member member);
    public Member select(Member member);
    public void update(Member member);
}
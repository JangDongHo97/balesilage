package kr.co.bsa.member;

import java.util.List;

public interface MemberMapper {
    public void insert(Member member);
    public List<Member> selectAll();
    public Member select(Member member);
    public void update(Member member);
}
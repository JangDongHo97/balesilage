package kr.co.bsa.member;

import java.util.List;

public interface MemberService {
    public void insertMember(Member member);
    public List<Member> selectMemberList();
    public Member selectMember(Member member);
    public void updateMember(Member member);
    public void deleteMember(Member member);
}

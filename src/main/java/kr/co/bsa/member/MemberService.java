package kr.co.bsa.member;

public interface MemberService {
    public void insertMember(Member member);
    public Member selectMember(Member member);
    public void updateMember(Member member);
    public void deleteMember(Member member);
}

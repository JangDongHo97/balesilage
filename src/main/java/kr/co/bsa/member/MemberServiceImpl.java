package kr.co.bsa.member;

import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void insertMember(Member member) {
        memberMapper.insert(member);
    }

    @Override
    public List<Member> selectMemberList() {
        List<Member> members = memberMapper.select();
        return members;
    }

    @Override
    public Member selectMember(Member member) {
        member = memberMapper.select(member);
        return member;
    }

    @Override
    public void updateMember(Member member) {
        memberMapper.update(member);
    }

    @Override
    public void deleteMember(Member member) {
        //회원 수정을 통한 회원 탈퇴 진행 (회원 삭제 x)
        member.setMemberStatus('N');
        memberMapper.update(member);
    }
}

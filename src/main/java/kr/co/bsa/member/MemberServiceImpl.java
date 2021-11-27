package kr.co.bsa.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MemberServiceImpl implements MemberService{
    @Autowired
    private MemberMapper memberMapper;

    @Override
    public void insertMember(Member member) {

    }

    @Override
    public List<Member> selectMemberList() {
        System.out.println("service -----");
        List<Member> members =  memberMapper.select();
        return members;
    }

    @Override
    public Member selectMember(Member member) {
        return null;
    }

    @Override
    public void updateMember(Member member) {

    }

    @Override
    public void deleteMember(Member member) {

    }
}

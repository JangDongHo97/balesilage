package kr.co.bsa.member;

import kr.co.bsa.silage.Silage;
import kr.co.bsa.silage.SilageMapper;
import org.springframework.stereotype.Service;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

@Service
public class MemberServiceImpl implements MemberService {
    @Autowired
    private MemberMapper memberMapper;

    @Autowired
    private SilageMapper silageMapper;

    @Override
    @Transactional
    public void insertMember(Member member) {
        memberMapper.insert(member);
    }

    @Override
    @Transactional
    public Member selectMember(Member member) {
        member = memberMapper.select(member);
        if (member != null) {
            member.setAddress(member.getAddress().trim());
        }

        return member;
    }

    @Override
    @Transactional
    public void updateMember(Member member) {
        memberMapper.update(member);
    }

    @Override
    @Transactional
    public void deleteMember(Member member) {
        member.setMemberStatus('N');
        memberMapper.update(member);

        Silage silage = new Silage();
        silage.setSellerCode(member.getMemberCode());
        silageMapper.delete(silage);
    }
}

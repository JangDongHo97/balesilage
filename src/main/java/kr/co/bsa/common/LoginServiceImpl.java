package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import kr.co.bsa.member.MemberMapper;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
public class LoginServiceImpl implements LoginService{
    @Autowired
    private MemberMapper memberMapper;

    @Transactional
    @Override
    public Member login(Member member) {
        List<Member> members = memberMapper.select();

        for (int i = 0; i < members.size(); i ++ ) {
            //id, password 검증
            if (members.get(i).getId().equals(member.getId()) &&
                    members.get(i).getPassword().equals(member.getPassword())) {
                member = members.get(i);
                return member;
            }
        }
        return null;
    }

    @Override
    public boolean auth(Member member) {
        Member afterMember = memberMapper.select(member);
        if (afterMember.getPassword().equals(member.getPassword())) {
            return true;
        }
        return false;
    }
}

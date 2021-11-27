package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import kr.co.bsa.member.MemberMapper;
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
    public char login(Member member) {
        List<Member> members = memberMapper.selectAll();

        for (int i = 0; i < members.size(); i ++ ) {
            //id, password 검증
            if (members.get(i).getId().equals(member.getId()) &&
                    members.get(i).getPassword().equals(member.getPassword())) {
                return member.getMemberStatus();
            }
        }
        return 0;
    }
}

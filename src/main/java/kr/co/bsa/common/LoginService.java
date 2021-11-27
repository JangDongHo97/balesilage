package kr.co.bsa.common;

import kr.co.bsa.member.Member;
import org.springframework.stereotype.Service;

public interface LoginService {
    public char login(Member member);
}

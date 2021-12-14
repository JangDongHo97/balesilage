package kr.co.bsa.common;

import kr.co.bsa.member.Member;

public interface LoginService {
    public Member login(Member member);

    public boolean auth(Member member);
}

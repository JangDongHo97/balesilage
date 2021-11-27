package kr.co.bsa.member;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Mapper
public interface MemberMapper {
    public void insert(Member member);
    public List<Member> select();
    public Member select(Member member);
    public void update(Member member);
}
package kr.co.bsa.account;

public interface AccountMapper {
    public void insert(Account account);
    public Account select(Account account);
    public void update(Account account);
}

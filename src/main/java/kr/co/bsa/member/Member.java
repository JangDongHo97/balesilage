package kr.co.bsa.member;

import java.io.Serializable;

public class Member implements Serializable {
    private String memberCode;
    private String id;
    private String password;
    private String name;
    private String phone;
    private String address;
    private char memberStatus;

    public Member() {
    }

    public String getMemberCode() {
        return memberCode;
    }

    public void setMemberCode(String memberCode) {
        this.memberCode = memberCode;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public char getMemberStatus() {
        return memberStatus;
    }

    public void setMemberStatus(char memberStatus) {
        this.memberStatus = memberStatus;
    }

    @Override
    public String toString() {
        return "Member{" +
                "memberCode='" + memberCode + '\'' +
                ", id='" + id + '\'' +
                ", password='" + password + '\'' +
                ", name='" + name + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", memberStatus=" + memberStatus +
                '}';
    }
}

package kr.co.bsa.common;

import java.io.Serializable;

public class Condition implements Serializable {
    private int silageCode;
    private int sellerCode;
    private int buyerCode;
    private int transactionCode;
    private String id;
    private String startDate;
    private String endDate;
    private char transactionStatus;
    private String orderStandard;
    private int pageNo;

    public Condition() {
    }

    public int getSilageCode() {
        return silageCode;
    }

    public void setSilageCode(int silageCode) {
        this.silageCode = silageCode;
    }

    public int getSellerCode() {
        return sellerCode;
    }

    public void setSellerCode(int sellerCode) {
        this.sellerCode = sellerCode;
    }

    public int getBuyerCode() {
        return buyerCode;
    }

    public void setBuyerCode(int buyerCode) {
        this.buyerCode = buyerCode;
    }

    public int getTransactionCode() {
        return transactionCode;
    }

    public void setTransactionCode(int transactionCode) {
        this.transactionCode = transactionCode;
    }

    public int getPageNo() {
        return pageNo;
    }

    public void setPageNo(int pageNo) {
        this.pageNo = pageNo;
    }

    public String getOrderStandard() {
        return orderStandard;
    }

    public void setOrderStandard(String orderStandard) {
        this.orderStandard = orderStandard;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public char getTransactionStatus() {
        return transactionStatus;
    }

    public void setTransactionStatus(char transactionStatus) {
        this.transactionStatus = transactionStatus;
    }

    public String getStartDate() {
        return startDate;
    }

    public void setStartDate(String startDate) {
        this.startDate = startDate;
    }

    public String getEndDate() {
        return endDate;
    }

    public void setEndDate(String endDate) {
        this.endDate = endDate;
    }

    @Override
    public String toString() {
        return "DateCommand{" +
                "silageCode=" + silageCode +
                ", sellerCode=" + sellerCode +
                ", buyerCode=" + buyerCode +
                ", transactionCode=" + transactionCode +
                ", startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", id='" + id + '\'' +
                ", transactionStatus=" + transactionStatus +
                ", orderStandard='" + orderStandard + '\'' +
                ", pageNo=" + pageNo +
                '}';
    }
}

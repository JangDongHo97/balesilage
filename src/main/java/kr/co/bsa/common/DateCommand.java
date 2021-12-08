package kr.co.bsa.common;

import java.io.Serializable;

public class DateCommand implements Serializable {
    private String startDate;
    private String endDate;
    private String id;
    private char transactionStatus;
    private String orderStandard;
    private int pageNo;

    public DateCommand() {
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
                "startDate='" + startDate + '\'' +
                ", endDate='" + endDate + '\'' +
                ", id='" + id + '\'' +
                ", transactionStatus='" + transactionStatus + '\'' +
                ", orderStandard='" + orderStandard + '\'' +
                ", pageNo=" + pageNo +
                '}';
    }
}

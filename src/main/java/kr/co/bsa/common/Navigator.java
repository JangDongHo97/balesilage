package kr.co.bsa.common;

import org.springframework.stereotype.Component;

@Component
public class Navigator {
    public String getNavigator(int allNo, int pageNo) {
        StringBuffer navigator = new StringBuffer("");
        if (pageNo == 0) {
            navigator.append("<td class='pager'><a class='disable' id = 'firstPage' ");
        } else {
            navigator.append("<td class='pager'><a id = 'firstPage' ");
        }

        navigator.append("href='#' ");
        navigator.append("onclick='changePage(" + 0 + ")'>&laquo;&nbsp;&nbsp;&nbsp;&nbsp;</a></td> ");
        if ((pageNo / 5) == 0) {
            navigator.append("<td class='pager' >");
            navigator.append("<a href='#' class='disable' id='backPage' ");
        } else {
            navigator.append("<td class='pager'>");
            navigator.append("<a href='#' id='backPage' ");
        }
        navigator.append(" onclick='changePage(" + (((pageNo / 5) * 5) - 5) + ")'>&lt;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>");

        int endPageNo = 0;
        if (((allNo - 1) / 10) + 1 < ((pageNo / 5) * 5) + 5) {
            endPageNo = (allNo - 1) / 10 + 1;
        } else {
            endPageNo = ((pageNo / 5) * 5) + 5;
        }

        int count = 1;
        for (int i = ((pageNo / 5) * 5); i < endPageNo; i++) {
            if (pageNo == i) {
                navigator.append("<td class='active'><a href='#' onclick='changePage(" + i + ")'");
            } else {
                navigator.append("<td class=''><a href='#' onclick='changePage(" + i + ")'");
            }
            navigator.append(" >" + (i + 1) + "&nbsp;&nbsp;&nbsp;&nbsp;</a></td>");
        }

        if (endPageNo < (allNo - 1) / 10 + 1) {
            navigator.append("<td class='pager' id='datatable_next'>");
            navigator.append("        <a id='nextPage' onclick='changePage(" + (((pageNo / 5) * 5) + 5) + ")'");
        } else {
            navigator.append("<td class='pager' id='datatable_next'>");
            navigator.append("        <a id='nextPage' class='disable' onclick='changePage(" + (((pageNo / 5) * 5) + 5) + ")'");
        }
        navigator.append("        href='#' ");
        navigator.append(" >&gt;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>");
        if (pageNo < (allNo - 1) / 10) {
            navigator.append("<td class='pager'>");
            navigator.append("<a id='lastPage' onclick='changePage(" + ((allNo - 1) / 10) + ")' ");
        } else {
            navigator.append("<td class='pager'>");
            navigator.append("<a id='lastPage' class='disable' onclick='changePage(" + ((allNo - 1) / 10) + ")' ");
        }
        navigator.append("href='#' ");
        navigator.append(">&raquo;&nbsp;&nbsp;&nbsp;&nbsp;</a></td>");

        return navigator.toString();
    }
}

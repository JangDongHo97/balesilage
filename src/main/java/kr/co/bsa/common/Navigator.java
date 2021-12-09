package kr.co.bsa.common;

import org.springframework.stereotype.Component;

@Component
public class Navigator {
    public String getNavigator(int allNo, int pageNo) {
        StringBuffer navigator = new StringBuffer("");

        navigator.append("<div id='pagingHtml'><table><tbody><tr>");
        if (pageNo== 0) {
            navigator.append("<a class='disable' id = 'firstPage' ");
        } else {
            navigator.append("<a id = 'firstPage' ");
        }
        navigator.append("href='#' ");
        navigator.append("onclick='changePage(" + 0 + ")'><td>&laquo;&nbsp;&nbsp;&nbsp;&nbsp;</td></a>");
        if ((pageNo / 5) == 0) {
            navigator.append("<a href='#' class='disable' id='backPage' ");
        } else {
            navigator.append("<a href='#' id='backPage' ");
        }
        navigator.append(" onclick='changePage(" + (((pageNo / 5) * 5) - 5) + ")'><td>&lt;&nbsp;&nbsp;&nbsp;&nbsp;</td></a>");

        int endPageNo = 0;
        if (((allNo - 1) / 10) + 1 < ((pageNo / 5) * 5) + 5) {
            endPageNo = (allNo - 1) / 10 + 1;
        } else {
            endPageNo = ((pageNo / 5) * 5) + 5;
        }

        int count = 1;
        for (int i = ((pageNo / 5) * 5); i < endPageNo; i++) {
            if (pageNo == i) {
                navigator.append("<a href='#' onclick='changePage(" + i + ")><td class='active'");
            } else {
                navigator.append("<a href='#' onclick='changePage(\" + i + \")><td");
            }
            navigator.append(">" + (i + 1) + " &nbsp;&nbsp;&nbsp;&nbsp;</td></a>");
        }
        if (endPageNo < (allNo - 1) / 10 + 1) {
            navigator.append("        <a id='nextPage' onclick='changePage(" + (((pageNo / 5) * 5) + 5) + ")'");
        } else {
            navigator.append("        <a id='nextPage' class='disable' onclick='changePage(" + (((pageNo / 5) * 5) + 5) + ")'");
        }
        navigator.append("        href='#' ");
        navigator.append(" ><td>&gt;&nbsp;&nbsp;&nbsp;&nbsp;</td></a>");
        if (pageNo < (allNo - 1) / 10) {
            navigator.append("<a id='lastPage' onclick='changePage(" + ((allNo - 1) / 10) + ")' ");
        } else {
            navigator.append("<a id='lastPage' class='disable' onclick='changePage(" + ((allNo - 1) / 10) + ")' ");
        }
        navigator.append("href='#' ");
        navigator.append("><td>&raquo;&nbsp;&nbsp;&nbsp;&nbsp;</td></a>");

        navigator.append("</tr></tbody></table></div>");

        return navigator.toString();
    }
}

<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<% request.setCharacterEncoding("utf-8"); %>
<h2>While문 예제 - 임의의 값을 임의의 회수로 곱하기</h2>
<%
    int number = Integer.parseInt(request.getParameter("number"));
    int num = Integer.parseInt(request.getParameter("num"));
    long multiply = 1;
    int count = 0;

    while(count<num) {
        multiply *=number;
        count++;
        }
%>
결과 : <%=multiply%>
p131_whileTestForm
p131_whileTestForm.jsp
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<meta name="viewport" content="width=device-width,initial-scale=1.0"/>
<h2>While문 예제 - 임의의 값을 임의의 횟수로 곱하기</h2>
<form method="post"action="p131_whileTest.jsp">
<dl>
<dd>
    <label for="number">곱해질 값:</label>
</dd>
<dd>
    <label for="num">곱해질 횟수:</label>
    <input type="number" name = "num" required>
</dd>
    <dd>
    <input type="submit" value="확인">
    </dd>
</dl>
</form>
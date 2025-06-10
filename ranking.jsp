
<%@ page import="java.sql.*" %>
<%@ include file="db.jsp" %>
<%@ page contentType="text/html; charset=UTF-8" %>
<h2>랭킹 TOP 10</h2>
<table border="1">
    <tr><th>순위</th><th>닉네임</th><th>최고점수</th></tr>
<%
    String sql = "SELECT u.nickname, MAX(s.score) AS best_score " +
                 "FROM scores s JOIN users u ON u.user_id = s.user_id " +
                 "GROUP BY s.user_id ORDER BY best_score DESC LIMIT 10";
    PreparedStatement pstmt = conn.prepareStatement(sql);
    ResultSet rs = pstmt.executeQuery();

    int rank = 1;
    while(rs.next()) {
        String nick = rs.getString("nickname");
        int score = rs.getInt("best_score");
%>
    <tr>
        <td><%= rank++ %></td>
        <td><%= nick %></td>
        <td><%= score %></td>
    </tr>
<%
    }
    rs.close();
    pstmt.close();
    conn.close();
%>
</table>

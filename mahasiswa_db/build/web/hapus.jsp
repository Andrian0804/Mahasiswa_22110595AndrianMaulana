<%@ page import="java.sql.*" %>
<%! 
    String dbURL = "jdbc:mysql://localhost:3306/mahasiswa_db";
    String dbUser = "root";
    String dbPass = "";
%>
<%
    String id = request.getParameter("id");
    if (id != null) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            PreparedStatement ps = conn.prepareStatement("DELETE FROM mahasiswa WHERE id=?");
            ps.setInt(1, Integer.parseInt(id));
            ps.executeUpdate();
            ps.close(); conn.close();
        } catch (Exception e) {
            out.println("Gagal hapus: " + e.getMessage());
        }
    }
    response.sendRedirect("index.jsp");
%>
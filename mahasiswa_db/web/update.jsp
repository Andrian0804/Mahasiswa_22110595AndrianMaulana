<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String dbURL = "jdbc:mysql://localhost:3306/mahasiswa_db";
    String dbUser = "root";
    String dbPass = "";
%>
<%
    String id = request.getParameter("id");
    String nim = "", nama = ""; int nilai = 0;

    // Load data existing
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
        Statement st = conn.createStatement();
        ResultSet rs = st.executeQuery("SELECT * FROM mahasiswa WHERE id=" + id);
        if(rs.next()) {
            nim = rs.getString("nim");
            nama = rs.getString("nama");
            nilai = rs.getInt("nilai");
        }
        rs.close(); st.close(); conn.close();
    } catch (Exception e) {
        out.println("Gagal: " + e.getMessage());
    }

    // Proses update
    String newNama = request.getParameter("nama");
    if(newNama != null){
        try {
            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
            String sql = "UPDATE mahasiswa SET nim=?, nama=?, nilai=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, request.getParameter("nim"));
            ps.setString(2, newNama);
            ps.setInt(3, Integer.parseInt(request.getParameter("nilai")));
            ps.setInt(4, Integer.parseInt(id));
            ps.executeUpdate();
            ps.close(); conn.close();
            response.sendRedirect("index.jsp");
        } catch (Exception e) {
            out.println("Gagal update: " + e.getMessage());
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Mahasiswa</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <div class="container mt-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-warning text-dark">
                        <h5 class="mb-0">Edit Mahasiswa</h5>
                    </div>
                    <div class="card-body">
                        <form method="post">
                            <div class="mb-3">
                                <label for="nim" class="form-label">NIM</label>
                                <input type="text" class="form-control" id="nim" name="nim" value="<%= nim %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="nama" class="form-label">Nama</label>
                                <input type="text" class="form-control" id="nama" name="nama" value="<%= nama %>" required>
                            </div>
                            <div class="mb-3">
                                <label for="nilai" class="form-label">Nilai</label>
                                <input type="number" class="form-control" id="nilai" name="nilai" value="<%= nilai %>" required>
                            </div>
                            <div class="d-flex justify-content-between">
                                <a href="index.jsp" class="btn btn-secondary">Batal</a>
                                <button type="submit" class="btn btn-success">Simpan Perubahan</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
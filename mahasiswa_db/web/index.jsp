<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%!
    String dbURL = "jdbc:mysql://localhost:3306/mahasiswa_db";
    String dbUser = "root";
    String dbPass = "";
%>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <title>Data Mahasiswa</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS & Icons -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet">
    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Inter', sans-serif;
            background-color: #f1f3f6;
            color: #333;
        }
        .navbar-brand {
            font-weight: 600;
            font-size: 1.3rem;
        }
        .table-hover tbody tr:hover {
            background-color: #f9f9f9;
        }
        .card {
            border: none;
            border-radius: 16px;
        }
        .card-header {
            border-radius: 16px 16px 0 0;
            border-bottom: 1px solid #ddd;
        }
        .btn-sm i {
            vertical-align: middle;
        }
        .footer {
            font-size: 0.9rem;
            color: #888;
            padding: 30px 0 10px;
            text-align: center;
        }
    </style>
</head>
<body>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="#">Sistem Informasi Mahasiswa</a>
    </div>
</nav>

<!-- Main Content -->
<div class="container my-5">
    <div class="card shadow-sm">
        <div class="card-header bg-white d-flex justify-content-between align-items-center">
            <h5 class="mb-0 fw-semibold">📋 Daftar Mahasiswa</h5>
            <a href="tambah.jsp" class="btn btn-success btn-sm shadow-sm">
                <i class="bi bi-plus-circle me-1"></i> Tambah Mahasiswa
            </a>
        </div>
        <div class="card-body">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>ID</th>
                            <th>NIM</th>
                            <th>Nama</th>
                            <th>Nilai</th>
                            <th style="width: 120px;">Aksi</th>
                        </tr>
                    </thead>
                    <tbody>
                    <%
                        try {
                            Class.forName("com.mysql.cj.jdbc.Driver");
                            Connection conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                            Statement stmt = conn.createStatement();
                            ResultSet rs = stmt.executeQuery("SELECT * FROM mahasiswa");
                            while(rs.next()) {
                    %>
                        <tr>
                            <td><%= rs.getInt("id") %></td>
                            <td><%= rs.getString("nim") %></td>
                            <td><%= rs.getString("nama") %></td>
                            <td><%= rs.getInt("nilai") %></td>
                            <td>
                                <a href="update.jsp?id=<%= rs.getInt("id") %>" class="btn btn-outline-warning btn-sm me-1" title="Edit">
                                    <i class="bi bi-pencil-fill"></i>
                                </a>
                                <a href="hapus.jsp?id=<%= rs.getInt("id") %>" class="btn btn-outline-danger btn-sm" title="Hapus"
                                   onclick="return confirm('Yakin ingin menghapus data ini?')">
                                    <i class="bi bi-trash-fill"></i>
                                </a>
                            </td>
                        </tr>
                    <%
                            }
                            rs.close(); stmt.close(); conn.close();
                        } catch (Exception e) {
                            out.println("<tr><td colspan='5' class='text-danger'>Error: " + e.getMessage() + "</td></tr>");
                        }
                    %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

<
<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
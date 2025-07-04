# Mahasiswa_22110595AndrianMaulana

# 🎓 Sistem Informasi Mahasiswa (SIM)

Aplikasi web berbasis **JSP + Servlet + MySQL** untuk mengelola data mahasiswa seperti **NIM**, **nama**, dan **nilai**. Aplikasi ini cocok digunakan untuk keperluan pembelajaran CRUD (Create, Read, Update, Delete) sederhana menggunakan Java Web.

---

## ✨ Fitur Utama

- 📋 **Daftar Mahasiswa**  
  Menampilkan semua data mahasiswa yang telah ditambahkan.

- ➕ **Tambah Mahasiswa**  
  Menambahkan data baru ke dalam sistem.

- ✏️ **Edit Mahasiswa**  
  Mengubah data mahasiswa secara langsung.

- 🗑️ **Hapus Mahasiswa**  
  Menghapus data mahasiswa dari database.

---

## 📸 Tampilan Antarmuka

### Halaman Daftar Mahasiswa
![Daftar Mahasiswa](screenshots/daftar-mahasiswa.png)

> 💡 Simpan gambar screenshot ke folder `screenshots/` dalam project.

---

## 🛠 Aplikasi yang Digunakan

- Java (JDK 8+)
- JSP dan Servlet
- Apache Tomcat 8/9
- MySQL
- Bootstrap 5 (untuk tampilan antarmuka)
- JDBC (untuk koneksi database)

---

## 🔧 Cara Build dan Menjalankan Aplikasi

### 1. Persiapan

Pastikan kamu sudah menginstal:
- Java JDK
- Apache Tomcat
- MySQL Server
- NetBeans IDE (atau IDE Java lainnya)

### 2. Buat Database
Buka MySQL atau phpMyAdmin

CREATE DATABASE mahasiswa;

USE mahasiswa;

CREATE TABLE mahasiswa (
  id INT AUTO_INCREMENT PRIMARY KEY,
  nim VARCHAR(20) NOT NULL,
  nama VARCHAR(100) NOT NULL,
  nilai INT NOT NULL
);

### 4. Sesuaikan Koneksi Database
   
Edit file koneksi (contoh: Koneksi.java) dan pastikan seperti ini:
String url = "jdbc:mysql://localhost:3306/mahasiswa";
String username = "root";
String password = "";

### 5. Jalankan Project

Jalankan via NetBeans → Run Project

Atau deploy ke Tomcat secara manual

http://localhost:8080/mahasiswa_db/

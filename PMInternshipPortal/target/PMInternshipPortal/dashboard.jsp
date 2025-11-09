<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - PM Internship Portal</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        :root { --primary: #0d6efd; --muted: #6c757d }
        body { font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, Arial; background: #f6f8fb; padding-bottom:40px }
        .site-header { background: linear-gradient(90deg, var(--primary), #0b5ed7); color:#fff; padding:18px 0 }
        .site-header .brand { font-weight:700; font-size:1.25rem }
        .site-container { max-width:1100px; margin:20px auto; padding:0 16px }
        .dashboard-welcome { margin-bottom:18px }
        .feature-card { border-radius:10px; box-shadow:0 8px 18px rgba(20,20,50,0.06); }
        .feature-card .card-body { min-height:150px }
        .btn-primary { border-radius:8px }
        @media (max-width:576px){ .site-container{padding:0 12px} }
    </style>
</head>
<body>
    <header class="site-header">
        <div class="container">
            <div class="d-flex align-items-center justify-content-between">
                <div class="brand"><i class="fas fa-graduation-cap me-2"></i>PM Internship Portal</div>
                <div>
                    <a href="profile" class="btn btn-outline-light btn-sm me-2">Profile</a>
                    <a href="logout" class="btn btn-light btn-sm">Logout</a>
                </div>
            </div>
        </div>
    </header>

    <main class="site-container">
        <div class="row">
            <div class="col-12">
                <h2 class="dashboard-welcome">Welcome, <%= session.getAttribute("user") != null ? ((com.pminternship.model.User)session.getAttribute("user")).getFullName() : "User" %></h2>
                <hr>
            </div>
        </div>

        <div class="row g-4 mt-1">
            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body">
                        <h5 class="card-title">Available Internships</h5>
                        <p class="card-text">View and apply for available internship positions.</p>
                        <a href="internships" class="btn btn-primary"><i class="fas fa-briefcase me-2"></i>View Internships</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body">
                        <h5 class="card-title">My Applications</h5>
                        <p class="card-text">Track your internship applications.</p>
                        <a href="applications" class="btn btn-primary"><i class="fas fa-file-alt me-2"></i>View Applications</a>
                    </div>
                </div>
            </div>

            <div class="col-md-4">
                <div class="card feature-card">
                    <div class="card-body">
                        <h5 class="card-title">Profile</h5>
                        <p class="card-text">Update your profile and resume.</p>
                        <a href="profile" class="btn btn-primary"><i class="fas fa-user-cog me-2"></i>View Profile</a>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
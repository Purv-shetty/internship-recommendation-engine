<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile - PM Internship Portal</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        body {
            background-color: #f8fafc;
            min-height: 100vh;
        }

        .profile-card {
            background: white;
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border: none;
        }

        .profile-header {
            background: linear-gradient(135deg, #2563eb, #1e40af);
            color: white;
            padding: 40px 0;
            border-radius: 15px 15px 0 0;
        }

        .profile-image {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            border: 5px solid white;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .skill-badge {
            font-size: 0.9rem;
            padding: 8px 15px;
            margin: 5px;
            border-radius: 20px;
            background-color: #e2e8f0;
            color: #1e293b;
            display: inline-block;
        }

        .nav-pills .nav-link.active {
            background-color: #2563eb;
        }

        .nav-pills .nav-link {
            color: #64748b;
        }

        .profile-stat {
            text-align: center;
            padding: 20px;
            border-radius: 10px;
            background-color: #f8fafc;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-light bg-white shadow-sm">
        <div class="container">
            <a class="navbar-brand" href="home.jsp">
                <i class="fas fa-laptop-code me-2"></i>PM Internship Portal
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="profile.jsp">Profile</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="logout">Logout</a>
                    </li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="profile-card">
            <!-- Profile Header -->
            <div class="profile-header text-center">
                <img src="https://ui-avatars.com/api/?name=<%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %>&background=random" 
                     alt="Profile Image" class="profile-image mb-3">
                <h3><%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %></h3>
                <p class="mb-0">Computer Science Student</p>
            </div>

            <!-- Profile Content -->
            <div class="card-body p-4">
                <!-- Profile Navigation -->
                <ul class="nav nav-pills mb-4" id="profileTab" role="tablist">
                    <li class="nav-item" role="presentation">
                        <button class="nav-link active" data-bs-toggle="pill" data-bs-target="#overview">Overview</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#skills">Skills & Experience</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#applications">Applications</button>
                    </li>
                    <li class="nav-item" role="presentation">
                        <button class="nav-link" data-bs-toggle="pill" data-bs-target="#settings">Settings</button>
                    </li>
                </ul>

                <!-- Tab Content -->
                <div class="tab-content" id="profileTabContent">
                    <!-- Overview Tab -->
                    <div class="tab-pane fade show active" id="overview">
                        <div class="row g-4">
                            <div class="col-md-4">
                                <div class="profile-stat">
                                    <h4 class="mb-0">12</h4>
                                    <p class="text-muted mb-0">Applications</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="profile-stat">
                                    <h4 class="mb-0">85%</h4>
                                    <p class="text-muted mb-0">Profile Completion</p>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="profile-stat">
                                    <h4 class="mb-0">8</h4>
                                    <p class="text-muted mb-0">Recommendations</p>
                                </div>
                            </div>
                        </div>

                        <hr class="my-4">

                        <h5>About Me</h5>
                        <p>A passionate computer science student with strong interests in AI, machine learning, and web development. Looking for opportunities to apply classroom knowledge in real-world projects.</p>

                        <h5 class="mt-4">Contact Information</h5>
                        <div class="row g-3">
                            <div class="col-md-6">
                                <p><i class="fas fa-envelope me-2"></i>user@example.com</p>
                            </div>
                            <div class="col-md-6">
                                <p><i class="fas fa-phone me-2"></i>+91 XXXXXXXXXX</p>
                            </div>
                            <div class="col-md-6">
                                <p><i class="fas fa-map-marker-alt me-2"></i>Mumbai, India</p>
                            </div>
                            <div class="col-md-6">
                                <p><i class="fab fa-linkedin me-2"></i>linkedin.com/in/username</p>
                            </div>
                        </div>
                    </div>

                    <!-- Skills Tab -->
                    <div class="tab-pane fade" id="skills">
                        <h5>Technical Skills</h5>
                        <div class="mb-4">
                            <span class="skill-badge">Python</span>
                            <span class="skill-badge">Java</span>
                            <span class="skill-badge">JavaScript</span>
                            <span class="skill-badge">React</span>
                            <span class="skill-badge">Node.js</span>
                            <span class="skill-badge">Machine Learning</span>
                            <span class="skill-badge">SQL</span>
                            <span class="skill-badge">Git</span>
                        </div>

                        <h5>Education</h5>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h6>Bachelor of Technology in Computer Science</h6>
                                <p class="text-muted mb-1">Example University</p>
                                <p class="text-muted mb-0">2022 - 2026 | CGPA: 8.5</p>
                            </div>
                        </div>

                        <h5>Projects</h5>
                        <div class="card mb-3">
                            <div class="card-body">
                                <h6>AI-Based Image Recognition System</h6>
                                <p class="text-muted mb-2">Personal Project | 2024</p>
                                <p>Developed an AI system using TensorFlow for real-time image recognition with 95% accuracy.</p>
                                <div>
                                    <span class="skill-badge">Python</span>
                                    <span class="skill-badge">TensorFlow</span>
                                    <span class="skill-badge">OpenCV</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Applications Tab -->
                    <div class="tab-pane fade" id="applications">
                        <div class="list-group">
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">ML Engineer Intern</h6>
                                        <p class="mb-1 text-muted">Google India</p>
                                    </div>
                                    <span class="badge bg-success">Applied</span>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Software Developer Intern</h6>
                                        <p class="mb-1 text-muted">Microsoft</p>
                                    </div>
                                    <span class="badge bg-warning">In Review</span>
                                </div>
                            </div>
                            <div class="list-group-item">
                                <div class="d-flex w-100 justify-content-between align-items-center">
                                    <div>
                                        <h6 class="mb-1">Data Science Intern</h6>
                                        <p class="mb-1 text-muted">Amazon</p>
                                    </div>
                                    <span class="badge bg-info">Shortlisted</span>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Settings Tab -->
                    <div class="tab-pane fade" id="settings">
                        <form>
                            <div class="mb-3">
                                <label class="form-label">Full Name</label>
                                <input type="text" class="form-control" value="John Doe">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Email</label>
                                <input type="email" class="form-control" value="user@example.com">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Phone</label>
                                <input type="tel" class="form-control" value="+91 XXXXXXXXXX">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Location</label>
                                <input type="text" class="form-control" value="Mumbai, India">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">LinkedIn Profile</label>
                                <input type="url" class="form-control" value="https://linkedin.com/in/username">
                            </div>
                            <div class="mb-3">
                                <label class="form-label">Bio</label>
                                <textarea class="form-control" rows="4">A passionate computer science student with strong interests in AI, machine learning, and web development. Looking for opportunities to apply classroom knowledge in real-world projects.</textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Save Changes</button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Footer -->
    <footer class="bg-white py-4 mt-5">
        <div class="container text-center">
            <p class="mb-0">&copy; 2025 PM Internship Portal — All Rights Reserved</p>
        </div>
    </footer>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
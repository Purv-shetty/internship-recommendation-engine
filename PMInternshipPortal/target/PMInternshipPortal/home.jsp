<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PM Internship Portal - Find Your Perfect Internship</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        /* Custom CSS */
        :root {
            --primary-color: #2563eb;
            --secondary-color: #1e40af;
            --bg-light: #f8fafc;
        }

        /* Hero Section */
        .hero-section {
            background: linear-gradient(rgba(0, 0, 0, 0.6), rgba(0, 0, 0, 0.7)),
                        url('https://images.unsplash.com/photo-1516321318423-f06f85e504b3?auto=format&fit=crop&w=1920');
            background-size: cover;
            background-position: center;
            color: white;
            padding: 120px 0;
            margin-top: -56px;
        }

        /* Navbar */
        .navbar-custom {
            background-color: transparent;
            transition: background-color 0.3s ease;
        }

        .navbar-custom.scrolled {
            background-color: white;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        /* Cards */
        .category-card {
            border-radius: 15px;
            transition: transform 0.3s ease;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .category-card:hover {
            transform: translateY(-5px);
        }

        /* Steps */
        .step-card {
            border-radius: 15px;
            height: 100%;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .step-icon {
            font-size: 2.5rem;
            color: var(--primary-color);
        }

        /* Footer */
        .footer {
            background-color: #1e293b;
            color: white;
            padding: 40px 0;
        }

        .social-icons a {
            color: white;
            margin: 0 10px;
            font-size: 1.5rem;
            transition: color 0.3s ease;
        }

        .social-icons a:hover {
            color: var(--primary-color);
        }

        /* Internship Cards */
        .internship-card {
            border-radius: 15px;
            transition: transform 0.3s ease;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .internship-card:hover {
            transform: translateY(-5px);
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark fixed-top navbar-custom">
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
                        <a class="nav-link active" href="home.jsp">Home</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp">Internships</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="dashboard.jsp#ai-recommender">AI Recommender</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp#about">About</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="home.jsp#contact">Contact</a>
                    </li>
                    <%
                        HttpSession userSession = request.getSession(false);
                        if(userSession != null && userSession.getAttribute("user") != null) {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard.jsp">Dashboard</a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" id="profileDropdown" role="button" data-bs-toggle="dropdown">
                                <i class="fas fa-user-circle me-2"></i>
                                <%= session.getAttribute("username") != null ? session.getAttribute("username") : "User" %>
                            </a>
                            <ul class="dropdown-menu dropdown-menu-end">
                                <li><a class="dropdown-item" href="profile.jsp"><i class="fas fa-user me-2"></i>Profile</a></li>
                                <li><a class="dropdown-item" href="profile.jsp#settings"><i class="fas fa-cog me-2"></i>Settings</a></li>
                                <li><hr class="dropdown-divider"></li>
                                <li><a class="dropdown-item" href="logout"><i class="fas fa-sign-out-alt me-2"></i>Logout</a></li>
                            </ul>
                        </li>
                    <%
                        } else {
                    %>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="register.jsp">Register</a>
                        </li>
                    <%
                        }
                    %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section">
        <div class="container text-center">
            <h1 class="display-4 fw-bold mb-4">Find the Right Internship with the Power of AI</h1>
            <p class="lead mb-4">Our AI-powered platform matches your skills with the perfect internship opportunities.</p>
            
            <!-- Quick Search Bar -->
            <div class="row justify-content-center mt-5">
                <div class="col-lg-8">
                    <form action="search.jsp" method="GET" class="bg-white p-3 rounded-pill shadow-lg">
                        <div class="row g-2 align-items-center">
                            <div class="col">
                                <input type="text" name="keywords" class="form-control form-control-lg border-0" placeholder="Search skills, technologies...">
                            </div>
                            <div class="col-auto">
                                <button type="submit" class="btn btn-primary btn-lg rounded-pill px-4">
                                    <i class="fas fa-search me-2"></i>Find Internships
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <!-- Call to Action Buttons -->
            <div class="mt-4">
                <%
                    if(userSession != null && userSession.getAttribute("user") != null) {
                %>
                    <a href="dashboard.jsp" class="btn btn-primary btn-lg px-5 py-3 me-3">
                        View Recommendations <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                <%
                    } else {
                %>
                    <a href="register.jsp" class="btn btn-primary btn-lg px-5 py-3 me-3">
                        Get Started <i class="fas fa-arrow-right ms-2"></i>
                    </a>
                <%
                    }
                %>
                <a href="search.jsp" class="btn btn-outline-light btn-lg px-5 py-3">
                    Advanced Search <i class="fas fa-filter ms-2"></i>
                </a>
            </div>
        </div>
    </section>

    <!-- Recommended Internships Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-5">Recommended Internships</h2>
            <div class="row g-4">
                <!-- Sample Internship Cards -->
                <div class="col-md-4">
                    <div class="card internship-card">
                        <div class="card-body">
                            <h5 class="card-title">AI Research Intern</h5>
                            <p class="card-text text-muted">Microsoft</p>
                            <div class="mb-3">
                                <span class="badge bg-primary">Machine Learning</span>
                                <span class="badge bg-info">Python</span>
                                <span class="badge bg-secondary">Remote</span>
                            </div>
                            <p class="card-text">Join Microsoft's AI research team to work on cutting-edge machine learning projects.</p>
                            <a href="dashboard.jsp" class="btn btn-outline-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card internship-card">
                        <div class="card-body">
                            <h5 class="card-title">Full Stack Developer</h5>
                            <p class="card-text text-muted">Google</p>
                            <div class="mb-3">
                                <span class="badge bg-primary">React</span>
                                <span class="badge bg-info">Node.js</span>
                                <span class="badge bg-secondary">Hybrid</span>
                            </div>
                            <p class="card-text">Develop modern web applications using React and Node.js in Google's developer team.</p>
                            <a href="dashboard.jsp" class="btn btn-outline-primary">Learn More</a>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card internship-card">
                        <div class="card-body">
                            <h5 class="card-title">Data Science Intern</h5>
                            <p class="card-text text-muted">Amazon</p>
                            <div class="mb-3">
                                <span class="badge bg-primary">Data Analysis</span>
                                <span class="badge bg-info">SQL</span>
                                <span class="badge bg-secondary">On-site</span>
                            </div>
                            <p class="card-text">Analyze large datasets and build predictive models for Amazon's retail platform.</p>
                            <a href="dashboard.jsp" class="btn btn-outline-primary">Learn More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Popular Categories Section -->
    <section class="py-5">
        <div class="container">
            <h2 class="text-center mb-5">Popular Categories</h2>
            <div class="row g-4">
                <div class="col-md-3">
                    <div class="card category-card text-center">
                        <div class="card-body">
                            <i class="fas fa-code fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Web Development</h5>
                            <p class="card-text">150+ openings</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card category-card text-center">
                        <div class="card-body">
                            <i class="fas fa-brain fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">AI/ML</h5>
                            <p class="card-text">80+ openings</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card category-card text-center">
                        <div class="card-body">
                            <i class="fas fa-database fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">Data Science</h5>
                            <p class="card-text">120+ openings</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-3">
                    <div class="card category-card text-center">
                        <div class="card-body">
                            <i class="fas fa-palette fa-3x mb-3 text-primary"></i>
                            <h5 class="card-title">UI/UX Design</h5>
                            <p class="card-text">90+ openings</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- How It Works Section -->
    <section class="py-5 bg-light">
        <div class="container">
            <h2 class="text-center mb-5">How It Works</h2>
            <div class="row g-4">
                <div class="col-md-4">
                    <div class="card step-card text-center">
                        <div class="card-body">
                            <div class="step-icon mb-3">
                                <i class="fas fa-user-plus"></i>
                            </div>
                            <h5 class="card-title">1. Register</h5>
                            <p class="card-text">Create your account and complete your profile with your skills and interests.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card step-card text-center">
                        <div class="card-body">
                            <div class="step-icon mb-3">
                                <i class="fas fa-upload"></i>
                            </div>
                            <h5 class="card-title">2. Upload Skills</h5>
                            <p class="card-text">Upload your resume and add your technical skills and preferences.</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="card step-card text-center">
                        <div class="card-body">
                            <div class="step-icon mb-3">
                                <i class="fas fa-robot"></i>
                            </div>
                            <h5 class="card-title">3. Get Recommendations</h5>
                            <p class="card-text">Our AI analyzes your profile and suggests the best matching internships.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="footer">
        <div class="container">
            <div class="row">
                <div class="col-md-6 text-center text-md-start">
                    <p>&copy; 2025 PM Internship Portal. All rights reserved.</p>
                </div>
                <div class="col-md-6 text-center text-md-end">
                    <div class="social-icons">
                        <a href="#"><i class="fab fa-linkedin"></i></a>
                        <a href="#"><i class="fab fa-twitter"></i></a>
                        <a href="#"><i class="fab fa-facebook"></i></a>
                        <a href="#"><i class="fab fa-instagram"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </footer>

    <!-- Bootstrap JS and dependencies -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JavaScript for Navbar scroll effect -->
    <script>
        window.addEventListener('scroll', function() {
            const navbar = document.querySelector('.navbar-custom');
            if (window.scrollY > 50) {
                navbar.classList.add('scrolled');
                navbar.classList.remove('navbar-dark');
                navbar.classList.add('navbar-light');
            } else {
                navbar.classList.remove('scrolled');
                navbar.classList.remove('navbar-light');
                navbar.classList.add('navbar-dark');
            }
        });
    </script>
</body>
</html>
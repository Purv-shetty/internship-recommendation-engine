<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Internships - PM Internship Portal</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Font Awesome 6 -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    
    <style>
        .search-section {
            background: linear-gradient(135deg, #f8fafc 0%, #e2e8f0 100%);
            padding: 50px 0;
            min-height: 100vh;
        }
        .filter-card {
            border-radius: 15px;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
            border: none;
        }
        .internship-card {
            border-radius: 15px;
            transition: transform 0.3s ease;
            border: none;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }
        .internship-card:hover {
            transform: translateY(-5px);
        }
        .badge {
            font-size: 0.8rem;
            padding: 0.5em 1em;
            margin-right: 0.5em;
        }
    </style>
</head>
<body>
    <!-- Navigation Bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
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
                        <a class="nav-link active" href="search.jsp">Search</a>
                    </li>
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
                </ul>
            </div>
        </div>
    </nav>

    <!-- Search Section -->
    <section class="search-section">
        <div class="container">
            <div class="row">
                <!-- Search Filters -->
                <div class="col-lg-3 mb-4">
                    <div class="card filter-card">
                        <div class="card-body">
                            <h5 class="card-title mb-4">Search Filters</h5>
                            <form action="SearchInternshipServlet" method="GET">
                                <div class="mb-3">
                                    <label class="form-label">Keywords</label>
                                    <input type="text" class="form-control" name="keywords" placeholder="e.g., Java, AI, Data Science">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Location</label>
                                    <input type="text" class="form-control" name="location" placeholder="e.g., Mumbai, Delhi">
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Category</label>
                                    <select class="form-select" name="category">
                                        <option value="">All Categories</option>
                                        <option value="software">Software Development</option>
                                        <option value="data">Data Science</option>
                                        <option value="ai">AI/ML</option>
                                        <option value="web">Web Development</option>
                                        <option value="mobile">Mobile Development</option>
                                        <option value="design">UI/UX Design</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Duration</label>
                                    <select class="form-select" name="duration">
                                        <option value="">Any Duration</option>
                                        <option value="1-3">1-3 months</option>
                                        <option value="3-6">3-6 months</option>
                                        <option value="6+">6+ months</option>
                                    </select>
                                </div>
                                
                                <div class="mb-3">
                                    <label class="form-label">Work Type</label>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="workType" value="remote">
                                        <label class="form-check-label">Remote</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="workType" value="onsite">
                                        <label class="form-check-label">On-site</label>
                                    </div>
                                    <div class="form-check">
                                        <input class="form-check-input" type="checkbox" name="workType" value="hybrid">
                                        <label class="form-check-label">Hybrid</label>
                                    </div>
                                </div>
                                
                                <button type="submit" class="btn btn-primary w-100">
                                    <i class="fas fa-search me-2"></i>Search
                                </button>
                            </form>
                        </div>
                    </div>
                </div>
                
                <!-- Search Results -->
                <div class="col-lg-9">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h4>Search Results</h4>
                        <div class="dropdown">
                            <button class="btn btn-outline-primary dropdown-toggle" type="button" data-bs-toggle="dropdown">
                                Sort by
                            </button>
                            <ul class="dropdown-menu">
                                <li><a class="dropdown-item" href="#">Latest First</a></li>
                                <li><a class="dropdown-item" href="#">Duration: Short to Long</a></li>
                                <li><a class="dropdown-item" href="#">Duration: Long to Short</a></li>
                            </ul>
                        </div>
                    </div>
                    
                    <!-- Sample Results -->
                    <div class="row g-4">
                        <div class="col-12">
                            <div class="card internship-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h5 class="card-title">Machine Learning Intern</h5>
                                            <p class="text-muted mb-2">Google India</p>
                                        </div>
                                        <span class="badge bg-success">Remote</span>
                                    </div>
                                    <div class="mb-3">
                                        <span class="badge bg-primary">Python</span>
                                        <span class="badge bg-primary">TensorFlow</span>
                                        <span class="badge bg-primary">Deep Learning</span>
                                    </div>
                                    <p class="card-text">Join Google's ML team to work on cutting-edge AI projects. You'll be working with large-scale datasets and implementing state-of-the-art machine learning models.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="far fa-clock me-2"></i>6 months
                                            <i class="fas fa-map-marker-alt ms-3 me-2"></i>Bangalore
                                        </div>
                                        <a href="#" class="btn btn-outline-primary">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-12">
                            <div class="card internship-card">
                                <div class="card-body">
                                    <div class="d-flex justify-content-between align-items-start">
                                        <div>
                                            <h5 class="card-title">Full Stack Developer Intern</h5>
                                            <p class="text-muted mb-2">Microsoft</p>
                                        </div>
                                        <span class="badge bg-warning">Hybrid</span>
                                    </div>
                                    <div class="mb-3">
                                        <span class="badge bg-primary">React</span>
                                        <span class="badge bg-primary">Node.js</span>
                                        <span class="badge bg-primary">MongoDB</span>
                                    </div>
                                    <p class="card-text">Work with Microsoft's web development team on building scalable applications using modern technologies and best practices.</p>
                                    <div class="d-flex justify-content-between align-items-center">
                                        <div>
                                            <i class="far fa-clock me-2"></i>3 months
                                            <i class="fas fa-map-marker-alt ms-3 me-2"></i>Mumbai
                                        </div>
                                        <a href="#" class="btn btn-outline-primary">View Details</a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
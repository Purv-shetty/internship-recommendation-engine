<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - PM Internship Portal</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet">
    <style>
        :root { --primary: #0d6efd; --muted: #6c757d; }
        body {
            min-height:100vh;
            display:flex;
            align-items:center;
            justify-content:center;
            background: linear-gradient(135deg,#f8f9fa 0%, #e9eef8 100%);
            font-family: -apple-system, BlinkMacSystemFont, "Segoe UI", Roboto, "Helvetica Neue", Arial;
            padding: 2rem;
        }
        .card-login {
            width:100%;
            max-width:480px;
            border-radius:12px;
            box-shadow:0 10px 30px rgba(20,20,50,0.08);
            overflow:hidden;
        }
        .card-login .card-header {
            background: linear-gradient(90deg, var(--primary), #0b5ed7);
            color:#fff;
            padding:28px 20px;
            text-align:center;
        }
        .brand-title { font-weight:700; font-size:1.25rem; }
        .card-login .card-body { padding:28px 24px; }
        .form-floating > .form-control { height:56px; border-radius:8px; }
        .btn-primary { border-radius:8px; padding:12px 14px; font-weight:600; }
        .small-muted { color:var(--muted); font-size:.95rem }
        .input-icon { position:absolute; right:12px; top:50%; transform:translateY(-50%); color:#9aa4b2 }
        .form-row { position:relative }
        .footer-note { text-align:center; margin-top:14px; color:var(--muted) }
        @media (max-width:480px){ body{padding:1rem} .card-login{max-width:100%} }
    </style>
</head>
<body>
    <div class="card card-login">
        <div class="card-header">
            <div class="brand-title"><i class="fas fa-graduation-cap me-2"></i>PM Internship Portal</div>
            <div class="small-muted">Student internships & opportunities</div>
        </div>
        <div class="card-body">
            <%-- show error or success messages --%>
            <% if(request.getAttribute("error") != null) { %>
                <div class="alert alert-danger" role="alert"><i class="fas fa-exclamation-circle me-2"></i><%= request.getAttribute("error") %></div>
            <% } %>
            <% if(request.getParameter("registered") != null) { %>
                <div class="alert alert-success" role="alert"><i class="fas fa-check-circle me-2"></i>Registration successful! Please login.</div>
            <% } %>

            <form action="login" method="post" novalidate>
                <div class="mb-3 form-floating form-row">
                    <input type="email" class="form-control" id="email" name="email" placeholder="name@example.com" required>
                    <label for="email">Email address</label>
                    <i class="fas fa-envelope input-icon" aria-hidden="true"></i>
                </div>

                <div class="mb-3 form-floating form-row">
                    <input type="password" class="form-control" id="password" name="password" placeholder="Password" required>
                    <label for="password">Password</label>
                    <i class="fas fa-eye-slash input-icon password-toggle" onclick="togglePassword()" title="Show / hide password"></i>
                </div>

                <div class="d-grid mb-3">
                    <button class="btn btn-primary" type="submit"><i class="fas fa-sign-in-alt me-2"></i>Login</button>
                </div>

                <div class="d-flex justify-content-between align-items-center">
                    <div class="small-muted">Don't have an account?</div>
                    <div><a href="register.jsp" class="btn btn-outline-secondary btn-sm">Register</a></div>
                </div>
            </form>

            <div class="footer-note">&copy; <%= java.time.Year.now() %> PM Internship Portal</div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <script>
        function togglePassword(){
            const pw = document.getElementById('password');
            const icon = document.querySelector('.password-toggle');
            if(!pw) return;
            if(pw.type === 'password'){ pw.type = 'text'; icon.classList.remove('fa-eye-slash'); icon.classList.add('fa-eye'); }
            else { pw.type = 'password'; icon.classList.remove('fa-eye'); icon.classList.add('fa-eye-slash'); }
        }

        // small client-side validation feedback
        document.querySelector('form').addEventListener('submit', function(e){
            const form = e.target;
            if(!form.checkValidity()){
                e.preventDefault();
                form.classList.add('was-validated');
            }
        });
    </script>
</body>
</html>
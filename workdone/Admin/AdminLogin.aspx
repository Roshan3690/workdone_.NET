<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="workdone.Admin.AdminLogin" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin Login - WorkDone</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" />
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&display=swap" rel="stylesheet" />
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css" />
    
    <!-- Admin CSS -->
    <link href="../AdminContent/css/admin.css" rel="stylesheet" />
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="min-vh-100 d-flex align-items-center justify-content-center py-5 px-3">
            <div class="w-100" style="max-width: 440px;">
                <!-- Brand Header -->
                <div class="text-center mb-4">
                    <a href="../Default.aspx" class="d-inline-flex align-items-center text-decoration-none fw-bold fs-3 text-primary">
                        <i class="bi bi-tools text-primary me-2 fs-2"></i>WorkDone<span class="text-dark">.com</span>
                    </a>
                    <div class="mt-2 text-muted fw-semibold" style="letter-spacing: 0.05em; font-size: 0.8rem; text-transform: uppercase;">
                        Enterprise Administration Portal
                    </div>
                </div>

                <!-- Login Card -->
                <div class="admin-card p-4 p-md-5 shadow-lg border-0">
                    <div class="mb-4 text-center">
                        <div class="bg-primary-subtle text-primary rounded-circle d-inline-flex align-items-center justify-content-center mb-3" style="width: 56px; height: 56px;">
                            <i class="bi bi-shield-lock-fill fs-3"></i>
                        </div>
                        <h4 class="fw-bold text-dark mb-1">Admin Sign In</h4>
                        <p class="text-muted small">Enter your authorized administrative credentials</p>
                    </div>

                    <!-- Credential Quick-Fill Notice -->
                    <div class="p-3 bg-primary-subtle rounded-3 mb-4 border border-primary border-opacity-25">
                        <div class="d-flex align-items-start gap-2">
                            <i class="bi bi-key-fill text-primary fs-5 mt-1"></i>
                            <div>
                            </div>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="admin-form-label">Admin Email</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope text-muted"></i></span>
                            <asp:TextBox ID="txtAdminEmail" runat="server" CssClass="form-control admin-form-control border-start-0" Text="admin@workdone.com"></asp:TextBox>
                        </div>
                    </div>

                    <div class="mb-3">
                        <label class="admin-form-label">Password</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-lock text-muted"></i></span>
                            <asp:TextBox ID="txtAdminPass" runat="server" TextMode="Password" CssClass="form-control admin-form-control border-start-0" Text="admin123"></asp:TextBox>
                        </div>
                    </div>

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <div class="form-check mb-0">
                            <input class="form-check-input" type="checkbox" id="adminRemember" checked>
                            <label class="form-check-label small text-muted" for="adminRemember">Remember session</label>
                        </div>
                        <a href="AdminUsers.aspx" class="text-decoration-none small text-primary fw-semibold">Direct Access &rarr;</a>
                    </div>

                    <a href="AdminUsers.aspx" class="btn btn-admin-primary w-100 py-2 justify-content-center shadow-sm">
                        <i class="bi bi-box-arrow-in-right me-1"></i> Sign In to Portal
                    </a>

                    <div class="text-center mt-4 pt-3 border-top">
                        <a href="../Default.aspx" class="text-decoration-none text-muted small hover-primary">
                            <i class="bi bi-arrow-left me-1"></i> Back to Main Website
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- Bootstrap 5 JS Bundle -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>

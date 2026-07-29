<%@ Page Title="Login" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="workdone.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Login - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-light min-vh-100 d-flex align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-6 col-lg-5 col-xl-4">
                    <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5">
                        <div class="text-center mb-4">
                            <a class="navbar-brand fw-bold text-primary fs-3" href="Default.aspx">
                                <i class="bi bi-tools text-primary me-2"></i>WorkDone<span class="text-dark">.com</span>
                            </a>
                            <h4 class="fw-bold mt-4 mb-2">Welcome Back</h4>
                            <p class="text-muted small">Log in to manage your bookings</p>
                        </div>
                        
                        <div class="mb-3">
                            <label for="txtEmail" class="form-label fw-medium small">Email Address</label>
                            <input type="email" class="form-control rounded-3 py-2 bg-light border-0" id="txtEmail" placeholder="name@example.com">
                        </div>
                        
                        <div class="mb-3">
                            <div class="d-flex justify-content-between align-items-center">
                                <label for="txtPassword" class="form-label fw-medium small mb-0">Password</label>
                                <a href="#" class="text-decoration-none small text-primary fw-medium">Forgot Password?</a>
                            </div>
                            <input type="password" class="form-control rounded-3 py-2 bg-light border-0 mt-2" id="txtPassword" placeholder="Enter your password">
                        </div>
                        
                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="chkRemember">
                            <label class="form-check-label small text-muted" for="chkRemember">Remember me for 30 days</label>
                        </div>
                        
                        <button type="button" class="btn btn-primary w-100 rounded-pill py-2 fw-medium mb-3 shadow-sm hover-scale">Log In</button>
                        
                        <div class="text-center mt-3 border-top pt-4">
                            <p class="text-muted small mb-0">Don't have an account? <a href="Register.aspx" class="text-decoration-none fw-bold text-primary">Sign Up</a></p>
                            <p class="text-muted small mt-2">Are you a professional? <a href="JoinProfessional.aspx" class="text-decoration-none fw-bold text-dark">Login here</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

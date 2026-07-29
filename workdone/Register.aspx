<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="workdone.Register" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Sign Up - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-light min-vh-100 d-flex align-items-center">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-md-8 col-lg-6 col-xl-5">
                    <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5">
                        <div class="text-center mb-4">
                            <a class="navbar-brand fw-bold text-primary fs-3" href="Default.aspx">
                                <i class="bi bi-tools text-primary me-2"></i>WorkDone<span class="text-dark">.com</span>
                            </a>
                            <h4 class="fw-bold mt-4 mb-2">Create an Account</h4>
                            <p class="text-muted small">Join us to book local services easily</p>
                        </div>
                        
                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="txtFirstName" class="form-label fw-medium small">First Name</label>
                                <input type="text" class="form-control rounded-3 py-2 bg-light border-0" id="txtFirstName" placeholder="John">
                            </div>
                            <div class="col-sm-6">
                                <label for="txtLastName" class="form-label fw-medium small">Last Name</label>
                                <input type="text" class="form-control rounded-3 py-2 bg-light border-0" id="txtLastName" placeholder="Doe">
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="txtEmail" class="form-label fw-medium small">Email Address</label>
                            <input type="email" class="form-control rounded-3 py-2 bg-light border-0" id="txtEmail" placeholder="name@example.com">
                        </div>

                        <div class="mb-3">
                            <label for="txtPhone" class="form-label fw-medium small">Phone Number</label>
                            <input type="tel" class="form-control rounded-3 py-2 bg-light border-0" id="txtPhone" placeholder="+91 9876543210">
                        </div>
                        
                        <div class="mb-3">
                            <label for="txtPassword" class="form-label fw-medium small">Password</label>
                            <input type="password" class="form-control rounded-3 py-2 bg-light border-0" id="txtPassword" placeholder="Create a strong password">
                            <div class="form-text small text-muted mt-1">Must be at least 8 characters long.</div>
                        </div>
                        
                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="chkTerms">
                            <label class="form-check-label small text-muted" for="chkTerms">I agree to the <a href="#" class="text-primary text-decoration-none">Terms of Service</a> and <a href="#" class="text-primary text-decoration-none">Privacy Policy</a></label>
                        </div>
                        
                        <button type="button" class="btn btn-primary w-100 rounded-pill py-2 fw-medium mb-3 shadow-sm hover-scale">Create Account</button>
                        
                        <div class="text-center mt-3 border-top pt-4">
                            <p class="text-muted small mb-0">Already have an account? <a href="Login.aspx" class="text-decoration-none fw-bold text-primary">Log In</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

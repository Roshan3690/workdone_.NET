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
                                <asp:TextBox ID="txtfname" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter first name"></asp:TextBox>
                            </div>

                            <div class="col-sm-6">
                                <label for="txtLastName" class="form-label fw-medium small">Last Name</label>
                                <asp:TextBox ID="txtlname" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter last name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="txtEmail" class="form-label fw-medium small">Email Address</label>
                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="you@example.com"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtPhone" class="form-label fw-medium small">Phone Number</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter phone number"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="ddlGender" class="form-label fw-medium small">Gender</label>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select rounded-3 py-2 bg-light border-1">
                                <asp:ListItem Value="">Select gender</asp:ListItem>
                                <asp:ListItem>Male</asp:ListItem>
                                <asp:ListItem>Female</asp:ListItem>
                                <asp:ListItem>Other</asp:ListItem>
                            </asp:DropDownList>
                        </div>

                        <div class="mb-3">
                            <label for="txtAddress" class="form-label fw-medium small">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter your full address"></asp:TextBox>
                        </div>

                        <div class="mb-3">
                            <label for="txtPassword" class="form-label fw-medium small">Password</label>
                            <asp:TextBox ID="txtpass" runat="server" TextMode="Password" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Create password"></asp:TextBox>
                            <div class="form-text small text-muted mt-1">Must be at least 8 characters long.</div>
                        </div>

                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="chkTerms">
                            <label class="form-check-label small text-muted" for="chkTerms">I agree to the <a href="#" class="text-primary text-decoration-none">Terms of Service</a> and <a href="#" class="text-primary text-decoration-none">Privacy Policy</a></label>
                            <p class="text-muted small mb-0">
                                <asp:Button ID="Button1" runat="server" Text="Create Account" class="btn btn-primary w-100 rounded-pill py-2 fw-medium mb-3 shadow-sm hover-scale" OnClick="Button1_Click" />
                                Already have an account? <a href="Login.aspx" class="text-decoration-none fw-bold text-primary">Log In</a>
                                <br />
                                <center>
                                    <asp:Label ID="Label1" runat="server" Style="color: red"></asp:Label>
                                </center>
                            </p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
</asp:Content>

<%@ Page Title="Join as Professional" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="JoinProfessional.aspx.cs" Inherits="workdone.JoinProfessional" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Join as a Professional - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-primary-subtle border-bottom text-center">
        <div class="container py-4">
            <h1 class="display-5 fw-bold text-dark mb-3">Earn More. Grow Your Business.</h1>
            <p class="lead text-secondary max-w-2xl mx-auto">Join thousands of professionals on WorkDone and connect with customers in your area.</p>
        </div>
    </section>

    <section class="py-5 bg-light min-vh-100">
        <div class="container">
            <div class="row g-5">
                <!-- Info Section -->
                <div class="col-lg-5 order-2 order-lg-1">
                    <h3 class="fw-bold mb-4">Why join WorkDone?</h3>
                    <div class="d-flex mb-4">
                        <div class="flex-shrink-0 mt-1">
                            <i class="bi bi-graph-up-arrow text-primary fs-3"></i>
                        </div>
                        <div class="ms-3">
                            <h5 class="fw-bold mb-1">More Customers</h5>
                            <p class="text-muted">Get consistent bookings without spending on marketing.</p>
                        </div>
                    </div>
                    <div class="d-flex mb-4">
                        <div class="flex-shrink-0 mt-1">
                            <i class="bi bi-clock-history text-primary fs-3"></i>
                        </div>
                        <div class="ms-3">
                            <h5 class="fw-bold mb-1">Flexible Schedule</h5>
                            <p class="text-muted">You decide when you work and how many jobs you take.</p>
                        </div>
                    </div>
                    <div class="d-flex mb-4">
                        <div class="flex-shrink-0 mt-1">
                            <i class="bi bi-wallet2 text-primary fs-3"></i>
                        </div>
                        <div class="ms-3">
                            <h5 class="fw-bold mb-1">Better Earnings</h5>
                            <p class="text-muted">Transparent pricing and instant payouts for your hard work.</p>
                        </div>
                    </div>
                    
                    <div class="bg-white p-4 rounded-4 shadow-sm mt-5 border">
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <img src="https://randomuser.me/api/portraits/men/32.jpg" class="rounded-circle border border-2 border-primary" width="50" height="50" alt="Pro">
                            <div>
                                <h6 class="fw-bold mb-0">Rahul Patel</h6>
                                <small class="text-muted">Electrician in Rajkot</small>
                            </div>
                        </div>
                        <p class="small text-dark fst-italic mb-0">"Joining WorkDone was the best decision for my business. I get regular jobs and my income has doubled in just 6 months."</p>
                    </div>
                </div>

                <!-- Registration Form -->
                <div class="col-lg-7 order-1 order-lg-2">
                    <div class="card border-0 shadow-lg rounded-4 p-4 p-md-5">
                        <h4 class="fw-bold mb-4">Professional Registration</h4>

                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="txtProfessionalFirstName" class="form-label fw-medium small">First Name</label>
                                <asp:TextBox ID="txtProfessionalFirstName" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter first name"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtProfessionalLastName" class="form-label fw-medium small">Last Name</label>
                                <asp:TextBox ID="txtProfessionalLastName" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter last name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="txtProfessionalEmail" class="form-label fw-medium small">Email Address</label>
                                <asp:TextBox ID="txtProfessionalEmail" runat="server" TextMode="Email" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="you@example.com"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label for="txtProfessionalPhone" class="form-label fw-medium small">Phone Number</label>
                                <asp:TextBox ID="txtProfessionalPhone" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter phone number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="ddlProfessionalCity" class="form-label fw-medium small">City</label>
                                <asp:DropDownList ID="ddlProfessionalCity" runat="server" CssClass="form-select rounded-3 py-2 bg-light border-1">
                                    <asp:ListItem Value="">Select city</asp:ListItem>
                                    <asp:ListItem>Rajkot</asp:ListItem>
                                    <asp:ListItem>Surat</asp:ListItem>
                                    <asp:ListItem>Ahmdabad</asp:ListItem>
                                    <asp:ListItem>Vadodara</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                            <div class="col-sm-6">
                                <label for="ddlProfessionalService" class="form-label fw-medium small">Primary Service</label>
                                <asp:DropDownList ID="ddlProfessionalService" runat="server" CssClass="form-select rounded-3 py-2 bg-light border-1">
                                    <asp:ListItem Value="">Select service</asp:ListItem>
                                    <asp:ListItem>Home Cleaning</asp:ListItem>
                                    <asp:ListItem>Electrician</asp:ListItem>
                                    <asp:ListItem>AC Repair</asp:ListItem>
                                    <asp:ListItem>Carpentry</asp:ListItem>
                                    <asp:ListItem>Painting</asp:ListItem>
                                    <asp:ListItem>Beauty &amp; Salon</asp:ListItem>
                                    <asp:ListItem>Vehicle Repair</asp:ListItem>
                                    <asp:ListItem>Plumbing</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="txtProfessionalExperience" class="form-label fw-medium small">Years of Experience</label>
                                <asp:TextBox ID="txtProfessionalExperience" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="e.g. 3"></asp:TextBox>
                            </div>
                            <div class="col-sm-6">
                                <label for="ddlProfessionalGender" class="form-label fw-medium small">Gender</label>
                                <asp:DropDownList ID="ddlProfessionalGender" runat="server" CssClass="form-select rounded-3 py-2 bg-light border-1">
                                    <asp:ListItem Value="">Select gender</asp:ListItem>
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:DropDownList>
                            </div>
                        </div>

                        <div class="mb-3">
                            <label for="txtProfessionalAddress" class="form-label fw-medium small">Address</label>
                            <asp:TextBox ID="txtProfessionalAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter your full address"></asp:TextBox>
                        </div>

                        <div class="row g-3 mb-3">
                            <div class="col-sm-6">
                                <label for="fileProfessionalPic" class="form-label fw-medium small">Profile Picture</label>
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                            </div>
                            <div class="col-sm-6">
                                <label for="txtProfessionalAadhaarId" class="form-label fw-medium small">Aadhaar ID</label>
                                <asp:TextBox ID="txtProfessionalAadhaarId" runat="server" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Enter Aadhaar number"></asp:TextBox>
                            </div>
                        </div>

                        <div class="mb-4 form-check">
                            <input type="checkbox" class="form-check-input" id="chkProTerms">
                            <label class="form-check-label small text-muted" for="chkProTerms">I agree to the <a href="#" class="text-primary text-decoration-none">Professional Terms & Conditions</a></label>
                            <br />
                            <asp:Button ID="Button1" runat="server" Text="Submit Application" CssClass="btn btn-primary w-100 rounded-pill py-2 fw-medium mb-3 shadow-sm hover-scale" OnClick="Button1_Click" />
                            <center>
                                <asp:Label ID="Label1" runat="server" Style="color: red"></asp:Label>
                            </center>
                        </div>

                        <div class="text-center mt-3">
                            <p class="text-muted small mb-0">Already registered as a pro? <a href="Login.aspx" class="text-decoration-none fw-bold text-primary">Log In</a></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

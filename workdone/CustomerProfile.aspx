<%@ Page Title="My Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="CustomerProfile.aspx.cs" Inherits="workdone.CustomerProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    My Profile - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .profile-avatar-circle {
            width: 100px;
            height: 100px;
            background: linear-gradient(135deg, #4F46E5 0%, #7C3AED 100%);
            color: #ffffff;
            font-size: 2.25rem;
            font-weight: 700;
            display: inline-flex;
            align-items: center;
            justify-content: center;
            border-radius: 50%;
            box-shadow: 0 10px 20px rgba(79, 70, 229, 0.25);
        }

        .profile-nav .nav-link {
            border-radius: 12px;
            padding: 12px 18px;
            color: #4B5563;
            font-weight: 500;
            display: flex;
            align-items: center;
            gap: 12px;
            transition: all 0.2s ease;
            margin-bottom: 6px;
            border: 1px solid transparent;
        }

            .profile-nav .nav-link:hover {
                background-color: #F3F4F6;
                color: var(--primary-color);
            }

            .profile-nav .nav-link.active {
                background-color: rgba(79, 70, 229, 0.08);
                color: var(--primary-color) !important;
                font-weight: 600;
                border-color: rgba(79, 70, 229, 0.2);
            }

        .profile-stat-box {
            background: #ffffff;
            border-radius: 14px;
            padding: 16px 20px;
            border: 1px solid #F3F4F6;
            transition: all 0.3s ease;
        }

            .profile-stat-box:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 20px rgba(0, 0, 0, 0.05);
                border-color: #E5E7EB;
            }

        .booking-card {
            border: 1px solid #F3F4F6;
            border-radius: 16px;
            transition: all 0.25s ease;
            background: #ffffff;
        }

            .booking-card:hover {
                border-color: #E5E7EB;
                box-shadow: 0 12px 24px -6px rgba(0, 0, 0, 0.08);
                transform: translateY(-2px);
            }

        .badge-subtle-success {
            background-color: #ECFDF5;
            color: #059669;
            border: 1px solid #A7F3D0;
        }

        .badge-subtle-primary {
            background-color: #EEF2FF;
            color: #4F46E5;
            border: 1px solid #C7D2FE;
        }

        .badge-subtle-warning {
            background-color: #FFFBEB;
            color: #D97706;
            border: 1px solid #FDE68A;
        }

        .form-floating-custom label {
            color: #6B7280;
            font-size: 0.85rem;
            font-weight: 500;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HERO / PROFILE HEADER -->
    <section class="bg-primary-subtle border-bottom py-4 py-md-5">
        <div class="container">
            <div class="row align-items-center justify-content-between g-4">
                <div class="col-lg-7">
                    <div class="d-flex align-items-center gap-3 gap-md-4">
                        <div class="position-relative">
                            <div class="profile-avatar-circle">
                                <asp:Label ID="lblAvatarInitials" runat="server" Text="CU"></asp:Label>
                            </div>
                            <span class="position-absolute bottom-0 end-0 bg-success border border-2 border-white rounded-circle p-2" title="Verified Customer"></span>
                        </div>
                        <div>
                            <div class="d-flex align-items-center gap-2 flex-wrap">
                                <h2 class="fw-bold mb-0 text-dark">
                                    <asp:Label ID="lblCustomerFullName" runat="server" ></asp:Label>
                                </h2>
                                <span class="badge bg-success-subtle text-success rounded-pill px-3 py-1 border border-success-subtle small fw-medium">
                                    <i class="bi bi-shield-check me-1"></i>Verified Member
                                </span>
                            </div>
                            <p class="text-muted mb-2 mt-1">
                                <i class="bi bi-envelope me-1"></i>
                                <asp:Label ID="lblHeaderEmail" runat="server" Text="customer@example.com"></asp:Label>
                                <span class="mx-2">•</span>
                                <i class="bi bi-geo-alt me-1 text-danger"></i>
                                <asp:Label ID="lblHeaderCity" runat="server" Text="Rajkot, Gujarat"></asp:Label>
                            </p>
                            <small class="text-secondary">Member since
                                <asp:Label ID="lblJoinDate" runat="server" Text="2026"></asp:Label></small>
                        </div>
                    </div>
                </div>

                <!-- Quick Stats Summary -->
                <div class="col-lg-5">
                    <div class="row g-2">
                        <div class="col-4">
                            <div class="profile-stat-box text-center">
                                <div class="fs-4 fw-bold text-primary">12</div>
                                <div class="text-muted small">Bookings</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="profile-stat-box text-center">
                                <div class="fs-4 fw-bold text-success">2</div>
                                <div class="text-muted small">Active</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="profile-stat-box text-center">
                                <div class="fs-4 fw-bold text-dark">₹450</div>
                                <div class="text-muted small">Wallet</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- MAIN PROFILE WORKSPACE -->
    <section class="py-5 bg-light min-vh-100">
        <div class="container">
            <div class="row g-4">
                <!-- LEFT SIDEBAR NAVIGATION -->
                <div class="col-lg-4 col-xl-3">
                    <div class="card border-0 shadow-sm rounded-4 p-3 sticky-top" style="top: 90px;">
                        <div class="profile-nav nav nav-pills flex-column" id="profileTab" role="tablist">
                            <button class="nav-link active" id="tab-profile-btn" data-bs-toggle="pill" data-bs-target="#tab-profile" type="button" role="tab" aria-controls="tab-profile" aria-selected="true">
                                <i class="bi bi-person-lines-fill fs-5"></i>
                                <span>Personal Info</span>
                            </button>
                            <button class="nav-link" id="tab-security-btn" data-bs-toggle="pill" data-bs-target="#tab-security" type="button" role="tab" aria-controls="tab-security" aria-selected="false">
                                <i class="bi bi-shield-lock-fill fs-5"></i>
                                <span>Security & Password</span>
                            </button>
                            <button class="nav-link" id="tab-bookings-btn" data-bs-toggle="pill" data-bs-target="#tab-bookings" type="button" role="tab" aria-controls="tab-bookings" aria-selected="false">
                                <i class="bi bi-calendar2-check-fill fs-5"></i>
                                <span>My Bookings</span>
                            </button>
                            <button class="nav-link" id="tab-addresses-btn" data-bs-toggle="pill" data-bs-target="#tab-addresses" type="button" role="tab" aria-controls="tab-addresses" aria-selected="false">
                                <i class="bi bi-geo-alt-fill fs-5"></i>
                                <span>Saved Addresses</span>
                            </button>
                            <button class="nav-link" id="tab-preferences-btn" data-bs-toggle="pill" data-bs-target="#tab-preferences" type="button" role="tab" aria-controls="tab-preferences" aria-selected="false">
                                <i class="bi bi-sliders fs-5"></i>
                                <span>Preferences</span>
                            </button>
                        </div>

                        <hr class="my-3 text-secondary opacity-25">

                        <div class="d-grid gap-2">
                            <asp:LinkButton ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-outline-danger rounded-3 py-2 fw-medium d-flex align-items-center justify-content-center gap-2" />
                        </div>

                        <div class="bg-primary-subtle rounded-3 p-3 mt-4 text-center">
                            <i class="bi bi-headset text-primary fs-3"></i>
                            <h6 class="fw-bold mt-2 mb-1">Need Assistance?</h6>
                            <p class="small text-muted mb-2">Our customer care is 24/7 ready to support your requests.</p>
                            <a href="About.aspx" class="btn btn-sm btn-primary rounded-pill px-3">Contact Support</a>
                        </div>
                    </div>
                </div>

                <!-- RIGHT CONTENT TABS -->
                <div class="col-lg-8 col-xl-9">
                    <div class="tab-content" id="profileTabContent">

                        <!-- TAB 1: PERSONAL INFO -->
                        <div class="tab-pane fade show active" id="tab-profile" role="tabpanel" aria-labelledby="tab-profile-btn">
                            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-white">
                                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                                    <div>
                                        <h4 class="fw-bold text-dark mb-1">Personal Information</h4>
                                        <p class="text-muted small mb-0">Update your personal contact details and delivery preferences</p>
                                    </div>
                                    <span class="badge bg-light text-secondary border px-3 py-2 rounded-pill small">
                                        <i class="bi bi-info-circle me-1"></i>ID:
                                        <asp:Label ID="lblCustomerId" runat="server" Text="--"></asp:Label>
                                    </span>
                                </div>

                                <asp:Panel ID="pnlAlertMessage" runat="server" Visible="false" CssClass="alert alert-dismissible fade show rounded-3 mb-4" role="alert">
                                    <asp:Label ID="lblAlertMessage" runat="server"></asp:Label>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <label for="txtfname" class="form-label fw-medium small text-dark">First Name</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-person text-muted"></i></span>
                                            <asp:TextBox ID="txtfname" runat="server" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="Enter first name"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtlname" class="form-label fw-medium small text-dark">Last Name</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-person text-muted"></i></span>
                                            <asp:TextBox ID="txtlname" runat="server" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="Enter last name"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <label for="txtEmail" class="form-label fw-medium small text-dark">Email Address</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-envelope text-muted"></i></span>
                                            <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" ReadOnly="true" CssClass="form-control rounded-end-3 py-2 bg-light border-1 text-muted" placeholder="you@example.com"></asp:TextBox>
                                        </div>
                                        <small class="text-muted">Email is linked to your account login.</small>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtPhone" class="form-label fw-medium small text-dark">Phone Number</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-telephone text-muted"></i></span>
                                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="+91 9876543210"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-6">
                                        <label for="ddlGender" class="form-label fw-medium small text-dark">Gender</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-gender-ambiguous text-muted"></i></span>
                                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="form-select rounded-end-3 py-2 bg-light border-1">
                                                <asp:ListItem Value="">Select gender</asp:ListItem>
                                                <asp:ListItem Value="Male">Male</asp:ListItem>
                                                <asp:ListItem Value="Female">Female</asp:ListItem>
                                                <asp:ListItem Value="Other">Other</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="ddlCity" class="form-label fw-medium small text-dark">City / Region</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-geo-alt text-muted"></i></span>
                                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select rounded-end-3 py-2 bg-light border-1">
                                                <asp:ListItem Value="Rajkot">Rajkot</asp:ListItem>
                                                <asp:ListItem Value="Ahmedabad">Ahmedabad</asp:ListItem>
                                                <asp:ListItem Value="Surat">Surat</asp:ListItem>
                                                <asp:ListItem Value="Vadodara">Vadodara</asp:ListItem>
                                            </asp:DropDownList>
                                        </div>
                                    </div>
                                </div>

                                <div class="mb-4">
                                    <label for="txtAddress" class="form-label fw-medium small text-dark">Delivery Address</label>
                                    <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control rounded-3 py-2 bg-light border-1" placeholder="Flat / House No., Apartment, Street, Landmark, Area"></asp:TextBox>
                                </div>

                                <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 pt-3 border-top">
                                    <div class="text-muted small">
                                        <i class="bi bi-check2-circle text-success me-1"></i>All changes are encrypted and safely stored.
                                   
                                    </div>
                                    <div class="d-flex gap-2">
                                        <button type="reset" class="btn btn-outline-secondary rounded-pill px-4 py-2 fw-medium">Reset</button>
                                        <asp:Button ID="btnUpdateProfile" runat="server" Text="Save Changes" CssClass="btn btn-primary rounded-pill px-4 py-2 fw-medium shadow-sm hover-scale" />
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- TAB 2: SECURITY & PASSWORD -->
                        <div class="tab-pane fade" id="tab-security" role="tabpanel" aria-labelledby="tab-security-btn">
                            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-white">
                                <div class="mb-4">
                                    <h4 class="fw-bold text-dark mb-1">Security & Password</h4>
                                    <p class="text-muted small mb-0">Ensure your account uses a secure, modern password</p>
                                </div>

                                <asp:Panel ID="pnlPasswordAlert" runat="server" Visible="false" CssClass="alert alert-dismissible fade show rounded-3 mb-4" role="alert">
                                    <asp:Label ID="lblPasswordAlert" runat="server"></asp:Label>
                                    <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
                                </asp:Panel>

                                <div class="row g-3 mb-3">
                                    <div class="col-md-12">
                                        <label for="txtCurrentPassword" class="form-label fw-medium small text-dark">Current Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-key text-muted"></i></span>
                                            <asp:TextBox ID="txtCurrentPassword" runat="server" TextMode="Password" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="Enter current password"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtNewPassword" class="form-label fw-medium small text-dark">New Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-lock text-muted"></i></span>
                                            <asp:TextBox ID="txtNewPassword" runat="server" TextMode="Password" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="Enter new password"></asp:TextBox>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <label for="txtConfirmPassword" class="form-label fw-medium small text-dark">Confirm New Password</label>
                                        <div class="input-group">
                                            <span class="input-group-text bg-light border-1"><i class="bi bi-lock-fill text-muted"></i></span>
                                            <asp:TextBox ID="txtConfirmPassword" runat="server" TextMode="Password" CssClass="form-control rounded-end-3 py-2 bg-light border-1" placeholder="Repeat new password"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>

                                <div class="bg-light rounded-3 p-3 mb-4 border">
                                    <h6 class="fw-bold small mb-2 text-dark">Password Requirements:</h6>
                                    <ul class="list-unstyled small text-muted mb-0">
                                        <li><i class="bi bi-check-circle-fill text-success me-1"></i>Minimum 8 characters in length</li>
                                        <li><i class="bi bi-check-circle-fill text-success me-1"></i>At least one uppercase and one lowercase letter</li>
                                        <li><i class="bi bi-check-circle-fill text-success me-1"></i>At least one number or special character</li>
                                    </ul>
                                </div>

                                <div class="d-flex justify-content-end pt-3 border-top">
                                    <asp:Button ID="btnChangePassword" runat="server" Text="Update Password" class="btn btn-primary rounded-pill px-4 py-2 fw-medium shadow-sm hover-scale" />s
                                </div>
                            </div>
                        </div>

                        <!-- TAB 3: MY BOOKINGS -->
                        <div class="tab-pane fade" id="tab-bookings" role="tabpanel" aria-labelledby="tab-bookings-btn">
                            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-white">
                                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                                    <div>
                                        <h4 class="fw-bold text-dark mb-1">My Bookings</h4>
                                        <p class="text-muted small mb-0">Track active orders and review previous services</p>
                                    </div>
                                    <a href="Professionals.aspx" class="btn btn-outline-primary btn-sm rounded-pill px-3">
                                        <i class="bi bi-plus-lg me-1"></i>Book New Service
                                    </a>
                                </div>

                                <!-- Booking List -->
                                <div class="d-flex flex-column gap-3">
                                    <!-- Booking Item 1 -->
                                    <div class="booking-card p-4">
                                        <div class="d-flex justify-content-between align-items-start flex-wrap gap-2 mb-3">
                                            <div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <h5 class="fw-bold mb-0 text-dark">AC Deep Cleaning & Service</h5>
                                                    <span class="badge badge-subtle-warning rounded-pill px-3 py-1 fw-medium small">Scheduled</span>
                                                </div>
                                                <p class="text-muted small mb-0 mt-1">Booking #WD-84291 • Booked for Tomorrow, 11:00 AM</p>
                                            </div>
                                            <div class="text-md-end">
                                                <span class="fs-5 fw-bold text-dark">₹799</span>
                                                <div class="text-muted small">Cash / Online after service</div>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 pt-3 border-top">
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="https://randomuser.me/api/portraits/men/44.jpg" class="rounded-circle border" width="36" height="36" alt="Worker">
                                                <div>
                                                    <div class="small fw-bold text-dark">Vikram Mehta</div>
                                                    <small class="text-muted"><i class="bi bi-star-fill text-warning"></i>4.9 (124 reviews)</small>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-2">
                                                <a href="tel:+919876543210" class="btn btn-sm btn-outline-secondary rounded-pill px-3">
                                                    <i class="bi bi-telephone me-1"></i>Call Pro
                                                </a>
                                                <button type="button" class="btn btn-sm btn-primary rounded-pill px-3">
                                                    View Details
                                               
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Booking Item 2 -->
                                    <div class="booking-card p-4">
                                        <div class="d-flex justify-content-between align-items-start flex-wrap gap-2 mb-3">
                                            <div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <h5 class="fw-bold mb-0 text-dark">Complete Home Electrical Repair</h5>
                                                    <span class="badge badge-subtle-success rounded-pill px-3 py-1 fw-medium small">Completed</span>
                                                </div>
                                                <p class="text-muted small mb-0 mt-1">Booking #WD-83104 • Completed on Sep 14, 2026</p>
                                            </div>
                                            <div class="text-md-end">
                                                <span class="fs-5 fw-bold text-dark">₹499</span>
                                                <div class="text-success small"><i class="bi bi-check-circle-fill me-1"></i>Paid</div>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 pt-3 border-top">
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="https://randomuser.me/api/portraits/men/32.jpg" class="rounded-circle border" width="36" height="36" alt="Worker">
                                                <div>
                                                    <div class="small fw-bold text-dark">Rahul Patel</div>
                                                    <small class="text-muted"><i class="bi bi-star-fill text-warning"></i>4.8 (89 reviews)</small>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-2">
                                                <a href="Professionals.aspx" class="btn btn-sm btn-outline-primary rounded-pill px-3">Book Again
                                                </a>
                                                <button type="button" class="btn btn-sm btn-light border rounded-pill px-3">
                                                    Download Invoice
                                               
                                                </button>
                                            </div>
                                        </div>
                                    </div>

                                    <!-- Booking Item 3 -->
                                    <div class="booking-card p-4">
                                        <div class="d-flex justify-content-between align-items-start flex-wrap gap-2 mb-3">
                                            <div>
                                                <div class="d-flex align-items-center gap-2">
                                                    <h5 class="fw-bold mb-0 text-dark">Bathroom Plumbing & Tap Repair</h5>
                                                    <span class="badge badge-subtle-success rounded-pill px-3 py-1 fw-medium small">Completed</span>
                                                </div>
                                                <p class="text-muted small mb-0 mt-1">Booking #WD-81992 • Completed on Aug 28, 2026</p>
                                            </div>
                                            <div class="text-md-end">
                                                <span class="fs-5 fw-bold text-dark">₹349</span>
                                                <div class="text-success small"><i class="bi bi-check-circle-fill me-1"></i>Paid</div>
                                            </div>
                                        </div>

                                        <div class="d-flex align-items-center justify-content-between flex-wrap gap-3 pt-3 border-top">
                                            <div class="d-flex align-items-center gap-2">
                                                <img src="https://randomuser.me/api/portraits/men/75.jpg" class="rounded-circle border" width="36" height="36" alt="Worker">
                                                <div>
                                                    <div class="small fw-bold text-dark">Manoj Solanki</div>
                                                    <small class="text-muted"><i class="bi bi-star-fill text-warning"></i>4.7 (56 reviews)</small>
                                                </div>
                                            </div>
                                            <div class="d-flex gap-2">
                                                <a href="Professionals.aspx" class="btn btn-sm btn-outline-primary rounded-pill px-3">Book Again
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- TAB 4: SAVED ADDRESSES -->
                        <div class="tab-pane fade" id="tab-addresses" role="tabpanel" aria-labelledby="tab-addresses-btn">
                            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-white">
                                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                                    <div>
                                        <h4 class="fw-bold text-dark mb-1">Saved Addresses</h4>
                                        <p class="text-muted small mb-0">Manage delivery and service location addresses</p>
                                    </div>
                                    <button type="button" class="btn btn-primary btn-sm rounded-pill px-3" data-bs-toggle="modal" data-bs-target="#addAddressModal">
                                        <i class="bi bi-plus-lg me-1"></i>Add New Address
                                   
                                    </button>
                                </div>

                                <div class="row g-3">
                                    <div class="col-md-6">
                                        <div class="border rounded-4 p-4 h-100 position-relative bg-light">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="d-flex align-items-center gap-2">
                                                    <i class="bi bi-house-door-fill text-primary fs-5"></i>
                                                    <h6 class="fw-bold mb-0">Home (Primary)</h6>
                                                </div>
                                                <span class="badge bg-primary rounded-pill px-2 py-1 small">Default</span>
                                            </div>
                                            <p class="text-muted small mb-3">
                                                <asp:Label ID="lblDisplayAddress" runat="server" Text="B-402, Royal Palace Apartments, Near Kalawad Road, Rajkot, Gujarat - 360005"></asp:Label>
                                            </p>
                                            <div class="d-flex gap-2">
                                                <button type="button" class="btn btn-sm btn-outline-primary rounded-pill px-3">Edit</button>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-md-6">
                                        <div class="border rounded-4 p-4 h-100 position-relative">
                                            <div class="d-flex justify-content-between align-items-center mb-2">
                                                <div class="d-flex align-items-center gap-2">
                                                    <i class="bi bi-briefcase-fill text-secondary fs-5"></i>
                                                    <h6 class="fw-bold mb-0">Office / Workplace</h6>
                                                </div>
                                            </div>
                                            <p class="text-muted small mb-3">
                                                304, Sapphire Complex, 150 Feet Ring Road, Rajkot, Gujarat - 360004
                                           
                                            </p>
                                            <div class="d-flex gap-2">
                                                <button type="button" class="btn btn-sm btn-outline-secondary rounded-pill px-3">Edit</button>
                                                <button type="button" class="btn btn-sm btn-outline-danger rounded-pill px-3">Remove</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- TAB 5: PREFERENCES -->
                        <div class="tab-pane fade" id="tab-preferences" role="tabpanel" aria-labelledby="tab-preferences-btn">
                            <div class="card border-0 shadow-sm rounded-4 p-4 p-md-5 bg-white">
                                <div class="mb-4">
                                    <h4 class="fw-bold text-dark mb-1">Notification & Preferences</h4>
                                    <p class="text-muted small mb-0">Customize how and when WorkDone connects with you</p>
                                </div>

                                <div class="list-group list-group-flush border rounded-3 mb-4">
                                    <div class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <div>
                                            <h6 class="fw-bold mb-1">Booking Status Updates</h6>
                                            <p class="text-muted small mb-0">Receive instant SMS and WhatsApp notifications when a professional is on the way.</p>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" id="switchBookingUpdates" checked>
                                        </div>
                                    </div>

                                    <div class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <div>
                                            <h6 class="fw-bold mb-1">Exclusive Offers & Promotions</h6>
                                            <p class="text-muted small mb-0">Get discounts and promotional deals on home services in your area.</p>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" id="switchPromo" checked>
                                        </div>
                                    </div>

                                    <div class="list-group-item d-flex justify-content-between align-items-center p-3">
                                        <div>
                                            <h6 class="fw-bold mb-1">Newsletter & Service Tips</h6>
                                            <p class="text-muted small mb-0">Monthly maintenance tips and safety recommendations from top rated experts.</p>
                                        </div>
                                        <div class="form-check form-switch">
                                            <input class="form-check-input" type="checkbox" role="switch" id="switchTips">
                                        </div>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-end">
                                    <button type="button" class="btn btn-primary rounded-pill px-4 py-2 fw-medium shadow-sm hover-scale">Save Preferences</button>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>
    </section>
</asp:Content>

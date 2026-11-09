<%@ Page Title="Professional Dashboard" Language="C#" MasterPageFile="~/Professional/Professional.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="workdone.Professional.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfessionalTitle" runat="server">
    Dashboard - Professional Portal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ProfessionalHead" runat="server">
    <style>
        .stat-card {
            background: #ffffff;
            border-radius: 14px;
            padding: 22px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
            display: flex;
            align-items: center;
            justify-content: space-between;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .stat-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.06);
        }

        .stat-icon {
            width: 52px;
            height: 52px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.5rem;
        }

        .stat-icon.blue {
            background: #eff6ff;
            color: #2563eb;
        }

        .stat-icon.green {
            background: #ecfdf5;
            color: #059669;
        }

        .stat-icon.purple {
            background: #faf5ff;
            color: #7c3aed;
        }

        .stat-icon.amber {
            background: #fffbeb;
            color: #d97706;
        }

        .dashboard-panel {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid #e2e8f0;
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.04);
            overflow: hidden;
        }

        .panel-header {
            padding: 18px 24px;
            border-bottom: 1px solid #e2e8f0;
            display: flex;
            align-items: center;
            justify-content: space-between;
        }

        .panel-body {
            padding: 24px;
        }

        .booking-row {
            padding: 18px;
            border-radius: 12px;
            border: 1px solid #e2e8f0;
            margin-bottom: 16px;
            background: #ffffff;
            transition: all 0.2s ease;
        }

        .booking-row:hover {
            background-color: #f8fafc;
            border-color: #cbd5e1;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.05);
        }

        .service-badge {
            font-size: 0.78rem;
            padding: 5px 12px;
            border-radius: 6px;
            background: #e0f2fe;
            color: #0369a1;
            font-weight: 600;
            display: inline-block;
        }

        .label-title {
            font-weight: 600;
            color: #475569;
            font-size: 0.85rem;
        }

        .label-value {
            color: #0f172a;
            font-weight: 600;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfessionalMainContent" runat="server">
    <!-- HERO GREETING -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 gap-3">
        <div>
            <h3 class="fw-bold text-dark mb-1">Welcome back, <asp:Label ID="lblPartnerName" runat="server" Text="Partner"></asp:Label>!</h3>
            <p class="text-muted mb-0">Here is a summary of your assigned jobs, inquiries, and earnings.</p>
        </div>
        <div class="d-flex gap-2">
            <a href="Help.aspx" class="btn btn-outline-primary rounded-pill px-3">
                <i class="bi bi-question-circle me-1"></i> Need Help?
            </a>
            <a href="ContactUs.aspx" class="btn btn-primary rounded-pill px-4">
                <i class="bi bi-headset me-1"></i> Contact Support
            </a>
        </div>
    </div>

    <!-- METRICS OVERVIEW -->
    <div class="row g-3 mb-4">
        <div class="col-xl-3 col-sm-6">
            <div class="stat-card">
                <div>
                    <span class="text-muted small fw-medium d-block mb-1">New Job Requests</span>
                    <h3 class="fw-bold mb-0 text-dark">
                        <asp:Label ID="lblPendingStat" runat="server" Text="0"></asp:Label>
                    </h3>
                    <span class="text-success small fw-medium"><i class="bi bi-arrow-up-right"></i> Pending approval</span>
                </div>
                <div class="stat-icon blue">
                    <i class="bi bi-bell-fill"></i>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-sm-6">
            <div class="stat-card">
                <div>
                    <span class="text-muted small fw-medium d-block mb-1">Completed Services</span>
                    <h3 class="fw-bold mb-0 text-dark">
                        <asp:Label ID="lblCompletedStat" runat="server" Text="0"></asp:Label>
                    </h3>
                    <span class="text-primary small fw-medium"><i class="bi bi-check-circle"></i> Accepted jobs</span>
                </div>
                <div class="stat-icon green">
                    <i class="bi bi-check2-all"></i>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-sm-6">
            <div class="stat-card">
                <div>
                    <span class="text-muted small fw-medium d-block mb-1">Estimated Earnings</span>
                    <h3 class="fw-bold mb-0 text-dark"><asp:Label ID="lblEarnings" runat="server" Text="?0"></asp:Label></h3>
                    <span class="text-success small fw-medium"><i class="bi bi-graph-up"></i> Based on completed jobs</span>
                </div>
                <div class="stat-icon purple">
                    <i class="bi bi-cash-stack"></i>
                </div>
            </div>
        </div>

        <div class="col-xl-3 col-sm-6">
            <div class="stat-card">
                <div>
                    <span class="text-muted small fw-medium d-block mb-1">Customer Rating</span>
                    <h3 class="fw-bold mb-0 text-dark">4.9 <small class="text-muted fs-6">/ 5</small></h3>
                    <span class="text-warning small fw-medium"><i class="bi bi-star-fill"></i> 52 reviews</span>
                </div>
                <div class="stat-icon amber">
                    <i class="bi bi-star-fill"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- MAIN TWO COLUMN LAYOUT -->
    <div class="row g-4">
        <!-- RECENT JOB REQUESTS -->
        <div class="col-lg-8">
            <div class="dashboard-panel mb-4">
                <div class="panel-header">
                    <div>
                        <h5 class="fw-bold mb-0 text-dark">Incoming Service Requests</h5>
                        <small class="text-muted">Customers waiting for confirmation</small>
                    </div>
                    <asp:Label ID="lblPendingBadge" runat="server" CssClass="badge bg-primary rounded-pill px-3 py-2" Text="0 Pending"></asp:Label>
                </div>
                <div class="panel-body">

                    <!-- Empty State when no bookings exist -->
                    <asp:Panel ID="pnlNoData" runat="server" Visible="false" CssClass="alert alert-light border border-secondary border-opacity-25 rounded-4 p-4 text-center my-2">
                        <div class="py-3">
                            <i class="bi bi-inbox text-muted display-6 d-block mb-2"></i>
                            <h6 class="fw-bold text-dark mb-1">No Service Requests Found</h6>
                            <p class="text-muted small mb-0">When customers book your services, their details and requests will appear here.</p>
                        </div>
                    </asp:Panel>

                    <!-- DataList for Booking Requests -->
                    <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand" OnSelectedIndexChanged="DataList1_SelectedIndexChanged">
                        <ItemTemplate>
                            <div class="booking-row">
                                <div class="d-flex flex-column flex-sm-row justify-content-between align-items-sm-start gap-3">
                                    <div class="d-flex align-items-start gap-3">
                                        <div class="rounded-circle bg-primary-subtle p-3 d-flex align-items-center justify-content-center text-primary fs-4 flex-shrink-0" style="width: 52px; height: 52px;">
                                            <i class="bi bi-person-fill"></i>
                                        </div>
                                        <div>
                                            <!-- Name & Status -->
                                            <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                                                <span class="label-title">Name:</span>
                                                <h6 class="mb-0 fw-bold text-dark">
                                                    <asp:Label ID="lblname" runat="server" Text='<%# Eval("name") %>' CssClass="label-value"></asp:Label>
                                                </h6>
                                                <span class='badge <%# Eval("status").ToString() == "Accepted" ? "bg-success" : (Eval("status").ToString() == "Rejected" ? "bg-danger" : "bg-warning text-dark") %> rounded-pill px-3 py-1 ms-sm-2'>
                                                    Status: <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'></asp:Label>
                                                </span>
                                            </div>

                                            <!-- Work & Duration -->
                                            <div class="d-flex align-items-center gap-2 mb-2 flex-wrap">
                                                <span class="service-badge">
                                                    <i class="bi bi-tools me-1"></i>Work:
                                                    <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                                </span>
                                                <span class="badge bg-secondary-subtle text-secondary border">
                                                    <i class="bi bi-clock-history me-1"></i>Duration:
                                                    <asp:Label ID="lblduration" runat="server" Text='<%# Eval("duration") %>'></asp:Label>
                                                </span>
                                            </div>

                                            <!-- Address -->
                                            <div class="text-muted small mb-1">
                                                <i class="bi bi-geo-alt-fill text-danger me-1"></i>
                                                <span class="label-title">Address:</span>
                                                <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("address") %>' CssClass="text-dark fw-medium"></asp:Label>
                                                <br />
                                            </div>

                                            <!-- Contact & Schedule Details -->

                                            <%# (Eval("description") != null && !string.IsNullOrEmpty(Eval("description").ToString())) ? 
                                                "<div class=\"text-muted small mt-2 p-2 bg-light rounded border border-light-subtle\"><i class=\"bi bi-chat-left-text me-1 text-secondary\"></i><strong>Customer Note:</strong> " + Eval("description") + "</div>" : "" %>
                                        </div>
                                    </div>

                                    <!-- Action Buttons -->
                                    <div class="d-flex align-items-center gap-2 flex-shrink-0 mt-2 mt-sm-0">
                                        <asp:LinkButton ID="lnkaccept" runat="server" CommandArgument='<%# Eval("booking_Id") %>' CommandName="cmdaccept" CssClass="btn btn-sm btn-success rounded-pill px-3 py-1 fw-medium shadow-sm"><i class="bi bi-check-lg me-1"></i>Accept</asp:LinkButton>
                                        <asp:LinkButton ID="lnkreject" runat="server" CommandArgument='<%# Eval("booking_Id") %>' CommandName="cmdreject" CssClass="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 fw-medium"><i class="bi bi-x-lg me-1"></i>Reject</asp:LinkButton>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:DataList>

                </div>
            </div>
        </div>

        <!-- RIGHT SIDEBAR: QUICK ACTIONS & HELP SHORTCUTS -->
        <div class="col-lg-4">
            <!-- QUICK AVAILABILITY CARD -->
            <div class="dashboard-panel mb-4">
                <div class="panel-header">
                    <h6 class="fw-bold mb-0 text-dark">Duty Status <span class="badge bg-success ms-2">Active</span></h6>
                </div>
                <div class="panel-body text-center">
                    <div class="mb-3">
                        <i class="bi bi-shield-check text-success display-4"></i>
                    </div>
                    <h6 class="fw-bold mb-1">You are Online</h6>
                    <p class="text-muted small mb-3">You are currently visible to nearby customers in your service area.</p>
                    <div class="form-check form-switch d-inline-flex align-items-center gap-2">
                        <input class="form-check-input" type="checkbox" role="switch" id="dutyToggle" checked>
                        <label class="form-check-label fw-medium small" for="dutyToggle">Receive new booking alerts</label>
                    </div>
                </div>
            </div>

            <!-- RESTRICTED PORTAL NOTICE & SHORTCUTS -->
            <div class="dashboard-panel">
                <div class="panel-header">
                    <h6 class="fw-bold mb-0 text-dark">Professional Support</h6>
                </div>
                <div class="panel-body">
                    <div class="p-3 rounded bg-light mb-3">
                        <div class="d-flex gap-3">
                            <i class="bi bi-info-circle-fill text-primary fs-4"></i>
                            <div>
                                <h6 class="fw-bold mb-1 small">Dedicated Portal</h6>
                                <p class="text-muted mb-0" style="font-size: 0.8rem;">
                                    As a registered professional, you have access exclusively to your <strong>Dashboard</strong>, <strong>Help</strong>, and <strong>Contact Us</strong> sections.
                                </p>
                            </div>
                        </div>
                    </div>

                    <div class="d-grid gap-2">
                        <a href="Help.aspx" class="btn btn-outline-secondary text-start d-flex justify-content-between align-items-center py-2 px-3">
                            <span><i class="bi bi-question-circle text-primary me-2"></i> Professional Guide & FAQs</span>
                            <i class="bi bi-chevron-right text-muted small"></i>
                        </a>
                        <a href="ContactUs.aspx" class="btn btn-outline-secondary text-start d-flex justify-content-between align-items-center py-2 px-3">
                            <span><i class="bi bi-headset text-success me-2"></i> Partner Support Desk</span>
                            <i class="bi bi-chevron-right text-muted small"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>


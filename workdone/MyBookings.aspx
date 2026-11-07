<%@ Page Title="My Bookings" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="MyBookings.aspx.cs" Inherits="workdone.MyBookings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
        My Bookings - WorkDone Customer Portal
    </asp:Content>

    <asp:Content ID="Content2" ContentPlaceHolderID="HeadContent" runat="server">
        <style>
            :root {
                --primary-color: #2563eb;
                --primary-hover: #1d4ed8;
                --primary-soft: #eff6ff;
                --success-soft: #ecfdf5;
                --success-color: #059669;
                --warning-soft: #fffbeb;
                --warning-color: #d97706;
                --danger-soft: #fef2f2;
                --danger-color: #dc2626;
                --surface-bg: #f8fafc;
                --card-border: #e2e8f0;
            }

            .booking-page-wrapper {
                background-color: var(--surface-bg);
                min-height: calc(100vh - 80px);
            }

            /* Hero Header */
            .customer-hero {
                background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
                position: relative;
                overflow: hidden;
            }

            .customer-hero::before {
                content: '';
                position: absolute;
                top: -50%;
                right: -20%;
                width: 500px;
                height: 500px;
                background: radial-gradient(circle, rgba(37, 99, 235, 0.25) 0%, rgba(37, 99, 235, 0) 70%);
                border-radius: 50%;
                pointer-events: none;
            }

            /* Sidebar Navigation */
            .customer-sidebar-card {
                background: #ffffff;
                border-radius: 20px;
                border: 1px solid var(--card-border);
                box-shadow: 0 4px 20px -2px rgba(0, 0, 0, 0.05);
            }

            .cust-nav .nav-link {
                border-radius: 12px;
                padding: 12px 16px;
                color: #475569;
                font-weight: 500;
                display: flex;
                align-items: center;
                gap: 12px;
                transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1);
                margin-bottom: 6px;
                border: 1px solid transparent;
                text-decoration: none;
            }

            .cust-nav .nav-link:hover {
                background-color: #f1f5f9;
                color: var(--primary-color);
                transform: translateX(4px);
            }

            .cust-nav .nav-link.active {
                background-color: var(--primary-soft);
                color: var(--primary-color) !important;
                font-weight: 600;
                border-color: rgba(37, 99, 235, 0.2);
                box-shadow: 0 2px 8px rgba(37, 99, 235, 0.08);
            }

            /* Stat Pills */
            .stat-pill {
                background: #ffffff;
                border: 1px solid var(--card-border);
                border-radius: 16px;
                padding: 14px 20px;
                transition: transform 0.25s ease, box-shadow 0.25s ease;
            }

            .stat-pill:hover {
                transform: translateY(-3px);
                box-shadow: 0 10px 20px -4px rgba(0, 0, 0, 0.08);
            }

            /* Booking Cards */
            .booking-item-card {
                background: #ffffff;
                border: 1px solid var(--card-border);
                border-radius: 20px;
                transition: all 0.25s ease;
                position: relative;
                overflow: hidden;
            }

            .booking-item-card:hover {
                border-color: #cbd5e1;
                box-shadow: 0 16px 32px -8px rgba(15, 23, 42, 0.08);
                transform: translateY(-2px);
            }

            .booking-item-card.is-scheduled {
                border-left: 5px solid var(--warning-color);
            }

            .booking-item-card.is-ongoing {
                border-left: 5px solid var(--primary-color);
            }

            .booking-item-card.is-completed {
                border-left: 5px solid var(--success-color);
            }

            .booking-item-card.is-cancelled {
                border-left: 5px solid #94a3b8;
            }

            /* Badges */
            .status-pill {
                display: inline-flex;
                align-items: center;
                gap: 6px;
                padding: 6px 14px;
                border-radius: 9999px;
                font-size: 0.8rem;
                font-weight: 600;
                letter-spacing: 0.02em;
            }

            .status-pill-warning {
                background-color: var(--warning-soft);
                color: var(--warning-color);
                border: 1px solid #fde68a;
            }

            .status-pill-primary {
                background-color: var(--primary-soft);
                color: var(--primary-color);
                border: 1px solid #bfdbfe;
            }

            .status-pill-success {
                background-color: var(--success-soft);
                color: var(--success-color);
                border: 1px solid #a7f3d0;
            }

            .status-pill-secondary {
                background-color: #f1f5f9;
                color: #64748b;
                border: 1px solid #cbd5e1;
            }

            .status-dot-pulse {
                width: 8px;
                height: 8px;
                border-radius: 50%;
                display: inline-block;
                animation: pulse-ring 1.8s infinite;
            }

            @keyframes pulse-ring {
                0% {
                    transform: scale(0.95);
                    box-shadow: 0 0 0 0 rgba(217, 119, 6, 0.7);
                }

                70% {
                    transform: scale(1);
                    box-shadow: 0 0 0 6px rgba(217, 119, 6, 0);
                }

                100% {
                    transform: scale(0.95);
                    box-shadow: 0 0 0 0 rgba(217, 119, 6, 0);
                }
            }

            .pulse-primary {
                background-color: #2563eb;
                box-shadow: 0 0 0 0 rgba(37, 99, 235, 0.7);
                animation: pulse-primary-anim 1.8s infinite;
            }

            @keyframes pulse-primary-anim {
                0% {
                    transform: scale(0.95);
                    box-shadow: 0 0 0 0 rgba(37, 99, 235, 0.7);
                }

                70% {
                    transform: scale(1);
                    box-shadow: 0 0 0 6px rgba(37, 99, 235, 0);
                }

                100% {
                    transform: scale(0.95);
                    box-shadow: 0 0 0 0 rgba(37, 99, 235, 0);
                }
            }

            /* Stepper progress */
            .booking-stepper {
                display: flex;
                align-items: center;
                justify-content: space-between;
                position: relative;
                margin: 18px 0;
                padding: 0 10px;
            }

            .booking-stepper::before {
                content: '';
                position: absolute;
                top: 14px;
                left: 20px;
                right: 20px;
                height: 3px;
                background-color: #e2e8f0;
                z-index: 1;
            }

            .stepper-progress-line {
                position: absolute;
                top: 14px;
                left: 20px;
                height: 3px;
                background-color: var(--primary-color);
                z-index: 2;
                transition: width 0.3s ease;
            }

            .stepper-step {
                position: relative;
                z-index: 3;
                display: flex;
                flex-direction: column;
                align-items: center;
                gap: 6px;
            }

            .stepper-circle {
                width: 30px;
                height: 30px;
                border-radius: 50%;
                background: #ffffff;
                border: 2px solid #cbd5e1;
                display: flex;
                align-items: center;
                justify-content: center;
                font-size: 0.75rem;
                font-weight: 700;
                color: #64748b;
                transition: all 0.3s ease;
            }

            .stepper-step.completed .stepper-circle {
                background-color: var(--success-color);
                border-color: var(--success-color);
                color: #ffffff;
            }

            .stepper-step.active .stepper-circle {
                background-color: var(--primary-color);
                border-color: var(--primary-color);
                color: #ffffff;
                box-shadow: 0 0 0 4px rgba(37, 99, 235, 0.2);
            }

            .stepper-label {
                font-size: 0.75rem;
                color: #64748b;
                font-weight: 500;
                text-align: center;
                max-width: 80px;
            }

            .stepper-step.active .stepper-label {
                color: var(--primary-color);
                font-weight: 700;
            }

            /* Filter Tabs */
            .filter-pill-btn {
                border-radius: 9999px;
                padding: 8px 18px;
                font-size: 0.88rem;
                font-weight: 500;
                color: #475569;
                background: #ffffff;
                border: 1px solid var(--card-border);
                cursor: pointer;
                transition: all 0.2s ease;
                display: inline-flex;
                align-items: center;
                gap: 8px;
            }

            .filter-pill-btn:hover {
                background-color: #f1f5f9;
                color: #0f172a;
            }

            .filter-pill-btn.active {
                background-color: var(--primary-color);
                color: #ffffff;
                border-color: var(--primary-color);
                box-shadow: 0 4px 12px rgba(37, 99, 235, 0.25);
            }

            .filter-pill-btn .pill-count {
                background: rgba(0, 0, 0, 0.08);
                border-radius: 9999px;
                padding: 1px 7px;
                font-size: 0.75rem;
            }

            .filter-pill-btn.active .pill-count {
                background: rgba(255, 255, 255, 0.25);
                color: #ffffff;
            }

            /* OTP Code box */
            .otp-pill {
                background: #f8fafc;
                border: 1px dashed #3b82f6;
                border-radius: 10px;
                padding: 6px 12px;
                display: inline-flex;
                align-items: center;
                gap: 8px;
                font-size: 0.85rem;
                color: #1e3a8a;
                font-weight: 600;
            }
        </style>
    </asp:Content>

    <asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">
        <div class="booking-page-wrapper py-5">
            <div class="container">
                <!-- Header -->
                <div class="d-flex justify-content-between align-items-center mb-4 flex-wrap gap-2">
                    <div>
                        <h3 class="fw-bold text-dark mb-1">My Bookings</h3>
                        <p class="text-muted small mb-0">Track your service requests, assigned worker details, and live
                            status.</p>
                    </div>
                    <a href="Professionals.aspx" class="btn btn-primary rounded-pill px-4 shadow-sm">
                        <i class="bi bi-plus-lg me-1"></i>Book New Service
                    </a>
                </div>

                <!-- Bookings DataList -->
                <asp:DataList ID="DataList1" runat="server" Width="100%">
                    <ItemTemplate>
                        <div
                            class='booking-item-card p-4 mb-4 shadow-sm <%# Eval("status").ToString() == "Accepted" ? "is-completed" : (Eval("status").ToString() == "Rejected" ? "is-cancelled" : "is-scheduled") %>'>
                            <!-- Top: Service Name & Status Badge -->
                            <div class="d-flex justify-content-between align-items-start flex-wrap gap-2 mb-3">
                                <div>
                                    <div class="d-flex align-items-center gap-2 flex-wrap mb-1">
                                        <h5 class="fw-bold mb-0 text-dark">
                                            <asp:Label ID="lblservice" runat="server" Text='<%# Eval("service") %>'>
                                            </asp:Label>
                                        </h5>
                                        <span
                                            class="badge bg-primary-subtle text-primary border border-primary-subtle rounded-pill px-3 py-1 small">
                                            <i class="bi bi-clock-history me-1"></i>
                                            <%# Eval("duration") %>
                                        </span>
                                    </div>
                                </div>

                                <!-- Live Status Pill -->
                                <div>
                                    <span
                                        class='<%# Eval("status").ToString() == "Accepted" ? "status-pill status-pill-success" : (Eval("status").ToString() == "Rejected" ? "status-pill status-pill-secondary" : "status-pill status-pill-warning") %>'>
                                        <%# Eval("status").ToString()=="Accepted" ? "<i class=\"bi bi-check-circle-fill me-1\"></i>Accepted & Confirmed" : (Eval("status").ToString() == "Rejected" ? "<i class=\"bi bi-x-circle-fill text-danger me-1\"></i>Request Rejected" : "<span class=\"status-dot-pulse bg-warning me-1\"></span>Waiting for Worker") %>
                                    </span>
                                </div>
                            </div>

                            <!-- Description -->
                            <div class="mb-3">
                                <span class="text-muted small"><strong>Description / Work:</strong></span>
                                <div class="p-2 mt-1 bg-light rounded-3 text-muted small border border-light-subtle">
                                    <i class="bi bi-card-text text-secondary me-1"></i>
                                    <asp:Label ID="lbldesc" runat="server" Text='<%# Eval("description") %>'>
                                    </asp:Label>
                                </div>
                            </div>

                            <!-- Address -->
                            <div class="text-muted small mb-3">
                                <i class="bi bi-geo-alt-fill text-danger me-1"></i>
                                <strong>Service Address:</strong>
                                <asp:Label ID="lbladdress" runat="server" Text='<%# Eval("address") %>'
                                    CssClass="text-dark"></asp:Label>
                            </div>

                            <!-- Live Status Banner -->
                            <div class="p-3 mb-3 rounded-3 <%# Eval("status").ToString()=="Accepted"
                                ? "bg-success-subtle border border-success-subtle text-success-emphasis" :
                                (Eval("status").ToString()=="Rejected"
                                ? "bg-danger-subtle border border-danger-subtle text-danger-emphasis"
                                : "bg-warning-subtle border border-warning-subtle text-warning-emphasis" ) %> small">
                                <%# Eval("status").ToString()=="Accepted" ? "<i class=\"bi bi-check-circle-fill me-2 fs-6 text-success\"></i><strong>Great news!</strong> The professional accepted your booking and confirmed the job." :
                                    (Eval("status").ToString() == "Rejected" ?
                                    "<i class=\"bi bi-exclamation-triangle-fill me-2 fs-6 text-danger\"></i><strong>Notice:</strong> The professional was unavailable and declined this slot. Please choose another worker." :
                                    "<i class=\"bi bi-hourglass-split me-2 fs-6 text-warning\"></i><strong>Request Sent:</strong> The professional has been notified and will accept or confirm shortly.")
                                    %>
                            </div>

                            <!-- Worker Details & Call Button -->
                            <div
                                class="d-flex align-items-center justify-content-between flex-wrap gap-3 pt-3 border-top">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="rounded-circle bg-primary-subtle text-primary p-3 d-flex align-items-center justify-content-center fs-4 flex-shrink-0"
                                        style="width: 48px; height: 48px;">
                                        <i class="bi bi-person-badge"></i>
                                    </div>
                                    <div>
                                        <div class="d-flex align-items-center gap-2">
                                            <span class="small text-muted">Worker Name:</span>
                                            <span class="fw-bold text-dark fs-6">
                                                <asp:Label ID="lblfname" runat="server" Text='<%# Eval("fname") + " " + Eval("lname") %>'></asp:Label>
                                            </span>
                                        </div>
                                        <small class="text-muted">
                                            <i class="bi bi-tools text-secondary me-1"></i>
                                            <%# Eval("service") %> &bull;
                                                <i class="bi bi-telephone text-success me-1"></i>Phone: <asp:Label
                                                    ID="lblphone" runat="server" Text='<%# Eval("phone") %>'>
                                                </asp:Label>
                                        </small>
                                    </div>
                                </div>

                                <div class="d-flex align-items-center gap-2">
                                    <span class="small text-muted me-1">Status:</span>
                                    <asp:Label ID="lblstatus" runat="server" Text='<%# Eval("status") %>'
                                        CssClass='<%# Eval("status").ToString() == "Accepted" ? "badge bg-success rounded-pill px-3 py-2 fw-medium" : (Eval("status").ToString() == "Rejected" ? "badge bg-danger rounded-pill px-3 py-2 fw-medium" : "badge bg-warning text-dark rounded-pill px-3 py-2 fw-medium") %>'>
                                    </asp:Label>

                                    <%# Eval("status").ToString()=="Accepted" ? "<a href=\"tel:" + Eval("phone") + "\" class=\"btn btn-success btn-sm rounded-pill px-3 shadow-sm ms-2\"><i class=\"bi bi-telephone-fill me-1\"></i>Call Worker</a>" : "" %>
                                    <%# Eval("status").ToString()=="Rejected" ? "<a href=\"Professionals.aspx\" class=\"btn btn-outline-primary btn-sm rounded-pill px-3 ms-2\"><i class=\"bi bi-arrow-repeat me-1\"></i>Book Other</a>" : "" %>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
            </div>
        </div>
    </asp:Content>
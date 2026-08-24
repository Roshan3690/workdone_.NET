<%@ Page Title="Professionals Management" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminWorkers.aspx.cs" Inherits="workdone.Admin.AdminWorkers" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="AdminTitle" runat="server">
    Professionals - WorkDone Admin
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="AdminHead" runat="server">
    <style>
        .metric-card {
            border: 1px solid var(--admin-card-border);
            border-radius: var(--admin-radius-lg);
            background: #fff;
            padding: 1.25rem 1.5rem;
            box-shadow: var(--admin-shadow-sm);
            transition: var(--admin-transition);
        }
        .metric-card:hover {
            box-shadow: var(--admin-shadow-md);
            transform: translateY(-2px);
        }
        .metric-icon {
            width: 48px;
            height: 48px;
            border-radius: var(--admin-radius-md);
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.35rem;
        }
        .worker-img-thumb {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            object-fit: cover;
            border: 2px solid #E2E8F0;
        }
    </style>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="AdminMainContent" runat="server">
    <!-- PAGE HEADER -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
        <div>
            <div class="d-flex align-items-center gap-2">
                <h1 class="h3 fw-bold text-dark mb-0">Professionals</h1>
                <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1 rounded-pill small">Database: profesonalTBL</span>
            </div>
            <p class="text-muted mb-0 mt-1">Manage verified service providers, review trades, view Aadhaar verification details, and manage records.</p>
        </div>
        <div>
            <a href="../JoinProfessional.aspx" target="_blank" class="btn btn-admin-primary shadow-sm">
                <i class="bi bi-person-plus-fill me-1"></i> Add / Register Professional
            </a>
        </div>
    </div>

    <!-- NOTIFICATION ALERT -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false">
        <div class="d-flex align-items-center">
            <i class="bi bi-info-circle-fill fs-5 me-2"></i>
            <div><asp:Label ID="lblAlertMessage" runat="server"></asp:Label></div>
            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </asp:Panel>

    <!-- METRIC CARDS -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Total Professionals</div>
                    <div class="fs-3 fw-bold text-dark mt-1">
                        <asp:Label ID="lblTotalWorkers" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-primary-subtle text-primary">
                    <i class="bi bi-person-badge-fill"></i>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Active Services</div>
                    <div class="fs-3 fw-bold text-success mt-1">
                        <asp:Label ID="lblTotalServices" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-success-subtle text-success">
                    <i class="bi bi-tools"></i>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Cities Covered</div>
                    <div class="fs-3 fw-bold text-warning mt-1">
                        <asp:Label ID="lblTotalCities" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-warning-subtle text-warning">
                    <i class="bi bi-geo-alt-fill"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- SEARCH & FILTER AREA -->
    <div class="admin-card mb-4 p-3">
        <div class="row g-3 align-items-center">
            <div class="col-lg-4 col-md-4">
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-start-0 bg-light" placeholder="Search by name, phone, Aadhaar, skill..."></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 col-md-3">
                <asp:DropDownList ID="ddlServiceFilter" runat="server" CssClass="form-select bg-light">
                    <asp:ListItem Text="All Services" Value="all"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-6 col-lg-3 col-md-3">
                <asp:DropDownList ID="ddlCityFilter" runat="server" CssClass="form-select bg-light">
                    <asp:ListItem Text="All Cities" Value="all"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-12 col-lg-2 col-md-2 d-flex gap-2">
                
                
        </div>
    </div>

    <!-- PROFESSIONALS GRIDVIEW SECTION (READY FOR YOUR GRIDVIEW) -->
    <div class="admin-card">
        <div class="admin-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
            <div>
                <h5 class="admin-card-title mb-0">Professionals Directory (profesonalTBL)</h5>
                <span class="text-muted small">Manage and view registered service professionals</span>
            </div>
            <asp:Label ID="lblTotalBadge" runat="server" CssClass="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill" Text="Total: 0 Professionals"></asp:Label>
        </div>

        <div class="p-4">
            <!-- YOU CAN ADD YOUR GRIDVIEW HERE -->
            
        </div>
    </div>
</asp:Content>

<asp:Content ID="ContentScripts" ContentPlaceHolderID="AdminScripts" runat="server">
</asp:Content>

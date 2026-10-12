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
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-info alert-dismissible fade show mb-4 shadow-sm">
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
                <asp:Button ID="btnFilter" runat="server" Text="Filter" OnClick="btnFilter_Click" CssClass="btn btn-admin-primary w-100" />
            </div>
        </div>
    </div>

    <!-- PROFESSIONALS GRIDVIEW SECTION -->
    <div class="admin-card">
        <div class="admin-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
            <div>
                <h5 class="admin-card-title mb-0">Professionals Directory (profesonalTBL)</h5>
                <span class="text-muted small">Manage and view registered service professionals</span>
            </div>
            <asp:Label ID="lblTotalBadge" runat="server" CssClass="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill" Text="Total: 0 Professionals"></asp:Label>
        </div>

        <div class="p-0">
            <div class="table-responsive">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand"
                    GridLines="None" CssClass="table table-hover align-middle admin-gridview mb-0"
                    ShowHeaderWhenEmpty="true">
                    <HeaderStyle CssClass="admin-grid-header" />
                    <RowStyle CssClass="admin-grid-row" />
                    <AlternatingRowStyle CssClass="admin-grid-alt-row" />
                    <Columns>
                        <asp:TemplateField HeaderText="ID" ItemStyle-Width="60px" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <span class="badge bg-light text-secondary border font-monospace px-2 py-1">#<%# Eval("Id") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Professional">
                            <ItemTemplate>
                                <div class="d-flex align-items-center gap-2">
                                    <img src='<%# (Eval("pic") == null || string.IsNullOrEmpty(Eval("pic").ToString())) ? "https://randomuser.me/api/portraits/men/32.jpg" : Eval("pic") %>' class="worker-img-thumb shadow-sm" width="42" height="42" alt="Photo" />
                                    <div>
                                        <div class="fw-bold text-dark d-flex align-items-center">
                                            <%# Eval("fname") %> <%# Eval("lname") %>
                                            <i class="bi bi-patch-check-fill text-primary ms-1 small" title="Verified Professional"></i>
                                        </div>
                                        <small class="text-muted"><%# Eval("gender") %></small>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Service">
                            <ItemTemplate>
                                <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2.5 py-1 rounded-pill">
                                    <%# Eval("service") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Experience">
                            <ItemTemplate>
                                <span class="fw-semibold text-dark"><%# Eval("experience") %> Yrs</span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="City">
                            <ItemTemplate>
                                <span class="badge bg-light text-dark border">
                                    <i class="bi bi-geo-alt-fill text-danger me-1"></i><%# Eval("city") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Contact Info">
                            <ItemTemplate>
                                <div>
                                    <div class="d-flex align-items-center gap-1 text-dark small">
                                        <i class="bi bi-telephone text-success opacity-75"></i>
                                        <span class="font-monospace"><%# Eval("phone") %></span>
                                    </div>
                                    <div class="d-flex align-items-center gap-1 text-muted small mt-1">
                                        <i class="bi bi-envelope text-primary opacity-75"></i>
                                        <span><%# Eval("email") %></span>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Aadhaar ID">
                            <ItemTemplate>
                                <span class="badge bg-light text-secondary border font-monospace">
                                    <i class="bi bi-shield-check text-success me-1"></i><%# Eval("addhar_id") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Address">
                            <ItemTemplate>
                                <span class="text-muted small text-truncate d-inline-block" style="max-width: 160px;" title='<%# Eval("address") %>'>
                                    <%# Eval("address") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>

                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="110px" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButtonDlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt"
                                    CssClass="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 shadow-sm d-inline-flex align-items-center gap-1"
                                    OnClientClick="return confirm('Are you sure you want to delete this professional?');">
                                    <i class="bi bi-trash3-fill"></i> Delete
                                </asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="text-center py-5">
                            <div class="mb-3">
                                <i class="bi bi-person-badge text-muted opacity-50" style="font-size: 3rem;"></i>
                            </div>
                            <h5 class="fw-bold text-dark">No Professionals Found</h5>
                            <p class="text-muted small mb-0">No professional records match your filter criteria.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ContentScripts" ContentPlaceHolderID="AdminScripts" runat="server">
</asp:Content>

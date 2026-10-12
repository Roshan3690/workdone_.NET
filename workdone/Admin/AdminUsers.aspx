<%@ Page Title="Customers Management" Language="C#" MasterPageFile="~/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AdminUsers.aspx.cs" Inherits="workdone.Admin.AdminUsers" %>

<asp:Content ID="ContentTitle" ContentPlaceHolderID="AdminTitle" runat="server">
    Customers - WorkDone Admin
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
    </style>
</asp:Content>

<asp:Content ID="ContentMain" ContentPlaceHolderID="AdminMainContent" runat="server">
    <!-- PAGE HEADER -->
    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 mb-4">
        <div>
            <div class="d-flex align-items-center gap-2">
                <h1 class="h3 fw-bold text-dark mb-0">Customers</h1>
                <span class="badge bg-primary-subtle text-primary border border-primary-subtle px-2 py-1 rounded-pill small">Database: customerTBL</span>
            </div>
            <p class="text-muted mb-0 mt-1">Manage registered client accounts, view customer details, and oversee database records.</p>
        </div>
        <div>
            <a href="../Register.aspx" target="_blank" class="btn btn-admin-primary shadow-sm">
                <i class="bi bi-person-plus-fill me-1"></i>Register New Customer
            </a>
        </div>
    </div>

    <!-- NOTIFICATION ALERT -->
    <asp:Panel ID="pnlAlert" runat="server" Visible="false" CssClass="alert alert-info alert-dismissible fade show mb-4 shadow-sm">
        <div class="d-flex align-items-center">
            <i class="bi bi-info-circle-fill fs-5 me-2"></i>
            <div>
                <asp:Label ID="lblAlertMessage" runat="server"></asp:Label></div>
            <button type="button" class="btn-close ms-auto" data-bs-dismiss="alert" aria-label="Close"></button>
        </div>
    </asp:Panel>

    <!-- METRIC CARDS -->
    <div class="row g-3 mb-4">
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Total Customers</div>
                    <div class="fs-3 fw-bold text-dark mt-1">
                        <asp:Label ID="lblTotalCustomers" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-primary-subtle text-primary">
                    <i class="bi bi-people-fill"></i>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Male Customers</div>
                    <div class="fs-3 fw-bold text-primary mt-1">
                        <asp:Label ID="lblMaleCount" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-info-subtle text-info">
                    <i class="bi bi-gender-male"></i>
                </div>
            </div>
        </div>
        <div class="col-sm-6 col-lg-4">
            <div class="metric-card d-flex align-items-center justify-content-between">
                <div>
                    <div class="text-muted small fw-semibold text-uppercase">Female Customers</div>
                    <div class="fs-3 fw-bold text-danger mt-1">
                        <asp:Label ID="lblFemaleCount" runat="server" Text="0"></asp:Label>
                    </div>
                </div>
                <div class="metric-icon bg-danger-subtle text-danger">
                    <i class="bi bi-gender-female"></i>
                </div>
            </div>
        </div>
    </div>

    <!-- SEARCH & FILTER AREA -->
    <div class="admin-card mb-4 p-3">
        <div class="row g-3 align-items-center">
            <div class="col-lg-6 col-md-6">
                <div class="input-group">
                    <span class="input-group-text bg-light border-end-0"><i class="bi bi-search text-muted"></i></span>
                    <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-start-0 bg-light" placeholder="Search by name, email, or phone..."></asp:TextBox>
                </div>
            </div>
            <div class="col-sm-6 col-lg-3 col-md-3">
                <asp:DropDownList ID="ddlGenderFilter" runat="server" CssClass="form-select bg-light">
                    <asp:ListItem Text="All Genders" Value="all"></asp:ListItem>
                    <asp:ListItem Text="Male" Value="Male"></asp:ListItem>
                    <asp:ListItem Text="Female" Value="Female"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="col-sm-6 col-lg-3 col-md-3 d-flex gap-2">
                <asp:Button ID="btnSearchCustomer" runat="server" Text="Filter" OnClick="btnSearchCustomer_Click" CssClass="btn btn-admin-primary w-100" />
            </div>
        </div>
    </div>

    <!-- CUSTOMERS GRIDVIEW SECTION -->
    <div class="admin-card">
        <div class="admin-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
            <div>
                <h5 class="admin-card-title mb-0">Customer Directory (customerTBL)</h5>
                <span class="text-muted small">Manage and view registered customer accounts</span>
            </div>
            <asp:Label ID="lblTotalBadge" runat="server" CssClass="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill" Text="Total: 0 Customers"></asp:Label>
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
                        <asp:TemplateField HeaderText="ID" ItemStyle-Width="70px" ItemStyle-CssClass="text-center" HeaderStyle-CssClass="text-center">
                            <ItemTemplate>
                                <span class="badge bg-light text-secondary border font-monospace px-2 py-1">#<%# Eval("Id") %></span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Customer Name">
                            <ItemTemplate>
                                <div class="d-flex align-items-center gap-2">
                                    <div class="user-avatar-circle bg-primary-subtle text-primary border border-primary-subtle shadow-sm">
                                        <%# (Eval("fname") != null && Eval("fname").ToString().Length > 0 ? Eval("fname").ToString().Substring(0, 1) : "U") %>
                                    </div>
                                    <div>
                                        <div class="fw-bold text-dark"><%# Eval("fname") %> <%# Eval("lname") %></div>
                                        <small class="text-muted d-block d-md-none"><%# Eval("email") %></small>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Email Address">
                            <ItemTemplate>
                                <a href='mailto:<%# Eval("email") %>' class="text-decoration-none text-muted d-inline-flex align-items-center gap-1 hover-primary">
                                    <i class="bi bi-envelope-at text-primary opacity-75"></i>
                                    <span><%# Eval("email") %></span>
                                </a>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Gender">
                            <ItemTemplate>
                                <span class='badge rounded-pill px-2.5 py-1 <%# (Eval("gender") != null && Eval("gender").ToString().ToLower() == "male") ? "bg-info-subtle text-info border border-info-subtle" : (Eval("gender") != null && Eval("gender").ToString().ToLower() == "female") ? "bg-danger-subtle text-danger border border-danger-subtle" : "bg-secondary-subtle text-secondary border" %>'>
                                    <i class='bi <%# (Eval("gender") != null && Eval("gender").ToString().ToLower() == "male") ? "bi-gender-male" : (Eval("gender") != null && Eval("gender").ToString().ToLower() == "female") ? "bi-gender-female" : "bi-person" %> me-1'></i>
                                    <%# Eval("gender") %>
                                </span>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Phone Number">
                            <ItemTemplate>
                                <div class="d-inline-flex align-items-center gap-1 text-dark">
                                    <i class="bi bi-telephone text-success opacity-75"></i>
                                    <span class="font-monospace small"><%# Eval("phone") %></span>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                        
                        <asp:TemplateField HeaderText="Actions" ItemStyle-Width="120px" ItemStyle-CssClass="text-end pe-4" HeaderStyle-CssClass="text-end pe-4">
                            <ItemTemplate>
                                <div class="d-inline-flex gap-2">
                                    <asp:LinkButton ID="btn_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt"
                                        CssClass="btn btn-sm btn-outline-danger rounded-pill px-3 py-1 shadow-sm d-inline-flex align-items-center gap-1"
                                        OnClientClick="return confirm('Are you sure you want to permanently delete this customer record?');">
                                        <i class="bi bi-trash3-fill"></i> Delete
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <EmptyDataTemplate>
                        <div class="text-center py-5">
                            <div class="mb-3">
                                <i class="bi bi-people text-muted opacity-50" style="font-size: 3rem;"></i>
                            </div>
                            <h5 class="fw-bold text-dark">No Customers Found</h5>
                            <p class="text-muted small mb-0">No customer records match your filter criteria.</p>
                        </div>
                    </EmptyDataTemplate>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ContentScripts" ContentPlaceHolderID="AdminScripts" runat="server">
</asp:Content>

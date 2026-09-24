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
    <asp:Panel ID="pnlAlert" runat="server" Visible="false">
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
            </div>
        </div>
    </div>

    <!-- CUSTOMERS GRIDVIEW SECTION (READY FOR YOUR GRIDVIEW) -->
    <div class="admin-card">
        <div class="admin-card-header d-flex justify-content-between align-items-center flex-wrap gap-2">
            <div>
                <h5 class="admin-card-title mb-0">Customer Directory (customerTBL)</h5>
                <span class="text-muted small">Manage and view customer records</span>
            </div>
            <asp:Label ID="lblTotalBadge" runat="server" CssClass="badge bg-primary-subtle text-primary fw-semibold px-3 py-2 rounded-pill" Text="Total: 0 Customers"></asp:Label>
        </div>

        <div class="p-4">
            <!-- YOU CAN ADD YOUR GRIDVIEW HERE -->
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowCommand="GridView1_RowCommand">
    <Columns>
        <asp:TemplateField HeaderText="Id">
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Eval("Id") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="fname">
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="lname">
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="email">
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="gender">
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("gender") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="phone">
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("phone") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Edit">
            <ItemTemplate>
                <asp:LinkButton ID="btn_edt" runat="server" CommandArgument='<%# Eval("Id") %>' Text="Edit" CommandName="cmd_edt"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Delete">
            <ItemTemplate>
                <asp:LinkButton ID="btn_dlt" runat="server" CommandArgument='<%# Eval("Id") %>' CommandName="cmd_dlt">Delete</asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
        </div>
    </div>
</asp:Content>

<asp:Content ID="ContentScripts" ContentPlaceHolderID="AdminScripts" runat="server">
</asp:Content>

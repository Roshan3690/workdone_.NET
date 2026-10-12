<%@ Page Title="Find Professionals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Professionals.aspx.cs" Inherits="workdone.Professionals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Find Professionals - WorkDone
</asp:Content>

<asp:Content ID="ContentHead" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .professionals-grid-container,
        #MainContent_DataList1,
        [id$="DataList1"] {
            display: grid !important;
            grid-template-columns: repeat(3, minmax(0, 1fr)) !important;
            gap: 1.75rem !important;
            width: 100% !important;
            margin-bottom: 2rem !important;
        }

        .professionals-grid-container > *,
        #MainContent_DataList1 > *,
        [id$="DataList1"] > * {
            display: flex !important;
            flex-direction: column !important;
            height: 100% !important;
            min-width: 0 !important;
            width: 100% !important;
        }

        .worker-card-col {
            display: flex !important;
            flex-direction: column !important;
            height: 100% !important;
            width: 100% !important;
        }

        .worker-card {
            display: flex !important;
            flex-direction: column !important;
            height: 100% !important;
            width: 100% !important;
            border-radius: var(--radius-lg, 20px) !important;
            border: 1px solid rgba(226, 232, 240, 0.8) !important;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.05) !important;
            background: #fff !important;
            transition: all 0.35s cubic-bezier(0.16, 1, 0.3, 1) !important;
            overflow: hidden;
        }

        .worker-card:hover {
            transform: translateY(-8px) !important;
            box-shadow: 0 20px 35px -8px rgba(67, 56, 202, 0.16) !important;
            border-color: rgba(99, 102, 241, 0.4) !important;
        }

        @media (max-width: 1199.98px) {
            .professionals-grid-container,
            #MainContent_DataList1,
            [id$="DataList1"] {
                grid-template-columns: repeat(2, minmax(0, 1fr)) !important;
                gap: 1.25rem !important;
            }
        }

        @media (max-width: 767.98px) {
            .professionals-grid-container,
            #MainContent_DataList1,
            [id$="DataList1"] {
                grid-template-columns: 1fr !important;
                gap: 1rem !important;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- SEARCH SECTION -->
    <section class="bg-light py-5 border-bottom">
        <div class="container py-4">
            <div class="row justify-content-center">
                <div class="col-lg-8 text-center">
                    <h2 class="fw-bold mb-4">Find Trusted Local Professionals</h2>
                    
                    <div class="search-box bg-white rounded-pill shadow-sm p-2 d-flex flex-column flex-md-row align-items-center">
                        <div class="input-group search-input border-end-md pe-md-2 mb-2 mb-md-0">
                            <span class="input-group-text bg-transparent border-0 text-muted ps-3"><i class="bi bi-search"></i></span>
                            <asp:TextBox ID="txtSearch" runat="server" CssClass="form-control border-0 shadow-none ps-2" placeholder="Search by name, service, or keyword..."></asp:TextBox>
                        </div>
                        <div class="input-group location-input px-md-2 mb-2 mb-md-0 border-end-md">
                            <span class="input-group-text bg-transparent border-0 text-danger"><i class="bi bi-geo-alt-fill"></i></span>
                            <asp:DropDownList ID="ddlCity" runat="server" CssClass="form-select border-0 shadow-none text-muted">
                                <asp:ListItem Text="All Cities" Value=""></asp:ListItem>
                                <asp:ListItem Text="Rajkot" Value="Rajkot" Selected="True"></asp:ListItem>
                                <asp:ListItem Text="Ahmedabad" Value="Ahmedabad"></asp:ListItem>
                                <asp:ListItem Text="Surat" Value="Surat"></asp:ListItem>
                                <asp:ListItem Text="Vadodara" Value="Vadodara"></asp:ListItem>
                            </asp:DropDownList>
                        </div>
                        <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" CssClass="btn btn-primary rounded-pill px-4 py-2 w-100 w-md-auto ms-md-2 fw-medium text-nowrap" />
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- FILTERS AND RESULTS -->
    <section class="py-5">
        <div class="container">
            <div class="row">
                <!-- Sidebar Filters -->
                <div class="col-lg-3 mb-4 mb-lg-0">
                    <div class="card border-0 shadow-sm rounded-4 p-4 sticky-top" style="top: 100px;">
                        <h5 class="fw-bold mb-4">Filters</h5>
                        
                        <div class="mb-4">
                            <h6 class="fw-bold mb-3 small text-muted text-uppercase tracking-wider">Service Category</h6>
                            <div class="d-flex flex-column gap-2">
                                <a href="Professionals.aspx" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= string.IsNullOrEmpty(Request.QueryString["service"]) ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-grid-fill me-2 text-primary"></i>All Services
                                </a>
                                <a href="Professionals.aspx?service=Plumbing" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= Request.QueryString["service"] == "Plumbing" ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-droplet-fill me-2 text-info"></i>Plumbing
                                </a>
                                <a href="Professionals.aspx?service=Home+Cleaning" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= Request.QueryString["service"] == "Home Cleaning" ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-house-heart-fill me-2 text-success"></i>Home Cleaning
                                </a>
                                <a href="Professionals.aspx?service=Electrician" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= Request.QueryString["service"] == "Electrician" ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-lightning-charge-fill me-2 text-warning"></i>Electrician
                                </a>
                                <a href="Professionals.aspx?service=AC+Repair" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= Request.QueryString["service"] == "AC Repair" ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-snow me-2 text-info"></i>AC Repair
                                </a>
                                <a href="Professionals.aspx?service=Carpentry" class="text-decoration-none text-dark py-1 px-2 rounded-2 hover-bg <%= Request.QueryString["service"] == "Carpentry" ? "bg-primary-subtle text-primary fw-bold" : "" %>">
                                    <i class="bi bi-hammer me-2 text-danger"></i>Carpentry
                                </a>
                            </div>
                        </div>
                        
                        <div class="mb-4">
                            <h6 class="fw-bold mb-3 small text-muted text-uppercase tracking-wider">Quick Information</h6>
                            <p class="small text-muted mb-0">
                                <i class="bi bi-shield-check text-success me-1"></i>All listed professionals are background-verified and locally available.
                            </p>
                        </div>
                    </div>
                </div>

                <!-- Results -->
                <div class="col-lg-9">
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Showing <asp:Label ID="lblCount" runat="server" CssClass="text-primary" Text="0"></asp:Label> professionals</h5>
                    </div>

                    <asp:Label ID="lblNoData" runat="server" Visible="false" CssClass="alert alert-light border border-secondary border-opacity-25 shadow-sm rounded-4 p-4 text-center d-block w-100 my-4 text-muted fw-medium" Text="No professionals found matching your search."></asp:Label>

                    <div class="professionals-results-container w-100">
                        <asp:DataList ID="DataList1" runat="server" RepeatLayout="Flow" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" CssClass="professionals-grid-container">
                            <ItemTemplate>
                                <div class="worker-card-col">
                                    <div class="card worker-card border-0 shadow-sm rounded-4 h-100 p-4">
                                        <div class="d-flex align-items-center mb-3">
                                            <img src='<%# (Eval("pic") == null || string.IsNullOrEmpty(Eval("pic").ToString())) ? "https://randomuser.me/api/portraits/men/32.jpg" : Eval("pic") %>' class="rounded-circle border border-3 border-primary-subtle me-3 shadow-sm object-fit-cover flex-shrink-0" width="70" height="70" alt="Worker">
                                            <div class="overflow-hidden">
                                                <h5 class="fw-bold mb-1 d-flex align-items-center text-truncate">
                                                    <%# Eval("fname") %> <%# Eval("lname") %>
                                                    <i class="bi bi-patch-check-fill text-primary ms-1 fs-6 flex-shrink-0" title="Verified Professional"></i>
                                                </h5>
                                                <span class="badge bg-primary-subtle text-primary border border-primary-subtle"><%# Eval("service") %></span>
                                            </div>
                                        </div>
                                        
                                        <div class="row text-center mb-3 g-2 bg-light rounded-3 py-2 mx-0 border border-light-subtle">
                                            <div class="col-4 border-end border-secondary-subtle">
                                                <div class="fw-bold fs-6 text-dark d-flex align-items-center justify-content-center"><i class="bi bi-star-fill text-warning me-1"></i>4.8</div>
                                                <div class="small text-muted" style="font-size: 0.75rem;">Rating</div>
                                            </div>
                                            <div class="col-4 border-end border-secondary-subtle">
                                                <div class="fw-bold fs-6 text-dark">120+</div>
                                                <div class="small text-muted" style="font-size: 0.75rem;">Jobs</div>
                                            </div>
                                            <div class="col-4">
                                                <div class="fw-bold fs-6 text-dark"><%# Eval("experience") %> Yrs</div>
                                                <div class="small text-muted" style="font-size: 0.75rem;">Exp</div>
                                            </div>
                                        </div>
                                        
                                        <div class="d-flex align-items-center justify-content-between text-muted small mb-3 pb-3 border-bottom">
                                            <div class="d-flex align-items-center text-truncate me-2">
                                                <i class="bi bi-geo-alt-fill text-danger me-1 flex-shrink-0"></i>
                                                <span class="text-truncate fw-medium text-dark"><%# Eval("city") %></span>
                                            </div>
                                            <div class="fw-bold text-dark text-nowrap">
                                                <i class="bi bi-telephone text-success me-1"></i><%# Eval("phone") %>
                                            </div>
                                        </div>
                                        
                                        <div class="mt-auto">
                                            <asp:LinkButton ID="btnBook" runat="server" CommandName="cmd_book" CommandArgument='<%# Eval("Id") %>' CssClass="btn btn-primary rounded-pill w-100 fw-medium shadow-sm py-2">
                                                <i class="bi bi-calendar-check me-1"></i>Book Now
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation" class="mt-5">
                        <ul class="pagination justify-content-center border-0 gap-2">
                            <li class="page-item disabled">
                                <a class="page-link rounded-circle border-0 text-dark shadow-sm" href="#" tabindex="-1" aria-disabled="true"><i class="bi bi-chevron-left"></i></a>
                            </li>
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-white bg-primary shadow-sm active" href="#">1</a></li>
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#">2</a></li>
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#"><i class="bi bi-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

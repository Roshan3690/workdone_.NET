<%@ Page Title="Find Professionals" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Professionals.aspx.cs" Inherits="workdone.Professionals" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Find Professionals - WorkDone
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
                            <input type="text" class="form-control border-0 shadow-none ps-2" placeholder="Search by name, service, or keyword...">
                        </div>
                        <div class="input-group location-input px-md-2 mb-2 mb-md-0 border-end-md">
                            <span class="input-group-text bg-transparent border-0 text-danger"><i class="bi bi-geo-alt-fill"></i></span>
                            <select class="form-select border-0 shadow-none text-muted">
                                <option selected>Rajkot</option>
                                <option value="1">Ahmedabad</option>
                                <option value="2">Surat</option>
                            </select>
                        </div>
                        <button class="btn btn-primary rounded-pill px-4 py-2 w-100 w-md-auto ms-md-2 fw-medium text-nowrap">Search</button>
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
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="catPlumbing" checked>
                                <label class="form-check-label" for="catPlumbing">Plumbing (45)</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="catCleaning">
                                <label class="form-check-label" for="catCleaning">Home Cleaning (32)</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="catElectrician">
                                <label class="form-check-label" for="catElectrician">Electrician (58)</label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="checkbox" value="" id="catAC">
                                <label class="form-check-label" for="catAC">AC Repair (27)</label>
                            </div>
                            <a href="#" class="text-decoration-none small text-primary fw-medium">View all categories</a>
                        </div>
                        
                        <div class="mb-4">
                            <h6 class="fw-bold mb-3 small text-muted text-uppercase tracking-wider">Rating</h6>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="ratingRadio" id="rating4" checked>
                                <label class="form-check-label" for="rating4">
                                    <i class="bi bi-star-fill text-warning"></i> 4.0 & above
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="ratingRadio" id="rating3">
                                <label class="form-check-label" for="rating3">
                                    <i class="bi bi-star-fill text-warning"></i> 3.0 & above
                                </label>
                            </div>
                            <div class="form-check mb-2">
                                <input class="form-check-input" type="radio" name="ratingRadio" id="ratingAny">
                                <label class="form-check-label" for="ratingAny">Any Rating</label>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Results -->
                <div class="col-lg-9">
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Showing <span class="text-primary">124</span> professionals</h5>
                        <select class="form-select w-auto border-0 shadow-sm rounded-pill px-3">
                            <option selected>Sort by: Recommended</option>
                            <option value="1">Rating: High to Low</option>
                            <option value="2">Experience: High to Low</option>
                            <option value="3">Price: Low to High</option>
                        </select>
                    </div>

                    <style>
                        .pro-card {
                            background: #fff;
                            border-radius: 18px;
                            box-shadow: 0 4px 24px rgba(80,80,180,0.10);
                            padding: 28px 22px 22px 22px;
                            display: inline-block;
                            width: 260px;
                            margin: 12px;
                            vertical-align: top;
                            transition: box-shadow 0.25s, transform 0.25s;
                            border: 1px solid #ececf5;
                        }
                        .pro-card:hover {
                            box-shadow: 0 10px 36px rgba(80,80,180,0.18);
                            transform: translateY(-4px);
                        }
                        .pro-card .pro-img-wrap {
                            display: flex;
                            justify-content: center;
                            margin-bottom: 16px;
                        }
                        .pro-card .pro-img {
                            width: 90px;
                            height: 90px;
                            border-radius: 50%;
                            object-fit: cover;
                            border: 3px solid #d0d8ff;
                            box-shadow: 0 2px 10px rgba(80,80,180,0.15);
                        }
                        .pro-card .pro-name {
                            font-size: 1.08rem;
                            font-weight: 700;
                            color: #1a1a2e;
                            text-align: center;
                            margin-bottom: 6px;
                        }
                        .pro-card .pro-badge {
                            display: inline-block;
                            background: #eef0ff;
                            color: #4f5bd5;
                            border: 1px solid #c7ccf7;
                            border-radius: 20px;
                            font-size: 0.78rem;
                            font-weight: 600;
                            padding: 2px 14px;
                            margin-bottom: 12px;
                        }
                        .pro-card .pro-info-row {
                            display: flex;
                            align-items: center;
                            justify-content: center;
                            gap: 6px;
                            font-size: 0.88rem;
                            color: #555;
                            margin-bottom: 6px;
                        }
                        .pro-card .pro-info-row .pi-icon {
                            color: #4f5bd5;
                            font-size: 1rem;
                        }
                        .pro-card .pro-divider {
                            border: none;
                            border-top: 1px solid #ececf5;
                            margin: 14px 0;
                        }
                        .pro-card .pro-actions {
                            display: flex;
                            gap: 10px;
                            margin-top: 6px;
                        }
                        .pro-card .btn-view {
                            flex: 1;
                            background: transparent;
                            color: #4f5bd5;
                            border: 2px solid #4f5bd5;
                            border-radius: 50px;
                            padding: 7px 0;
                            font-size: 0.85rem;
                            font-weight: 600;
                            cursor: pointer;
                            transition: background 0.2s, color 0.2s;
                            text-align: center;
                            text-decoration: none;
                        }
                        .pro-card .btn-view:hover {
                            background: #4f5bd5;
                            color: #fff;
                        }
                        .pro-card .btn-book {
                            flex: 1;
                            background: linear-gradient(135deg, #4f5bd5 0%, #7c3aed 100%);
                            color: #fff;
                            border: none;
                            border-radius: 50px;
                            padding: 7px 0;
                            font-size: 0.85rem;
                            font-weight: 600;
                            cursor: pointer;
                            transition: opacity 0.2s, transform 0.2s;
                            text-align: center;
                            text-decoration: none;
                        }
                        .pro-card .btn-book:hover {
                            opacity: 0.88;
                            transform: scale(1.03);
                        }
                        .pro-datalist-wrap {
                            display: flex;
                            flex-wrap: wrap;
                            gap: 0;
                        }
                    </style>

                    <div class="pro-datalist-wrap">
<asp:DataList ID="DataList1" runat="server" OnItemCommand="DataList1_ItemCommand" RepeatDirection="Horizontal" CssClass="pro-datalist-wrap">
    <ItemTemplate>
        <div class="pro-card">
            <div class="pro-img-wrap">
                <asp:Image ID="Image1" runat="server"
                    ImageUrl='<%# Eval("pic") %>'
                    CssClass="pro-img"
                    AlternateText="Professional Photo" />
            </div>
            <div class="pro-name">
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("fname") %>'></asp:Label>
                &nbsp;<asp:Label ID="Label2" runat="server" Text='<%# Eval("lname") %>'></asp:Label>
            </div>
            <div style="text-align:center; margin-bottom:10px;">
                <span class="pro-badge">
                    <asp:Label ID="Label3" runat="server" Text='<%# Eval("service") %>'></asp:Label>
                </span>
            </div>
            <div class="pro-info-row">
                <i class="bi bi-briefcase-fill pi-icon"></i>
                <span>Experience:&nbsp;<strong><asp:Label ID="Label4" runat="server" Text='<%# Eval("experience") %>'></asp:Label> yrs</strong></span>
            </div>
            <hr class="pro-divider" />
            <div class="pro-actions">
                <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn-view" CommandName="cmd_view_profile" CommandArgument='<%# Eval("Id") %>' Text="View Profile"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CssClass="btn-book" CommandName="cmd_book_now">Book Now</asp:LinkButton>
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
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-white bg-primary shadow-sm active" href="#">1#">1</a></li>
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#">2</a></li>
                            <li class="page-item"><a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#">3</a></li>
                            <li class="page-item">
                                <a class="page-link rounded-circle border-0 text-dark shadow-sm hover-primary" href="#"><i class="bi bi-chevron-right"></i></a>
                            </li>
                        </ul>
                    </nav>
                    <center>
                    
                        </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

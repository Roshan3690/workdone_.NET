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
                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h5 class="fw-bold mb-0">Showing <span class="text-primary">124</span> professionals</h5>
                        <select class="form-select w-auto border-0 shadow-sm rounded-pill px-3">
                            <option selected>Sort by: Recommended</option>
                            <option value="1">Rating: High to Low</option>
                            <option value="2">Experience: High to Low</option>
                            <option value="3">Price: Low to High</option>
                        </select>
                    </div>

                    <div class="row g-4">
                        <!-- Worker Card 1 -->
                        <div class="col-md-6 col-xl-4">
                            <div class="card worker-card border-0 shadow-sm rounded-4 h-100 p-4">
                                <div class="d-flex align-items-center mb-4">
                                    <img src="https://randomuser.me/api/portraits/men/32.jpg" class="rounded-circle border border-3 border-primary-subtle me-3 shadow-sm" width="80" height="80" alt="Worker">
                                    <div>
                                        <h5 class="fw-bold mb-1 d-flex align-items-center">Rahul Patel <i class="bi bi-patch-check-fill text-primary ms-1 fs-6" title="Verified"></i></h5>
                                        <span class="badge bg-primary-subtle text-primary border border-primary-subtle">Electrician</span>
                                    </div>
                                </div>
                                <div class="row text-center mb-4 g-2 bg-light rounded-3 py-2 mx-0">
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark d-flex align-items-center justify-content-center"><i class="bi bi-star-fill text-warning fs-6 me-1"></i>4.8</div>
                                        <div class="small text-muted">Rating</div>
                                    </div>
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark">320+</div>
                                        <div class="small text-muted">Jobs</div>
                                    </div>
                                    <div class="col-4">
                                        <div class="fw-bold fs-5 text-dark">6 Yrs</div>
                                        <div class="small text-muted">Exp</div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center text-muted small mb-4 pb-3 border-bottom">
                                    <i class="bi bi-geo-alt-fill text-danger me-2"></i> Rajkot Area
                                    <span class="ms-auto fw-bold text-dark fs-6">Starting Rs. 299</span>
                                </div>
                                <div class="d-flex gap-2 mt-auto">
                                    <a href="#" class="btn btn-outline-primary rounded-pill w-50 fw-medium">View Profile</a>
                                    <button class="btn btn-primary rounded-pill w-50 fw-medium">Book Now</button>
                                </div>
                            </div>
                        </div>

                        <!-- Worker Card 2 -->
                        <div class="col-md-6 col-xl-4">
                            <div class="card worker-card border-0 shadow-sm rounded-4 h-100 p-4">
                                <div class="d-flex align-items-center mb-4">
                                    <img src="https://randomuser.me/api/portraits/men/44.jpg" class="rounded-circle border border-3 border-primary-subtle me-3 shadow-sm" width="80" height="80" alt="Worker">
                                    <div>
                                        <h5 class="fw-bold mb-1 d-flex align-items-center">Amit Sharma <i class="bi bi-patch-check-fill text-primary ms-1 fs-6" title="Verified"></i></h5>
                                        <span class="badge bg-info-subtle text-info border border-info-subtle">Plumber</span>
                                    </div>
                                </div>
                                <div class="row text-center mb-4 g-2 bg-light rounded-3 py-2 mx-0">
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark d-flex align-items-center justify-content-center"><i class="bi bi-star-fill text-warning fs-6 me-1"></i>4.9</div>
                                        <div class="small text-muted">Rating</div>
                                    </div>
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark">512+</div>
                                        <div class="small text-muted">Jobs</div>
                                    </div>
                                    <div class="col-4">
                                        <div class="fw-bold fs-5 text-dark">8 Yrs</div>
                                        <div class="small text-muted">Exp</div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center text-muted small mb-4 pb-3 border-bottom">
                                    <i class="bi bi-geo-alt-fill text-danger me-2"></i> Rajkot City
                                    <span class="ms-auto fw-bold text-dark fs-6">Starting Rs. 199</span>
                                </div>
                                <div class="d-flex gap-2 mt-auto">
                                    <a href="#" class="btn btn-outline-primary rounded-pill w-50 fw-medium">View Profile</a>
                                    <button class="btn btn-primary rounded-pill w-50 fw-medium">Book Now</button>
                                </div>
                            </div>
                        </div>

                        <!-- Worker Card 3 -->
                        <div class="col-md-6 col-xl-4">
                            <div class="card worker-card border-0 shadow-sm rounded-4 h-100 p-4">
                                <div class="d-flex align-items-center mb-4">
                                    <img src="https://randomuser.me/api/portraits/women/65.jpg" class="rounded-circle border border-3 border-primary-subtle me-3 shadow-sm" width="80" height="80" alt="Worker">
                                    <div>
                                        <h5 class="fw-bold mb-1 d-flex align-items-center">Sneha Desai <i class="bi bi-patch-check-fill text-primary ms-1 fs-6" title="Verified"></i></h5>
                                        <span class="badge bg-success-subtle text-success border border-success-subtle">Cleaner</span>
                                    </div>
                                </div>
                                <div class="row text-center mb-4 g-2 bg-light rounded-3 py-2 mx-0">
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark d-flex align-items-center justify-content-center"><i class="bi bi-star-fill text-warning fs-6 me-1"></i>4.7</div>
                                        <div class="small text-muted">Rating</div>
                                    </div>
                                    <div class="col-4 border-end border-secondary-subtle">
                                        <div class="fw-bold fs-5 text-dark">240+</div>
                                        <div class="small text-muted">Jobs</div>
                                    </div>
                                    <div class="col-4">
                                        <div class="fw-bold fs-5 text-dark">3 Yrs</div>
                                        <div class="small text-muted">Exp</div>
                                    </div>
                                </div>
                                <div class="d-flex align-items-center text-muted small mb-4 pb-3 border-bottom">
                                    <i class="bi bi-geo-alt-fill text-danger me-2"></i> 150ft Ring Road
                                    <span class="ms-auto fw-bold text-dark fs-6">Starting Rs. 499</span>
                                </div>
                                <div class="d-flex gap-2 mt-auto">
                                    <a href="#" class="btn btn-outline-primary rounded-pill w-50 fw-medium">View Profile</a>
                                    <button class="btn btn-primary rounded-pill w-50 fw-medium">Book Now</button>
                                </div>
                            </div>
                        </div>

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

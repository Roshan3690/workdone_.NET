<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="workdone.Default" %>

<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WorkDone - Local Services. Trusted Professionals.</title>
    
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <!-- Google Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700&display=swap" rel="stylesheet">
    
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    
    <!-- Custom CSS -->
    <link href="Content/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <!-- 1. NAVBAR -->
        <nav class="navbar navbar-expand-lg sticky-top bg-white shadow-sm py-3">
            <div class="container">
                <a class="navbar-brand fw-bold text-primary fs-4" href="Default.aspx">
                    <i class="bi bi-tools text-primary me-2"></i>WorkDone<span class="text-dark">.com</span>
                </a>
                <button class="navbar-toggler border-0" type="button" data-bs-toggle="collapse" data-bs-target="#navbarContent" aria-controls="navbarContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                
                <div class="collapse navbar-collapse" id="navbarContent">
                    <ul class="navbar-nav mx-auto mb-2 mb-lg-0 fw-medium">
                        <li class="nav-item"><a class="nav-link active" href="#">Home</a></li>
                        <li class="nav-item"><a class="nav-link" href="#services">Services</a></li>
                        <li class="nav-item"><a class="nav-link" href="#professionals">Find Workers</a></li>
                        <li class="nav-item"><a class="nav-link" href="#how-it-works">How It Works</a></li>
                        <li class="nav-item"><a class="nav-link" href="#about">About Us</a></li>
                    </ul>
                    
                    <div class="d-flex flex-column flex-lg-row align-items-lg-center gap-3 mt-3 mt-lg-0">
                        <div class="dropdown">
                            <button class="btn btn-light dropdown-toggle location-btn rounded-pill border-0 px-3 w-100 text-start" type="button" id="locationDropdown" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-geo-alt-fill text-danger me-1"></i> Rajkot
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end border-0 shadow-sm w-100" aria-labelledby="locationDropdown">
                                <li><a class="dropdown-item" href="#">Rajkot</a></li>
                                <li><a class="dropdown-item" href="#">Ahmedabad</a></li>
                                <li><a class="dropdown-item" href="#">Surat</a></li>
                            </ul>
                        </div>
                        <a href="#" class="text-decoration-none text-dark fw-medium btn-hover">Login</a>
                        <a href="#" class="text-decoration-none text-dark fw-medium btn-hover">Sign Up</a>
                        <a href="#" class="btn btn-outline-primary rounded-pill px-4 fw-medium text-nowrap">Join as Professional</a>
                    </div>
                </div>
            </div>
        </nav>

        <!-- 2. HERO SECTION -->
        <section class="hero-section position-relative bg-light overflow-hidden">
            <div class="container py-5">
                <div class="row align-items-center py-4 py-lg-5">
                    <div class="col-lg-7 position-relative z-1">
                        <span class="badge bg-primary-subtle text-primary mb-3 px-3 py-2 rounded-pill fw-medium border border-primary-subtle shadow-sm">#1 Local Service Marketplace</span>
                        <h1 class="display-4 fw-bold text-dark mb-4 hero-title">
                            Local Services.<br />
                            Trusted Professionals.<br />
                            <span class="text-primary">Work Done.</span>
                        </h1>
                        <p class="lead text-secondary mb-5 pe-lg-5 fs-5">
                            Find and book trusted local professionals for everyday services in just a few clicks. Top-rated experts ready to help.
                        </p>
                        
                        <div class="search-box bg-white rounded-pill shadow-lg p-2 d-flex flex-column flex-md-row align-items-center mb-4">
                            <div class="input-group search-input border-end-md pe-md-2 mb-2 mb-md-0">
                                <span class="input-group-text bg-transparent border-0 text-muted ps-3"><i class="bi bi-search"></i></span>
                                <input type="text" class="form-control border-0 shadow-none ps-2" placeholder="What service do you need?">
                            </div>
                            <div class="input-group location-input px-md-2 mb-2 mb-md-0 border-end-md">
                                <span class="input-group-text bg-transparent border-0 text-danger"><i class="bi bi-geo-alt-fill"></i></span>
                                <select class="form-select border-0 shadow-none text-muted">
                                    <option selected>Rajkot</option>
                                    <option value="1">Ahmedabad</option>
                                    <option value="2">Surat</option>
                                </select>
                            </div>
                            <asp:Button ID="btnSearch" runat="server" Text="Find Professionals" CssClass="btn btn-primary rounded-pill px-4 py-3 py-md-2 w-100 w-md-auto ms-md-2 fw-medium text-nowrap" />
                        </div>
                        
                        <div class="quick-searches d-flex flex-wrap align-items-center gap-2 mt-4">
                            <span class="text-muted small fw-medium me-2">Popular:</span>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">Plumber</a>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">Electrician</a>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">Home Cleaning</a>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">AC Repair</a>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">Carpenter</a>
                            <a href="#" class="badge bg-white text-dark border px-3 py-2 rounded-pill text-decoration-none shadow-sm hover-primary transition">Painter</a>
                        </div>
                    </div>
                    <div class="col-lg-5 d-none d-lg-block position-relative mt-5 mt-lg-0">
                        <div class="hero-image-wrapper position-relative z-1">
                            <img src="https://images.unsplash.com/photo-1581578731548-c64695cc6952?q=80&w=2070&auto=format&fit=crop" class="img-fluid rounded-4 shadow-lg border border-4 border-white" alt="Professional Worker" />
                            <div class="floating-card bg-white p-3 rounded-4 shadow-lg position-absolute bottom-0 start-0 translate-middle-x mb-5 border">
                                <div class="d-flex align-items-center gap-3">
                                    <div class="bg-success-subtle p-2 rounded-circle">
                                        <i class="bi bi-shield-check text-success fs-4"></i>
                                    </div>
                                    <div>
                                        <h6 class="mb-0 fw-bold">Verified Pros</h6>
                                        <small class="text-muted">100% Background checked</small>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- Decorative shapes -->
                        <div class="shape-blob bg-primary opacity-10 position-absolute top-0 end-0 translate-middle rounded-circle z-0" style="width: 400px; height: 400px; filter: blur(50px);"></div>
                        <div class="shape-blob bg-warning opacity-10 position-absolute bottom-0 start-50 translate-middle rounded-circle z-0" style="width: 300px; height: 300px; filter: blur(50px);"></div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 3. SERVICE CATEGORIES -->
        <section id="services" class="py-5">
            <div class="container py-4">
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-end mb-5 gap-3">
                    <div>
                        <h2 class="fw-bold mb-2">What service do you need?</h2>
                        <p class="text-muted mb-0">Choose from our wide range of professional services.</p>
                    </div>
                    <a href="#" class="btn btn-outline-dark rounded-pill px-4 d-none d-md-inline-block fw-medium">View All Services</a>
                </div>

                <div class="row g-4">
                    <!-- Categories -->
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-primary-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-house-heart text-primary fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Home Cleaning</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-info-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-droplet text-info fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Plumbing</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-warning-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-lightning-charge text-warning fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Electrician</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-danger-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-snow text-danger fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">AC Repair</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-success-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-hammer text-success fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Carpentry</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-secondary-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-brush text-secondary fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Painting</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-pink-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-scissors text-pink fs-3" style="color: #d63384;"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Beauty & Salon</h6>
                        </a>
                    </div>
                    <div class="col-6 col-md-4 col-lg-3">
                        <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4">
                            <div class="icon-wrapper bg-dark-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center">
                                <i class="bi bi-car-front text-dark fs-3"></i>
                            </div>
                            <h6 class="card-title text-dark fw-bold mb-0">Vehicle Repair</h6>
                        </a>
                    </div>
                </div>
                
                <div class="text-center mt-4 d-md-none">
                    <a href="#" class="btn btn-outline-dark rounded-pill px-4 fw-medium w-100">View All Services</a>
                </div>
            </div>
        </section>

        <!-- 4. POPULAR SERVICES -->
        <section class="py-5 bg-light">
            <div class="container py-4">
                <h2 class="fw-bold mb-4 text-center text-md-start">Popular Services Near You</h2>
                <div class="row g-4">
                    <!-- Service Card 1 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card service-card border-0 shadow-sm h-100 rounded-4 overflow-hidden">
                            <div class="position-relative">
                                <img src="https://images.unsplash.com/photo-1584622650111-993a426fbf0a?q=80&w=2070&auto=format&fit=crop" class="card-img-top object-fit-cover w-100" height="200" alt="Plumbing Service">
                                <span class="badge bg-white text-dark position-absolute top-0 end-0 m-3 px-2 py-1 shadow-sm rounded-pill"><i class="bi bi-star-fill text-warning me-1"></i>4.8</span>
                            </div>
                            <div class="card-body p-4 d-flex flex-column">
                                <h5 class="card-title fw-bold">Expert Plumbing</h5>
                                <p class="text-muted small mb-4"><i class="bi bi-patch-check-fill text-success me-1"></i> 1,240 bookings</p>
                                <div class="d-flex justify-content-between align-items-end mt-auto">
                                    <div>
                                        <small class="text-muted d-block lh-1 mb-1">Starts from</small>
                                        <span class="fw-bold text-dark fs-5">Rs. 299</span>
                                    </div>
                                    <button class="btn btn-outline-primary rounded-pill px-3 py-1 btn-sm fw-medium hover-primary">Book Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Service Card 2 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card service-card border-0 shadow-sm h-100 rounded-4 overflow-hidden">
                            <div class="position-relative">
                                <img src="https://images.unsplash.com/photo-1563453392212-326f5e854473?q=80&w=2070&auto=format&fit=crop" class="card-img-top object-fit-cover w-100" height="200" alt="Cleaning Service">
                                <span class="badge bg-white text-dark position-absolute top-0 end-0 m-3 px-2 py-1 shadow-sm rounded-pill"><i class="bi bi-star-fill text-warning me-1"></i>4.9</span>
                            </div>
                            <div class="card-body p-4 d-flex flex-column">
                                <h5 class="card-title fw-bold">Deep Home Cleaning</h5>
                                <p class="text-muted small mb-4"><i class="bi bi-patch-check-fill text-success me-1"></i> 2,100 bookings</p>
                                <div class="d-flex justify-content-between align-items-end mt-auto">
                                    <div>
                                        <small class="text-muted d-block lh-1 mb-1">Starts from</small>
                                        <span class="fw-bold text-dark fs-5">Rs. 999</span>
                                    </div>
                                    <button class="btn btn-outline-primary rounded-pill px-3 py-1 btn-sm fw-medium hover-primary">Book Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Service Card 3 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card service-card border-0 shadow-sm h-100 rounded-4 overflow-hidden">
                            <div class="position-relative">
                                <img src="https://images.unsplash.com/photo-1621905252507-b35492cc74b4?q=80&w=2069&auto=format&fit=crop" class="card-img-top object-fit-cover w-100" height="200" alt="AC Repair">
                                <span class="badge bg-white text-dark position-absolute top-0 end-0 m-3 px-2 py-1 shadow-sm rounded-pill"><i class="bi bi-star-fill text-warning me-1"></i>4.7</span>
                            </div>
                            <div class="card-body p-4 d-flex flex-column">
                                <h5 class="card-title fw-bold">AC Service & Repair</h5>
                                <p class="text-muted small mb-4"><i class="bi bi-patch-check-fill text-success me-1"></i> 850 bookings</p>
                                <div class="d-flex justify-content-between align-items-end mt-auto">
                                    <div>
                                        <small class="text-muted d-block lh-1 mb-1">Starts from</small>
                                        <span class="fw-bold text-dark fs-5">Rs. 499</span>
                                    </div>
                                    <button class="btn btn-outline-primary rounded-pill px-3 py-1 btn-sm fw-medium hover-primary">Book Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Service Card 4 -->
                    <div class="col-md-6 col-lg-3">
                        <div class="card service-card border-0 shadow-sm h-100 rounded-4 overflow-hidden">
                            <div class="position-relative">
                                <img src="https://images.unsplash.com/photo-1604014237800-1c9102c219da?q=80&w=2070&auto=format&fit=crop" class="card-img-top object-fit-cover w-100" height="200" alt="Electrician">
                                <span class="badge bg-white text-dark position-absolute top-0 end-0 m-3 px-2 py-1 shadow-sm rounded-pill"><i class="bi bi-star-fill text-warning me-1"></i>4.8</span>
                            </div>
                            <div class="card-body p-4 d-flex flex-column">
                                <h5 class="card-title fw-bold">Electrical Works</h5>
                                <p class="text-muted small mb-4"><i class="bi bi-patch-check-fill text-success me-1"></i> 1,530 bookings</p>
                                <div class="d-flex justify-content-between align-items-end mt-auto">
                                    <div>
                                        <small class="text-muted d-block lh-1 mb-1">Starts from</small>
                                        <span class="fw-bold text-dark fs-5">Rs. 199</span>
                                    </div>
                                    <button class="btn btn-outline-primary rounded-pill px-3 py-1 btn-sm fw-medium hover-primary">Book Now</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 5. HOW IT WORKS -->
        <section id="how-it-works" class="py-5">
            <div class="container py-5 text-center">
                <span class="text-primary fw-bold text-uppercase tracking-wider small">Simple Process</span>
                <h2 class="fw-bold mb-3 mt-2">How WorkDone Works</h2>
                <p class="text-muted mb-5 max-w-2xl mx-auto">Your home needs sorted in 3 simple steps.</p>
                
                <div class="row g-4 position-relative z-1 mt-4">
                    <!-- Connector line for desktop -->
                    <div class="d-none d-md-block position-absolute top-50 start-50 translate-middle w-75 border-top border-2 border-dashed text-muted opacity-25" style="z-index: -1;"></div>
                    
                    <div class="col-md-4">
                        <div class="step-card p-4 h-100 bg-white rounded-4 shadow-sm border border-light">
                            <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-3 position-relative z-1">
                                1
                            </div>
                            <h5 class="fw-bold mb-3">Search a Service</h5>
                            <p class="text-muted mb-0">Tell us what you need. From cleaning to repairs, we have it all.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="step-card p-4 h-100 bg-white rounded-4 shadow-sm border border-light">
                            <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-3 position-relative z-1">
                                2
                            </div>
                            <h5 class="fw-bold mb-3">Choose a Professional</h5>
                            <p class="text-muted mb-0">Compare trusted local professionals based on reviews and pricing.</p>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="step-card p-4 h-100 bg-white rounded-4 shadow-sm border border-light">
                            <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-3 position-relative z-1">
                                3
                            </div>
                            <h5 class="fw-bold mb-3">Get the Work Done</h5>
                            <p class="text-muted mb-0">Book your preferred professional and get the job completed seamlessly.</p>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 6. PROFESSIONALS SECTION -->
        <section id="professionals" class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <span class="text-primary fw-bold text-uppercase tracking-wider small">Verified Experts</span>
                    <h2 class="fw-bold mt-2">Top Professionals Near You</h2>
                </div>
                
                <div class="row g-4 justify-content-center">
                    <!-- Worker Card 1 -->
                    <div class="col-md-6 col-lg-4">
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
                    <div class="col-md-6 col-lg-4">
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
                    <div class="col-md-6 col-lg-4">
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
                
                <div class="text-center mt-5">
                    <a href="#" class="btn btn-outline-dark rounded-pill px-4 py-2 fw-medium">Browse All Professionals</a>
                </div>
            </div>
        </section>

        <!-- 7. TRUST SECTION -->
        <section class="py-5">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <h2 class="fw-bold mb-3">Why Choose WorkDone?</h2>
                    <p class="text-muted max-w-2xl mx-auto">We ensure a seamless and secure experience for all our customers.</p>
                </div>
                
                <div class="row g-4 g-lg-5">
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-shield-check text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Verified Professionals</h5>
                        <p class="text-muted px-2">Every professional goes through a strict background check before joining.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-tags text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Transparent Pricing</h5>
                        <p class="text-muted px-2">No hidden charges or surprises. Know the price before you book.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-star-fill text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Customer Ratings</h5>
                        <p class="text-muted px-2">Choose experts based on genuine reviews from real customers.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-phone text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Easy Booking</h5>
                        <p class="text-muted px-2">Book any service in just a few clicks through our responsive website.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-shield-lock text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Secure Experience</h5>
                        <p class="text-muted px-2">Your personal data and payments are always kept secure with us.</p>
                    </div>
                    <div class="col-md-4 col-sm-6 text-center">
                        <div class="trust-icon bg-light rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                            <i class="bi bi-geo-alt text-primary fs-1"></i>
                        </div>
                        <h5 class="fw-bold mb-2">Local Professionals</h5>
                        <p class="text-muted px-2">Get fast help from trusted professionals right in your own neighborhood.</p>
                    </div>
                </div>
            </div>
        </section>

        <!-- 8. BECOME A PROFESSIONAL CTA -->
        <section class="py-5">
            <div class="container">
                <div class="bg-primary rounded-4 p-5 p-md-5 position-relative overflow-hidden shadow-lg text-white cta-banner">
                    <!-- Decor elements -->
                    <div class="position-absolute top-0 end-0 opacity-10" style="transform: translate(20%, -20%);">
                        <i class="bi bi-briefcase-fill" style="font-size: 20rem;"></i>
                    </div>
                    <div class="position-absolute bottom-0 start-0 opacity-10" style="transform: translate(-30%, 30%);">
                        <i class="bi bi-tools" style="font-size: 15rem;"></i>
                    </div>
                    
                    <div class="row align-items-center position-relative z-1 py-3">
                        <div class="col-md-8 text-center text-md-start mb-4 mb-md-0">
                            <h2 class="fw-bold mb-3 display-6 text-white">Have a skill? Start earning with WorkDone.</h2>
                            <p class="lead mb-0 text-white-50">Join WorkDone.com and connect with customers looking for your services. Grow your business locally.</p>
                        </div>
                        <div class="col-md-4 text-center text-md-end">
                            <a href="#" class="btn btn-light btn-lg rounded-pill fw-bold text-primary px-4 py-3 shadow-sm hover-scale text-nowrap">Register as a Professional</a>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 9. CUSTOMER REVIEWS -->
        <section class="py-5 bg-light">
            <div class="container py-5">
                <div class="text-center mb-5">
                    <span class="text-primary fw-bold text-uppercase tracking-wider small">Testimonials</span>
                    <h2 class="fw-bold mt-2">What Our Customers Say</h2>
                </div>
                
                <div class="row g-4">
                    <div class="col-md-4">
                        <div class="card review-card border-0 shadow-sm rounded-4 h-100 p-4 p-xl-5">
                            <i class="bi bi-quote text-primary opacity-25" style="font-size: 3rem; line-height: 1; margin-top: -1rem;"></i>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                            </div>
                            <p class="text-dark mb-4 fw-medium fs-6">"Booked a plumber for an urgent leak. The professional arrived in 30 minutes and fixed it perfectly. Very reasonable pricing too! Life saver."</p>
                            <div class="d-flex align-items-center mt-auto">
                                <img src="https://randomuser.me/api/portraits/women/12.jpg" class="rounded-circle me-3 border border-2 border-white shadow-sm" width="55" height="55" alt="Customer">
                                <div>
                                    <h6 class="fw-bold mb-0">Priya K.</h6>
                                    <small class="text-muted">Booked Plumbing</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card review-card border-0 shadow-sm rounded-4 h-100 p-4 p-xl-5">
                            <i class="bi bi-quote text-primary opacity-25" style="font-size: 3rem; line-height: 1; margin-top: -1rem;"></i>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-half"></i>
                            </div>
                            <p class="text-dark mb-4 fw-medium fs-6">"The deep home cleaning service was amazing. The team was polite, efficient, and left my house sparkling clean. Highly recommend to everyone!"</p>
                            <div class="d-flex align-items-center mt-auto">
                                <img src="https://randomuser.me/api/portraits/men/22.jpg" class="rounded-circle me-3 border border-2 border-white shadow-sm" width="55" height="55" alt="Customer">
                                <div>
                                    <h6 class="fw-bold mb-0">Rohan M.</h6>
                                    <small class="text-muted">Booked Home Cleaning</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="card review-card border-0 shadow-sm rounded-4 h-100 p-4 p-xl-5">
                            <i class="bi bi-quote text-primary opacity-25" style="font-size: 3rem; line-height: 1; margin-top: -1rem;"></i>
                            <div class="text-warning mb-3">
                                <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                            </div>
                            <p class="text-dark mb-4 fw-medium fs-6">"Found a great electrician through WorkDone. He was verified, so I felt safe having him in my home. Excellent service marketplace."</p>
                            <div class="d-flex align-items-center mt-auto">
                                <img src="https://randomuser.me/api/portraits/women/42.jpg" class="rounded-circle me-3 border border-2 border-white shadow-sm" width="55" height="55" alt="Customer">
                                <div>
                                    <h6 class="fw-bold mb-0">Snehal J.</h6>
                                    <small class="text-muted">Booked Electrician</small>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 10. APP/PROMOTIONAL SECTION -->
        <section class="py-5 overflow-hidden">
            <div class="container py-5">
                <div class="row align-items-center g-5">
                    <div class="col-lg-6 order-2 order-lg-1 position-relative">
                        <div class="p-4 bg-primary-subtle rounded-circle mx-auto d-flex align-items-center justify-content-center position-relative z-1" style="width: 350px; height: 350px;">
                            <img src="https://images.unsplash.com/photo-1512428559087-560fa5ceab42?q=80&w=2070&auto=format&fit=crop" class="img-fluid rounded-4 shadow-lg position-absolute border border-4 border-white" style="width: 250px; left: 10%; top: 10%;" alt="Mobile Booking">
                            <div class="floating-badge bg-white p-3 rounded-4 shadow-lg position-absolute bottom-0 end-0 border translate-middle-y">
                                <div class="d-flex align-items-center gap-2">
                                    <i class="bi bi-lightning-fill text-warning fs-3"></i>
                                    <div class="fw-bold text-dark lh-1">Instant<br><span class="text-muted small fw-normal">Booking</span></div>
                                </div>
                            </div>
                        </div>
                        <div class="bg-warning rounded-circle position-absolute z-0 opacity-25" style="width: 400px; height: 400px; filter: blur(50px); top: -20px; left: 0;"></div>
                    </div>
                    <div class="col-lg-6 order-1 order-lg-2">
                        <h2 class="fw-bold mb-4 display-6">Booking local services has never been easier.</h2>
                        <ul class="list-unstyled mb-5">
                            <li class="d-flex mb-4 align-items-start">
                                <div class="bg-success-subtle text-success rounded-circle p-2 me-3 d-flex align-items-center justify-content-center">
                                    <i class="bi bi-check-lg fs-5"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1">Find top-rated professionals instantly</h5>
                                    <p class="text-muted mb-0">Search through our wide range of vetted experts.</p>
                                </div>
                            </li>
                            <li class="d-flex mb-4 align-items-start">
                                <div class="bg-success-subtle text-success rounded-circle p-2 me-3 d-flex align-items-center justify-content-center">
                                    <i class="bi bi-check-lg fs-5"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1">Compare prices and reviews</h5>
                                    <p class="text-muted mb-0">Make informed decisions based on genuine customer feedback.</p>
                                </div>
                            </li>
                            <li class="d-flex mb-4 align-items-start">
                                <div class="bg-success-subtle text-success rounded-circle p-2 me-3 d-flex align-items-center justify-content-center">
                                    <i class="bi bi-check-lg fs-5"></i>
                                </div>
                                <div>
                                    <h5 class="fw-bold mb-1">Book securely through our platform</h5>
                                    <p class="text-muted mb-0">Enjoy peace of mind with our secure booking and payment system.</p>
                                </div>
                            </li>
                        </ul>
                        <button class="btn btn-dark btn-lg rounded-pill px-5 py-3 fw-medium hover-scale"><i class="bi bi-rocket-takeoff me-2"></i> Get Started Now</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- 11. FOOTER -->
        <footer class="bg-dark text-white pt-5 pb-3 mt-auto">
            <div class="container pt-4">
                <div class="row g-4 mb-5">
                    <div class="col-lg-4 col-md-6 pe-lg-5">
                        <a class="navbar-brand fw-bold text-white fs-3 d-block mb-4" href="Default.aspx">
                            <i class="bi bi-tools text-primary me-2"></i>WorkDone<span class="text-white-50">.com</span>
                        </a>
                        <p class="text-white-50 pe-lg-4 lh-lg">Your trusted local service marketplace. Connecting you with reliable professionals for all your home and personal needs quickly and securely.</p>
                        <div class="d-flex gap-3 mt-4">
                            <a href="#" class="btn btn-outline-light btn-sm rounded-circle d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;"><i class="bi bi-facebook"></i></a>
                            <a href="#" class="btn btn-outline-light btn-sm rounded-circle d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;"><i class="bi bi-twitter-x"></i></a>
                            <a href="#" class="btn btn-outline-light btn-sm rounded-circle d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;"><i class="bi bi-instagram"></i></a>
                            <a href="#" class="btn btn-outline-light btn-sm rounded-circle d-flex align-items-center justify-content-center" style="width: 35px; height: 35px;"><i class="bi bi-linkedin"></i></a>
                        </div>
                    </div>
                    
                    <div class="col-lg-2 col-md-6">
                        <h5 class="fw-bold mb-4 text-white">Services</h5>
                        <ul class="list-unstyled">
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Home Cleaning</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Electrician</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Plumbing</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Repair</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Beauty</a></li>
                            <li class="mb-3"><a href="#" class="text-primary text-decoration-none fw-medium transition">View All Services <i class="bi bi-arrow-right small ms-1"></i></a></li>
                        </ul>
                    </div>
                    
                    <div class="col-lg-2 col-md-6">
                        <h5 class="fw-bold mb-4 text-white">Company</h5>
                        <ul class="list-unstyled">
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">About Us</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Careers</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Contact Us</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Terms & Conditions</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Privacy Policy</a></li>
                        </ul>
                    </div>
                    
                    <div class="col-lg-2 col-md-6">
                        <h5 class="fw-bold mb-4 text-white">For Professionals</h5>
                        <ul class="list-unstyled">
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Join as Professional</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Professional Login</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">How It Works</a></li>
                        </ul>
                    </div>

                    <div class="col-lg-2 col-md-6">
                        <h5 class="fw-bold mb-4 text-white">Support</h5>
                        <ul class="list-unstyled">
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Help Center</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Contact Support</a></li>
                            <li class="mb-3"><a href="#" class="text-white-50 text-decoration-none hover-white transition">Safety</a></li>
                        </ul>
                    </div>
                </div>
                
                <hr class="border-secondary opacity-50 mb-4">
                
                <div class="d-flex flex-column flex-md-row justify-content-between align-items-center text-white-50 small">
                    <p class="mb-2 mb-md-0">&copy; 2026 WorkDone.com. All rights reserved.</p>
                    <div class="d-flex gap-3">
                        <a href="#" class="text-white-50 text-decoration-none hover-white">Privacy</a>
                        <a href="#" class="text-white-50 text-decoration-none hover-white">Terms</a>
                        <a href="#" class="text-white-50 text-decoration-none hover-white">Sitemap</a>
                    </div>
                </div>
            </div>
        </footer>

    </form>
    
    <!-- Bootstrap JS Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- Custom JS -->
    <script src="Scripts/main.js"></script>
</body>
</html>

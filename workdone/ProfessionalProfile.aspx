<%@ Page Title="Professional Profile" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProfessionalProfile.aspx.cs" Inherits="workdone.ProfessionalProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Professional Profile - WorkDone
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        /* Profile Hero */
        .profile-hero {
            background: linear-gradient(135deg, #1a1a2e 0%, #16213e 50%, #0f3460 100%);
            padding: 60px 0 80px;
            position: relative;
            overflow: hidden;
        }

            .profile-hero::before {
                content: '';
                position: absolute;
                top: -60px;
                right: -60px;
                width: 320px;
                height: 320px;
                background: radial-gradient(circle, rgba(79,91,213,0.25) 0%, transparent 70%);
                border-radius: 50%;
            }

            .profile-hero::after {
                content: '';
                position: absolute;
                bottom: -80px;
                left: -40px;
                width: 260px;
                height: 260px;
                background: radial-gradient(circle, rgba(124,58,237,0.18) 0%, transparent 70%);
                border-radius: 50%;
            }

        .profile-avatar {
            width: 120px;
            height: 120px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid rgba(255,255,255,0.25);
            box-shadow: 0 8px 32px rgba(0,0,0,0.35);
        }

        .verified-badge {
            background: linear-gradient(135deg, #4f5bd5, #7c3aed);
            color: #fff;
            border-radius: 20px;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 3px 12px;
            display: inline-flex;
            align-items: center;
            gap: 4px;
        }

        .service-tag {
            background: rgba(255,255,255,0.12);
            color: #c7d0ff;
            border: 1px solid rgba(255,255,255,0.18);
            border-radius: 20px;
            font-size: 0.82rem;
            font-weight: 500;
            padding: 4px 14px;
            display: inline-block;
        }

        .hero-stat-box {
            background: rgba(255,255,255,0.08);
            border: 1px solid rgba(255,255,255,0.12);
            border-radius: 14px;
            padding: 16px 20px;
            text-align: center;
            backdrop-filter: blur(8px);
            transition: background 0.2s;
        }

            .hero-stat-box:hover {
                background: rgba(255,255,255,0.13);
            }

            .hero-stat-box .stat-val {
                font-size: 1.55rem;
                font-weight: 800;
                color: #fff;
                line-height: 1;
            }

            .hero-stat-box .stat-lbl {
                font-size: 0.78rem;
                color: rgba(255,255,255,0.6);
                margin-top: 4px;
            }
        /* Section Cards */
        .profile-card {
            background: #fff;
            border-radius: 18px;
            box-shadow: 0 2px 20px rgba(80,80,180,0.08);
            border: 1px solid #ececf5;
            padding: 28px;
            margin-bottom: 24px;
        }

        .section-title {
            font-size: 1rem;
            font-weight: 700;
            color: #1a1a2e;
            margin-bottom: 20px;
            padding-bottom: 12px;
            border-bottom: 2px solid #f0f0ff;
            display: flex;
            align-items: center;
            gap: 8px;
        }

            .section-title i {
                color: #4f5bd5;
                font-size: 1.1rem;
            }
        /* Skill Pills */
        .skill-pill {
            display: inline-block;
            background: #eef0ff;
            color: #4f5bd5;
            border: 1px solid #c7ccf7;
            border-radius: 50px;
            font-size: 0.82rem;
            font-weight: 600;
            padding: 5px 16px;
            margin: 4px 4px 4px 0;
            transition: background 0.2s, color 0.2s;
        }

            .skill-pill:hover {
                background: #4f5bd5;
                color: #fff;
            }
        /* Stars */
        .stars {
            color: #f59e0b;
            font-size: 0.95rem;
        }
        /* Review Cards */
        .review-card {
            background: #fafafa;
            border: 1px solid #ececf5;
            border-radius: 14px;
            padding: 18px 20px;
            margin-bottom: 14px;
        }

        .review-avatar {
            width: 42px;
            height: 42px;
            border-radius: 50%;
            background: #e0e3ff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-weight: 700;
            color: #4f5bd5;
            font-size: 1rem;
            flex-shrink: 0;
        }
        /* Work Details */
        .feature-row {
            display: flex;
            align-items: center;
            gap: 10px;
            padding: 8px 0;
            border-bottom: 1px solid #f0f0ff;
            font-size: 0.88rem;
            color: #555;
        }

            .feature-row:last-child {
                border-bottom: none;
            }

            .feature-row i {
                color: #4f5bd5;
                font-size: 1rem;
                width: 20px;
            }
        /* Rating Progress */
        .rating-row {
            display: flex;
            align-items: center;
            gap: 10px;
            margin-bottom: 8px;
        }

            .rating-row .r-label {
                width: 30px;
                font-size: 0.82rem;
                color: #555;
                font-weight: 600;
            }

            .rating-row .progress {
                flex: 1;
                height: 8px;
                border-radius: 10px;
                background: #ececf5;
                overflow: hidden;
            }

            .rating-row .progress-bar {
                background: linear-gradient(90deg, #4f5bd5, #7c3aed);
                border-radius: 10px;
            }

            .rating-row .r-count {
                width: 28px;
                font-size: 0.8rem;
                color: #888;
                text-align: right;
            }
        /* Booking Sidebar */
        .booking-card {
            background: #fff;
            border-radius: 20px;
            box-shadow: 0 4px 32px rgba(80,80,180,0.13);
            border: 1px solid #ececf5;
            padding: 28px;
            position: sticky;
            top: 100px;
        }

        .price-tag {
            font-size: 1.9rem;
            font-weight: 800;
            color: #1a1a2e;
        }

            .price-tag span {
                font-size: 0.9rem;
                font-weight: 400;
                color: #888;
            }

        .btn-book-now {
            background: linear-gradient(135deg, #4f5bd5 0%, #7c3aed 100%);
            color: #fff;
            border: none;
            border-radius: 50px;
            padding: 14px 0;
            font-size: 1rem;
            font-weight: 700;
            width: 100%;
            cursor: pointer;
            transition: opacity 0.2s, transform 0.15s;
        }

            .btn-book-now:hover {
                opacity: 0.88;
                transform: scale(1.02);
            }

        .btn-contact {
            background: transparent;
            color: #4f5bd5;
            border: 2px solid #4f5bd5;
            border-radius: 50px;
            padding: 12px 0;
            font-size: 0.95rem;
            font-weight: 600;
            width: 100%;
            cursor: pointer;
            transition: background 0.2s, color 0.2s;
            margin-top: 10px;
        }

            .btn-contact:hover {
                background: #4f5bd5;
                color: #fff;
            }

        .avail-badge {
            background: #d1fae5;
            color: #065f46;
            border-radius: 20px;
            font-size: 0.8rem;
            font-weight: 600;
            padding: 4px 12px;
            display: inline-flex;
            align-items: center;
            gap: 5px;
        }

            .avail-badge::before {
                content: '';
                width: 8px;
                height: 8px;
                background: #10b981;
                border-radius: 50%;
                display: inline-block;
            }
        /* Back button */
        .back-btn {
            display: inline-flex;
            align-items: center;
            gap: 6px;
            color: rgba(255,255,255,0.75);
            text-decoration: none;
            font-size: 0.9rem;
            font-weight: 500;
            margin-bottom: 28px;
            transition: color 0.2s;
        }

            .back-btn:hover {
                color: #fff;
            }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">&nbsp;

    <!-- HERO SECTION -->
    <section class="profile-hero">
        <div class="container" style="position: relative; z-index: 1;">
            <a href="Professionals.aspx" class="back-btn">
                <i class="bi bi-arrow-left"></i>Back to Professionals
            </a>

            <div class="row align-items-center g-4">
                <!-- Avatar and Info -->
                <div class="col-lg-7">
                    <div class="d-flex align-items-center gap-4 flex-wrap">
                        <br />
                        <table>
                            <tr>
                                <td>
                                    <asp:Image ID="Image1" runat="server" Height="141px" Width="117px" />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Label ID="lblpronm" runat="server" Font-Size="XX-Large" ForeColor="White"></asp:Label>
                                    <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="Label1" runat="server" ForeColor="Yellow" Text="Skills &amp; Services:"></asp:Label>
                                    <br />
                                    <asp:Label ID="lblprosrv" runat="server" Font-Size="Medium" ForeColor="White"></asp:Label>
                                    </td>
                                    </tr>
                        </table>
                        &nbsp;<br />
                        <div>
                            <div class="d-flex align-items-center gap-1 mb-2">
                                <span class="stars">
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </span>
                                <span class="text-white fw-bold ms-1">4.7</span>
                                <span class="text-white-50 small ms-1">(128 reviews)</span>
                            </div>
                            <div class="d-flex align-items-center gap-2 text-white-50 small">
                                <i class="bi bi-geo-alt-fill text-danger"></i>Rajkot, Gujarat
                                &nbsp;·&nbsp;
                               
                                <i class="bi bi-clock"></i>Responds in ~1 hr
                           
                            </div>
                        </div>
                    </div>
                </div>

                <!-- Stats -->
                <div class="col-lg-5">
                    <div class="row g-3">
                        <div class="col-4">
                            <div class="hero-stat-box">
                                <div class="stat-val">4.7</div>
                                <div class="stat-lbl"><i class="bi bi-star-fill text-warning"></i>Rating</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="hero-stat-box">
                                <div class="stat-val">340+</div>
                                <div class="stat-lbl">Jobs Done</div>
                            </div>
                        </div>
                        <div class="col-4">
                            <div class="hero-stat-box">
                                <div class="stat-val">10 Yrs</div>
                                <div class="stat-lbl">Experience</div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- MAIN CONTENT -->
    <section class="py-5" style="background: #f8f8ff; min-height: 60vh;">
        <div class="container">
            <div class="row g-4">

                <!-- Left: Details -->
                <div class="col-lg-8">

                    <!-- About -->
                    <div class="profile-card">
                        <div class="section-title"><i class="bi bi-person-lines-fill"></i>About</div>
                        <p class="text-muted mb-0" style="line-height: 1.75;">
                            Hi! I'm <strong>Roshan Pandit</strong>, a professional home cleaning specialist with over
                           
                            <strong>10 years of experience</strong> serving households across Rajkot. I take pride in
                            delivering thorough, reliable, and eco-friendly cleaning services. My attention to detail and
                            commitment to customer satisfaction have earned me 340+ completed jobs and a loyal client base.
                            I am fully equipped with professional-grade tools and use safe, non-toxic cleaning products.
                       
                        </p>
                    </div>

                    <!-- Skills -->
                    <div class="profile-card">
                        <div class="section-title"><i class="bi bi-tools"></i>Skills &amp; Services</div>
                        <div>
                            <span class="skill-pill">Deep Home Cleaning</span>
                            <span class="skill-pill">Kitchen Cleaning</span>
                            <span class="skill-pill">Bathroom Sanitization</span>
                            <span class="skill-pill">Sofa &amp; Carpet Cleaning</span>
                            <span class="skill-pill">Post-Construction Cleanup</span>
                            <span class="skill-pill">Move-in / Move-out Cleaning</span>
                            <span class="skill-pill">Office Cleaning</span>
                            <span class="skill-pill">Window Cleaning</span>
                        </div>
                    </div>

                    <!-- Work Info -->
                    <div class="profile-card">
                        <div class="section-title"><i class="bi bi-briefcase-fill"></i>Work Details</div>
                        <div class="row g-3">
                            <div class="col-sm-6">
                                <div class="feature-row"><i class="bi bi-clock-history"></i>Experience: <strong>&nbsp;10 Years</strong></div>
                                <div class="feature-row"><i class="bi bi-calendar-check"></i>Member Since: <strong>&nbsp;Jan 2022</strong></div>
                                <div class="feature-row"><i class="bi bi-geo-alt"></i>Serving Area: <strong>&nbsp;Rajkot (15 km radius)</strong></div>
                            </div>
                            <div class="col-sm-6">
                                <div class="feature-row"><i class="bi bi-translate"></i>Languages: <strong>&nbsp;Hindi, Gujarati</strong></div>
                                <div class="feature-row"><i class="bi bi-shield-check"></i>Background Verified: <strong>&nbsp;Yes</strong></div>
                                <div class="feature-row"><i class="bi bi-trophy"></i>Top Rated: <strong>&nbsp;Yes</strong></div>
                            </div>
                        </div>
                    </div>

                    <!-- Rating Breakdown -->
                    <div class="profile-card">
                        <div class="section-title"><i class="bi bi-bar-chart-fill"></i>Rating Breakdown</div>
                        <div class="row align-items-center g-3">
                            <div class="col-sm-3 text-center">
                                <div style="font-size: 3.5rem; font-weight: 800; color: #1a1a2e; line-height: 1;">4.7</div>
                                <div class="stars mb-1">
                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                    <i class="bi bi-star-half"></i>
                                </div>
                                <div class="text-muted small">128 reviews</div>
                            </div>
                            <div class="col-sm-9">
                                <div class="rating-row"><span class="r-label">5 &#9733;</span><div class="progress">
                                    <div class="progress-bar" style="width: 70%"></div>
                                </div>
                                    <span class="r-count">90</span></div>
                                <div class="rating-row"><span class="r-label">4 &#9733;</span><div class="progress">
                                    <div class="progress-bar" style="width: 20%"></div>
                                </div>
                                    <span class="r-count">25</span></div>
                                <div class="rating-row"><span class="r-label">3 &#9733;</span><div class="progress">
                                    <div class="progress-bar" style="width: 6%"></div>
                                </div>
                                    <span class="r-count">8</span></div>
                                <div class="rating-row"><span class="r-label">2 &#9733;</span><div class="progress">
                                    <div class="progress-bar" style="width: 3%"></div>
                                </div>
                                    <span class="r-count">4</span></div>
                                <div class="rating-row"><span class="r-label">1 &#9733;</span><div class="progress">
                                    <div class="progress-bar" style="width: 1%"></div>
                                </div>
                                    <span class="r-count">1</span></div>
                            </div>
                        </div>
                    </div>

                    <!-- Reviews -->
                    <div class="profile-card">
                        <div class="section-title"><i class="bi bi-chat-quote-fill"></i>Customer Reviews</div>

                        <div class="review-card">
                            <div class="d-flex align-items-center gap-3 mb-2">
                                <div class="review-avatar">P</div>
                                <div>
                                    <div class="fw-bold text-dark" style="font-size: 0.95rem;">Priya Shah</div>
                                    <div class="stars" style="font-size: 0.8rem;">
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i>
                                    </div>
                                </div>
                                <span class="ms-auto text-muted small">2 days ago</span>
                            </div>
                            <p class="mb-0 text-muted" style="font-size: 0.9rem; line-height: 1.65;">
                                Absolutely fantastic service! Roshan cleaned our entire 3BHK in just 4 hours.
                                Everything was spotless — kitchen, bathrooms, balconies. Highly recommended!
                           
                            </p>
                        </div>

                        <div class="review-card">
                            <div class="d-flex align-items-center gap-3 mb-2">
                                <div class="review-avatar">M</div>
                                <div>
                                    <div class="fw-bold text-dark" style="font-size: 0.95rem;">Mehul Joshi</div>
                                    <div class="stars" style="font-size: 0.8rem;">
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star"></i>
                                    </div>
                                </div>
                                <span class="ms-auto text-muted small">1 week ago</span>
                            </div>
                            <p class="mb-0 text-muted" style="font-size: 0.9rem; line-height: 1.65;">
                                Very professional and punctual. Used eco-friendly products which I appreciate.
                                Will definitely book again for monthly cleaning.
                           
                            </p>
                        </div>

                        <div class="review-card">
                            <div class="d-flex align-items-center gap-3 mb-2">
                                <div class="review-avatar">A</div>
                                <div>
                                    <div class="fw-bold text-dark" style="font-size: 0.95rem;">Anjali Mehta</div>
                                    <div class="stars" style="font-size: 0.8rem;">
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-fill"></i><i class="bi bi-star-fill"></i>
                                        <i class="bi bi-star-half"></i>
                                    </div>
                                </div>
                                <span class="ms-auto text-muted small">2 weeks ago</span>
                            </div>
                            <p class="mb-0 text-muted" style="font-size: 0.9rem; line-height: 1.65;">
                                Hired for post-construction cleanup — tough job but Roshan handled it brilliantly.
                                Very hardworking and detail-oriented. 5 stars for effort!
                           
                            </p>
                        </div>

                        <div class="text-center mt-2">
                            <a href="#" class="btn btn-outline-primary rounded-pill px-4 py-2 fw-medium" style="font-size: 0.88rem;">Load More Reviews
                            </a>
                        </div>
                    </div>

                </div>
                <!-- /col-lg-8 -->

                <!-- Right: Booking Sidebar -->
                <div class="col-lg-4">
                    <div class="booking-card">
                        <div class="d-flex align-items-center justify-content-between mb-3">
                            <div>
                                <div class="price-tag">&#8377;299 <span>/ visit</span></div>
                                <div class="text-muted small">Starting price, may vary by scope</div>
                            </div>
                            <span class="avail-badge">Available</span>
                        </div>

                        <hr style="border-color: #ececf5; margin: 18px 0;" />

                        <div class="mb-4">
                            <div class="feature-row"><i class="bi bi-clock"></i>Duration: 2–6 hours</div>
                            <div class="feature-row"><i class="bi bi-house-check"></i>Service at your location</div>
                            <div class="feature-row"><i class="bi bi-shield-check"></i>Insured &amp; Background Checked</div>
                            <div class="feature-row"><i class="bi bi-arrow-counterclockwise"></i>Free re-clean if unsatisfied</div>
                            <div class="feature-row"><i class="bi bi-cash-coin"></i>Pay after service</div>
                        </div>

                        <button class="btn-book-now" onclick="alert('Booking flow coming soon!')">
                            <i class="bi bi-calendar-check me-2"></i>Book Now
                       
                        </button>
                        <button class="btn-contact" onclick="alert('Chat feature coming soon!')">
                            <i class="bi bi-chat-dots me-2"></i>Contact Professional
                       
                        </button>

                        <div class="text-center mt-4">
                            <div class="text-muted small mb-2">Share this profile</div>
                            <div class="d-flex justify-content-center gap-3">
                                <a href="#" class="fs-5" style="color: #25d366;"><i class="bi bi-whatsapp"></i></a>
                                <a href="#" class="fs-5" style="color: #1877f2;"><i class="bi bi-facebook"></i></a>
                                <a href="#" class="fs-5 text-dark"><i class="bi bi-twitter-x"></i></a>
                                <a href="#" class="fs-5" style="color: #4f5bd5;"><i class="bi bi-link-45deg"></i></a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /col-lg-4 -->

            </div>
        </div>
    </section>

</asp:Content>

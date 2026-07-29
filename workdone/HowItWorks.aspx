<%@ Page Title="How It Works" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="HowItWorks.aspx.cs" Inherits="workdone.HowItWorks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    How It Works - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-primary-subtle text-center">
        <div class="container py-5">
            <h1 class="display-4 fw-bold text-dark mb-4">How WorkDone Works</h1>
            <p class="lead text-secondary max-w-2xl mx-auto">Your everyday tasks and home needs sorted in 3 simple, stress-free steps.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container py-5 text-center">
            <div class="row g-5 position-relative z-1 mt-2">
                <!-- Connector line for desktop -->
                <div class="d-none d-md-block position-absolute top-50 start-50 translate-middle w-75 border-top border-2 border-dashed text-muted opacity-25" style="z-index: -1;"></div>
                
                <div class="col-md-4">
                    <div class="step-card p-5 h-100 bg-white rounded-4 shadow-sm border border-light hover-scale">
                        <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-2 position-relative z-1" style="width: 80px; height: 80px;">
                            1
                        </div>
                        <h4 class="fw-bold mb-3">Search a Service</h4>
                        <p class="text-muted mb-0">Tell us what you need. From cleaning to repairs, we have it all. Simply search for the service in your local area.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="step-card p-5 h-100 bg-white rounded-4 shadow-sm border border-light hover-scale">
                        <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-2 position-relative z-1" style="width: 80px; height: 80px;">
                            2
                        </div>
                        <h4 class="fw-bold mb-3">Choose a Professional</h4>
                        <p class="text-muted mb-0">Compare trusted local professionals based on genuine customer reviews, ratings, and transparent pricing.</p>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="step-card p-5 h-100 bg-white rounded-4 shadow-sm border border-light hover-scale">
                        <div class="step-icon bg-primary text-white rounded-circle d-flex align-items-center justify-content-center mx-auto mb-4 shadow-lg fs-2 position-relative z-1" style="width: 80px; height: 80px;">
                            3
                        </div>
                        <h4 class="fw-bold mb-3">Get the Work Done</h4>
                        <p class="text-muted mb-0">Book your preferred professional instantly and get the job completed seamlessly at your convenience.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- TRUST SECTION -->
    <section class="py-5 bg-light">
        <div class="container py-5">
            <div class="text-center mb-5">
                <h2 class="fw-bold mb-3">Why Trust Us?</h2>
                <p class="text-muted max-w-2xl mx-auto">We ensure a seamless and secure experience for all our customers.</p>
            </div>
            
            <div class="row g-4 g-lg-5">
                <div class="col-md-4 text-center">
                    <div class="trust-icon bg-white shadow-sm rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                        <i class="bi bi-shield-check text-primary fs-1"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Verified Professionals</h5>
                    <p class="text-muted px-2">Every professional goes through a strict background check before joining.</p>
                </div>
                <div class="col-md-4 text-center">
                    <div class="trust-icon bg-white shadow-sm rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                        <i class="bi bi-tags text-primary fs-1"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Transparent Pricing</h5>
                    <p class="text-muted px-2">No hidden charges or surprises. Know the price before you book.</p>
                </div>
                <div class="col-md-4 text-center">
                    <div class="trust-icon bg-white shadow-sm rounded-circle mx-auto mb-4 d-flex align-items-center justify-content-center" style="width: 90px; height: 90px;">
                        <i class="bi bi-shield-lock text-primary fs-1"></i>
                    </div>
                    <h5 class="fw-bold mb-2">Secure Experience</h5>
                    <p class="text-muted px-2">Your personal data and payments are always kept secure with us.</p>
                </div>
            </div>
        </div>
    </section>

</asp:Content>

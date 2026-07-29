<%@ Page Title="Our Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="workdone.Services" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    Our Services - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!-- HERO SECTION -->
    <section class="bg-primary-subtle py-5">
        <div class="container py-5 text-center">
            <h1 class="display-4 fw-bold text-dark mb-3">Our Professional Services</h1>
            <p class="lead text-secondary max-w-2xl mx-auto">Explore our wide range of professional services. We have trusted experts ready to help you with anything you need.</p>
        </div>
    </section>

    <!-- SERVICE CATEGORIES -->
    <section class="py-5">
        <div class="container py-4">
            <div class="row g-4">
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-primary-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-house-heart text-primary fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Home Cleaning</h5>
                        <p class="text-muted small mt-2">Deep cleaning, regular cleaning</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-info-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-droplet text-info fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Plumbing</h5>
                        <p class="text-muted small mt-2">Leak fixes, pipe installation</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-warning-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-lightning-charge text-warning fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Electrician</h5>
                        <p class="text-muted small mt-2">Wiring, appliance repair</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-danger-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-snow text-danger fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">AC Repair</h5>
                        <p class="text-muted small mt-2">Servicing, gas refill</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-success-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-hammer text-success fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Carpentry</h5>
                        <p class="text-muted small mt-2">Furniture repair, assembly</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-secondary-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-brush text-secondary fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Painting</h5>
                        <p class="text-muted small mt-2">Wall painting, texture</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-pink-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-scissors text-pink fs-2" style="color: #d63384;"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Beauty & Salon</h5>
                        <p class="text-muted small mt-2">At-home beauty services</p>
                    </a>
                </div>
                <div class="col-6 col-md-4 col-lg-3">
                    <a href="#" class="card category-card border-0 shadow-sm h-100 text-decoration-none text-center p-4 rounded-4 hover-scale">
                        <div class="icon-wrapper bg-dark-subtle rounded-circle mx-auto mb-3 d-flex align-items-center justify-content-center" style="width: 80px; height: 80px;">
                            <i class="bi bi-car-front text-dark fs-2"></i>
                        </div>
                        <h5 class="card-title text-dark fw-bold mb-0">Vehicle Repair</h5>
                        <p class="text-muted small mt-2">Car & bike servicing</p>
                    </a>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

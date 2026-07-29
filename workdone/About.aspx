<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="workdone.About" %>

<asp:Content ID="Content1" ContentPlaceHolderID="TitleContent" runat="server">
    About Us - WorkDone
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <section class="py-5 bg-light">
        <div class="container py-5 text-center">
            <h1 class="display-4 fw-bold text-dark mb-4">About WorkDone</h1>
            <p class="lead text-secondary max-w-3xl mx-auto">We are on a mission to organize the unorganized local service sector. We connect customers looking for everyday services with reliable, trusted, and verified professionals.</p>
        </div>
    </section>

    <section class="py-5">
        <div class="container py-5">
            <div class="row align-items-center g-5">
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1522071820081-009f0129c71c?q=80&w=2070&auto=format&fit=crop" class="img-fluid rounded-4 shadow-lg" alt="Our Team">
                </div>
                <div class="col-lg-6">
                    <h2 class="fw-bold mb-4">Our Story</h2>
                    <p class="text-muted fs-5 mb-4">Founded in 2026, WorkDone started with a simple idea: booking a local service should be as easy as buying a product online. We saw the struggles people faced in finding reliable help, and the challenges skilled workers faced in finding consistent jobs.</p>
                    <p class="text-muted fs-5 mb-4">Today, we are building India's most trusted local services platform, empowering thousands of professionals to run their micro-businesses and helping millions of customers get their chores done effortlessly.</p>
                    <div class="d-flex gap-4 mt-5">
                        <div>
                            <h3 class="fw-bold text-primary mb-1">50K+</h3>
                            <p class="text-muted small">Professionals</p>
                        </div>
                        <div>
                            <h3 class="fw-bold text-primary mb-1">1M+</h3>
                            <p class="text-muted small">Customers</p>
                        </div>
                        <div>
                            <h3 class="fw-bold text-primary mb-1">3M+</h3>
                            <p class="text-muted small">Jobs Completed</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</asp:Content>

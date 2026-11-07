<%@ Page Title="Professional Help Center" Language="C#" MasterPageFile="~/Professional/Professional.Master" AutoEventWireup="true" CodeBehind="Help.aspx.cs" Inherits="workdone.Professional.Help" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfessionalTitle" runat="server">
    Help & Guidelines - Professional Portal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ProfessionalHead" runat="server">
    <style>
        .help-hero {
            background: linear-gradient(135deg, #1e3a8a 0%, #2563eb 100%);
            color: #ffffff;
            border-radius: 16px;
            padding: 36px 30px;
            margin-bottom: 30px;
        }

        .help-card {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid #e2e8f0;
            padding: 24px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
            height: 100%;
            transition: transform 0.2s, box-shadow 0.2s;
        }

        .help-card:hover {
            transform: translateY(-2px);
            box-shadow: 0 10px 20px rgba(0,0,0,0.06);
        }

        .help-icon {
            width: 48px;
            height: 48px;
            border-radius: 12px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.4rem;
            margin-bottom: 16px;
        }

        .accordion-button:not(.collapsed) {
            background-color: #eff6ff;
            color: #2563eb;
            font-weight: 600;
        }
        
        .accordion-item {
            border-color: #e2e8f0;
            margin-bottom: 10px;
            border-radius: 10px !important;
            overflow: hidden;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfessionalMainContent" runat="server">
    <!-- HERO BANNER -->
    <div class="help-hero">
        <div class="row align-items-center">
            <div class="col-md-8">
                <span class="badge bg-white text-primary mb-2 fw-bold">PARTNER RESOURCE</span>
                <h2 class="fw-bold mb-2">How can we help you today?</h2>
                <p class="text-white-50 mb-0">Find answers to common questions about accepting jobs, payouts, commission policies, and customer communication.</p>
            </div>
            <div class="col-md-4 text-md-end mt-3 mt-md-0">
                <a href="ContactUs.aspx" class="btn btn-light rounded-pill px-4 fw-semibold text-primary">
                    <i class="bi bi-chat-dots me-1"></i> Talk to Support
                </a>
            </div>
        </div>
    </div>

    <!-- QUICK CATEGORIES -->
    <div class="row g-4 mb-4">
        <div class="col-md-4">
            <div class="help-card">
                <div class="help-icon bg-primary bg-opacity-10 text-primary">
                    <i class="bi bi-wallet2"></i>
                </div>
                <h5 class="fw-bold text-dark">Payouts & Earnings</h5>
                <p class="text-muted small">Understand weekly settlement cycles, direct bank transfers, and incentive structure.</p>
                <a href="#faqPayouts" class="fw-semibold text-primary text-decoration-none small">
                    View FAQ <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="help-card">
                <div class="help-icon bg-success bg-opacity-10 text-success">
                    <i class="bi bi-calendar2-check"></i>
                </div>
                <h5 class="fw-bold text-dark">Job Management</h5>
                <p class="text-muted small">Learn how to confirm bookings, update service arrival timings, and mark tasks as complete.</p>
                <a href="#faqBookings" class="fw-semibold text-success text-decoration-none small">
                    View FAQ <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>

        <div class="col-md-4">
            <div class="help-card">
                <div class="help-icon bg-warning bg-opacity-10 text-warning">
                    <i class="bi bi-shield-check"></i>
                </div>
                <h5 class="fw-bold text-dark">Safety & Guidelines</h5>
                <p class="text-muted small">Partner safety instructions, verification protocols, customer conduct, and dispute handling.</p>
                <a href="#faqSafety" class="fw-semibold text-warning text-decoration-none small">
                    View FAQ <i class="bi bi-arrow-right"></i>
                </a>
            </div>
        </div>
    </div>

    <!-- FAQS ACCORDION -->
    <div class="card border-0 shadow-sm rounded-4 p-4 mb-4">
        <h4 class="fw-bold text-dark mb-3">Frequently Asked Questions</h4>
        
        <div class="accordion" id="faqAccordion">
            <!-- FAQ 1 -->
            <div class="accordion-item" id="faqPayouts">
                <h2 class="accordion-header" id="headingOne">
                    <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        When and how are my earnings transferred?
                    </button>
                </h2>
                <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted">
                        Earnings for all verified completed jobs are processed every Monday directly to your registered bank account via IMPS/NEFT. You can view your invoice break-up and deductions in your dashboard summary.
                    </div>
                </div>
            </div>

            <!-- FAQ 2 -->
            <div class="accordion-item" id="faqBookings">
                <h2 class="accordion-header" id="headingTwo">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        What should I do if a customer requests to reschedule?
                    </button>
                </h2>
                <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted">
                        If a customer asks for a different time slot, you can coordinate directly with the customer. If the new slot does not fit your schedule, you can inform support via the Contact Us page to re-assign the order without penalty.
                    </div>
                </div>
            </div>

            <!-- FAQ 3 -->
            <div class="accordion-item">
                <h2 class="accordion-header" id="headingThree">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        What happens if the customer is not available at the location?
                    </button>
                </h2>
                <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted">
                        Please wait at least 15 minutes and call the customer twice. If there is no response, raise an "Unreachable Customer" report through the Contact Support desk. You will receive standard travel compensation for verified visits.
                    </div>
                </div>
            </div>

            <!-- FAQ 4 -->
            <div class="accordion-item" id="faqSafety">
                <h2 class="accordion-header" id="headingFour">
                    <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        How can I maintain a 5-star customer rating?
                    </button>
                </h2>
                <div id="collapseFour" class="accordion-collapse collapse" aria-labelledby="headingFour" data-bs-parent="#faqAccordion">
                    <div class="accordion-body text-muted">
                        Punctuality, clear communication of parts pricing before beginning work, polite behavior, and cleaning the work area after completing the service are key factors top-rated professionals follow.
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="Professional Support - Contact Us" Language="C#" MasterPageFile="~/Professional/Professional.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="workdone.Professional.ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ProfessionalTitle" runat="server">
    Contact Support - Professional Portal
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ProfessionalHead" runat="server">
    <style>
        .contact-info-card {
            background: #ffffff;
            border-radius: 14px;
            border: 1px solid #e2e8f0;
            padding: 24px;
            margin-bottom: 20px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.04);
        }
        
        .contact-channel {
            display: flex;
            align-items: flex-start;
            gap: 16px;
            padding: 14px 0;
            border-bottom: 1px solid #f1f5f9;
        }
        .contact-channel:last-child {
            border-bottom: none;
            padding-bottom: 0;
        }

        .channel-icon {
            width: 44px;
            height: 44px;
            border-radius: 10px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.3rem;
            flex-shrink: 0;
        }
    </style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ProfessionalMainContent" runat="server">
    <!-- HEADER -->
    <div class="mb-4">
        <h3 class="fw-bold text-dark mb-1">Partner Support Desk</h3>
        <p class="text-muted mb-0">Have an issue on-site, a question about your payouts, or account queries? Reach out to our dedicated professional support team.</p>
    </div>

    <div class="row g-4">
        <!-- SUPPORT TICKET FORM TEMPLATE -->
        <div class="col-lg-7">
            <div class="card border-0 shadow-sm rounded-4 p-4">
                <h5 class="fw-bold text-dark mb-3">Submit a Support Ticket</h5>
                
                <div class="mb-3">
                    <label class="form-label fw-semibold small text-secondary">Issue Category</label>
                    <select class="form-select" id="ticketCategory">
                        <option selected>Select inquiry category...</option>
                        <option value="payout">Payout / Earnings Discrepancy</option>
                        <option value="customer_issue">Customer Dispute or Location Issue</option>
                        <option value="cancellation">Booking Cancellation Assistance</option>
                        <option value="profile">Profile / Skill Category Update</option>
                        <option value="other">General Technical Support</option>
                    </select>
                </div>

                <div class="row g-3 mb-3">
                    <div class="col-md-6">
                        <label class="form-label fw-semibold small text-secondary">Related Booking ID (Optional)</label>
                        <input type="text" class="form-control" placeholder="e.g. BK-2026-9812" />
                    </div>
                    <div class="col-md-6">
                        <label class="form-label fw-semibold small text-secondary">Urgency Level</label>
                        <select class="form-select">
                            <option value="normal">Normal (Response in 4-6 hrs)</option>
                            <option value="urgent">Urgent / Active Job (Response in 15 mins)</option>
                        </select>
                    </div>
                </div>

                <div class="mb-3">
                    <label class="form-label fw-semibold small text-secondary">Subject</label>
                    <input type="text" class="form-control" placeholder="Brief summary of the issue" />
                </div>

                <div class="mb-4">
                    <label class="form-label fw-semibold small text-secondary">Description</label>
                    <textarea class="form-control" rows="5" placeholder="Please describe the issue in detail, including customer details if applicable..."></textarea>
                </div>

                <div class="d-flex align-items-center justify-content-between">
                    <span class="text-muted small">Our partner team is active 24/7.</span>
                    <button type="button" class="btn btn-primary rounded-pill px-4">
                        <i class="bi bi-send me-1"></i> Submit Ticket
                    </button>
                </div>
            </div>
        </div>

        <!-- CONTACT DETAILS & EMERGENCY HELPLINE -->
        <div class="col-lg-5">
            <!-- EMERGENCY HOTLINE -->
            <div class="contact-info-card bg-primary text-white border-0 shadow">
                <div class="d-flex align-items-center gap-3 mb-3">
                    <div class="rounded-circle bg-white text-primary p-3 d-flex align-items-center justify-content-center fs-4" style="width: 52px; height: 52px;">
                        <i class="bi bi-telephone-inbound-fill"></i>
                    </div>
                    <div>
                        <span class="text-white-50 small fw-bold text-uppercase">On-Job Priority Line</span>
                        <h4 class="fw-bold mb-0 text-white">+91 (800) 456-7890</h4>
                    </div>
                </div>
                <p class="text-white-50 small mb-0">For immediate assistance during active service orders or safety incidents.</p>
            </div>

            <!-- CHANNELS -->
            <div class="contact-info-card">
                <h6 class="fw-bold text-dark mb-3">Direct Contact Channels</h6>

                <div class="contact-channel">
                    <div class="channel-icon bg-success bg-opacity-10 text-success">
                        <i class="bi bi-whatsapp"></i>
                    </div>
                    <div>
                        <div class="fw-bold text-dark">WhatsApp Partner Desk</div>
                        <div class="text-muted small">+91 98765 43210</div>
                        <div class="text-muted small">Instant chat support (8 AM - 9 PM)</div>
                    </div>
                </div>

                <div class="contact-channel">
                    <div class="channel-icon bg-primary bg-opacity-10 text-primary">
                        <i class="bi bi-envelope"></i>
                    </div>
                    <div>
                        <div class="fw-bold text-dark">Partner Support Email</div>
                        <div class="text-muted small">partners@workdone.com</div>
                        <div class="text-muted small">Guaranteed reply within 4 hours</div>
                    </div>
                </div>

                <div class="contact-channel">
                    <div class="channel-icon bg-dark bg-opacity-10 text-dark">
                        <i class="bi bi-geo-alt"></i>
                    </div>
                    <div>
                        <div class="fw-bold text-dark">Regional Partner Hub</div>
                        <div class="text-muted small">3rd Floor, Shivalik Square, Kalawad Road, Rajkot - 360005</div>
                        <div class="text-muted small">Mon - Sat: 9:00 AM - 6:00 PM</div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

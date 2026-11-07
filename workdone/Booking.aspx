<%@ Page Title="Book Service" Language="C#" MasterPageFile="~/Site.Master"
    AutoEventWireup="true" CodeBehind="Booking.aspx.cs"
    Inherits="workdone.Booking" %>

<asp:Content ID="TitleContent" ContentPlaceHolderID="TitleContent" runat="server">
    Book Service - WorkDone
</asp:Content>

<asp:Content ID="HeadContent" ContentPlaceHolderID="HeadContent" runat="server">
    <style>
        .booking-page {
            background: #f5f7fc;
            min-height: 100vh;
            padding: 45px 15px;
        }

        .booking-form {
            max-width: 850px;
            margin: auto;
            background: white;
            padding: 35px;
            border-radius: 18px;
            border: 1px solid #e5e7eb;
            box-shadow: 0 10px 35px rgba(31, 41, 55, .07);
        }

        .booking-title {
            font-size: 30px;
            font-weight: 750;
            color: #172554;
            margin-bottom: 8px;
        }

        .booking-subtitle {
            color: #6b7280;
            margin-bottom: 30px;
        }

        .booking-badge {
            display: inline-block;
            background: #eef2ff;
            color: #4f46e5;
            padding: 7px 13px;
            border-radius: 30px;
            font-size: 13px;
            font-weight: 600;
            margin-bottom: 15px;
        }

        .section-title {
            font-size: 18px;
            font-weight: 700;
            color: #312e81;
            margin: 28px 0 18px;
            padding-bottom: 12px;
            border-bottom: 1px solid #e5e7eb;
        }

        .form-label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #374151;
            margin-bottom: 8px;
        }

        .form-control-custom {
            width: 100%;
            min-height: 46px;
            padding: 11px 13px;
            border: 1px solid #d1d5db;
            border-radius: 9px;
            background: #fff;
            color: #1f2937;
            font-size: 14px;
            box-sizing: border-box;
        }

            .form-control-custom:focus {
                border-color: #6366f1;
                outline: none;
                box-shadow: 0 0 0 3px rgba(99, 102, 241, .12);
            }

        textarea.form-control-custom {
            min-height: 110px;
            resize: vertical;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .booking-note {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 10px;
            padding: 14px;
            color: #64748b;
            font-size: 13px;
            margin: 20px 0;
        }

        .success-message {
            display: inline-block;
            padding: 10px 15px;
            color: #155724;
            background-color: #d4edda;
            border: 1px solid #c3e6cb;
            border-radius: 8px;
            font-weight: bold;
            font-size: 14px;
        }

        .btn-booking {
            width: 100%;
            min-height: 50px;
            background: linear-gradient(135deg, #4f46e5, #7c3aed);
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 700;
            cursor: pointer;
            margin-top: 10px;
            transition: .2s;
        }

            .btn-booking:hover {
                opacity: .92;
                transform: translateY(-1px);
            }

        .message {
            display: block;
            margin-top: 15px;
            font-weight: 600;
        }

        .back-link {
            display: inline-block;
            margin-bottom: 24px;
            color: #4f46e5;
            text-decoration: none;
            font-weight: 600;
            font-size: 14px;
        }

            .back-link:hover {
                color: #3730a3;
            }

        .required-star {
            color: #dc2626;
        }

        @media (max-width: 576px) {
            .booking-page {
                padding: 22px 10px;
            }

            .booking-form {
                padding: 23px 17px;
            }

            .booking-title {
                font-size: 25px;
            }
        }
    </style>
</asp:Content>

<asp:Content ID="MainContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="booking-page">
        <div class="container">
            <div class="booking-form">

                <a href="Professionals.aspx" class="back-link">&larr; Back to Professionals
                </a>

                <div class="booking-badge">WORKDONE SERVICE BOOKING</div>

                <h2 class="booking-title">Book Your Service</h2>
                <p class="booking-subtitle">
                    Tell us what you need, choose a convenient time,
                    and submit your booking request.
               
                </p>

                <asp:Label ID="lblMessage" runat="server"
                    CssClass="message" EnableViewState="false"></asp:Label>

                <h5 class="section-title">01. Service Details</h5>

                <div class="form-group">
                    <label class="form-label">
                        Service <span class="required-star">*</span>
                    </label>
                    <%--<asp:DropDownList ID="ddlService" runat="server"
                        CssClass="form-control-custom" required="required">
                        <asp:ListItem Value="">-- Select Service --</asp:ListItem>
                        <asp:ListItem>Home Cleaning</asp:ListItem>
                        <asp:ListItem>Plumbing</asp:ListItem>
                        <asp:ListItem>Electrician</asp:ListItem>
                        <asp:ListItem>Carpentry</asp:ListItem>
                        <asp:ListItem>Painting</asp:ListItem>
                        <asp:ListItem>AC Repair</asp:ListItem>
                        <asp:ListItem>Other</asp:ListItem>
                    </asp:DropDownList>--%>

                    <asp:Label ID="lblservice" runat="server" CssClass="form-control-custom" required="required" Text="Label"></asp:Label>

                </div>

                <div class="form-group">
                    <label class="form-label">
                        Describe Your Work <span class="required-star">*</span>
                    </label>
                    <asp:TextBox ID="txtDescription" runat="server"
                        CssClass="form-control-custom"
                        TextMode="MultiLine" Rows="4"
                        placeholder="Describe the work you need..."
                        required="required">
                    </asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                Booking Date <span class="required-star">*</span>
                            </label>
                            <asp:TextBox ID="txtDate" runat="server"
                                CssClass="form-control-custom"
                                TextMode="Date" required="required">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                Preferred Time <span class="required-star">*</span>
                            </label>
                            <asp:DropDownList ID="ddlTime" runat="server"
                                CssClass="form-control-custom" required="required">
                                <asp:ListItem Value="">-- Select Time --</asp:ListItem>
                                <asp:ListItem Value="08:00">08:00 AM</asp:ListItem>
                                <asp:ListItem Value="09:00">09:00 AM</asp:ListItem>
                                <asp:ListItem Value="10:00">10:00 AM</asp:ListItem>
                                <asp:ListItem Value="11:00">11:00 AM</asp:ListItem>
                                <asp:ListItem Value="12:00">12:00 PM</asp:ListItem>
                                <asp:ListItem Value="13:00">01:00 PM</asp:ListItem>
                                <asp:ListItem Value="14:00">02:00 PM</asp:ListItem>
                                <asp:ListItem Value="15:00">03:00 PM</asp:ListItem>
                                <asp:ListItem Value="16:00">04:00 PM</asp:ListItem>
                                <asp:ListItem Value="17:00">05:00 PM</asp:ListItem>
                                <asp:ListItem Value="18:00">06:00 PM</asp:ListItem>
                            </asp:DropDownList>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        Estimated Duration <span class="required-star">*</span>
                    </label>
                    <asp:DropDownList ID="ddlDuration" runat="server"
                        CssClass="form-control-custom" required="required">
                        <asp:ListItem Value="">-- Select Duration --</asp:ListItem>
                        <asp:ListItem Value="1">1 Hour</asp:ListItem>
                        <asp:ListItem Value="2">2 Hours</asp:ListItem>
                        <asp:ListItem Value="3">3 Hours</asp:ListItem>
                        <asp:ListItem Value="4">4 Hours</asp:ListItem>
                        <asp:ListItem Value="5">5 Hours</asp:ListItem>
                        <asp:ListItem Value="6">6 Hours</asp:ListItem>
                        <asp:ListItem Value="8">Full Day (8 Hours)</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <h5 class="section-title">02. Contact Details</h5>

                <div class="form-group">
                    <label class="form-label">
                        Full Name <span class="required-star">*</span>
                    </label>
                    <asp:TextBox ID="txtName" runat="server"
                        CssClass="form-control-custom"
                        placeholder="Enter your full name"
                        required="required">
                    </asp:TextBox>
                </div>

                <div class="row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                Mobile Number <span class="required-star">*</span>
                            </label>
                            <asp:TextBox ID="txtPhone" runat="server"
                                CssClass="form-control-custom"
                                TextMode="Phone" MaxLength="15"
                                placeholder="Enter your mobile number"
                                required="required">
                            </asp:TextBox>
                        </div>
                    </div>

                    <div class="col-md-6">
                        <div class="form-group">
                            <label class="form-label">
                                Email Address
                           
                            </label>
                            <asp:TextBox ID="txtEmail" runat="server"
                                CssClass="form-control-custom"
                                TextMode="Email"
                                placeholder="Enter your email address">
                            </asp:TextBox>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">
                        Service Address <span class="required-star">*</span>
                    </label>
                    <asp:TextBox ID="txtAddress" runat="server"
                        CssClass="form-control-custom"
                        TextMode="MultiLine" Rows="3"
                        placeholder="House, Street, Area, PIN code"
                        required="required">
                    </asp:TextBox>
                </div>

                <div class="booking-note">
                    <strong>Booking information</strong><br />
                    Your request will be submitted with Pending status.
                    The professional can confirm the booking later.
               
                    <br />
                    <br />
                    <asp:Label ID="Label1" runat="server" Cclass="success-message"></asp:Label>

                </div>

                <asp:Button ID="btnbooking" runat="server" Text="Book" CssClass="btn-booking" OnClick="btnbooking_Click" />



            </div>
        </div>
    </div>

</asp:Content>

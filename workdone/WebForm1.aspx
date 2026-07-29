<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="workdone.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>WorkDone | Local Services Marketplace</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background: #f7f9fc;
            color: #233142;
        }

        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 24px;
        }

        .hero {
            display: grid;
            grid-template-columns: 1.3fr 0.9fr;
            gap: 24px;
            background: linear-gradient(135deg, #0f766e, #2563eb);
            color: white;
            padding: 32px;
            border-radius: 20px;
            box-shadow: 0 12px 30px rgba(0,0,0,0.15);
        }

        .hero h1 {
            font-size: 2.2rem;
            margin: 0 0 12px 0;
        }

        .hero p {
            font-size: 1rem;
            line-height: 1.6;
        }

        .btn-row {
            margin-top: 20px;
        }

        .btn {
            display: inline-block;
            padding: 12px 16px;
            margin-right: 10px;
            border-radius: 999px;
            text-decoration: none;
            font-weight: bold;
        }

        .btn-primary {
            background: #fff;
            color: #2563eb;
        }

        .btn-secondary {
            background: transparent;
            border: 2px solid #fff;
            color: #fff;
        }

        .card {
            background: rgba(255,255,255,0.16);
            padding: 20px;
            border-radius: 16px;
            backdrop-filter: blur(8px);
        }

        .card h3 {
            margin-top: 0;
            margin-bottom: 10px;
        }

        .card ul {
            padding-left: 18px;
            line-height: 1.7;
        }

        .section {
            margin-top: 24px;
            background: white;
            padding: 24px;
            border-radius: 16px;
            box-shadow: 0 8px 20px rgba(15, 23, 42, 0.06);
        }

        .section h2 {
            margin-top: 0;
        }

        .service-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(180px, 1fr));
            gap: 14px;
        }

        .service-item {
            background: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 14px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
            gap: 16px;
        }

        .panel {
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 16px;
            background: #fcfdff;
        }

        .panel input, .panel select, .panel textarea {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            margin-bottom: 12px;
            border: 1px solid #cbd5e1;
            border-radius: 8px;
            box-sizing: border-box;
        }

        .panel button {
            background: #2563eb;
            color: white;
            border: none;
            padding: 10px 14px;
            border-radius: 8px;
            cursor: pointer;
            font-weight: bold;
        }

        footer {
            text-align: center;
            padding: 20px 0 8px 0;
            color: #64748b;
            font-size: 0.95rem;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <header class="hero">
                <div>
                    <p style="font-weight: bold; text-transform: uppercase; letter-spacing: 0.2em; margin-bottom: 8px;">Trusted local service marketplace</p>
                    <h1>Book plumbers, carpenters, beauticians, AC cleaners and more in one place.</h1>
                    <p>WorkDone helps local professionals register their services and lets customers quickly discover, contact, and book reliable help for home repairs, beauty care, cleaning, and everyday needs.</p>
                    <div class="btn-row">
                        <a class="btn btn-primary" href="#register">Register as Worker</a>
                        <a class="btn btn-secondary" href="#book">Book a Service</a>
                    </div>
                </div>
                <div class="card">
                    <h3>Popular Services</h3>
                    <ul>
                        <li>Plumber</li>
                        <li>Electrician</li>
                        <li>Carpenter</li>
                        <li>Beauty & Salon at Home</li>
                        <li>AC Cleaning & Repair</li>
                        <li>Home Cleaning</li>
                    </ul>
                </div>
            </header>

            <section class="section">
                <h2>Why WorkDone?</h2>
                <div class="service-grid">
                    <div class="service-item">
                        <strong>Verified Workers</strong>
                        <p>Local professionals ready to serve nearby customers.</p>
                    </div>
                    <div class="service-item">
                        <strong>Easy Booking</strong>
                        <p>Customers can find help quickly and book in minutes.</p>
                    </div>
                    <div class="service-item">
                        <strong>Flexible Services</strong>
                        <p>Support for home repairs, cleaning, beauty, and more.</p>
                    </div>
                    <div class="service-item">
                        <strong>Growth for Local Talent</strong>
                        <p>Small workers can register and build a steady customer base.</p>
                    </div>
                </div>
            </section>

            <section class="section">
                <h2>Start Today</h2>
                <div class="form-grid">
                    <div class="panel" id="register">
                        <h3>Register as a Worker</h3>
                        <label>Your Name</label>
                        <input type="text" placeholder="Enter your full name" />
                        <label>Service Type</label>
                        <select>
                            <option>Plumber</option>
                            <option>Carpenter</option>
                            <option>Electrician</option>
                            <option>Beauty Parlor</option>
                            <option>AC Cleaning</option>
                            <option>Home Cleaning</option>
                        </select>
                        <label>Location</label>
                        <input type="text" placeholder="Your city or area" />
                        <label>Phone Number</label>
                        <input type="text" placeholder="Contact number" />
                        <button type="button">Register Now</button>
                    </div>

                    <div class="panel" id="book">
                        <h3>Book a Service</h3>
                        <label>Your Name</label>
                        <input type="text" placeholder="Enter your name" />
                        <label>Required Service</label>
                        <select>
                            <option>Plumber</option>
                            <option>Carpenter</option>
                            <option>Electrician</option>
                            <option>Beauty Service</option>
                            <option>AC Cleaning</option>
                            <option>Cleaning</option>
                        </select>
                        <label>Preferred Date</label>
                        <input type="date" />
                        <label>Address</label>
                        <textarea rows="3" placeholder="Tell us your location and service details"></textarea>
                        <button type="button">Book Now</button>
                    </div>
                </div>
            </section>

            <footer>
                <p>WorkDone — A smarter way to connect local workers with the people who need them.</p>
            </footer>
        </div>
    </form>
</body>
</html>

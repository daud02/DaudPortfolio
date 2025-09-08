<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="DaudPortfolio.Home" %>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1" />
  <title>Daud Sharif — Portfolio</title>
  <meta name="description" content="Portfolio of Daud Sharif: projects, skills, and contact information." />
  <!-- TODO: Update description, social links, and contact email. -->
  <link rel="stylesheet" href="styles.css" />
   <script src="script.js"></script>
</head>
<body>
    <header class="header">
        <a href="#" class="logo">Portfolio</a>

        <nav class="navbar">
            <a href="#home">Home</a>
            <a href="#about">About</a>
            <a href="#achievements">Achievements</a>
            <a href="#skill">Skills</a>
            <a href="#contact">Contact</a>
        </nav>
    </header>
    <section class="home" id="home">
        <div class="home-content">
            <h3>Hello, It's </h3>
            <h1>Mohammad Abu Daud Sharif</h1>
            <h1>I am , </h1> <span id="skills"></span>
            <a href="#" class="btn-box">More about me</a>
        </div>
    </section>
    <section class="about" id="about">
        <div class="about-img">
            <img src="backgroundimg.jpg" />
        </div>
        <div class="about-text">
            <h1>About me</h1>
            <h4>A Computer Science ans Engineering student!</h4>
            <p>
                I am a Computer Science and Engineering student at KUET,
                passionate about learning and exploring new technologies.
                I am an active competitive programmer with a purple rating 
                on Codeforces and have achieved multiple rankings in various contests,
                including IUPC. I enjoy solving problems and continuously improving my skills.
            </p>
            <a href="#" class="btn-box">About Me</a>
        </div>
    </section>


    <section class="achievements" id="achievements">
        <div class="container">
            <h1>My Achievements</h1>

            <div class="achievements-grid">
                <asp:Repeater ID="rptAchievements" runat="server">
                    <ItemTemplate>
                        <div class="achievement-card">
                            <%-- <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' /> --%>
                            <div class="content">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>


    <section class="skill" id="skill">
        <div class="container">
            <h1>My Skills</h1>

            <div class="skills-grid">
                <asp:Repeater ID="Repeatskills" runat="server">
                    <ItemTemplate>
                        <div class="skill-card">
                            <%-- <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' /> --%>
                            <div class="content">
                                <h3><%# Eval("Title") %></h3>
                                <p><%# Eval("Description") %></p>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
    </section>




    <section class="contact" id="contact">
        <div class="container">
            <h1>Contact Me</h1>

            <form id="contactForm" runat="server">
                <div class="form-group">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control" Placeholder="Your Name"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" Placeholder="Your Email"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine" CssClass="form-control" Rows="5" Placeholder="Your Message"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:Button ID="btnSubmit" runat="server" Text="Send Message" CssClass="btn-box" OnClick="btnSubmit_Click" />
                </div>

                <asp:Label ID="lblStatus" runat="server" CssClass="status-label"></asp:Label>
            </form>
        </div>
    </section>




</body>
</html>

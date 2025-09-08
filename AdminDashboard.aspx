<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="DaudPortfolio.AdminDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0; padding: 0;
            background: #f5f7fb;
        }
        .header {
            background: #4f46e5;
            color: white;
            padding: 15px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .header h2 { margin: 0; }
        .header .buttons {
            display: flex;
            gap: 10px;
        }
        .content {
            padding: 30px;
            max-width: 900px;
            margin: auto;
        }
        .card {
            background: white;
            padding: 25px;
            margin-bottom: 25px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        .card h3 {
            margin-top: 0;
            color: #333;
        }
        /* General button style */
        .btn {
            display: inline-block;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            font-size: 15px;
            font-weight: bold;
            cursor: pointer;
            transition: 0.3s ease;
        }
        /* Header buttons */
        .logout {
            background: #ef4444;
            color: white;
        }
        .logout:hover {
            background: #dc2626;
        }
        .home {
            background: #facc15;
            color: #1e293b;
        }
        .home:hover {
            background: #eab308;
        }
        /* Dashboard buttons */
        .btn-primary {
            background: #4f46e5;
            color: white;
        }
        .btn-primary:hover {
            background: #3730a3;
        }
        .btn-success {
            background: #22c55e;
            color: white;
        }
        .btn-success:hover {
            background: #15803d;
        }
        .btn-info {
            background: #0ea5e9;
            color: white;
        }
        .btn-info:hover {
            background: #0369a1;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h2>Admin Dashboard</h2>
            <div class="buttons">
                <asp:Button ID="btnHome" runat="server" Text="Home" CssClass="btn home" OnClick="btnHome_Click" />
                <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn logout" OnClick="btnLogout_Click" />
            </div>
        </div>

        <div class="content">
            <div class="card">
                <h3>Welcome, <asp:Label ID="lblAdmin" runat="server" /></h3>
                <p>You are logged in as the admin.</p>
            </div>

            <div class="card">
                <h3>Manage Data</h3>
                <asp:Button ID="btnShowData" runat="server" Text="View Records" CssClass="btn btn-primary" OnClick="btnShowData_Click" />
                <asp:Button ID="btnInsertData" runat="server" Text="Insert New Record" CssClass="btn btn-success" OnClick="btnInsertData_Click" />
                <asp:Button ID="btnMessages" runat="server" Text="View Messages" CssClass="btn btn-info" OnClick="btnMessages_Click" />
            </div>
        </div>
    </form>
</body>
</html>

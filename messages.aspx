<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="messages.aspx.cs" Inherits="DaudPortfolio.Messages" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Messages</title>
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
        .content {
            padding: 30px;
            max-width: 1000px;
            margin: auto;
        }
        .card {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 5px 15px rgba(0,0,0,0.08);
        }
        .btn {
            background: #4f46e5;
            color: white;
            border: none;
            border-radius: 6px;
            padding: 8px 16px;
            cursor: pointer;
        }
        .btn:hover {
            background: #3730a3;
        }
        .grid {
            width: 100%;
            border-collapse: collapse;
        }
        .grid th, .grid td {
            border: 1px solid #ddd;
            padding: 10px;
            text-align: left;
        }
        .grid th {
            background: #4f46e5;
            color: white;
        }
        .grid tr:nth-child(even) {
            background: #f9fafb;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="header">
            <h2>Messages</h2>
            <asp:Button ID="btnBack" runat="server" Text="Back to Dashboard" CssClass="btn" OnClick="btnBack_Click" />
        </div>

        <div class="content">
            <div class="card">
                <asp:GridView ID="gvMessages" runat="server" CssClass="grid" AutoGenerateColumns="false">
                    <Columns>
                        <asp:BoundField DataField="id" HeaderText="ID" />
                        <asp:BoundField DataField="email" HeaderText="Email" />
                        <asp:BoundField DataField="name" HeaderText="Name" />
                        <asp:BoundField DataField="msg" HeaderText="Message" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </form>
</body>
</html>

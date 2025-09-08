<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin_update.aspx.cs" Inherits="DaudPortfolio.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="add_achievements.css" />
</head>
<body>
    <section class="add-achievement" id="add-achievement">
    <div class="container">
        <h1>Add New Achievement</h1>

        <form id="achievementForm" runat="server">
            <div class="form-group">
                <asp:TextBox ID="txtAchTitle" runat="server" CssClass="form-control" Placeholder="Title" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtAchDescription" runat="server" TextMode="MultiLine" CssClass="form-control" Placeholder="Description"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtAchDate" runat="server" CssClass="form-control" TextMode="Date" Placeholder="Date Achieved" required="true"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:DropDownList ID="ddlAchType" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Individual" Value="0"></asp:ListItem>
                    <asp:ListItem Text="Team" Value="1"></asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <asp:TextBox ID="txtAchTeamId" runat="server" CssClass="form-control" Placeholder="Team ID (if applicable)"></asp:TextBox>
            </div>
            <div class="form-group">
                <asp:Button ID="btnAddAchievement" runat="server" Text="Add Achievement" CssClass="btn-box" OnClick="btnAddAchievement_Click" />
            </div>

            <asp:Label ID="lblAchMessage" runat="server" CssClass="status-label"></asp:Label>
        </form>
    </div>
</section>

</body>
</html>

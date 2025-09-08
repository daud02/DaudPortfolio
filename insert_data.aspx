<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="insert_data.aspx.cs" Inherits="DaudPortfolio.InsertData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Insert Data</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Add New Record</h2>

            <!-- Radio buttons to choose table -->
            <asp:RadioButtonList ID="rblType" runat="server" RepeatDirection="Horizontal">
                <asp:ListItem Text="Achievement" Value="achievement" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Skill" Value="skill"></asp:ListItem>
            </asp:RadioButtonList>

            <br />

            <asp:Label ID="lblTitle" runat="server" Text="Title:" />
            <asp:TextBox ID="txtTitle" runat="server" Width="300px" /><br /><br />

            <asp:Label ID="lblContext" runat="server" Text="Context:" />
            <asp:TextBox ID="txtContext" runat="server" TextMode="MultiLine" Rows="5" Columns="50" /><br /><br />

            <asp:Label ID="lblLink" runat="server" Text="Link:" />
            <asp:TextBox ID="txtLink" runat="server" Width="300px" /><br /><br />

            <asp:Button ID="btnSave" runat="server" Text="Save Record" OnClick="btnSave_Click" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>

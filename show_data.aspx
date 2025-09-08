<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="show_data.aspx.cs" Inherits="DaudPortfolio.ShowData" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Data</title>
    <style>
        .big-textbox {
            width: 95% !important;
            height: 120px !important;
            font-size: 14px;
            padding: 6px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2>Records List</h2>

            <!-- Add New Button -->
            <asp:Button ID="btnAddNew" runat="server" Text="Add New Record" OnClick="btnAddNew_Click" />

            <br /><br />

            <!-- Choose table -->
            <asp:RadioButtonList ID="rblType" runat="server" AutoPostBack="True" 
                OnSelectedIndexChanged="rblType_SelectedIndexChanged"
                RepeatDirection="Horizontal">
                <asp:ListItem Text="Achievements" Value="achievements" Selected="True"></asp:ListItem>
                <asp:ListItem Text="Skills" Value="skills"></asp:ListItem>
            </asp:RadioButtonList>

            <br />

            <!-- Grid -->
            <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" 
                OnRowEditing="gvData_RowEditing"
                OnRowUpdating="gvData_RowUpdating"
                OnRowCancelingEdit="gvData_RowCancelingEdit"
                OnRowDeleting="gvData_RowDeleting"
                DataKeyNames="ID">

                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" />

                    <asp:TemplateField HeaderText="Title">
                        <ItemTemplate>
                            <%# Eval("Title") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtTitle" runat="server" Text='<%# Bind("Title") %>' CssClass="big-textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Context">
                        <ItemTemplate>
                            <%# Eval("Context") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtContext" runat="server" Text='<%# Bind("Context") %>' 
                                TextMode="MultiLine" CssClass="big-textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:TemplateField HeaderText="Link">
                        <ItemTemplate>
                            <%# Eval("Link") %>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:TextBox ID="txtLink" runat="server" Text='<%# Bind("Link") %>' CssClass="big-textbox" />
                        </EditItemTemplate>
                    </asp:TemplateField>

                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green" />
        </div>
    </form>
</body>
</html>

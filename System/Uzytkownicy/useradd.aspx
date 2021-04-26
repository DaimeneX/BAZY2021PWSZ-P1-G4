<%@ Page Language="C#" AutoEventWireup="true" CodeFile="useradd.aspx.cs" Inherits="admin_access_useradd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dodaj użytkownika</title>
    <link type="text/css" href="~/MasterPages/system_users.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="webparts">
                <tr>
                    <th colspan="2">Dodaj użytkownika</th>
                </tr>

                <tr>
                    <td class="details_u" valign="top" width="350">
                        <h3>Dane użytkownika:</h3>
                        <table>
                            <tr>
                                <td class="detailheader">Użytkownik aktywny</td>
                                <td>
                                    <asp:CheckBox ID="isapproved" runat="server" Checked="true" />
                                </td>
                            </tr>
                            <tr>
                                <td class="detailheader">Nazwa</td>
                                <td>
                                    <asp:TextBox ID="username" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="detailheader">Hasło</td>
                                <td>
                                    <asp:TextBox ID="password" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="detailheader">Email</td>
                                <td>
                                    <asp:TextBox ID="email" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td class="detailheader">Notka</td>
                                <td>
                                    <asp:TextBox ID="comment" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <br />
                                    <input type="submit" value="Dodaj" />&nbsp;
		                            <input type="reset" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <div id="ConfirmationMessage" runat="server" class="alert"></div>
                                </td>
                            </tr>
                        </table>
                </tr>
                <tr>
                    <td class="details" valign="top" width="250">

                        <h3>Role:</h3>
                        <asp:CheckBoxList ID="UserRoles" runat="server" />
                    </td>

                    <td>
                        <asp:ObjectDataSource ID="MemberData" runat="server" DataObjectTypeName="System.Web.Security.MembershipUser" SelectMethod="GetUser" UpdateMethod="UpdateUser" TypeName="System.Web.Security.Membership">
                            <SelectParameters>
                                <asp:QueryStringParameter Name="username" QueryStringField="username" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                    </td>

                </tr>

            </table>
        </div>
    </form>
</body>
</html>

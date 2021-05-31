<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Loginpage_Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="shortcut icon" type="image/x-icon" href="~/favicon.ico" />
    <title></title>
    <style type="text/css">

        .myStyle {
            height: 50px;
            width: 100%;
            margin-left: 100px;
        }

        .myStyle2 {
            height: 50px;
            width: 100%;
            border: none;
        }

        .mBoxM {
            margin: auto;
            width: 800px;
        }

        .mBox1 {
            width: 800px;
            height: 50px;
            border-bottom: solid;
            border-color: #689398;
            padding-bottom: 40px;
        }

        .mBox2 {
            width: 800px;
            height: 250px;
            padding-top: 40px;
            padding-bottom: 40px;
        }

        .mBox3 {
            width: 800px;
            height: 50px;
            border-top: double;
            border-color: silver;
            padding-top: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="mBoxM">

            <div class="mBox1">
            </div>
            <div class="mBox2">

                <dx:ASPxFormLayout ID="LoginForm" runat="server" Width="800px" Height="400px" CssClass="myStyle2">
                    <Items>
                        <dx:LayoutGroup GroupBoxDecoration="Box" ShowCaption="False" Width="100%" Height="50px" HorizontalAlign="center" ColumnCount="2">
                            <Items>
                                <dx:LayoutItem ShowCaption="False" HorizontalAlign="Right" Width="100%">
                                    <LayoutItemNestedControlCollection>
                                        <dx:LayoutItemNestedControlContainer runat="server" Width="100%">
                                            <div style="width: 100%; text-align: right;">
                                                <asp:Login ID="Login" runat="server" DestinationPageUrl="~/Default.aspx"
                                                    FailureText="Logowanie nie powiodło się. <br />Zaloguj się jeszcze raz."
                                                    LoginButtonText="Zaloguj" PasswordLabelText="Hasło: "
                                                    RememberMeText="Zapamietaj przy następnej wizycie." TitleText="Zaloguj się"
                                                    UserNameLabelText="Użytkownik: " VisibleWhenLoggedIn="False"
                                                    DisplayRememberMe="False" PasswordRequiredErrorMessage="Hasło jest wymagane."
                                                    UserNameRequiredErrorMessage="Nazwa użytkownika jest wymagana."
                                                    OnLoggedIn="Login_LoggedIn">
                                                    <LayoutTemplate>

                                                        <div style="float:left;">
                                                            <table style="width: 300px;">
                                                                <tr>
                                                                    <td style="width: 100px;"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: left; padding: 5px;">
                                                                        <dx:ASPxLabel ID="lbUserName" Text="Użytkownik" runat="server" Font-Size="Large" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: left; padding: 5px;">
                                                                        <dx:ASPxTextBox ID="UserName" runat="server" DisabledStyle-BackColor="Gray" BackColor="White" Font-Size="Large" Width="244px">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderStyle="Solid" BorderColor="#00C0C0" />
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: left; padding: 5px;">
                                                                        <dx:ASPxLabel ID="lbPassword" Text="Hasło" runat="server" Font-Size="Large" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: left; padding: 5px;">
                                                                        <dx:ASPxTextBox ID="Password" runat="server" Password="true" DisabledStyle-BackColor="Gray" BackColor="White" Font-Size="Large" Width="244px">
                                                                            <Border BorderStyle="None" />
                                                                            <BorderBottom BorderStyle="Solid" BorderColor="#00C0C0" />
                                                                        </dx:ASPxTextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="padding: 5px;">
                                                                        <dx:ASPxButton ID="LoginButton" runat="server" CommandName="Login" Text="Zaloguj" CssClass="LogBtn" BackColor="Green" AutoPostBack="true" OnClick="LoginButton_Click" />




                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                    <td style="text-align: left; padding: 5px;" colspan="2">
                                                                        <div style="text-decoration-color: red; color: red">
                                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div style="float:right;">
                                                            <dx:ASPxImage ID="imD" runat="server" ShowLoadingImage="true" AlternateText="Z-Liga" ImageUrl="z-liga.png" Width="400px"></dx:ASPxImage>
                                                        </div>
                                                        <div style="clear:both;"></div>
                                                    </LayoutTemplate>
                                                </asp:Login>
                                            </div>
                                        </dx:LayoutItemNestedControlContainer>
                                    </LayoutItemNestedControlCollection>
                                </dx:LayoutItem>
                            </Items>
                        </dx:LayoutGroup>
                    </Items>
                </dx:ASPxFormLayout>

            </div>

            <div class="mBox3">
                <asp:Label ID="Label1" Visible="false" runat="server" Text=""></asp:Label>
                <span style="float: right;">© 2021 Z-Liga: System Zarządzania Ligą Piłkarską</span><br />
                <asp:Label ID="Label2" Visible="false" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>

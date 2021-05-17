<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <dx:ASPxLabel runat="server" Text="Ostatnie mecze"></dx:ASPxLabel>
    <dx:ASPxGridView runat="server">
        
    </dx:ASPxGridView>

</asp:Content>


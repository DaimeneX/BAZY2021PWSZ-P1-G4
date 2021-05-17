<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <dx:ASPxLabel runat="server" Text="Ostatnie mecze"></dx:ASPxLabel>
    <dx:ASPxGridView runat="server" DataSourceID="SQL_Przeszle_mecze" AutoGenerateColumns="false" Width="480px" KeyFieldName="id">
        <Columns>
            <dx:GridViewDataColumn Caption="Data Meczu" FieldName="data"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Gospodarze" FieldName="gospodarz"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Goście" FieldName="gosc"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Wynik meczu" FieldName="wynik_koncowy"></dx:GridViewDataColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Przeszle_mecze"
        SelectCommand="dbs_select_przeszle_mecze" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


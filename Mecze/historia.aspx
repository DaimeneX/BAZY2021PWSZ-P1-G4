<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Historia.aspx.cs" Inherits="Mecze_historia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" Runat="Server">
    <dx:ASPxGridView runat="server" DataSourceID="SQL_Przeszle_mecze" AutoGenerateColumns="false" Width="1180px" KeyFieldName="id">
        <Columns>
            <dx:GridViewDataColumn Caption="Data Meczu" FieldName="data"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Godzina rozgrywki" FieldName="godzina"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Gospodarze" FieldName="gospodarz"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Bramki gospodarzy" FieldName="gosp_pkt"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Goście" FieldName="gosc"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Bramki gości" FieldName="gosc_pkt"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Wynik meczu" FieldName="wynik_koncowy"></dx:GridViewDataColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Przeszle_mecze"
        SelectCommand="dbs_select_przeszle_mecze" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Trener.aspx.cs" Inherits="Dane_Trener" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" Runat="Server">
        <div style="width: 480px;">
        <dx:ASPxGridView runat="server" ID="Stadion" DataSourceID="SQL_Trener" AutoGenerateColumns="false" KeyFieldName="id_trener">
            <Columns>
                <dx:GridViewDataColumn FieldName="id_trener" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="trener_imie" Caption="Imię"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="trener_nazwisko" Caption="Nazwisko"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="trener_licencja" Caption="Licencja"></dx:GridViewDataColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Trener"
        SelectCommand="dbs_select_trenerzy" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_trenerzy" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_trenerzy" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


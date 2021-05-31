<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Sponsorzy.aspx.cs" Inherits="Finanse_Sponsorzy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" Runat="Server">
    <div style="width: 640px;">
        <dx:ASPxGridView runat="server" ID="Stadion" DataSourceID="SQL_Sponsorzy" AutoGenerateColumns="false" KeyFieldName="id_sp" Width="640px">
            <Columns>
                <dx:GridViewDataColumn FieldName="id_sp" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="sp_nazwa" Caption="Nazwa sponsora"></dx:GridViewDataColumn>
                <dx:GridViewDataDateColumn FieldName="sp_data_umowy" Caption="Data Umowy"></dx:GridViewDataDateColumn>
                <dx:GridViewDataDateColumn FieldName="sp_czas_umowy" Caption="Data Wygaśnięcia"></dx:GridViewDataDateColumn>
                <dx:GridViewDataColumn FieldName="sp_kwota" Caption="Kwota" Width="60px"></dx:GridViewDataColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" Width="20px"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Sponsorzy"
        SelectCommand="dbs_select_sponsorzy" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_sponsorzy" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_sponsorzy" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


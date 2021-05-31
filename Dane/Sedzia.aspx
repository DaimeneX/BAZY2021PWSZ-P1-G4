<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Sedzia.aspx.cs" Inherits="Dane_Sedzia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <div style="width: 480px;">
        <dx:ASPxGridView runat="server" ID="Stadion" DataSourceID="SQL_Sedzia" AutoGenerateColumns="false" KeyFieldName="id_sedzia">
            <Columns>
                <dx:GridViewDataColumn FieldName="id_sedzia" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="sedzia_imie" Caption="Imię"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="sedzia_nazwisko" Caption="Nazwisko"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="sedzia_region" Caption="Region"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="sedzia_licencja" Caption="Licencja"></dx:GridViewDataColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Sedzia"
        SelectCommand="dbs_select_sedzia" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_sedzia" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_sedzia" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Stadiony.aspx.cs" Inherits="Lokacje_Stadiony" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" Runat="Server">
    <div style="width: 480px;">
        <dx:ASPxGridView runat="server" ID="Stadion" DataSourceID="SQL_Stadion" AutoGenerateColumns="false" KeyFieldName="id_stadion">
            <Columns>
                <dx:GridViewDataColumn FieldName="id_stadion" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="stadion_miasto" Caption="Miasto"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="stadion_ulica" Caption="Ulica"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="stadion_numer" Caption="Numer"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="stadion_pojemnosc" Caption="Pojemność"></dx:GridViewDataColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Stadion"
        SelectCommand="dbs_select_stadiony" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_stadiony" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_stadiony" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


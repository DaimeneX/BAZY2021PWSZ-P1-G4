<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Kluby.aspx.cs" Inherits="Liga_Kluby" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <div style="width: 1180px;">
        <dx:ASPxGridView runat="server" DataSourceID="SQL_Kluby" AutoGenerateColumns="false" Width="1180px" KeyFieldName="id">
            <Settings ShowTitlePanel="false" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="true" AllowInsert="true" />
            <Columns>
                <dx:GridViewDataColumn FieldName="id" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nazwa Klubu" FieldName="nazwa"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Zdobyte punkty" FieldName="punkty"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Strona internetowa" FieldName="strona"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Adres" FieldName="adres"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Barwy klubu" FieldName="barwy"></dx:GridViewDataColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trener" FieldName="trener">
                    <EditFormSettings Visible="True" VisibleIndex="2" Caption="Trener" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Trener" TextField="trener" DropDownStyle="DropDownList"
                        ValueField="id" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="imie" Width="100px" />
                            <dx:ListBoxColumn FieldName="nazwisko" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Stadion" FieldName="stadion">
                    <EditFormSettings Visible="True" VisibleIndex="2" Caption="Stadion" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Stadion" TextField="stadion" DropDownStyle="DropDownList"
                        ValueField="id" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="miasto" Width="100px" />
                            <dx:ListBoxColumn FieldName="ulica" Width="100px" />
                            <dx:ListBoxColumn FieldName="numer" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>

    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Kluby"
        SelectCommand="dbs_select_kluby" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_kluby" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_kluby" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Trener"
        SelectCommand="dbs_select_trenerzy" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_trenerzy" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_trenerzy" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Stadion"
        SelectCommand="dbs_select_stadiony" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_stadiony" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_stadiony" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Historia.aspx.cs" Inherits="Mecze_historia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" Runat="Server">
    <dx:ASPxGridView runat="server" DataSourceID="SQL_Przeszle_mecze" AutoGenerateColumns="false" Width="1180px" KeyFieldName="id_historia_meczy">
        <Columns>
            <dx:GridViewDataColumn Caption="Data Meczu" FieldName="hm_data" Width="60px"></dx:GridViewDataColumn>
            <dx:GridViewDataColumn Caption="Godzina rozgrywki" FieldName="hm_godzina" Width="60px"></dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn Caption="Gospodarze" FieldName="hm_gospodarz">
                <EditFormSettings Visible="True" VisibleIndex="2" Caption="Gospodarze" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Kluby" TextField="gosc" DropDownStyle="DropDownList"
                        ValueField="id_klub" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="klub_nazwa" Caption="Nazwa" Width="100px" />
                            <dx:ListBoxColumn FieldName="klub_miasto" Caption="Miasto" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn Caption="Bramki gospodarzy" FieldName="hm_gosp_pkt" Width="20px"></dx:GridViewDataColumn>
             <dx:GridViewDataComboBoxColumn Caption="Goście" FieldName="hm_gosc">
                 <EditFormSettings Visible="True" VisibleIndex="2" Caption="Goście" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Kluby" TextField="gosc" DropDownStyle="DropDownList"
                        ValueField="id_klub" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="klub_nazwa" Caption="Nazwa" Width="100px" />
                            <dx:ListBoxColumn FieldName="klub_miasto" Caption="Miasto" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataColumn Caption="Bramki gości" FieldName="hm_gosc_pkt" Width="20px"></dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn Caption="Sędzia" FieldName="hm_sedzia" Width="120px">
                <EditFormSettings Visible="True" VisibleIndex="2" Caption="Sędzia" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Sedzia" TextField="sedzia" DropDownStyle="DropDownList"
                        ValueField="id_sedzia" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="sedzia_imie" Width="100px" />
                            <dx:ListBoxColumn FieldName="sedzia_nazwisko" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Przeszle_mecze"
        SelectCommand="dbs_select_historia_meczy" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_historia_meczy" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_historia_meczy" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Kluby"
        SelectCommand="dbs_select_kluby" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Sedzia"
        SelectCommand="dbs_select_sedzia" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


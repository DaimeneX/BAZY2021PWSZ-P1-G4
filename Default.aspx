<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <dx:ASPxVerticalGrid runat="server" DataSourceID="SQL_Bilans" Width="300px">
        <Rows>
            <dx:VerticalGridDataRow FieldName="bilans_konta" Caption="Bilans"></dx:VerticalGridDataRow>
        </Rows>
    </dx:ASPxVerticalGrid> <br />
    <dx:ASPxLabel runat="server" Text="Ostatnie mecze"></dx:ASPxLabel>
    <dx:ASPxGridView runat="server" DataSourceID="SQL_Przeszle_mecze" AutoGenerateColumns="false" Width="480px" KeyFieldName="id_hm">
        <Columns>
            <dx:GridViewDataColumn Caption="Data Meczu" FieldName="hm_data"></dx:GridViewDataColumn>
            <dx:GridViewDataComboBoxColumn Caption="Gospodarze" FieldName="hm_gospodarz">
                <EditFormSettings Visible="True" VisibleIndex="2" Caption="Goście" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Kluby" TextField="hm_gospodarz" DropDownStyle="DropDownList"
                        ValueField="id_klub" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="klub_nazwa" Width="100px" />
                            <dx:ListBoxColumn FieldName="klub_miasto" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
            </dx:GridViewDataComboBoxColumn>
            <dx:GridViewDataComboBoxColumn Caption="Goście" FieldName="hm_gosc">
                 <EditFormSettings Visible="True" VisibleIndex="2" Caption="Goście" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Kluby" TextField="hm_gosc" DropDownStyle="DropDownList"
                        ValueField="id_klub" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="klub_nazwa" Width="100px" />
                            <dx:ListBoxColumn FieldName="klub_miasto" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
             </dx:GridViewDataComboBoxColumn>
        </Columns>
    </dx:ASPxGridView>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Przeszle_mecze"
        SelectCommand="dbs_select_historia_meczy" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Kluby"
        SelectCommand="dbs_select_kluby" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Bilans" SelectCommand="SELECT bilans_konta FROM bilans">
    </asp:SqlDataSource>
</asp:Content>


<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Zawodnicy.aspx.cs" Inherits="Liga_Zawodnicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <div style="width: 480px;">
        <dx:ASPxGridView runat="server" ID="Zawodnicy" DataSourceID="SQL_Zawodnik" AutoGenerateColumns="false" Width="480px" KeyFieldName="id_zawodnik">
            <SettingsDetail ShowDetailRow="true" />
            <Columns>
                <dx:GridViewDataColumn Caption="Imię" FieldName="zawodnik_imie" Width="60px"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nazwisko" FieldName="zawodnik_nazwisko" Width="60px"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Wiek" FieldName="zawodnik_wiek"></dx:GridViewDataColumn>
                <dx:GridViewDataComboBoxColumn Caption="Klub" FieldName="zawodnik_klub">
                    <EditFormSettings Visible="True" VisibleIndex="2" Caption="Klub" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Kluby" TextField="id_klub" DropDownStyle="DropDownList"
                        ValueField="id_klub" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="klub_nazwa" Caption="Nazwa" Width="100px" />
                            <dx:ListBoxColumn FieldName="klub_miasto" Caption="Miasto" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
            <Templates>
                <DetailRow>
                    <dx:ASPxGridView runat="server" ID="Zawodnicy" DataSourceID="SQL_Zawodnik_st" AutoGenerateColumns="false" Width="480px" KeyFieldName="id_statystyka"
                        OnBeforePerformDataSelect="Zawodnicy_BeforePerformDataSelect">
                        <Columns>
                            <dx:GridViewDataColumn Visible="false" FieldName="statystyka_zawodnik" Width="60px"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Mecze" FieldName="statystyka_mecz" Width="60px"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Bramki" FieldName="statystyka_bramki"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Czerwone Kartki" FieldName="statystyka_czerwone_kartki"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Żółte Kartki" FieldName="statystyka_zolte_kartki"></dx:GridViewDataColumn>
                            <dx:GridViewDataColumn Caption="Kontuzje" FieldName="statystyka_kontuzje"></dx:GridViewDataColumn>
                            <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
                        </Columns>
                    </dx:ASPxGridView>
                </DetailRow>
            </Templates>
        </dx:ASPxGridView>
    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Zawodnik"
        SelectCommand="dbs_select_zawodnik" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_zawodnik" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_zawodnik" InsertCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Zawodnik_st"
        SelectCommand="dbs_select_zawodnik_st" SelectCommandType="StoredProcedure"
        UpdateCommand="dbs_update_zawodnik_st" UpdateCommandType="StoredProcedure"
        InsertCommand="dbs_insert_zawodnik_st" InsertCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="zawodnik" SessionField="zawodnik" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Kluby"
        SelectCommand="dbs_select_kluby" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>

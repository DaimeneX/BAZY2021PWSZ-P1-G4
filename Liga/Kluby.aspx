<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Kluby.aspx.cs" Inherits="Liga_Kluby" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <div style="width: 1180px;">
        <dx:ASPxGridView runat="server" DataSourceID="SQL_Kluby" AutoGenerateColumns="false" Width="1180px" KeyFieldName="id_klub">
            <SettingsDetail ShowDetailRow="true" />
            <Settings ShowTitlePanel="false" />
            <SettingsDataSecurity AllowDelete="False" AllowEdit="true" AllowInsert="true" />
            <Columns>
                <dx:GridViewDataColumn FieldName="id_klub" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Nazwa Klubu" FieldName="klub_nazwa"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Zdobyte punkty" FieldName="klub_punkty"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Strona internetowa" FieldName="klub_strona"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Adres" FieldName="klub_adres"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="klub_miasto" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="klub_ulica" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="klub_numer" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Telefon" FieldName="klub_telefon"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn Caption="Barwy klubu" FieldName="klub_barwy"></dx:GridViewDataColumn>
                <dx:GridViewDataComboBoxColumn Caption="Trener" FieldName="klub_trener">
                    <EditFormSettings Visible="True" VisibleIndex="2" Caption="Trener" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Trener" TextField="trener" DropDownStyle="DropDownList"
                        ValueField="id_trener" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="trener_imie" Width="100px" />
                            <dx:ListBoxColumn FieldName="trener_nazwisko" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn Caption="Stadion" FieldName="klub_stadion">
                    <EditFormSettings Visible="True" VisibleIndex="2" Caption="Stadion" ColumnSpan="2" />
                    <PropertiesComboBox DataSourceID="SQL_Stadion" TextField="stadion" DropDownStyle="DropDownList"
                        ValueField="id_stadion" EnableIncrementalFiltering="True" IncrementalFilteringMode="Contains" EnableCallbackMode="True"
                        IncrementalFilteringDelay="250" CallbackPageSize="10" DropDownRows="5">
                        <Columns>
                            <dx:ListBoxColumn FieldName="stadion_miasto" Width="100px" />
                            <dx:ListBoxColumn FieldName="stadion_ulica" Width="100px" />
                            <dx:ListBoxColumn FieldName="stadion_numer" Width="100px" />
                        </Columns>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true"></dx:GridViewCommandColumn>
            </Columns>
            <EditFormLayoutProperties>
                <Items>
                    <dx:GridViewLayoutGroup GroupBoxDecoration="None" ColumnCount="3">
                        <Items>
                            <dx:GridViewLayoutGroup GroupBoxDecoration="None">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_nazwa" Caption="Nazwa Klubu"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_strona" Caption="Strona internetowa"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_miasto" Caption="Miasto"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_ulica" Caption="Ulica"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_numer" Caption="Numer"></dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                            <dx:GridViewLayoutGroup GroupBoxDecoration="None">
                                <Items>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_punkty" Caption="Zdobyte punkty"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_telefon" Caption="Telefon"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_barwy" Caption="Barwy klubu"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_trener" Caption="Trener"></dx:GridViewColumnLayoutItem>
                                    <dx:GridViewColumnLayoutItem ColumnName="klub_stadion" Caption="Stadion"></dx:GridViewColumnLayoutItem>
                                </Items>
                            </dx:GridViewLayoutGroup>
                        </Items>
                    </dx:GridViewLayoutGroup>
                </Items>
            </EditFormLayoutProperties>

            <Templates>
                <DetailRow>
                    <dx:ASPxGridView runat="server" ID="Zawodnicy" DataSourceID="SQL_Zawodnik" AutoGenerateColumns="false" Width="480px" KeyFieldName="zawodnik_klub"
                        OnBeforePerformDataSelect="Zawodnicy_BeforePerformDataSelect">
                        <SettingsDetail  ShowDetailRow="true"/>
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
                        </Columns>
                        <Templates>
                            <DetailRow>
                                <dx:ASPxGridView runat="server" ID="ZawodnicyStat" DataSourceID="SQL_Zawodnik_st" AutoGenerateColumns="false" Width="480px" KeyFieldName="id_statystyka"
                                    OnBeforePerformDataSelect="ZawodnicyStat_BeforePerformDataSelect">
                                    <Columns>
                                        <dx:GridViewDataColumn Visible="false" FieldName="statystyka_zawodnik" Width="60px"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Mecze" FieldName="statystyka_mecz" Width="60px"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Bramki" FieldName="statystyka_bramki"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Czerwone Kartki" FieldName="statystyka_czerwone_kartki"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Żółte Kartki" FieldName="statystyka_zolte_kartki"></dx:GridViewDataColumn>
                                        <dx:GridViewDataColumn Caption="Kontuzje" FieldName="statystyka_kontuzje"></dx:GridViewDataColumn>
                                    </Columns>
                                </dx:ASPxGridView>
                            </DetailRow>
                        </Templates>
                    </dx:ASPxGridView>
                </DetailRow>
                <EditForm>
                    <div style="padding: 0 0 0 0">
                        <dx:ASPxGridViewTemplateReplacement ID="Edit_Form" ReplacementType="EditFormEditors" runat="server" />
                        <div style="float: right; padding: 0 10px 10px 0">
                            <dx:ASPxGridViewTemplateReplacement ID="UpdateButton" ReplacementType="EditFormUpdateButton"
                                runat="server" />
                            <dx:ASPxGridViewTemplateReplacement ID="CancelButton" ReplacementType="EditFormCancelButton"
                                runat="server" />
                        </div>
                    </div>
                </EditForm>
            </Templates>
        </dx:ASPxGridView>

    </div>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Kluby"
        SelectCommand="dbs_select_kluby" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_kluby" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_kluby" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Trener"
        SelectCommand="dbs_select_trenerzy" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Stadion"
        SelectCommand="dbs_select_stadiony" SelectCommandType="StoredProcedure"></asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Zawodnik"
        SelectCommand="dbs_select_zawodnik_klub" SelectCommandType="StoredProcedure">
        <SelectParameters>
            <asp:SessionParameter Name="zawodnik_klub" SessionField="zawodnik_klub" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_Zawodnik_st"
            SelectCommand="dbs_select_zawodnik_st" SelectCommandType="StoredProcedure">
            <selectparameters>
            <asp:SessionParameter Name="zawodnik" SessionField="zawodnik" Type="Int32" />
        </selectparameters>
        </asp:SqlDataSource>
</asp:Content>


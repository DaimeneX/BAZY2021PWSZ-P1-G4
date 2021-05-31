<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="HistoriaTransakcji.aspx.cs" Inherits="Finanse_Zarzadzanie" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageHead" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MasterPageBody" runat="Server">
    <div style="width: 820px;">
        <dx:ASPxGridView runat="server" ID="Stadion" DataSourceID="SQL_FH" AutoGenerateColumns="false" KeyFieldName="id_fh" Width="820px">
            <Columns>
                <dx:GridViewDataColumn FieldName="id_fh" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="fh_data" Caption="Data" Width="80px"></dx:GridViewDataColumn>
                <dx:GridViewDataComboBoxColumn FieldName="fh_rodzaj" Caption="Rodzaj" Width="60px">
                    <PropertiesComboBox>
                        <Items>
                            <dx:ListEditItem Value="0" Text="Wydatek" />
                            <dx:ListEditItem Value="1" Text="Przychód" />
                        </Items>
                    </PropertiesComboBox>
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataColumn FieldName="fh_opis" Caption="Opis" Width="180px"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="fh_ile" Caption="Kwota" Width="80px"></dx:GridViewDataColumn>
                <dx:GridViewDataColumn FieldName="fh_konto" Caption="Konto" Width="60px" Visible="false"></dx:GridViewDataColumn>
                <dx:GridViewCommandColumn ShowEditButton="true" ShowNewButtonInHeader="true" Width="20px"></dx:GridViewCommandColumn>
            </Columns>
        </dx:ASPxGridView>
    </div>

    <asp:SqlDataSource runat="server" ConnectionString="<%$ ConnectionStrings:LocalSqlServer %>" ID="SQL_FH"
        SelectCommand="dbs_select_fh" SelectCommandType="StoredProcedure"
        InsertCommand="dbs_insert_fh" InsertCommandType="StoredProcedure"
        UpdateCommand="dbs_update_fh" UpdateCommandType="StoredProcedure"></asp:SqlDataSource>
</asp:Content>


<%@ Page Language="C#" MasterPageFile="~/MasterPage/MasterPage.master" AutoEventWireup="true" CodeFile="Uzytkownicy.aspx.cs" Inherits="System_Uzytkownicy" Title="Użytkownicy" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>


<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>
<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register assembly="DevExpress.Web.v20.1, Version=20.1.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<%@ Register TagPrefix="dc" TagName="alphalinks" Src="~/System/alphalinks.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MasterPageBody" Runat="Server">

<div>    
    <!-- ******************************************************* -->    

<script type="text/javascript">
function OnShowUserAdd(s, e) {
    useradd.SetHeaderText("Dodaj użytkownika");
    useradd.Show();
}

function OnShowUserEdit(s, e) {
    useredit.SetHeaderText("Zmień dane użytkownika");
    useredit.ContentUrl="~/System/Uzytkownicy/useradd.aspx?";
    useredit.Show();
}

</script>


<dx:ASPxRoundPanel ID="ASPxRoundPanel2" runat="server" 
        HeaderText="Użytkownicy" Width="800px">
        <PanelCollection>
        <dx:PanelContent ID="PanelContent1" runat="server">
         
        <dx:ASPxButton ID="btAddUser" runat="server" Text="Nowy" AutoPostBack="False" 
            CssFilePath="~/App_Themes/Glass/{0}/styles.css" CssPostfix="Glass" Width="100px">
            <ClientSideEvents Click="OnShowUserAdd" />
        </dx:ASPxButton>

<table class="webparts">
<td class="details" valign="top">
    Filtr użytkowników:&nbsp;&nbsp;&nbsp;
    <dc:alphalinks runat="server" ID="Alphalinks" />
<br /><br />
<asp:GridView runat="server" ID="Users" AutoGenerateColumns="false"
	CssClass="list" AlternatingRowStyle-CssClass="odd" GridLines="none">
	
<Columns>
	<asp:TemplateField>
		<HeaderTemplate>Nazwa Użytkownika&nbsp;&nbsp;&nbsp;&nbsp;</HeaderTemplate>
		<ItemTemplate>
		<a href="useredit.aspx?username=<%# Eval("UserName") %>"><%# Eval("UserName") %></a>
		<ClientSideEvents Click="OnShowUserEdit" />
		</ItemTemplate>
	</asp:TemplateField>
	<asp:BoundField DataField="email" HeaderText="Email&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;" />
	<asp:BoundField DataField="isapproved" HeaderText="Aktywny&nbsp;&nbsp;&nbsp;&nbsp;" />
	<asp:BoundField DataField="isonline" HeaderText="Online&nbsp;&nbsp;&nbsp;&nbsp;" />
	<asp:BoundField DataField="islockedout" HeaderText="Zablokowany&nbsp;&nbsp;&nbsp;&nbsp;" />
	<asp:BoundField DataField="Comment" HeaderText="Notka&nbsp;&nbsp;&nbsp;&nbsp;" />
</Columns>
</asp:GridView>

</td>
<br />
</tr>
</table>
         <dx:ASPxPopupControl ID="pcUserAdd" runat="server" 
                                CloseAction="CloseButton"
                                Modal="True" 
                                ContentUrl="~/System/Uzytkownicy/useradd.aspx"
                                EnableClientSideAPI="True" 
                                EnableViewState="False" 
                                PopupHorizontalAlign="WindowCenter" 
                                PopupVerticalAlign="WindowCenter"
                                EnableHierarchyRecreation="True"
                                Width="620px" Height="350px"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                                CssPostfix="Glass" 
                                ImageFolder="~/App_Themes/Glass/{0}/"
                                ClientInstanceName="useradd" EncodeHtml="false">
                                

         <ContentStyle>
            <Paddings Padding="0px"></Paddings>
         </ContentStyle>

         </dx:ASPxPopupControl>
         
                  <dx:ASPxPopupControl ID="pcUserEdit" runat="server" 
                                CloseAction="CloseButton"
                                Modal="True" 
                                ContentUrl="~/System/Uzytkownicy/useredit.aspx?"
                                EnableClientSideAPI="True" 
                                EnableViewState="False" 
                                PopupHorizontalAlign="WindowCenter" 
                                PopupVerticalAlign="WindowCenter"
                                EnableHierarchyRecreation="True"
                                Width="620px" Height="350px"
                                CssFilePath="~/App_Themes/Glass/{0}/styles.css" 
                                CssPostfix="Glass" 
                                ImageFolder="~/App_Themes/Glass/{0}/"
                                ClientInstanceName="useredit" EncodeHtml="false">
         <ContentStyle>
            <Paddings Padding="0px"></Paddings>
         </ContentStyle>

         </dx:ASPxPopupControl>

</dx:PanelContent>
</PanelCollection>
</dx:ASPxRoundPanel>
</div>    
    <!-- ******************************************************* -->
    
   </asp:Content>

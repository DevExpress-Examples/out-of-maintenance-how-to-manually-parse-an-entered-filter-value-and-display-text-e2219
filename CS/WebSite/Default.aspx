<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.ASPxGridView.v10.1" Namespace="DevExpress.Web.ASPxGridView" TagPrefix="dx" %>
<%@ Register Assembly="DevExpress.Web.ASPxEditors.v10.1" Namespace="DevExpress.Web.ASPxEditors" TagPrefix="dx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
        <dx:ASPxGridView ID="grid" runat="server" DataSourceID="AccessDataSource1" KeyFieldName="OrderID" Width="100%" AutoGenerateColumns="False"             OnFilterControlCustomValueDisplayText="grid_FilterControlCustomValueDisplayText" OnFilterControlParseValue="grid_FilterControlParseValue">
            <Columns>
                <dx:GridViewDataTextColumn FieldName="ProductName" VisibleIndex="0" />
                <dx:GridViewDataComboBoxColumn FieldName="CategoryName" VisibleIndex="1">
                    <PropertiesComboBox DataSourceID="dsCategories" TextField="CategoryName" ValueField="CategoryName" ValueType="System.String" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataComboBoxColumn FieldName="Country" VisibleIndex="2">
                    <PropertiesComboBox DataSourceID="dsCountries" TextField="Country" ValueField="Country" ValueType="System.String" />
                </dx:GridViewDataComboBoxColumn>
                <dx:GridViewDataDateColumn FieldName="OrderDate" VisibleIndex="3" />
                <dx:GridViewDataTextColumn FieldName="UnitPrice" VisibleIndex="4">
                    <PropertiesTextEdit DisplayFormatString="c" />
                </dx:GridViewDataTextColumn>
                <dx:GridViewDataSpinEditColumn FieldName="Quantity" VisibleIndex="5">
                    <PropertiesSpinEdit NumberType="Integer" />
                </dx:GridViewDataSpinEditColumn>
            </Columns>
            <Settings ShowFilterBar="Visible" />
        </dx:ASPxGridView>
        <asp:AccessDataSource ID="AccessDataSource1" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT [OrderID], [Country], [FirstName], [LastName], [ProductName], [CategoryName], [OrderDate], [UnitPrice], [Quantity], [Discount], [Extended Price] AS Extended_Price, [Sales Person] AS Sales_Person FROM [SalesPerson]" />
        <asp:AccessDataSource ID="dsCountries" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT distinct [Country] FROM [SalesPerson]" />
        <asp:AccessDataSource ID="dsCategories" runat="server" DataFile="~/App_Data/nwind.mdb"
            SelectCommand="SELECT distinct [CategoryName] FROM [SalesPerson]" />
    </form>
</body>
</html>

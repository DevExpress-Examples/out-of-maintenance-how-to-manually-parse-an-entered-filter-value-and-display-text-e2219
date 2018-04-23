Imports Microsoft.VisualBasic
Imports System
Imports System.Data
Imports System.Configuration
Imports System.Web
Imports System.Web.Security
Imports System.Web.UI
Imports System.Web.UI.WebControls
Imports System.Web.UI.WebControls.WebParts
Imports System.Web.UI.HtmlControls
Imports DevExpress.Web.ASPxEditors

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)

	End Sub
	Protected Sub grid_FilterControlCustomValueDisplayText(ByVal sender As Object, ByVal e As FilterControlCustomValueDisplayTextEventArgs)
		If e.PropertyInfo.PropertyName = "OrderDate" Then
			If e.Value Is Nothing Then
				e.DisplayText = "&lt;enter the order date&gt;"
			End If
		End If
	End Sub
	Protected Sub grid_FilterControlParseValue(ByVal sender As Object, ByVal e As FilterControlParseValueEventArgs)
		If e.PropertyInfo.PropertyName = "Quantity" Then
			Dim value As Integer
			If Integer.TryParse(e.Text, value) Then
				If value < 0 Then
					e.Handled = True
					e.Value = 0
				End If
				If value > 25 Then
					e.Handled = True
					e.Value = 25
				End If
			End If
		End If
	End Sub
End Class

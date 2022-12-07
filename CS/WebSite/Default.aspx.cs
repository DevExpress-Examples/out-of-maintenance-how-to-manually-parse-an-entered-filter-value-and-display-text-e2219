using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DevExpress.Web;

public partial class _Default : System.Web.UI.Page {
    protected void Page_Load(object sender, EventArgs e) {

    }
    protected void grid_FilterControlCustomValueDisplayText(object sender, FilterControlCustomValueDisplayTextEventArgs e) {
        if(e.PropertyInfo.PropertyName == "OrderDate") {
            if(e.Value == null)
                e.DisplayText = "&lt;enter the order date&gt;";
        }
    }
    protected void grid_FilterControlParseValue(object sender, FilterControlParseValueEventArgs e) {
        if(e.PropertyInfo.PropertyName == "Quantity") {
            int value;
            if(int.TryParse(e.Text, out value)) {
                if(value < 0) {
                    e.Handled = true;
                    e.Value = 0;
                }
                if(value > 25) {
                    e.Handled = true;
                    e.Value = 25;
                }
            }
        }
    }
}

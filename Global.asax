<%@ Application Language="C#" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e) 
    {
    }
    
    void Application_End(object sender, EventArgs e) 
    {
    }
        
    void Application_Error(object sender, EventArgs e) 
    { 
    }

    void Session_Start(object sender, EventArgs e) 
    {
    }

    void Session_End(object sender, EventArgs e) 
    {
    }

    void Application_AcquireRequestState(object sender, EventArgs e)
    {
        try
        {
            if (Context != null && Context.Handler is System.Web.UI.Page)
            {
                string path = Request.AppRelativeCurrentExecutionFilePath ?? "";
                string pageName = System.IO.Path.GetFileName(path).ToLower();

                // Allow login.aspx and logout.aspx without authentication
                if (!pageName.Equals("login.aspx", StringComparison.OrdinalIgnoreCase) &&
                    !pageName.Equals("logout.aspx", StringComparison.OrdinalIgnoreCase))
                {
                    if (Session == null || Session["serviceno"] == null || string.IsNullOrWhiteSpace(Session["serviceno"].ToString()))
                    {
                        Response.Redirect("~/login.aspx", true);
                    }
                }
            }
        }
        catch (System.Threading.ThreadAbortException)
        {
            // Expected on Response.Redirect
        }
        catch
        {
        }
    }
       
</script>

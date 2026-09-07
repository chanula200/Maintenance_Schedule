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
        // Bypass login globally by pre-authenticating every session as Admin
        Session["serviceno"] = "012264";
        Session["username"] = "Admin";
        Session["user_profile"] = "admin";
        Session["passwd"] = "";
    }

    void Session_End(object sender, EventArgs e) 
    {
    }
       
</script>

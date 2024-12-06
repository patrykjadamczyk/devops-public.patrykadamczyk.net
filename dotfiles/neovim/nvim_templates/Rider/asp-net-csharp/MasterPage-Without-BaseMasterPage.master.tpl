;; meson
<%@ Master Language="C#" CodeBehind="{{_NAME_}}.aspx.cs" Inherits="{{_NAMESPACE_}}.{{_CLASS_}}" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <asp:ContentPlaceHolder id="{{_head_}}" runat="server">
    </asp:ContentPlaceHolder>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ContentPlaceHolder id="{{_ContentPlaceHolder1_}}" runat="server">

        </asp:ContentPlaceHolder>
    </div>
    </form>
</body>
</html>

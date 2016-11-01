<#macro loginBase title="" jsFiles=[] cssFiles=[] staticJsFiles=[] staticCssFiles=[] checkLogin=true>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <#assign non_responsive2>y</#assign>
    <#assign responsive>${Session["responsive"]!""}</#assign>
    <#if responsive == "y">
        <#assign non_responsive2>n</#assign>
    <#elseif systemSetting().openResponsive == "n">
        <#assign non_responsive2>y</#assign>
    <#else >
        <#assign non_responsive2>n</#assign>
    </#if>
    <script>
        var basepath = "${basepath}";
        var staticpath = "${staticpath}";
        var imageRootPath = "${systemSetting().imageRootPath}";
        var non_responsive2 = "${non_responsive2}";
        var systemCode = "${systemSetting().systemCode}"
        <#if currentUser()??>
            var login = true;
        var currentUser = "${currentUser().username}";
        <#else >
        var login = false;
        var currentUser = "";
            <#if checkLogin>
                top.location = "${basepath}/manage/user/logout";
            </#if>
        </#if>
    </script>
    <#if non_responsive2 != "y">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </#if>
    <meta name="description" content="${systemSetting().description}"/>
    <meta name="keywords" content="${systemSetting().keywords}"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>${(title?? && title!="")?string("${systemSetting().systemCode} - "+ title , "金鼎涛销售业务系统")}</title>
          
    <link href="${staticpath}/loginCss/stylesLogin.css" rel="stylesheet">
    <link rel="shortcut icon" type="image/x-icon" href="${systemSetting().shortcuticon}">
    <link rel="stylesheet" href="${staticpath}/bootstrap3.3.4/css/bootstrap.min.css"  type="text/css">
    <link rel="stylesheet" href="${staticpath}/jquery-ui-1.11.2/jquery-ui.css">
    
    <script type="text/javascript" src="${staticpath}/js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="${staticpath}/js/jquery.blockUI.js"></script>
    <script type="text/javascript" src="${staticpath}/bootstrap3.3.4/js/bootstrap.min.js"></script>
    <script src="${staticpath}/jquery-ui-1.11.2/jquery-ui.js"></script>

</head>
<#nested />
</html>
</#macro>

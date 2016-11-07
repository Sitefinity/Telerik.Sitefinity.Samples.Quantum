<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="SitefinityWebApp.Sitefinity.Primer._default" %>

<!DOCTYPE html>
<html>
<head>
    <title>Sitefinity Primer http://www.sitefinitysteve.com</title>
    <script src="http://code.jquery.com/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script src="http://cdn.kendostatic.com/2013.3.1324/js/kendo.all.min.js" type="text/javascript"></script>
    <link href="http://cdn.kendostatic.com/2013.3.1324/styles/kendo.common.min.css" rel="stylesheet" />
    <link href="http://cdn.kendostatic.com/2013.3.1324/styles/kendo.flat.min.css" rel="stylesheet" />
    <script src=" /Sitefinity/WebsiteTemplates/Quantum/App_Themes/Quantum/Scripts/masonry.js" type="text/javascript"></script>
    <link href="resources/primer.min.css" rel='stylesheet' type='text/css' />
</head>
<body style="visibility: hidden">
    <div id="wrapper">
        <header id="header-wrapper">
            <h1>Sitefinity Primer<span class="subheader"> - Warm Up</span></h1>
        </header>
        <div id="primer-stats">
            <div>
                Content Callbacks: <span data-bind="text: primer.activeAjax"></span>
                <br />
                Sitemap Callbacks: <span data-bind="text: primer.sitemapAjax"></span>
                <br />
                Timer Ticks: <span data-bind="text: primer.runs"></span>
            </div>
        </div>
        <a id="prime-button" data-bind="click: engage" class="prime-button big">Prime All<span class="icon"></span></a>
        <a id="timer-stop" class="prime-button big" data-bind="click: toggleTimer"><span data-bind="    text: buttonText">Stop Timer</span><span class="icon"></span></a>
        <div id="timer-details">
            <h4 class="expandable" data-bind="click: showOptions">
                <span>Timer Options</span>
                <span class="link"></span>
            </h4>
            <div id="timer-options">
                <ul>
                    <li>
                        <label>Interval:<input id="timer-ms" data-role="numerictextbox" data-bind="value: primer.timer.ms" data-format="# milliseconds" data-min="500" /></label>
                    </li>
                </ul>
                <a id="save-button" data-bind="attr: {href: getOptionsUrl}" class="prime-button save">Save</a>
                <h4>Querystring Examples:</h4>
                <ul class="example">
                    <li>http://<span data-bind="text: host"></span>/Sitefinity/Primer/?prime=all&reloadevery=60000&timerenabled=true</li>
                    <li>http://<span data-bind="text: host"></span>/Sitefinity/Primer/?prime=pages&reloadevery=20000&timerenabled=true</li>
                    <li>http://<span data-bind="text: host"></span>/Sitefinity/Primer/?prime=pages,templates,settings&reloadevery=10000ms&timerenabled=true</li>
                </ul>
            </div>
        </div>
        <div id="section-wrapper">
            <div id="sitemap" class="section-item">
                <div class="inner-wrapper">
                    <h3>Sitemap</h3>
                    <ul id="pages" data-template="page-template" data-bind="source: primer.pages">
                    </ul>
                    <a data-bind="click: primeSitemap, invisible: primer.parsingSitemap" class="prime-button">Prime</a>
                    <a data-bind="visible: primer.parsingSitemap" class="prime-button disabled" disabled="disabled">In Progress...</a>
                </div>
            </div>
            <div id="elements" data-template="group-template" data-bind="source: sections">
            </div>
        </div>
    </div>

    <footer>
        <a href="http://www.sitefinity.com" title="Telerik .NET UI Controls, Reporting, Visual Studio Tools, Agile Project Management, Automated Testing, ASP.NET Web CMS">www.sitefinity.com</a>
    </footer>

    <script id="group-template" type="text/x-kendo-template">
        <div class='section-item'>
            <div class="inner-wrapper">
                <h3 data-bind="css: status"><span data-bind="text: name"></span></h3>
                <div data-bind="attr: { class: status }">
                    <ul data-bind="source: urls" data-template="item-template">
                    </ul>
                    <a data-bind="click: engageSingle" class="prime-button">Prime</a>
                    <label class="checkbox" title="Makes this item auto-load"><input data-bind="checked: parent.parent.parent.autoLoad, click: addToInterval" type="checkbox" value="Prime" class="k-button" />Timer</label>
                </div>
            </div>
        </div>
    </script>

    <script id="page-template" type="text/x-kendo-template">
        <li data-bind="css: status">
            <span data-bind="text: url, attr: {title: name}" />
        </li>
    </script>

    <script id="item-template" type="text/x-kendo-template">
        <li data-bind="css: status">
            <span data-bind="text: name"></span>
        </li>
    </script>

    <script id="loader" type="text/javascript">
        var $primer = {
            objects: [<asp:Literal id="clientStateLiteral" runat="server" />],
            pages: <asp:Literal id="pagesStateLiteral" runat="server" />,
            timer: {
            interval: null,
            enabled: <asp:Literal id="enableTimerLiteral" runat="server" />,
                    ms: <asp:Literal id="intervalLiteral" runat="server" />
                    }
        };
    </script>
    <script src="resources/primer.min.js" type="text/javascript"></script>
</body>
</html>

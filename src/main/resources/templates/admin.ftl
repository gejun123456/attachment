<html>
<head>
<#--<#include "head_header.ftl">-->


<#include "header_admin.ftl">
    <link href="https://fonts.googleapis.com/css?family=Roboto:300i,400" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="/static/css/admin.css"/>

</head>
<body>
<div id="header">
    <div class="logo">
        admin panel
    </div>
    <span class="mypanel">
        <button><img src="/static/img/logout.png"/><span>logout</span></button>
        <button><img src="/static/img/email.png"/></button>
    </span>
</div>

<div id="sidebar">
    <ul>
        <li><a href="#"><img src="/static/img/dashboard.png"/><span>DashBoard</span></a></li>
        <li><a href="#" id="addContentLink"><img src="/static/img/add_content.png"/><span>addContent</span></a></li>
        <li><a href="#"><img src="/static/img/edit-content.png"/><span>editContent</span></a></li>
        <li><a href="#"><img src="/static/img/tag.png"/><span>tags</span></a></li>
        <li><a href="#"><img src="/static/img/rubbish-bin.png"/><span>deleted</span></a></li>
    </ul>
</div>

<div id="content">
    <div class="dashboard" style="display: none">
        <center>good to see you, bro</center>
    </div>
    <div id="addContent">
        <div id="addContentHeader">
            <span>add content to blog<span>
        </div>
        <div id="sourceContent">
            <form id="blogForm" action="/">
                <div class="form-group">
                    <label> Title</label>
                    <input type="text" id="sourceContentTitle" class="form-control" placeholder="blog tilte"
                           id="sourceContentId" name="title" required>
                </div>
                <div class="form-group">
                    <label> Blog Content</label>
                    <div>
                    <#include "markdown_btngroup.ftl">
                        <textarea class="form-control" id="sourceContentValue" placeholder="blogContent"
                                  name="value" required></textarea>
                    </div>
                </div>

                <div>
                    <button id="sourceContentButton" type="submit" class="btn btn-default">submit</button>
                </div>
            </form>
        </div>

    </div>
    <div class="form-group">
        <label>markdownText</label>
    </div>
    <div id="markdownContent">
        "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and
        I will give you a complete account of the system, and expound the actual teachings of the great explorer of
        the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself,
        because it is pleasure, but because those who do not know how to pursue pleasure rationally encounter
        consequences that are extremely painful. Nor again is there anyone who loves or pursues or desires to obtain
        pain of itself, because it is pain, but because occasionally circumstances occur in which toil and pain can
        procure him some great pleasure. To take a trivial example, which of us ever undertakes laborious physical
        exercise, except to obtain some advantage from it? But who has any right to find fault with a man who
        chooses to enjoy a pleasure that has no annoying consequences, or one who avoids a pain that produces no
        resultant pleasure?"
    </div>
<#include "markdown_modal.ftl">
</div>
</div>
</body>
<#include "footerjs.ftl">
<script src="//cdn.bootcss.com/showdown/1.5.0/showdown.min.js"></script>
<script src="//cdn.bootcss.com/autosize.js/3.0.18/autosize.min.js"></script>
<script src="/static/js/admin/markdown.js"></script>

<script type="text/javascript">
    $(document).ready(function () {
        function refresh() {
            markdownRefresh($("#sourceContentTitle").val(), $("#sourceContentValue").val(), $("#markdownContent"));
        }

        $("#blogForm").validate();


        refresh();
        $("#sourceContentTitle").keyup(function () {
            refresh()
        })

        $("#sourceContentValue").keyup(function () {
            refresh()
        })

        $("#sourceContentValue").keydown(function (e) {
            //todo may be i can create modal for my own.
            dealWithTableAndMarkDownShortCut($(this), e, $("#myModal"), $("#imageModal"));
        })

        $("#blogForm").submit(function (e) {
            $.ajax({
                type: 'POST',
                data: $("#blogForm").serialize(),
                url: '/register',
                success: function (response) {
                    if (response.code != 200) {
                        $("#register-warn").html(geti18n(response.msg));
                        $("#register-warn").show();
                    } else {
                        window.location.href = "/";
                    }
                }
            })
        })
    })
</script>
</html>
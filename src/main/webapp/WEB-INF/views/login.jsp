<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="http://code.jquery.com/jquery-1.10.0.min.js"></script>
    <script>
        $(function(){
            $("a.hidelink").each(function (index, element){
                var href = $(this).attr("href");
                $(this).attr("hiddenhref", href);
                $(this).removeAttr("href");
            });
            $("a.hidelink").click(function(){
                url = $(this).attr("hiddenhref");
                window.open(url, '_blank');
            })
        });
    </script>
    <style>
        a.hidelink {
            cursor: pointer;
            text-decoration: underline;
        }
    </style>
</head>
<body>
<a class="hidelink" href="https://discord.com/api/oauth2/authorize?response_type=code&client_id=894943429283446814&redirect_uri=http%3A%2F%2F127.0.0.1%3A8000%2Fusers%2Flogin%2Fredirect&scope=identify%20email%20connections%20guilds.members.read%20guilds">로그인</a>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>최종 후기</title>
    <style>

        body{
            margin: 0px;
            min-height: 1200px;
            background: url(<%=request.getContextPath()%>/resources/img/음식사진2.jpg);
            font-family: 'IBM Plex Sans KR', sans-serif;
        }

        #reviewdiv div{
            font-size: 3em;
            color: rgb(11, 35, 58);
            font-weight: bold;
        }

        #reviewdiv{
            background-color: bisque;
            text-align: center;
            margin: 0px auto 3px auto;
            width: 50%;
            font-size: 2em;
            display: flex;
            justify-content: center;
            border-radius: 10px;
        }

        section{
            margin: 0px auto;
            margin-bottom: 20px;
            border-radius: 10px;
            width: 90%;
        }

        section > div > div:nth-child(3){
            font-size: 1.8em;
            color : rgb(248, 248, 248);
            font-family: sans-serif;
            position:relative;
            padding-left: 60px;
        }

        section > div > div:nth-child(1){
            color : rgb(255, 255, 255);
            text-indent: 2em;
            font-size: 4em;
        }

        #s1{
            position: relative;
            animation: s1in 1.5s cubic-bezier(0.22, 0.61, 0.36, 1);
        }

        #s2{
            position: relative;
            left: 200px;
            opacity: 0;
        }

        #s3{
            position: relative;
            left: -200px;
            opacity: 0;
        }

        #s4{
            position: relative;
            left: 200px;
            opacity: 0;
        }

        @keyframes s1in {
            from{
                left: -200px;
                opacity: 0;
            }
            to{
                left: 0px;
                opacity: 1;
            }
        }

        @keyframes s1out {
            from{
                left: 0px;
                opacity: 1;
            }
            to{
                left: -200px;
                opacity: 0;
            }
        }



        @keyframes s2in {
            from{
                left: 200px;
                opacity: 0;
            }
            to{
                left: 0px;
                opacity: 1;
            }
        }

        @keyframes s2out {
            from{
                left: 0px;
                opacity: 1;
            }
            to{
                left: 200px;
                opacity: 0;
            }
        }



        @keyframes s3in {
            from{
                left: -200px;
                opacity: 0;
            }
            to{
                left: 0px;
                opacity: 1;
            }
        }

        @keyframes s3out {
            from{
                left: 0px;
                opacity: 1;
            }
            to{
                left: -200px;
                opacity: 0;
            }
        }



        @keyframes s4in {
            from{
                left: 200px;
                opacity: 0;
            }
            to{
                left: 0px;
                opacity: 1;
            }
        }

        @keyframes s4out {
            from{
                left: 0px;
                opacity: 1;
            }
            to{
                left: 200px;
                opacity: 0;
            }
        }

        #QNAdiv{
            background-color: wheat;
            width: 100%;
            height: 100vh;
            text-align: center;
            font-size: 165px;
            position: relative;
            left: -200px;
            opacity: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        @keyframes s5in {
            from{
                left: 200px;
                opacity: 0;
            }
            to{
                left: 0px;
                opacity: 1;
            }
        }

        @keyframes s5out {
            from{
                left: 0px;
                opacity: 1;
            }
            to{
                left: 200px;
                opacity: 0;
            }
        }

    </style>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans+KR&display=swap" rel="stylesheet">
</head>
<body onselectstart="return false;">
    <div id="reviewdiv">
        <div>최종 후기</div>
    </div>

    <section id="s1" style="height: 300px; background-color: rgb(110, 32, 32);">
        <div id="s1div">
            <div>황윤제</div>
            <br>
            <div>숙제 하나 끝난 느낌입니다.<br>어떤 방향으로 공부를 해야할지 감이 잡히는 시간이였습니다.</div>
        </div>
    </section>

    <section id="s2" style="height: 350px; background-color: rgb(28, 90, 64);">
        <div id="s2div">
            <div>박성훈</div>
            <br>
            <div>
                팀프로젝트를 하면서 작은부분 하나 하나가 합쳐져<br>웹 홈페이지가 만들어지는 것을 알게되었다.<br>
                길지도 짧지도 않은 기간동안 html, java, javascript, spring을<br>배워 많은 것을 경험을 하였다.
                부족한 부분을 많이 느껴<br>더 많은 것을 공부해야 하는 것을 느꼈습니다.
            </div>
        </div>
    </section>

    <section id="s3" style="height: 450px; background-color: rgb(45, 28, 121);">
        <div id="s3div">
            <div>신동환</div>
            <br>
            <div style="font-size: 1.5em;">
                jsp와 js를 나눔으로써 서버 동작 순서가<br>
                JAVA → JSTL → HTML → Javascript 인것을 뼈저리게 느꼈고,<br>비동기 처리 후 출력 시, 애를 많이 먹었다.<br>
                하지만 백엔드의 원하는 데이터를 js에서 사용하고 싶을 때,<br>나름의 여러 방법을 시도해서 해결을 했던 좋은 경험이었다.<br>
                또한, 스프링 프레임워크로 프로젝트를 진행하면서<br>백엔드와 프론트엔드간의 데이터를 주고 받는 방법이나,<br>
                학원에서 배웠지만 시도해 볼 기회가 없었던<br>여러 기능들을 사용해 볼 수 있는 값진 경험이 됐다.
            </div>
        </div>
    </section>

    <section id="s4" style="height: 300px; background-color: rgb(86, 150, 27);">
        <div id="s4div">
            <div>최용규</div>
            <br>
            <div>
                스프링으로 처음 해보는 프로젝트라 어려웠지만 재밌었고,<br>팀원들이 열심히 하는 모습을 보며
                자극을 받아 <br>더 열심히 하게 된것 같다.<br>그래도 뭔가 해낸것 같은 느낌이 들어 뿌듯합니다.
            </div>
        </div>
    </section>

    <div id="QNAdiv" style="background-color: wheat; text-align: center; font-size: 60px;">
        <h1>QNA</h1>
    </div>

    <script>

        var s1 = document.getElementById("s1");
        var s2 = document.getElementById("s2");
        var s3 = document.getElementById("s3");
        var s4 = document.getElementById("s4");
        var s5 = document.getElementById("QNAdiv");

        window.addEventListener("scroll", function(){
            var value = window.scrollY;
            if(value == 0){
                s1.style.animation = "s1in 1.5s ease-out";
                s2.style.animation = "s2out 1.5s ease-out forwards";
                s3.style.animation = "s3out 1.5s ease-out forwards";
                s3.style.animation = "s4out 1.5s ease-out forwards";
            }
            if(value > 200){
                s1.style.animation = "s1out 1.5s ease-out forwards";
                s2.style.animation = "s2in 1.5s ease-out forwards";
            }else{
                s1.style.animation = "s1in 1.5s ease-out";
            }
            if(value > 450){
                s2.style.animation = "s2out 1.5s ease-out forwards";
            }

            if(value > 500){
                s3.style.animation = "s3in 1.5s ease-out forwards";
            }

            if(value > 750){
                s4.style.animation = "s4in 1.5s ease-out forwards";
                s3.style.animation = "s3out 1.5s ease-out forwards";
            }

            if(value > 1200){
                s4.style.animation = "s4out 1.5s ease-out forwards";
                s5.style.animation = "s5in 1.5s ease-out forwards";
            }else{
            	s5.style.animation = "s5out 1.5s ease-out forwards";
            }

        });

    </script>
</body>
</html>
<%--<%@ taglib prefix="c" uri="http://jakarta.ee/jstl/core" %>--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа № 1 по дисциплине "Веб-программирование". СППО ИТМО</title>
    <link rel="stylesheet" href="css/styles.css">
</head>
<body>
<header id="header-container">
    <h1 class="header-title">Лабораторная работа <span class="pink-header">№ 2</span></h1>
    <h1>Дисциплина: <span  class="pink-header">Веб-программирование</span></h1>
    <h2 class="author-info">ФИО: <span  class="pink-header">Пронкин Алексей Дмитриевич</span>, Группа: <span  class="pink-header">P3208</span>, Вариант: <span  class="pink-header">312313</span></h2>
</header>

<!-- Вывод Сообщения об Ошибке -->
<c:if test="${not empty error}">
    <div class="error-message">
            ${error}
    </div>
</c:if>

<!-- Input Form and Graph -->
<table id="main-content" >
    <tr>
        <!-- Input form -->
        <td>
            <form method="post" action="${pageContext.request.contextPath}/controller" id="data-form">
                <label for="x">Enter X:</label>
                <input type="text" placeholder="enter a number from -3 to 3" id="x" name="x" required>

                <section id="errorX" hidden></section>
                <p></p>

                <label for="y">Enter Y:</label>
                <input type="text" placeholder="enter a number from -5 to 3" id="y" name="y" required>

                <section id="errorY" hidden></section>

                <p></p>

                <label for="r">Select R:</label>
                <select id="r" name="r" required>
                    <option value="1">1</option>
                    <option value="1.5">1.5</option>
                    <option value="2">2</option>
                    <option value="2.5">2.5</option>
                    <option value="3">3</option>
                </select>

                <p></p>

                <button type="submit" class="styled-button">Submit</button>
            </form>
        </td>

        <!-- Right column with graph -->
        <td>
<!--            <canvas id="graph" width="400" height="400"></canvas>-->
            <svg xmlns="http://www.w3.org/2000/svg" id="svg" width="300" height="300">
                <!-- triangle-->
                <polygon id="triangle" points="150,150 210,150 150,90" fill="#122028" fill-opacity="0.6"></polygon>

                <!-- square-->
                <rect id="square" x="150" y="150" width="120" height="120" fill="#122028" fill-opacity="0.6"></rect>
                <!-- circle-->
                <path id="quarterCircle" d="M 150 150 L 30 150 C 30 80 80 30 150 30 Z" fill="#122028" fill-opacity="0.6"></path>

                <!--X line-->
                <line x1="0" y1="150" x2="300" y2="150" stroke="#122028"></line>
                <!--Y line-->
                <line x1="150" y1="0" x2="150" y2="300" stroke="#122028"></line>

                <line x1="110" y1="148" x2="110" y2="152" stroke="#122028"></line> <!-- -1 point on x -->
                <line x1="190" y1="148" x2="190" y2="152" stroke="#122028"></line> <!-- 1 point on x -->
                <text x="105" y="140">-1</text> <!-- '-1' on x -->
                <text x="185" y="140">1</text> <!-- '1' on x -->

                <line x1="70" y1="148" x2="70" y2="152" stroke="#122028"></line> <!-- -2 point on x -->
                <line x1="230" y1="148" x2="230" y2="152" stroke="#122028"></line> <!-- 2 point on x -->
                <text x="65" y="140">-2</text> <!-- '-2' on x -->
                <text x="225" y="140">2</text> <!-- '2' on x -->

                <line x1="30" y1="148" x2="30" y2="152" stroke="#122028"></line> <!-- -3 point on x -->
                <line x1="270" y1="148" x2="270" y2="152" stroke="#122028"></line> <!-- 3 point on x -->
                <text x="25" y="140">-3</text> <!-- '-3' on x -->
                <text x="265" y="140">3</text> <!-- '3' on x -->


                <line x1="148" y1="110" x2="152" y2="110" stroke="#122028"></line> <!-- 1 on y -->
                <line x1="148" y1="190" x2="152" y2="190" stroke="#122028"></line> <!-- -1 on y -->
                <text x="156" y="115">1</text> <!-- 1 on y -->
                <text x="156" y="195">-1</text> <!-- -1 on y -->

                <line x1="148" y1="70" x2="152" y2="70" stroke="#122028"></line> <!-- 2 on y -->
                <line x1="148" y1="230" x2="152" y2="230" stroke="#122028"></line> <!-- -2 on y -->
                <text x="156" y="75">2</text> <!-- 2 on y -->
                <text x="156" y="235">-2</text> <!-- -2 on y -->

                <line x1="148" y1="30" x2="152" y2="30" stroke="#122028"></line> <!-- 3 on y -->
                <line x1="148" y1="270" x2="152" y2="270" stroke="#122028"></line> <!-- -3 on y -->
                <text x="156" y="35">3</text> <!-- 3 on y -->
                <text x="156" y="275">-3</text> <!-- -3 on y -->

                <polygon points="300,150 295,155 295, 145" fill="#000720" stroke="#000720"></polygon>
                <polygon points="150,0 145,5 155,5" fill="#000720" stroke="#000720"></polygon>


                <!-- Point-->
                <circle id="pointer" r="5" cx="150" cy="150" fill-opacity="0.9" fill="red" stroke="firebrick"
                        visibility="hidden"></circle>
            </svg>
        </td>
    </tr>
</table>

<!-- Result Table -->
<table class="result-table" id="result-table">
    <!--    <table id="result-table">-->
    <thead>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Попадание</th>
        <th>Время запроса</th>
        <th>Время работы скрипта (в с)</th>
    </tr>
    </thead>
    <tbody id="result">
    <!-- Previous shots will be saved here -->
    </tbody>
</table>

<footer>
    <section id="footer-content">
        <p>© 2024 Web Lab 1 by ren1kron. All rights and privileges are reserved for the inner circle of the President.</p>
        <p>'cause we are in Russia</p>
    </section>
</footer>

<script type="text/javascript" src="js/fetch.js"></script>
</body>
</html>

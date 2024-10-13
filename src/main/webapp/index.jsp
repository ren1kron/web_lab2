<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа № 2 по дисциплине "Веб-программирование". СППО ИТМО</title>
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
<%--                <label for="x">Enter X:</label>--%>
<%--                <input type="text" placeholder="enter a number from -3 to 3" id="x" name="x" required>--%>

                <label for="xs">Select X:</label>
                <fieldset id="xs">
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="-2">-2</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="-1.5">-1.5</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="-1">-1</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="-0.5">-0.5</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="0">0</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="0.5">0.5</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="1">1</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="1.5">1.5</label>
                    <label><input type="checkbox" name="x" onclick="checkX(this)" value="2">2</label>
                                        <label><input type="checkbox" name="x" id="custom-x" disabled hidden></label>
                </fieldset>

                <section id="errorX" hidden></section>
                <p></p>

                <label for="y">Enter Y:</label>
                <input type="text" placeholder="enter a number from -5 to 5" id="y" name="y" required maxlength="6">

                <section id="errorY" hidden></section>

                <p></p>

                <label for="rs">Select R:</label>
<%--                <select id="r" name="r" required>--%>
<%--                    <option value="1">1</option>--%>
<%--                    <option value="1.5">1.5</option>--%>
<%--                    <option value="2">2</option>--%>
<%--                    <option value="2.5">2.5</option>--%>
<%--                    <option value="3">3</option>--%>
<%--                </select>--%>

                <fieldset id="rs">
                    <label><input type="checkbox" name="r" onclick="checkR(this)" value="1">1</label>
                    <label><input type="checkbox" name="r" onclick="checkR(this)" value="1.5">1.5</label>
                    <label><input type="checkbox" name="r" onclick="checkR(this)" value="2">2</label>
                    <label><input type="checkbox" name="r" onclick="checkR(this)" value="2.5">2.5</label>
                    <label><input type="checkbox" name="r" onclick="checkR(this)" value="3">3</label>
                </fieldset>

                <p></p>

                <button type="submit" class="styled-button">Submit</button>
            </form>
        </td>

        <!-- Right column with graph -->
        <td>
            <svg xmlns="http://www.w3.org/2000/svg" id="svg" width="500" height="500">
                <!-- triangle-->
<%--                <polygon id="triangle" points="150,150 210,150 150,90" fill="#122028" fill-opacity="0.6"></polygon>--%>
                <polygon id="triangle"
                         points="
                            250,250
                            250,370
                            190,250
                        "
                         fill="#122028" fill-opacity="0.6"></polygon>
                <!-- square-->
                <rect id="rectangle"
                      x="250"
                      y="130"
                      width="60"
                      height="120"
                      fill="#122028" fill-opacity="0.6"></rect>
                <!-- circle-->
                <path id="quarterCircle"
                      d="
                        M 250 250
                        L 190 250
                        A 60 60 0 0 1 250 190
                        Z "
                          fill="#122028" fill-opacity="0.6"></path>

                <!--X line-->
                <line x1="0" y1="250" x2="500" y2="250" stroke="#122028"></line>
                <!--Y line-->
                <line x1="250" y1="0" x2="250" y2="500" stroke="#122028"></line>

                <line x1="210" y1="248" x2="210" y2="252" stroke="#122028"></line> <!-- -1 point on x -->
                <line x1="290" y1="248" x2="290" y2="252" stroke="#122028"></line> <!-- 1 point on x -->
                <text x="205" y="240">-1</text> <!-- '-1' on x -->
                <text x="285" y="240">1</text> <!-- '1' on x -->

                <line x1="170" y1="248" x2="170" y2="252" stroke="#122028"></line> <!-- -2 point on x -->
                <line x1="330" y1="248" x2="330" y2="252" stroke="#122028"></line> <!-- 2 point on x -->
                <text x="165" y="240">-2</text> <!-- '-2' on x -->
                <text x="325" y="240">2</text> <!-- '2' on x -->

                <line x1="130" y1="248" x2="130" y2="252" stroke="#122028"></line> <!-- -3 point on x -->
                <line x1="370" y1="248" x2="370" y2="252" stroke="#122028"></line> <!-- 3 point on x -->
                <text x="125" y="240">-3</text> <!-- '-3' on x -->
                <text x="365" y="240">3</text> <!-- '3' on x -->

                <line x1="90" y1="248" x2="90" y2="252" stroke="#122028"></line> <!-- -4 point on x -->
                <line x1="410" y1="248" x2="410" y2="252" stroke="#122028"></line> <!-- 4 point on x -->
                <text x="85" y="240">-4</text> <!-- '-4' on x -->
                <text x="405" y="240">4</text> <!-- '4' on x -->

                <line x1="50" y1="248" x2="50" y2="252" stroke="#122028"></line> <!-- -5 point on x -->
                <line x1="450" y1="248" x2="450" y2="252" stroke="#122028"></line> <!-- 5 point on x -->
                <text x="45" y="240">-5</text> <!-- '-5' on x -->
                <text x="445" y="240">5</text> <!-- '5' on x -->


                <line x1="248" y1="210" x2="252" y2="210" stroke="#122028"></line> <!-- 1 on y -->
                <line x1="248" y1="290" x2="252" y2="290" stroke="#122028"></line> <!-- -1 on y -->
                <text x="256" y="215">1</text> <!-- 1 on y -->
                <text x="256" y="295">-1</text> <!-- -1 on y -->

                <line x1="248" y1="170" x2="252" y2="170" stroke="#122028"></line> <!-- 2 on y -->
                <line x1="248" y1="330" x2="252" y2="330" stroke="#122028"></line> <!-- -2 on y -->
                <text x="256" y="175">2</text> <!-- 2 on y -->
                <text x="256" y="335">-2</text> <!-- -2 on y -->

                <line x1="248" y1="130" x2="252" y2="130" stroke="#122028"></line> <!-- 3 on y -->
                <line x1="248" y1="370" x2="252" y2="370" stroke="#122028"></line> <!-- -3 on y -->
                <text x="256" y="135">3</text> <!-- 3 on y -->
                <text x="256" y="375">-3</text> <!-- -3 on y -->

                <line x1="248" y1="90" x2="252" y2="90" stroke="#122028"></line> <!-- 4 on y -->
                <line x1="248" y1="410" x2="252" y2="410" stroke="#122028"></line> <!-- -4 on y -->
                <text x="256" y="95">4</text> <!-- 4 on y -->
                <text x="256" y="415">-4</text> <!-- -4 on y -->

                <line x1="248" y1="50" x2="252" y2="50" stroke="#122028"></line> <!-- 5 on y -->
                <line x1="248" y1="450" x2="252" y2="450" stroke="#122028"></line> <!-- -5 on y -->
                <text x="256" y="55">5</text> <!-- 3 on y -->
                <text x="256" y="455">-5</text> <!-- -3 on y -->
                <!-- arrows -->
                <polygon points="250,0 255,5 245, 5" fill="#000720" stroke="#000720"></polygon>
                <polygon points="500, 250 495,245 495,255" fill="#000720" stroke="#000720"></polygon>


                <!-- Point-->
<%--                <circle id="pointer" r="2.5" cx="150" cy="150" fill-opacity="0.9" fill="red" stroke="firebrick"--%>
                <circle id="pointer" r="2.5" cx="250" cy="250" fill-opacity="0.9" fill="blue" stroke="darkblue"
<%--                        visibility="hidden"--%>
                ></circle>
                <c:forEach var="result" items="${sessionScope.results}">
                    <circle r="3.5"
                            cx="${250 + result.x * 40}"
                            cy="${250 - result.y * 40}"
                            fill="${result.hit ? "#11FF00FF" : "red"}"
                                    fill-opacity="0.9"  stroke="${result.hit ? "green" : "firebrick"}">
                    </circle>
                </c:forEach>
            </svg>
<%--            const x = (xClick - centerX) / scale;
    const y = (centerY - yClick) / scale;--%>
        </td>
    </tr>
</table>

<%--<!-- Result Table -->--%>
<%--<table class="result-table" id="result-table">--%>
<%--    <!--    <table id="result-table">-->--%>
<%--    <thead>--%>
<%--    <tr>--%>
<%--        <th>X</th>--%>
<%--        <th>Y</th>--%>
<%--        <th>R</th>--%>
<%--        <th>Попадание</th>--%>
<%--        <th>Время запроса</th>--%>
<%--        <th>Время работы скрипта (в с)</th>--%>
<%--    </tr>--%>
<%--    </thead>--%>
<%--    <tbody id="result">--%>
<%--    <!-- Previous shots will be saved here -->--%>
<%--    </tbody>--%>
<%--</table>--%>
<!-- Result Table -->
<table class="result-table" id="result-table">
    <thead>
    <tr>
        <th>X</th>
        <th>Y</th>
        <th>R</th>
        <th>Попадание</th>
        <th>Время запроса</th>
    </tr>
    </thead>
    <tbody id="result">
    <c:forEach var="result" items="${sessionScope.results}">
        <tr>
            <td>${result.x}</td>
            <td>${result.y}</td>
            <td>${result.r}</td>

            <c:choose>
                <c:when test="${result.hit}">
                    <td>
                        Попал
                    </td>
                    </c:when>
                    <c:otherwise>
                    <td class="miss">
                        Промазал
                    </td>
                    </c:otherwise>
            </c:choose>

            <td>${result.reqNanoTime}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>


<footer>
    <section id="footer-content">
        <p>© 2024 Web Lab 2 by ren1kron. All rights and privileges are reserved for the inner circle of the President.</p>
        <p>'cause we are in Russia</p>
    </section>
</footer>

<script type="text/javascript" src="js/fetch.js"></script>
</body>
</html>

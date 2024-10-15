<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лабораторная работа № 2 по дисциплине "Веб-программирование". СППО ИТМО</title>
    <link rel="stylesheet" href="css/styles.css">
    <link rel="stylesheet" href="css/result-styles.css">
</head>
<body>
    <div id="animation-container">
        <img src="fada.png" id="bouncing-image" alt="Bouncing Image">
    </div>
    <div id="content">
        <c:if test="${not empty currentResult}">
            <c:choose>
            <c:when test="${currentResult.hit == true}">
                <div class="hit">
                    <h3>Попадание</h3>
                </div>
            </c:when>
            <c:otherwise>
                <div class="miss">
                    <h3>Промах</h3>
                </div>
            </c:otherwise>
            </c:choose>
            <div>
                <table class="result-table" id="result-table">
                    <thead>
                    <tr>
                        <th>X</th>
                        <th>Y</th>
                        <th>R</th>
        <%--                <th>Попадание</th>--%>
<%--                        <th>Время запроса</th>--%>
                    </tr>
                    </thead>
                    <tbody id="result">
                        <tr>
                            <td>${currentResult.x}</td>
                            <td>${currentResult.y}</td>
                            <td>${currentResult.r}</td>
        <%--                    <td>--%>
        <%--                        <c:choose>--%>
        <%--                            <c:when test="${currentResult.hit}">--%>
        <%--                                Попал--%>
        <%--                            </c:when>--%>
        <%--                            <c:otherwise>--%>
        <%--                                Промазал--%>
        <%--                            </c:otherwise>--%>
        <%--                        </c:choose>--%>
        <%--                    </td>--%>
<%--                            <td>${currentResult.reqNanoTime}</td>--%>
                        </tr>
                    </tbody>
                </table>
            </div>
        </c:if>

        <!-- Вывод Сообщения об Ошибке -->
        <c:if test="${not empty error}">
            <div class="error-message">
                <p>${error}</p>
            </div>
        </c:if>
        <div id="back-to-main">
            <button type="button" onclick="window.location.href='index.jsp'">Back to form</button>
        </div>
    </div>
<script type="text/javascript" src="js/bouncing-img.js"></script>
</body>
</html>

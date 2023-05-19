<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/resources/css/mainpage.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <%--    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>--%>
    <title>Hide on 404</title>
</head>

<body>
<div id="container">

    <%@ include file="header.jsp" %>
    <div id="slideShow">
        <div id="slides">
            <img src="/resources/images/1.png" alt style="display: block; width: 1200px; height:300px">
            <img src="/resources/images/2.png" alt style="display: none; width: 1200px; height:300px">
            <button id="prev">&lang;</button>
            <button id="next">&rang;</button>
        </div>
    </div>

    <script src="/resources/js/main1.js"></script>

    <div class="board_wrap">

        <div class="board_title">
            <strong>404 커뮤니티</strong>
        </div>

        <div class="button1">
            <button style="font-size: 20px;">+</button>
        </div>

        <div class="board_write_wrap hide">
            <form action="main/create" method="post">
                <div class="board_write">
                    <div class="title">
                        <dl>
                            <dt>제목</dt>
                            <dd><input type="text" name="title" placeholder="제목 입력"></dd>
                        </dl>
                    </div>
                    <div class="cont">
                        <textarea name="content" placeholder="내용 입력"></textarea>
                    </div>
                </div>
                <div class="bt_wrap">
                    <input type="hidden" name="sort" value="1">
                    <INPUT TYPE="submit" VALUE="등록">

                </div>
            </form>
        </div>

        <div class="board_list_wrap">
            <div class="board_list">
                <div>
                    <c:forEach var="board" items="${list}" varStatus="status">
                        <div class="post" data-toggle="modal" data-target="#modal-${status.count}">
                            <div class="num"><c:out value="${status.count}"/></div>
                            <div class="title">${board.title}</div>
                            <div class="date">${board.created_at}</div>
                            <div class="count">${board.view_count}</div>
                        </div>

                        <div class="modal fade align-content-center" tabindex="-1" role="dialog"
                             id="modal-${status.count}">
                            <div class="modal-dialog">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h4>${board.title}</h4>
                                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                            <span aria-hidden="true">&times;</span>
                                        </button>
                                    </div>
                                    <div class="modal-body">
                                        <p>${board.content}</p>
                                    </div>
                                    <div class="modal-footer">
                                            <%--                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>--%>
                                        <form action='<c:url value='/main/update/${board.num}'/>' method="post"
                                              class='on'>
                                            <button type="button" class="btn btn-secondary">수정</button>
                                        </form>
                                        <form action='<c:url value='/main/delete/${board.num}'/>' method="post"
                                              class='on'>
                                            <button type="submit" class="btn btn-secondary">삭제</button>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </c:forEach>
                    <script>
                        const modals = document.querySelectorAll('.modal');
                        const posts = document.querySelectorAll('.post');

                        posts.forEach((post, index) => {
                            post.addEventListener('click', () => {
                                modals[index].style.display = 'block';
                            });
                        });

                        modals.forEach(modal => {
                            modal.addEventListener('click', event => {
                                if (event.target === modal) {
                                    modal.style.display = 'none';
                                }
                            });
                        });

                    </script>

                </div>
            </div>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
</div>
</body>

</html>
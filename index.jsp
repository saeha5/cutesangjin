<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>

<%@ page import="java.io.PrintWriter"%>

<%@ page import="java.util.ArrayList"%>

<%@ page import="java.net.URLEncoder"%>

<!doctype html>

<html lang="ko">

<head>

<title>모집 등록 페이지</title>

<meta charset="utf-8">

<meta name="viewport"
  content="width=device-width, initial-scale=1, shrink-to-fit=no">




<link rel="stylesheet"
  href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
  integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
  crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
  
  <link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
<!--   <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script> -->
  <script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
  <script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
  
  
<link rel="icon"
  href='data:image/svg+xml,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 100 100"><text y=".9em" font-size="90">👀</text></svg>'>

</head>

<body>

  <%
  request.setCharacterEncoding("UTF-8");

  String lectureDivide = "전체";

  String searchType = "최신순";

  String search = "";

  int pageNumber = 0;

  %>

  <nav class="navbar navbar-expand-lg navbar-light bg-light">

    <a class="navbar-brand" href="index.jsp">모집 등록 페이지</a>

    <button class="navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbar">

      <span class="navbar-toggler-icon"></span>

    </button>

    <div class="collapse navbar-collapse" id="navbar">

      <ul class="navbar-nav mr-auto">

        <li class="nav-item active"><a class="nav-link"
          href="index.jsp">메인</a></li>

        <li class="nav-item dropdown"><a
          class="nav-link dropdown-toggle" id="dropdown"
          data-toggle="dropdown"> 회원 관리 </a>

          <div class="dropdown-menu" aria-labelledby="dropdown">

          </div></li>

      </ul>

      <form action="./index.jsp" method="get"
        class="form-inline my-2 my-lg-0">

        <input type="text" name="search" class="form-control mr-sm-2"
          placeholder="내용을 입력하세요.">

        <button class="btn btn-outline-success my-2 my-sm-0" type="submit">검색</button>

      </form>

    </div>

  </nav>

  <div class="container">

    <form method="get" action="./index.jsp" class="form-inline mt-3">

      <select name="lectureDivide" class="form-control mx-1 mt-2">

        <option value="전체">전체</option>

      </select> <select name="searchType" class="form-control mx-1 mt-2">

        <option value="최신순">최신순</option>

      </select> <input type="text" name="search" class="form-control mx-1 mt-2"
        value="<%=search%>" placeholder="내용을 입력하세요.">

      <button type="submit" class="btn btn-primary mx-1 mt-2">검색</button>

      <a class="btn btn-primary mx-1 mt-2" data-toggle="modal"
        href="#registerModal">등록하기</a> <a class="btn btn-danger ml-1 mt-2"
        data-toggle="modal" href="#reportModal">신고</a>

    </form>




    <div class="card bg-light mt-3">

      <div class="card-header bg-light">

        <div class="row">

          <div class="col-8 text-left"><%=search%>&nbsp;<small><%=search%></small>
          </div>

          <div class="col-4 text-right">

            종합 <span style="color: red;"><%=search%></span>

          </div>

        </div>

      </div>

      <div class="card-body">

        <h5 class="card-title">

          <%=search%>&nbsp;<small>(<%=search%>년
            <%=search%>)
          </small>

        </h5>

        <p class="card-text"><%=search%></p>

        <div class="row">

          <div class="col-9 text-left">

            성적 <span style="color: red;"><%=search%></span>

            널널 <span style="color: red;"><%=search%></span>

            강의 <span style="color: red;"><%=search%></span>

            <span style="color: green;">(추천: <%=search%>)
            </span>

          </div>

          <div class="col-3 text-right">

            <a onclick="return confirm('추천하시겠습니까?')"
              href="./likeAction.jsp?evaluationID=<%=search%>">추천</a>

            <a onclick="return confirm('삭제하시겠습니까?')"
              href="./deleteAction.jsp?evaluationID=<%=search%>">삭제</a>

          </div>

        </div>

      </div>

    </div>



  </div>

  <ul class="pagination justify-content-center mt-3">

    <li class="page-item">


    </li>

    <li class="page-item">


    </li>

  </ul>

  <div class="modal fade" id="registerModal" tabindex="-1" role="dialog"
    aria-labelledby="modal" aria-hidden="true">

    <div class="modal-dialog">

      <div class="modal-content">

        <div class="modal-header">

          <h5 class="modal-title" id="modal">모집 등록</h5>

          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">

            <span aria-hidden="true">&times;</span>

          </button>

        </div>

        <div class="modal-body">

          <form action="./evaluationRegisterAction.jsp" method="post" autocomplete="off">

            <div class="form-group">

              <label>모집 제목</label> <input type="text" name="evaluationTitle"
                class="form-control" maxlength="20">

            </div>
            

              <div class="form-group">
              
                <!-- !!!!!!!!1<label>모집 기한</label> <input type="date"> -->
                
                


            <label>모집 기한</label> <input class="form-control text-center" type="text" name="daterange" value="0000-00-00 - 0000-00-00" readonly />





              

            </div>

            <div class="form-group">

              <label>내용</label>

              <textarea type="text" name="evaluationContent"
                class="form-control" maxlength="2048" style="height: 180px;"></textarea>

            </div>


            <div class="modal-footer">

              <button type="button" class="btn btn-secondary"
                data-dismiss="modal">취소</button>

              <button type="submit" class="btn btn-primary">등록하기</button>

            </div>

          </form>

        </div>

      </div>

    </div>

  </div>

  <div class="modal fade" id="reportModal" tabindex="-1" role="dialog"
    aria-labelledby="modal" aria-hidden="true">

    <div class="modal-dialog">

      <div class="modal-content">

        <div class="modal-header">

          <h5 class="modal-title" id="modal">신고하기</h5>

          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">

            <span aria-hidden="true">&times;</span>

          </button>

        </div>

        <div class="modal-body">

          <form method="post" action="./reportAction.jsp">

            <div class="form-group">

              <label>신고 제목</label> <input type="text" name="reportTitle"
                class="form-control" maxlength="20">

            </div>

            <div class="form-group">

              <label>신고 내용</label>

              <textarea type="text" name="reportContent" class="form-control"
                maxlength="2048" style="height: 180px;"></textarea>

            </div>

            <div class="modal-footer">

              <button type="button" class="btn btn-secondary"
                data-dismiss="modal">취소</button>

              <button type="submit" class="btn btn-danger">신고하기</button>

            </div>

          </form>

        </div>

      </div>

    </div>

  </div>

  <footer class="bg-dark mt-4 p-5 text-center" style="color: #FFFFFF;">

    Copyright ⓒ 2018 나동빈 All Rights Reserved. </footer>




  <script>


$(document).ready(function () {
  $(function () {
    $('input[name="daterange"]').daterangepicker({
      "startDate": new Date(),
      "endDate": new Date(),
      opens: 'center',
      locale: {
        format: "YYYY년 M월 D일",
        "separator": " ~ ",
        "applyLabel": "적용",
        "cancelLabel": "취소",
        "fromLabel": "시작일",
        "toLabel": "종료일",
        "customRangeLabel": "직접선택",
        "daysOfWeek": [
            "일",
            "월",
            "화",
            "수",
            "목",
            "금",
            "토"
        ],
        "monthNames": [
            "1월",
            "2월",
            "3월",
            "4월",
            "5월",
            "6월",
            "7월",
            "8월",
            "9월",
            "10월",
            "11월",
            "12월"
        ],
      }
    });
  });
});



  </script>



</body>

</html>
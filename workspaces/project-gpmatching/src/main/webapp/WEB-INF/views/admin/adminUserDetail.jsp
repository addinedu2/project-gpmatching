<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>adminUserDetail</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap/dist/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
    <div class="container">
        <div class="row">
            <div class="col-md-6">
                <table class="table table-bordered border-primary">
                    <thead>
                        <tr>
                            <th scope="col">#</th>
                            <th scope="col">Details</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <th scope="row">1</th>
                            <td>
                                <form action="<c:url value='/user/${user.userNo}' />" method="post">
                                    <input type="hidden" name="_method" value="put">
                                     <div class="form-group">
                                        <label for="userNo">UserNo:</label>
                                        <input type="text" class="form-control" id="userNo" name="userNo" readonly>
                                    </div>
                                        <div class="form-group">
                                        <label for="userImage">Image URL:</label>
                                        <input type="text" class="form-control" id="userImage" name="userImage">
                                    </div>
                                    <div class="form-group">
                                        <label for="userId">User ID:</label>
                                        <input type="text" class="form-control" id="userId" name="userId">
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail">Email:</label>
                                        <input type="email" class="form-control" id="userEmail" name="userEmail">
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname">Nickname:</label>
                                        <input type="text" class="form-control" id="nickname" name="nickname">
                                    </div>
                                    <div class="form-group">
                                        <label for="userPhone">Phone:</label>
                                        <input type="tel" class="form-control" id="userPhone" name="userPhone">
                                    </div>
                                     <div class="form-group">
                                        <label for="regDate">UserNo:</label>
                                        <input type="date" class="form-control" id="regDate" name="regDate" readonly>
                                    </div>
                                
                                    <div class="form-group">
                                        <label for="userGrade">Grade:</label>
                                        <select class="form-control" id="userGrade" name="userGrade">
                                            <option value="normaluser">Normal User</option>
                                            <option value="VIP">VIP</option>
                                            <option value="admin">Admin</option>
                                            <option value="BanUser">Ban User</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="deletedUser">Deleted User:</label>
                                        <select class="form-control" id="deletedUser" name="deletedUser">
                                            <option value="false">유지</option>
                                            <option value="true">삭제</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">수정</button>
                                </form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            $.ajax({
                url: '<c:url value="/user/${user.userNo}" />',
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    $('#userId').val(data.userId);
                    $('#userEmail').val(data.userEmail);
                    $('#nickname').val(data.nickname);
                    $('#userPhone').val(data.userPhone);
                    $('#userImage').val(data.userImage);
                    $('#userGrade').val(data.userGrade);
                    $('#deletedUser').val(data.deletedUser.toString());

                    if (data.userGrade === 'BanUser') {
                        $('#banInfo').text('금지 기간: ' + data.banEndDate);
                    } else {
                        $('#banInfo').hide();
                    }
                },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
    </script>
</body>
</html>
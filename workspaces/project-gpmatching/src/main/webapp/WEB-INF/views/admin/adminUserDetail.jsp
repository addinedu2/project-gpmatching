<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
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
                                <form:form modelAttribute="user" action="/project-gpmatching/admin/user" method="post">
                                     <div class="form-group">
                                        <label for="userNo">UserNo:</label>
                                        <input type="text" class="form-control" id="userNo" name="userNo" value="${ user.userNo }" readonly>
                                    </div>
                                        <div class="form-group">
                                        <label for="userImage">Image URL:</label>
                                        <input type="text" class="form-control" id="userImage" name="userImage" >
                                    </div>
                                    <div class="form-group">
                                        <label for="userId">User ID:</label>
                                        <input type="text" class="form-control" id="userId" name="userId" value="${ user.userId }">
                                    </div>
                                    <div class="form-group">
                                        <label for="userEmail">Email:</label>
                                        <input type="email" class="form-control" id="userEmail" name="userEmail" value="${ user.userEmail }">
                                    </div>
                                    <div class="form-group">
                                        <label for="nickname">Nickname:</label>
                                        <input type="text" class="form-control" id="nickname" name="nickname" value="${ user.nickname }">
                                    </div>
                                    <div class="form-group">
                                        <label for="userPhone">Phone:</label>
                                        <input type="text" class="form-control" id="userPhone" name="userPhone" value="${ user.userPhone }">
                                    </div>
                                    <div class="form-group">
                                        <label for="userIntro">자기소개:</label>
                                        <input type="text" class="form-control" id="userIntro" name="userIntro" value="${ user.userIntro }">
                                    </div>
                                  <div class="form-group">
								   <label for="regDate">가입일:</label>
									    <fmt:formatDate value="${user.regDate}" pattern="yyyy-MM-dd" var="formattedDate" />
									    <input type="text" class="form-control" id="regDate" name="regDate" value="${formattedDate}" readonly="true">
									    </div>  

                                
                                    <div class="form-group">
                                        <label for="userGrade">Grade:</label>
                                        <select class="form-control" id="userGrade" name="userGrade" value="${ user.userGrade }">
                                         	<option value="normaluser" ${user.userGrade == 'normaluser' ? 'selected' : ''}>Normal User</option>
     										<option value="VIP" ${user.userGrade == 'VIP' ? 'selected' : ''}>VIP</option>
									        <option value="admin" ${user.userGrade == 'admin' ? 'selected' : ''}>Admin</option>
									        <option value="BanUser" ${user.userGrade == 'BanUser' ? 'selected' : ''}>Ban User</option>
                                        </select>
                                    </div>
                                    <div class="form-group">
                                        <label for="deletedUser">Deleted User:</label>
                                        <select class="form-control" id="deletedUser" name="deletedUser" value="${ user.deletedUser }">
                                            <option value="false" ${user.deletedUser == 'false' ? 'selected' : ''}>유지</option>
                                            <option value="true" ${user.deletedUser == 'true' ? 'selected' : ''}>삭제</option>
                                        </select>
                                    </div>
                                    <button type="submit" class="btn btn-primary">수정</button>
                                </form:form>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
      	  var userUrl = '<c:url value="/${user.userNo}" />';
            $.ajax({
                 url: userUrl,
                type: 'GET',
                dataType: 'json',
                success: function(data) {
                    $('#userId').val(data.userId);
                    $('#userEmail').val(data.userEmail);
                    $('#nickname').val(data.nickname);
                    $('#userPhone').val(data.userPhone);
                    $('#userImage').val(data.userImage);
                    $('#userGrade').val(data.userGrade);
                    $('#deletedUser').val(data.deletedUser);
                    
                     },
                error: function(xhr, status, error) {
                    console.error(xhr.responseText);
                }
            });
        });
           
    </script>
            
            
            
        });
    </script>
            
            
            
            
            
        });
        
        
        
        
        
        
        
    </script>
</body>
</html>
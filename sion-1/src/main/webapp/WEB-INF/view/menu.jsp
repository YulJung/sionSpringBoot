<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
<meta charset="EUC-KR">
<title>下水道処理システム</title>
</head>
<body>
 <div style="height: 621px">
            <div class="auto-style2">
                <div style="height:150px">
                
                    <div style="height: 33px; width: auto; margin-left: 47px; margin-top: 58px">

                        下水道処理システム > メニュー
                        <hr/>
                        <input class="btn btn-outline-danger" value="logout" type="button" ID="btnLogout" Font-Bold="true"  Font-Size="16px" 
                        OnClick="btnLogout_Click" CssClass="auto-style1" style="margin-left: 725px"></input>
                            
                   
                    </div>
                 </div> 
            </div>

              
           
            <div style="height:100px;">

            </div>

            <div class="container">
            <div class="row">
              
                <div class="col-md-4">
                    <input class="btn btn-secondary" type="button" ID="Button1"  Height="80px"
                     value="施設物一覧" Width="200px" onclick="location.href='/menu/list'"/>
                </div>
                <div class="col-md-4">
                <input class="btn btn-secondary" type="button" ID="Button2" Height="80px" 
                value="施設物（新規）" Width="200px" onclick="location.href='/menu/new'"/>
                </div>
                <div class="col-md-2"></div>
            </div>
            <div class="row">  
                     <div class="col-md-12" style="height:100px;"></div>
            </div>
            <div class="row">  
              
                <div class="col-md-4">
                <input class="btn btn-secondary" type="button" ID="Button3"  Height="80px" 
                value="施設物（修正）" Width="200px" onclick="location.href='/menu/update'"/>
                
                </div>
                <div class="col-md-4">
                <input class="btn btn-secondary" type="button" ID="Button4"   Height="80px" 
                value="施設物（削除）" Width="200px" onclick="location.href='/menu/delete'"/>
                </div>
                <div class="col-md-2"></div>
            </div>
                </div>
        </div>
    
</body>
</html>
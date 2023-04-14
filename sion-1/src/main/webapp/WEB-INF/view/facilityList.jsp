<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<meta charset="EUC-KR">
<title>下水道処理システム</title>
</head>
<body>
	<div style="height: 150px">

		<div style="margin-left: 47px; margin-top: 58px" class="auto-style23">

			下水道処理システム > 一覧
			<hr />
		

		</div>
	</div>
	<div>
	
		
		<div style="margin-left: 30px">
		年　　度 <select id="yearSelect" name="yearSelect" >
		<script>
		var yearStart = 2015;
		for(i=yearStart;i<2026;i++){
			if(i==2023){
			document.write("<option selected>"+i+"</option>");
			}else{
			 document.write("<option>"+i+"</option>");
			}
	
			}
		</script>
		</select>
			<span style="margin-left: 60%">
				地域 
				<select id="placeSelect" name="placeSelect" onchange="placeSelect()">
					<option value="1001">東京都</option>
					<option value="1002">大阪</option>
					<option value="1003">北海道</option>
					<option value="1004">名古屋</option>
					<option value="1005">沖縄</option>	
				</select>
			</span>
		</div>
		<script type="text/javascript">
			function placeSelect(){
				var selected = document.getElementById('placeSelect').value;
				
				location.href='/menu/list?place='+selected;
			}
		</script>
		<div style="margin-left: 30px">
		<form action="/list/search" method="get">
			
				
				<input type="text" id="tifNoInput" name="tifNo" />
				<input type="submit" value="検索" >
				
			
		</form>
			
		</div>
	
	</div>
	<div style="width: 80%">
	<table style="margin-left: 30px;" class="table table-bordered">
		<thead>
			<tr>
				<th>選択</th>
				<th>管理番号</th>
				<th>施設物名</th>
				<th>場所</th>
				<th>開始日</th>
				<th>終了日</th>
				<th>利用料</th>
				<th>支払回数</th>

			</tr>
		</thead>

		<tbody>
			<c:forEach items="${facilityList}" var="fList" varStatus="status">
			
				<tr>
				
					<td><input type="radio" onclick="selected(${status.index})" name="noSelect"></input></td>					
					<td ><input type="hidden" id ="tifNo_${status.index }" name="tifNo${status.index}" value = "${fList.tif_No}" />${fList.tif_No}</td>
					<td >${fList.tif_Name}</td>
					<td>${fList.basyo_Name}</td>
					<td>${fList.tif_Start_Date}</td>
					<td>${fList.tif_End_Date}</td>
					<td>${fList.amt_Fee}</td>
					<td>${fList.tifCount}</td>
					
				</tr>
			
			
			</c:forEach>
				
		</tbody>
	</table>
				<script type="text/javascript">
					
					function selected(i){		
						
						const target = document.getElementById('Button2');
						  target.disabled = false;
						  const target1 = document.getElementById('Button3');
						  target1.disabled = false;
						var tifNo = document.getElementById('tifNo_'+i);
						var test = tifNo.value;
						var tifSelected = document.getElementById('tifNoInput');
						
						tifSelected.value = test;
					
					}
					function updateBtn(){
						var tifNo = document.getElementById('tifNoInput').value;
						
						location.href='/detail/update?tifNo='+tifNo;
					}
					function deleteBtn(){
						var tifNo = document.getElementById('tifNoInput').value;
						
						location.href='/detail/delete?tifNo='+tifNo;
					}
					</script>
				
	</div>
	<div style="margin-top: 50px">

			<input type="button" ID="Button1" Height="31px" Width="70px"
			value="新　規" onclick="location.href='/detail/new'" style="margin-left: 50px" /> 
			<input type="button" ID="Button2" Height="31px" value="修　正" Width="70px"
			OnClick="updateBtn()" disabled="disabled" style="margin-left: 50px"/> 
			<input type="button" ID="Button3" Height="31px" value="削　除" Width="70px"
			OnClick="deleteBtn()" disabled="disabled" style="margin-left: 50px"/> 
			<input	type="button" ID="Button4" Height="31px" value="戻る" Width="70px"
			onclick="location.href='/menu/'" style="margin-left: 500px"/> <br /> <br /> <input
			id="hddValue" type="hidden" />

	</div>
</body>
</html>
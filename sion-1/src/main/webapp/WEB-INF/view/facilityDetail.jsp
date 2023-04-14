<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="EUC-KR">
<title>下水道処理システム</title>
</head>
<body onload="urlCheck()">
<div class="auto-style14">

		<div style="margin-left: 47px; margin-top: 35px; font-size: 20px;"
			class="auto-style21">下水道処理 > 管理画面 > <a id="viewName"></a>
			</div>

	</div>
	
<form action="/Detail/todo" method="post">
	<div
		style="border-style: solid; border-color: inherit; border-width: 1px; padding: 10px;"
		class="auto-style15">

		<Label ID="Label1">管理番号</Label> <br /> <Label ID="Lable2">施設物名</Label>
		<br /> <Label ID="Label3" Class="Lable1">場所</Label> <br /> <Label
			ID="Label4" Class="Lable1">開始日</Label> <br /> <Label ID="Label5"
			Class="Lable1">終了日</Label> <br /> <Label ID="Label6" Class="Lable1">備考１</Label>
		<br /> <Label ID="Label7" Class="Lable1">備考２</Label> <br /> <Label
			ID="Label8" Class="Lable1">面積</Label> <br /> <Label ID="Label9"
			Class="Lable1">幅</Label> <br /> <Label ID="Label10" Class="Lable1">長さ</Label>
		<br />

	</div>
	<div
		style="border-style: solid; border-color: inherit; border-width: 1px; padding: 10px;"
		class="auto-style19">

		<input ID="facilityNo" type="text" class="input1" value="${detail.tifNo }"  /> 
			<input type="button" 
			ID="searchNo" value="検索" disabled="disabled"
			OnClick="search_no_Click" /> <br /> <label id="searchError"></label>
		<input ID="facilityName" type="text" class="input1" value="${detail.tifName }"/> <br /> <label
			id="nameError"></label> 
			<select id="facilityPlace"  >
			<option <c:if test="${detail.tifPlace eq '1001'}">selected</c:if> value="1001">東京都</option>
			<option <c:if test="${detail.tifPlace eq '1002'}">selected</c:if> value="1002">大阪</option>
			<option <c:if test="${detail.tifPlace eq '1003'}">selected</c:if> value="1003">北海道</option>
			<option <c:if test="${detail.tifPlace eq '1004'}">selected</c:if> value="1004">名古屋</option>
			<option <c:if test="${detail.tifPlace eq '1005'}">selected</c:if> value="1005">沖縄</option>
		</select> <br /> 
		<input ID="startDate" type="date" class="input1" value="${detail.tifStartDate }"/> <br />
		<label id="nameError"></label> 
		<input ID="endDate" type="date"	class="input1" value="${detail.tifEndDate }"/>
		<br /> 
		<label id="nameError"></label> 
	
		<input name="area" type="text" class="input1" value="${detail.tifArea }"/> 
		<br />
		<input name="width" type="text" class="input1" value="${detail.tifWidth}"/> 
		<br />
		<input name="length" type="text" class="input1" value="${detail.tifLength }"/> 
		<br />
	</div>

	<script type="text/javascript">

    
			function urlCheck(){
				document.getElementById('facilityNo').disabled=true;
				const select = document.getElementById('facilityPlace');
				const url = '<c:out value='${urlForm}'/>';
				if(url=='update'){
					console.log('update');
				select.value = '<c:out value='${detail.tifPlace}'/>';
				document.getElementById('btn1').setAttribute('onClick','putUpdate()');
				}
				else if(url=='delete'){
					console.log('delete');
					var input = document.getElementsByClassName("input1");
					for( var i = 0; i < input.length; i++ ){
						var items = input.item(i);
						items.disabled=true;
					}
					document.getElementById('btn2').disabled=true;
					select.value ='<c:out value='${detail.tifPlace}'/>';
					document.getElementById('btn1').setAttribute('onClick','deleteDo()');
				}
				else if(url=='register'){
					document.getElementById('facilityNo').disabled=false;
					console.log('register');
					document.getElementById('btn1').setAttribute('type','submit');
					
				}
				else{
					console.log('error');
				}
			}
			function btn2_Click(){
			
				var input = document.getElementsByClassName("input1");
				document.getElementById('facilityPlace').value='1001';
				for( var i = 1; i < input.length; i++ ){
					var items = input.item(i);
					items.value='';
				}
			}
			const cancle = ()=>{
                window.history.back();
            }
			const deleteDo = ()=>{
				
			}
			const putUpdate = () =>{
	                console.log('put ajax');
	                let id = document.getElementById('boardId').value;
	                let title = document.getElementById('boardTitle').value;
	                let memberEmail = document.getElementById('memberEmail').value;
	                let contents = document.getElementById('boardContents').value;
	                let file = document.getElementById('boardFile').value;
	                //자바스크립트 오브젝트에 담아서 보냄
	                // const updateData = JSON.stringify({
	                //     boardId:id,
	                //     boardTitle:title,
	                //     memberEmail: memberEmail,
	                //     boardContents : contents,
	                //     boardFile : file
	                //
	                // });
	                // let data = {
	                //     "boardId" : id,
	                //     "boardTitle" : title,
	                //     "memberEmail": memberEmail,
	                //     "boardContents": contents,
	                // }
	                let form = $('#fileUploadForm')[0];
	                let data = new FormData(form);
	                // formData.append('boardFile', $('#boardFile'));
	                // formData.append('key', new Blob([JSON.stringify(data)] , {type: "application/json"}));

	                console.log(data);
	                const reqUrl ="/board/"+id;
	                $.ajax({
	                    type: 'put', // put :덮어씌우기 patch: 수정이 필요한부분만 바뀜
	                    data: data,
	                    url: reqUrl,
	                    enctype : 'multipart/form-data',
	                    contentType: false,
	                    processData: false,
	                    success: function (){

	                        location.href='/board/'+id;
	                    },
	                    error(){
	                        alert('ajax fail');
	                    }
	                });


	            }
        </script>

	







	<div class="auto-style13">
		<input type="button" ID="btn1"  value="処理"  	Width="100px"  />
		<input type="button" ID="btn2"  value="クリア" OnClick="btn2_Click()"  />
		<input type="button" ID="btn3"  value="戻る"	Width="100px" OnClick="cancle()" />
		<input type="hidden"  ID="card_check" />
		<input type="hidden"  ID="history"/>

	</div>
	
    </form>    
</body>
</html>
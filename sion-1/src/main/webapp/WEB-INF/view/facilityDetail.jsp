<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html>
<head>
	 
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" 
	 integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">
	<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<meta charset="EUC-KR">
<title>下水道処理システム</title>
</head>
<body onload="urlCheck()">
<div style="height: 150px">

		<div style="margin-left: 47px; margin-top: 58px" class="auto-style23">

			下水道処理システム > 管理画面 > <label id="urlLabel"></label>
			<hr />
		

		</div>
	</div>
	
	
<form action="/detail/todo" method="post" id="tifRegisterForm">
<div class="row">
	<div
		style="border-style: solid; border-color: inherit; border-width: 1px; padding: 10px; margin-left: 30px;"
		class="col-sm-3">

		<Label ID="Label1">管理番号</Label><br/> <br/> 
		<a></a>
		<Label ID="Lable2" style="margin-top: 5px;">施設物名</Label><br/><br/> 
		<a></a>
		<Label ID="Label3" Class="Lable1" style="margin-top: 5px;">場所</Label> <br/><br/> 
		<a></a>
		<Label ID="Label4" Class="Lable1" style="margin-top: 5px;">開始日</Label><br/><br/> 
		<a></a>
		<Label ID="Label5"	Class="Lable1" style="margin-top: 5px;">終了日</Label><br/><br/> 
		
	
		<Label ID="Label8" Class="Lable1" style="margin-top: 5px;">面積</Label><br/><br/> 
		<a></a>
		<Label ID="Label9"	Class="Lable1" style="margin-top: 5px;">幅</Label> <br/><br/> 
		<a></a>
		<Label ID="Label10" Class="Lable1" style="margin-top: 5px;">長さ</Label>
		<br/>

	</div>
	<div
		style="border-style: solid; border-color: inherit; border-width: 1px; padding: 10px;"
		class="col-sm-3">

		<input ID="tifNo" name="tifNo" type="text" class="input1" value="${detail.tifNo }"  /> 
		<input type="button"  ID="searchNo" name="searchNo" value="検索" disabled="disabled"	 /> <br /> 
		<label id="searchError"></label>
		<br /> 
		<input ID="tifName" name="tifName" type="text" class="input1" value="${detail.tifName }"/> <br />
	    <label	id="nameError"></label> <br /> 
			<select id="tifPlace" name="tifPlace" class="input1" >
			<option <c:if test="${detail.tifPlace eq '1001'}">selected</c:if> value="1001">東京都</option>
			<option <c:if test="${detail.tifPlace eq '1002'}">selected</c:if> value="1002">大阪</option>
			<option <c:if test="${detail.tifPlace eq '1003'}">selected</c:if> value="1003">北海道</option>
			<option <c:if test="${detail.tifPlace eq '1004'}">selected</c:if> value="1004">名古屋</option>
			<option <c:if test="${detail.tifPlace eq '1005'}">selected</c:if> value="1005">沖縄</option>
		</select> <br /> <br /> 
		
		<input ID="tifStartDate" name="tifStartDate" type="date" class="input1"  value="${detail.tifStartDate }"/> <br />
		<label id="nameError"></label> <br /> 
		<input ID="tifEndDate" name="tifEndDate" type="date"	class="input1" value="${detail.tifEndDate }"/>
		<br /> 
		<label id="nameError"></label> 
		<br /> 
		<input name="tifArea" id="tifArea" type="text" class="input1" value="${detail.tifArea }"/> 
		<br /><br /> 
		<input name="tifWidth" id="tifWidth" type="text" class="input1" value="${detail.tifWidth}"/> 
		<br /><br /> 
		<input name="tifLength" id="tifLength" type="text" class="input1" value="${detail.tifLength }"/> 
		<br /><br /> 
	</div>
</div>
	<script type="text/javascript">

    
			function urlCheck(){
				document.getElementById('tifNo').disabled=true;
				const select = document.getElementById('tifPlace');
				const url = '<c:out value='${urlForm}'/>';
				if(url=='update'){
					console.log('update');
				select.value = '<c:out value='${detail.tifPlace}'/>';
				document.getElementById('btn1').setAttribute('onClick','putUpdate()');
				document.getElementById('urlLabel').innerText = '修正';
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
					document.getElementById('urlLabel').innerText = '削除';
				}
				else if(url=='register'){
					document.getElementById('tifNo').disabled=false;
					console.log('register');
					document.getElementById('btn1').setAttribute('type','submit');
					document.getElementById('urlLabel').innerText = '新規';
					
				}else if(url=='menu/new'){
					document.getElementById('tifNo').disabled=false;
					document.getElementById('searchNo').disabled=true;
					document.getElementById('btn1').setAttribute('type','submit');
					document.getElementById('urlLabel').innerText = '新規';
				}else if(url=='menu/delete'){
					document.getElementById('tifNo').disabled=false;
					var input = document.getElementsByClassName("input1");
					for( var i = 1; i < input.length; i++ ){
						var items = input.item(i);
						items.disabled=true;
					}
					document.getElementById('searchNo').disabled=false;
					document.getElementById('btn2').disabled=true;
					select.value ='<c:out value='${detail.tifPlace}'/>';
					document.getElementById('btn1').setAttribute('onClick','deleteDo()');
					document.getElementById('urlLabel').innerText = '削除';
				}else if(url=='menu/update'){
					console.log('update');
					document.getElementById('tifNo').disabled=false;
					var input = document.getElementsByClassName("input1");
					for( var i = 1; i < input.length; i++ ){
						var items = input.item(i);
						items.disabled=true;
					}
					document.getElementById('searchNo').disabled=false;
					document.getElementById('btn1').setAttribute('onClick','putUpdate()');
					document.getElementById('urlLabel').innerText = '修正';
					}
				else{
					console.log('error');
				}
			}
			function btn2_Click(){
			
				var input = document.getElementsByClassName("input1");
				document.getElementById('tifPlace').value='1001';
				for( var i = 1; i < input.length; i++ ){
					var items = input.item(i);
					items.value='';
				}
			}
			
			
			const cancle = ()=>{
                window.history.back();
            }
			const deleteDo = ()=>{
				 console.log('delete ajax');
				 let tifNo = document.getElementById('tifNo').value;
				 let form = $('#tifRegisterForm')[0];
				 const reqUrl ="/detail/"+tifNo;
	                let data = new FormData(form);
				 $.ajax({
	                    type: 'delete', 
	                    data: data,
	                    url: reqUrl,
	                    enctype : 'multipart/form-data',
	                    contentType: false,
	                    processData: false,
	                    success: function (){
							alert('seikou');
	                        location.href='/menu/list';
	                    },
	                    error(){
	                        alert('ajax fail');
	                    }
	                });
			}
			const putUpdate = () =>{
	                console.log('put ajax');
	                let tifNo = document.getElementById('tifNo').value;
	                let tifName = document.getElementById('tifName').value;
	                let tifPlace = document.getElementById('tifPlace').value;
	                let tifStartDate = document.getElementById('tifStartDate').value;
	                let tifEndDate = document.getElementById('tifEndDate').value;
	                let tifArea = document.getElementById('tifArea').value;
	                let tifWidth = document.getElementById('tifWidth').value;
	                let tifLength = document.getElementById('tifLength').value;
	              
	                let form = $('#tifRegisterForm')[0];
	                let data = new FormData(form);
	                console.log(data);
	                const reqUrl ="/detail/"+tifNo;
	                $.ajax({
	                    type: 'put', // put :덮어씌우기 patch: 수정이 필요한부분만 바뀜
	                    data: data,
	                    url: reqUrl,
	                    enctype : 'multipart/form-data',
	                    contentType: false,
	                    processData: false,
	                    success: function (){
							alert('seikou');
	                        location.href='/menu/list';
	                    },
	                    error(){
	                        alert('ajax fail');
	                    }
	                });


	            }
			$("#searchNo").click(function () {
	            const tifNo = $("#tifNo").val();
	            const url = '<c:out value='${urlForm}'/>';
	            console.log(tifNo);
	            $.ajax({
	                type:'post',
	                url : '/detail/find',
	                data:{
	                    'tifNo' :tifNo
	                    
	                },
	                dataType : 'json',
	                success : function (result) {
	                    console.log(result);
	                 
	                    document.getElementById('tifNo').value=result.tifNo;
	                    document.getElementById('tifPlace').value=result.tifPlace;
	                    document.getElementById('tifName').value=result.tifName;
	                    document.getElementById('tifStartDate').value=result.tifStartDate;
	                    document.getElementById('tifEndDate').value=result.tifEndDate;
	                    if( result.tifArea===" "){
	                    	
	                    	 document.getElementById('tifArea').value="";
	                    }else{
	                    	 document.getElementById('tifArea').value=result.tifArea;
	                    }
	                  	if( result.tifWidth===" "){
	                  		 document.getElementById('tifWidth').value="";
	                  	}else{
	                  		 document.getElementById('tifWidth').value=result.tifWidth;
	                  	}
	                  	if( result.tifLength===" "){
	                  		 document.getElementById('tifLength').value="";
	                  	}else{
	                  		 document.getElementById('tifLength').value=result.tifLength;	
	                  	}
	                  
	                   
	                    document.getElementById('tifNo').disabled=true;
						var input = document.getElementsByClassName("input1");
						if(url=='menu/delete'){
							for( var i = 1; i < input.length; i++ ){
								var items = input.item(i);
								items.disabled=true;
							}
						}else{
							for( var i = 1; i < input.length; i++ ){
								var items = input.item(i);
								items.disabled=false;
							}
		                    
						}
					
	                },
	                error : function () {
	                    alert('ajax fail')
	                }
	            });
	        });
        </script>

	







	<div style="margin-left: 50px; margin-top: 10px;">
		<input type="button" ID="btn1"  value="処理"  	Width="100px" style="margin-left: 50px;" />
		<input type="button" ID="btn2"  value="クリア" OnClick="btn2_Click()" style="margin-left: 50px;" />
		<input type="button" ID="btn3"  value="戻る"	Width="100px" OnClick="cancle()" style="margin-left: 50px;"/>
		<input type="hidden"  ID="card_check" />
		<input type="hidden"  ID="history"/>

	</div>
	
    </form>    
</body>
</html>
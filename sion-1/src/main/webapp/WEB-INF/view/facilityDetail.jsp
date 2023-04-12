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
<div class="auto-style14">

		<div style="margin-left: 47px; margin-top: 35px; font-size: 20px;"
			class="auto-style21">下水道処理 > 管理画面 > <a id="viewName"></a>
			</div>

	</div>
	

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

		<input ID="facilityNo" type="text" class="auto-style6"
			onKeyPress="GetKeyCode(this)" MaxLength="16" /> <input type="button"
			ID="searchNo" value="検索" disabled="disabled"
			OnClick="search_no_Click" /> <br /> <label id="searchError"></label>
		<input ID="facilityName" type="text" class="auto-style6" /> <br /> <label
			id="nameError"></label> <select id="facilityPlace" ID="select1">
			<option value="1001">東京都</option>
			<option value="1002">大阪</option>
			<option value="1003">北海道</option>
			<option value="1004">名古屋</option>
			<option value="1005">沖縄</option>
		</select> <br /> <input ID="startDate" type="date" class="auto-style3" /> <br />
		<label id="nameError"></label> 
		<input ID="endDate" type="date"	class="auto-style3" />
		<br /> 
		<label id="nameError"></label> 
		<input name="etc1" type="text" class="auto-style2" /> 
		<br /> 
		<input name="etc2" type="text" class="auto-style11" /> 
		<br /> 
		<input name="area" type="text" class="auto-style3" /> 
		<br />
		<input name="width" type="text" class="auto-style3" /> 
		<br />
		<input name="length" type="text" class="auto-style3" /> 
		<br />
	</div>

	<script type="text/javascript">

            function GetKeyCode(text) {
                var text_read = 0;
                var btn = document.getElementById('search_no');

                text_read = text.value.length;
                if (text_read > 15) {
                    alert("カード番号は16桁")
                }
                if (text_read == 15) {

                    btn.disabled = false;
                }

            }


        </script>

	







	<div class="auto-style13">
		<input type="submit" ID="btn1"  value="処理" 	Width="100px"  />
		<input type="button" ID="btn2"  value="クリア" OnClick="btn2_Click"  />
		<input type="button" ID="btn3"  value="戻る"	Width="100px" OnClick="history.back(); return false" />
		<input type="hidden"  ID="card_check" />
		<input type="hidden"  ID="history"/>

	</div>
</body>
</html>
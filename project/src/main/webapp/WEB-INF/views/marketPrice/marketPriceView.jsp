<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%@include file="../fixsection/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>maerketPrice측정</title>

<!-- Styles -->
<style>
#chartdiv {
	width: 100%;
	height: 500px;
}
</style>

<!-- Resources -->
<script src="https://www.amcharts.com/lib/4/core.js"></script>
<script src="https://www.amcharts.com/lib/4/charts.js"></script>
<script src="https://www.amcharts.com/lib/4/themes/animated.js"></script>

<!-- Chart code -->
<script>
	var value = ${marketPriceView};
	console.log(value);
	var inputData = [];

	//생성자 객체생성
	function production(title, price, create_date) {
		this.country = title;
		this.visits = price;
		this.date = create_date;

	}
	
	// 값가져온거 넣어주깅 ~!!
	var cal = function() {
		for (var i = 0; i < value.length; i++) {
			var title = value[i].title;
			var create_date = value[i].create_date;
			var price = value[i].price;
			inputData.push(new production(title, price, create_date));
		}
	}();

	am4core.ready(function() {

		// Themes begin
		am4core.useTheme(am4themes_animated);
		// Themes end

		// Create chart instance
		var chart = am4core.create("chartdiv", am4charts.XYChart3D);
		
		console.log(inputData);
		
		//색깔 메서드 추가하깅 !!!
		for(var i = 0; i < inputData.length; i++){
			inputData[i].color = chart.colors.next();
		}
		
		chart.data = inputData;

		// Create axes
		var categoryAxis = chart.xAxes.push(new am4charts.CategoryAxis());
		categoryAxis.dataFields.category = "country";
		categoryAxis.renderer.labels.template.rotation = 0;
		categoryAxis.renderer.labels.template.hideOversized = false;
		categoryAxis.renderer.minGridDistance = 20;
		categoryAxis.renderer.labels.template.horizontalCenter = "middle";
		categoryAxis.renderer.labels.template.verticalCenter = "middle";
/* 		categoryAxis.tooltip.label.rotation = 270;
		categoryAxis.tooltip.label.horizontalCenter = "right";
		categoryAxis.tooltip.label.verticalCenter = "middle"; */

		var valueAxis = chart.yAxes.push(new am4charts.ValueAxis());
		valueAxis.title.text = "가격";
		valueAxis.title.fontWeight = "bold";

		// Create series
		var series = chart.series.push(new am4charts.ColumnSeries3D());
		series.dataFields.valueY = "visits";
		series.dataFields.categoryX = "country";
		series.dataFields.datePro = "date";

		series.name = "Visits";
		series.tooltipText = "{datePro} {categoryX}: [bold]{valueY}[/]";
		series.columns.template.fillOpacity = .8;
		series.columns.template.propertyFields.fill = "color";

		var columnTemplate = series.columns.template;
		columnTemplate.strokeWidth = 2;
		columnTemplate.strokeOpacity = 1;
		columnTemplate.stroke = am4core.color("#FFFFFF");

		chart.cursor = new am4charts.XYCursor();
		chart.cursor.lineX.strokeOpacity = 0;
		chart.cursor.lineY.strokeOpacity = 0;

		// Enable export
		chart.exporting.menu = new am4core.ExportMenu();

	}); // end am4core.ready()
</script>



</head>
<body>
	<!-- 검색 -->
	<div>
		<input type="text" placeholder="검색어를 입력하세요" />
		<button>검색</button>
	</div>
	<!-- HTML -->
	<div id="chartdiv"></div>
</body>
</html>

<%@include file="../fixsection/footer.jsp"%>
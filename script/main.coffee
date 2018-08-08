window.Main = class window.Main
	constructor:->

	init:->
		@fetchData()


	fetchData:->
		dataArray = []

		$.ajax(
			type: "GET",
			async: false,
			url: "./data/data.csv",
			dataType: "text",
			success: (csvdata) ->
				dataArray = $.csv.toArrays(csvdata)
				dataArray.shift()
		)
		return dataArray
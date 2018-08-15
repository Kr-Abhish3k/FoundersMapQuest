$(document).ready ->
	displayObject = new DisplayData()
	displayObject.init()

window.Displaydata = class window.DisplayData
	constructor: ->
		@main = new Main()
		@paginationObj = new Pagination()
		@addEntry = new addEntry()


		@tableWrapper = $(".entries_tableWrapper")
		@previousPage = $(".Page_previousBtn")
		@nextPage = $(".Page_nextBtn")
		

		@data = []
		@entriesCount= ''
		@currentPage = ''
		@recordsPerPage = 5


	init: ->
		@data = @main.fetchData()
		@totalEntries = @data.length
		@changePage(1)

		$("#form").submit ()=>
			@addEntry.validateEntries()


		$(".Page_nextBtn").on 'click',() =>
			@currentPage = $(".Page_pageNumber").text()
			@pageNext()

		$(".Page_previousBtn").on 'click',(e) =>
			@currentPage = $(".Page_pageNumber").text()
			@pagePrevious()

	pagePrevious:() ->
		if(@currentPage > 1)
			@currentPage--
			@changePage(@currentPage)
			@paginationObj.updatePageNo(@currentPage)

	pageNext:() ->
		if(@currentPage < @numOfPages())
			@currentPage++
			@changePage(@currentPage)
			@paginationObj.updatePageNo(@currentPage)


	numOfPages :() ->
		return @totalEntries / @recordsPerPage

	createTable	:(allRows)->
		@entriesCount = allRows.length
		table = $('.entries_table')
		body = $("<tbody/>")
		rowCount = 0

		#add rows to table
		for rows, index in allRows
			row = $("<tr/>")

			if rowCount < 5
				rowCells = allRows[index]
				for element , rowIndex in rowCells
					#skip to avoid making column Photo ,latitude & longitude
					unless rowIndex == 7 || rowIndex == 9 || rowIndex == 10
						element = element.replace(/"/g, "")
						cell= $("<td>"+element+"</td>")
						row.append(cell)
						body.append(row)
				rowCount++


		table.append(body)
		body.addClass("entries_table_body")

		return table

	changePage :(page) ->
		@listingTable = $(".entries_table_body")
		tabledata =[]

		#validate Page
		if(page <= 1)
			page = 1

		if(page > @numOfPages())
			page = @numOfPages()

		@listingTable.empty()

		recoredIndex = (page - 1)*@recordsPerPage + 1
		startIndex = recoredIndex
		while(recoredIndex <= page*@recordsPerPage && recoredIndex <= @totalEntries)
			tabledata.push( @data[recoredIndex - 1] )
			recoredIndex++

		@createTable(tabledata)
		@paginationObj.updateMessage(startIndex,recoredIndex - 1,@totalEntries)

		if(page == 1)
			$(".Page_previousBtn").hide()
		else
			$(".Page_previousBtn").show()

		if(page == @numOfPages())
			$(".Page_nextBtn").hide()
		else
			$(".Page_nextBtn").show()
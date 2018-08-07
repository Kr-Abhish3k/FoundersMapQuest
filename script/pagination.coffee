window.Pagination = class window.Pagination
	constructor:->
		@main = new Main()

		@paginationWrapper = $(".entries_PaginationWrapper")
		@paginationDiv = $(".entries_pagination")
		@pageNumber = $(".Page_pageNumber")
		@btnNext = $(".Page_nextBtn")
		@btnPrevious = $(".Page_previousBtn")
		@listingTable = $(".entries_table_body")
		@tableBody =$("<tobody>")
		@pageSpan =  $(".Page_pageNumber")
		@currentPage=''
		@recordsPerPage = 5
		@dataArray =[]


	init:->
		@getData()

	getData:()	->
		@dataArray = @main.fetchData()
		@totalEntries = @dataArray.length

	updateMessage : (startIndex , endIndex , totalEntries) ->
		$(".entries_info").text("Showing "+startIndex+" to "+endIndex+" of "+totalEntries+" Entries.")

	updatePageNo:(pageNo)->
		$(".Page_pageNumber").text(pageNo)

window.addEntry = class window.addEntry
	constructor:->
		@CompanyName  = $("#CompanyName")
		@founder = $("#founder")
		@city = $("#city")
		@country = $("#country")
		@postalCode = $("#postalCode")
		@streetAddress = $("#streetAddress")
		@latitude = $("#latitude")
		@longitude = $("#longitude")
		@photoLink = $("#photoLink")
		@website = $("#website")
		@data = []

		#@fs = require 'fs'
		
		
	init:->
		@validateEntries()	

	validateEntries:()->
		console.log("in form validation")
		flag = false
		index = 0
		locator = ["CompanyName","founder","city","country","postalCode","streetAddress","photoLink","website","latitude","longitude"]

		for value , index in locator
			fieldValue = $("#"+value).val()
			if(fieldValue == "")

				console.log($("#"+value).attr("name") + " is Wrong" )
				return flag = false
			else

				if(value == "postalCode")

					if !( @validateZipCode(fieldValue) )
						console.log($("#"+value).attr("name") + " is Wrong" )
						return flag = false
					else
						@data.push(fieldValue)
						flag = true 

				else if (value == "website") || (value == "photoLink")

					if !( @validateURL(fieldValue))
						console.log($("#"+value).attr("name") + " is Wrong" )
						return flag = false

					else
						@data.push(fieldValue)
						flag=true
				else
					@data.push(fieldValue)
					flag = true
					console.log("data gathered :- "+@data)
		###if (flag == true)
			@fs.writeFile  "data/data.csv" ,@data, (err) =>
				if(err)
					console.log(err)
				
				console.log("done")	###





	validateURL: (url)->	
		urlPattern = /^(?:(?:https?|ftp):\/\/)?(?:(?!(?:10|127)(?:\.\d{1,3}){3})(?!(?:169\.254|192\.168)(?:\.\d{1,3}){2})(?!172\.(?:1[6-9]|2\d|3[0-1])(?:\.\d{1,3}){2})(?:[1-9]\d?|1\d\d|2[01]\d|22[0-3])(?:\.(?:1?\d{1,2}|2[0-4]\d|25[0-5])){2}(?:\.(?:[1-9]\d?|1\d\d|2[0-4]\d|25[0-4]))|(?:(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)(?:\.(?:[a-z\u00a1-\uffff0-9]-*)*[a-z\u00a1-\uffff0-9]+)*(?:\.(?:[a-z\u00a1-\uffff]{2,})))(?::\d{2,5})?(?:\/\S*)?$/
		return urlPattern.test(url)

	validateZipCode: (elementValue) ->	
		zipCodePattern = /^\d{6}$|^\d{5}-\d{4}$/ 
		zipCodePattern.test elementValue
	
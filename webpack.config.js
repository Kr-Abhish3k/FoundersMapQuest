const webpack = require('webpack');
var path = require('path');
// let config = {
// 	entry : "./javascripts/index.js",
// 	output: {
// 		filename: './javascripts/bundle.js'
// 	}
// }

module.exports = {
	mode: 'production',
	entry : ["./javascripts/index.js", "./sass/style.scss"],
	output: {
		path: path.resolve(__dirname,'bundle'),
		filename: 'bundle.js'
	},
	module:{
     rules:[
             // {
             //     test:/\.(s*)css$/,
             //     use:['style-loader','css-loader', 'sass-loader']
             //  }
            {
				test: /\.(s*)css$/,
				use: [
					{
						loader: 'file-loader',
						options: {
							name: 'bundle.css',
							//outputPath: path.resolve(__dirname,'./stylesheet')
						}
					},
					{
						loader: 'style-loader'
					},
					{
						loader: 'css-loader',
						options: {
                    		sourceMap: true
                		}
					},
					{
						loader: 'sass-loader',
						options: {
                    		sourceMap: true
                		}
					}
	      		]
	      	}
	    ]
	}
}
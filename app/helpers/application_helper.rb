module ApplicationHelper

	# def current_user
	# 	# binding.pry
	# 	User.find_by(id: session[:user_id])
	# end

	def progress_bar_chart 
		pie_chart Cell.cell_progress, adapter: 'google', library: { 
			legend: { position: "bottom", textStyle: {color: 'white', fontSize: 16}},
			chartArea: {right: 10,left: 10},
			xtitle: "Cell % Complete",
			pieHole: 0.6,
			backgroundColor: 'none',
			fontName: "<global-font-name>",
			fontSize: "16",
			pieSliceText: 'value',
			# add a method to get array of colors based on data from 'cell_progress' method
			slices: [{color: 'black'}, {}, {}, {color: 'red'}]
		}
			
			
			
			# , colors: ["#0526FF", "#FFFFFF"], isStacked: 'percent'}


			# textStyle: { fontSize: 16, color: "#fff"}
		# xtitle: "No. of Cells", ytitle: "% Complete",
		# chartArea: {top: 15,right: 15, bottom: 20,left: 50},
		# id: "progress-chart"
		# adapter: 'google', library: { isStacked: true }, label: "Percentage Complete",
		# colors: ["#FF0000", "#FF3300",	"#ff6600", "#ff9900",	"#FFCC00", "#FFFF00", "#ccff00", "#99ff00", "#66ff00", "#33ff00","#00FF00"]
	end

end

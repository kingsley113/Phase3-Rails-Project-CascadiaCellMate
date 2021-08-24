module ApplicationHelper

	# def current_user
	# 	# binding.pry
	# 	User.find_by(id: session[:user_id])
	# end

	def progress_bar_chart 
		pie_chart Cell.cell_progress, adapter: 'google', library: { 
			legend: { position: "none", textStyle: {color: 'white', fontSize: 16}, maxLines: 3, alignment: 'center'},
			chartArea: {left: 0, right: 0, top: 5, bottom: 0},
			# chartArea: {width: 500, height: 500},
			# title: "Cell % Complete",
			pieHole: 0.5,
			backgroundColor: 'none',
			fontName: "<global-font-name>",
			fontSize: "16",
			# color: "white",
			pieSliceText: 'value',
			slices: chart_colors,
			# reverseCategories: true,
			width: '100%',
			height: '100%', 
			# isStacked: 'true';
		}
			
			
			
			# , colors: ["#0526FF", "#FFFFFF"], isStacked: 'percent'}


			# textStyle: { fontSize: 16, color: "#fff"}
		# xtitle: "No. of Cells", ytitle: "% Complete",
		# chartArea: {top: 15,right: 15, bottom: 20,left: 50},
		# id: "progress-chart"
		# adapter: 'google', library: { isStacked: true }, label: "Percentage Complete",
		# colors: ["#FF0000", "#FF3300",	"#ff6600", "#ff9900",	"#FFCC00", "#FFFF00", "#ccff00", "#99ff00", "#66ff00", "#33ff00","#00FF00"]
	end

	def chart_colors
		color_list = {0 => '#FF0000', 10 => '#FF3300', 20 => '#ff6600', 30 => '#ff9900', 40 => '#FFCC00', 50 => '#FFFF00',  60 => '#ccff00', 70 => '#99ff00', 80 => '#66ff00', 90 => '#33ff00', 100 => '#00FF00'}
		active_colors = Cell.cell_progress.map do |hash|
			{color: color_list[hash[0]]}
		end
	end


end

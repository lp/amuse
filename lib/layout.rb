# Author:: lp (mailto:lp@spiralix.org)
# Copyright:: 2009 Louis-Philippe Perron - Released under the terms of the MIT license
# 
# :title:AmuseHelpers
module AmuseHelpers
	
	def layout(args={:scroll => false})
		args = layout_default(args)
		background lightslategray
		stack do
			stack do
				stroke white; fill black
				rect :top => 10, :left => 10, :width => 580, :height => 100, :curve => 15
				stroke black; fill gray
				rect :top => 70, :left => 20, :width => 560, :height => 35, :curve => 5
			end
			stack do
				stroke white; fill slategray
				rect :top => 120, :left => 10, :width => 580, :height => 560, :curve => 40
			end
    	stack(:margin => 8) do
	      @title = title( '', 
	        :align => "center",
	        :font => "Trebuchet MS",
	        :stroke => white
	      )
	    end
	    stack(:margin => 20) do
	        @display = para( '',
	          :size => 14, 
	          :align => "center", 
	          :font => "Trebuchet MS", 
	          :stroke => pink
	        )
			end
		end
		stack(:top => 130, :left => 20,:height => 560,:width => 560,:scroll => args[:scroll]) do
      yield if block_given?
    end
  end
	
  def colorContent(text,color)
    return para( text,
      :size => 12,
      :align => 'left',
      :font => "Trebuchet MS",
      :stroke => color
    )
  end

	private
	
	def layout_default(args)
		args[:scroll] = false if args[:scroll].nil?
		args
	end
	
end
module AmuseHelpers
	
	def layout(args={:scroll => false})
		background lightslategray
		stack do
			stroke white
			stack do
				fill slategray
				rect :top => 10, :left => 10, :width => 580, :height => 660, :curve => 40
			end
    	stack(:margin => 10) do
	      @title = title( '', 
	        :align => "center",
	        :font => "Trebuchet MS",
	        :stroke => pink
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
		stack(:top => 40, :left => 40,:margin => 20,:height => 640,:width => 560,:scroll => args[:scroll]) do
      yield if block_given?
			@quit = button('quit', :margin => 10) { exit }
    end
  end
	
  def colorContent(text,color)
    return para( text,
      :size => 12,
      :align => 'left',
      :margin => 15,
      :font => "Trebuchet MS",
      :stroke => color
    )
  end
	
end
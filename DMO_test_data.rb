=begin
Copyright 2013, SketchUp
All Rights Reserved

Disclaimer
THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

License
###better licensing info needed for this whole section. Scott?######

Information
See loader file for detailed information
=end


module DMO_test # <--Change this to your own personal name space

	module DMO_test_Extension # <--Change this to your own scripts name space

		def self.su_select_all
			model = Sketchup.active_model
			sel = model.selection
			ents = model.active_entities
			sel.add( ents.to_a )
		end # main
		
		def self.msgbox(msg)
			UI.messagebox( msg )
		end
		
	end #module	
  
end #module


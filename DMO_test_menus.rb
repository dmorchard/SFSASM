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

require 'sketchup.rb'
require 'DMO_test/DMO_test_data.rb'

# Change this to your own personal name space. SU_Extensions_template is a 
# SketchUp namespace, used only for this template example.  
# Please do not use it. Use something UNIQUE and use it on all your plugins.
module DMO_test

  # Change this to your own script's namespace. Notice that this 
  # resides in the SU_Extensions_template namespace, so it will 
  # not clash with other developer's scripts.
	module DMO_test_Extension 
		
		# This section loads the extension into the menu system. The 
    # file_loaded? method is from the sketchup.rb file. It checks to see if
    # a file has already been loaded.  This is to help prevent double loading
    # of a script into the menu system, especially during development.
		if !file_loaded?(__FILE__)
      
      # Add a submenu to the "Plugins" menu.
			DMO_test_menu = UI.menu("Plugins").add_submenu("DMO test")
      # Create the toolbar object we will be using
			tb = UI::Toolbar.new("DMO est Template")
			
			# See the SU Ruby API docs for more information on creating
      # toolbars and menu commands.
      command1 = UI::Command.new("Select All") { su_select_all }
      command1.small_icon = "Images/icon1_16.png"
      command1.large_icon = "Images/icon1_24.png"
      command1.tooltip = "Select All"
      command1.status_bar_text = "Select everything"
      command1.menu_text = "Select All"
      DMO_test_menu.add_item(command1)
      tb.add_item(command1) 
      
      
			command2 = UI::Command.new("Message Box") { msgbox("Messagebox 1") }
      command2.small_icon = "Images/icon2_16.png"
      command2.large_icon = "Images/icon2_24.png"
      command2.tooltip = "Message Box"
      command2.tooltip = "Message Box"
      command2.status_bar_text = "Pop up a simple messagebox"
      command2.menu_text = "Message Box"
      DMO_test_menu.add_item(command2)
      tb.add_item(command2)
      
      
      command3 = UI::Command.new("Messagebox 2") { msgbox("Messagebox 2") }
      command3.small_icon = "Images/icon3_16.png"
      command3.large_icon = "Images/icon3_24.png"
      command3.tooltip = "Message Box 2"
      command3.status_bar_text = "Pop up a second simple messagebox"
      command3.menu_text = "Message Box 2"
      DMO_test_menu.add_item(command3)
      tb.add_item(command3)
      
      # Show the toolbar. If it was shown last time the user had it on, then
      # turn it on.  If it was off last time the user used SU, 
      # then leave it off.
      unless tb.get_last_state == TB_HIDDEN
        tb.restore
        UI.start_timer( 0.1, false ) { tb.restore } # SU bug 2902434
      end
		
      # This tells SU that the file is loaded into the menu system
			file_loaded(__FILE__)
		end
		
	end #module
  
end #module


# Use this as an example for your extensions.  

=begin
You can keep overall notes and licenses in a header section like this.
This is recommended.  You can find some examples of potentially useful
licesnses to use in the Developers area of the Extension Warehouse.

Extension Warehouse Template
Copyright 2013, SketchUp
All Rights Reserved

Disclaimer
THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED 
WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF 
MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.

License
###better licensing info needed for this whole section. Scott?######

Information:
Author - SketchUp
Organization - www.sketchup.com
Plugin Name - Extension Warehouse Template
Version - v1.0.0
SU Version - Developed on SU 2013, should be compatible with SU 8.
Date - April 18, 2013

Description:
This scipt demonstrates the basics of setting up a complete SketchupExtension
class extension that is compatible with the SketchUp Extension Warehouse.

Usage:
Access the extension from the menu "Plugins > Extension Warehouse Template".
Developers are encouraged to use this script to learn the basics of how to 
create an extension that is compatible with the Extension Warehouse.

History:
1.0 - 2009-04-18
   * First release
=end


# The whole thing is wrapped in a SU_Extensions module
# Developers should wrap their extensions inside their own modules.
module DMO_test # <--Change this to your own personal name space

	# This entire script is wrapped inside its own module,
  # inside of our SU_Extensions module.
	module DMO_test_Extension # <--Change this to your own scripts name space

		# Common required files for creating extensions
		require 'sketchup.rb'
		require 'extensions.rb'
		require 'langhandler.rb'


		# The "new" method is used to create a new SketchupExtension object. 
		# Note that once the extension object is created, it will not appear in 
    # the Extension Manager dialog until your register it with the 
    # Sketchup.register_extension method.
		DMO_test = SketchupExtension.new( 
      "DMO test", 
      "DMO_test/DMO_test_menus.rb")


		# The "name=" method sets the name which appears for an 
    # extension inside the Extensions Manager dialog.
		DMO_test.name = "DMO test"


		# The "description=" method sets the long description which appears 
    # beneath an extension inside the Extensions Manager dialog.
		DMO_test.description = "Dave's sandbox."


		# The "version" method sets the version which appears beneath an extension
    # inside the Extensions Manager dialog.  This is recommended to be a 
    # major.minor.revision versioning scheme.
		DMO_test.version = '1.00'


		# The "copyright=" method sets the copyright string which appears 
    # beneath an extension inside the Extensions Manager dialog.
		DMO_test.copyright = "2017"
		 
		 
		# The "creator=" method sets the creator string which appears beneath 
    # an extension inside the Extensions Manager dialog.
		DMO_test.creator = "D M Orchard"

		
		# The "register_extension" method is used to register an extension with 
    # SketchUp's extension manager (in SketchUp preferences). This method must
    # be called after all the SketchupExtension methods have been called 
    # (those shown above).
		Sketchup.register_extension( DMO_test, true )

		
	end # DMO_test_Extension

end # SU Extensions module
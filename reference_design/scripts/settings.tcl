# ----------------------------------------------------------------------------------
# Copyright (c) 2021 by Enclustra GmbH, Switzerland.
#
# Permission is hereby granted, free of charge, to any person obtaining a copy of
# this hardware, software, firmware, and associated documentation files (the
# "Product"), to deal in the Product without restriction, including without
# limitation the rights to use, copy, modify, merge, publish, distribute,
# sublicense, and/or sell copies of the Product, and to permit persons to whom the
# Product is furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Product.
#
# THE PRODUCT IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED,
# INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
# HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
# OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
# PRODUCT OR THE USE OR OTHER DEALINGS IN THE PRODUCT.
# ----------------------------------------------------------------------------------

# Project settings for Cosmos XZQ10 Reference Design
# Valid module codes
# CO-XZQ10-111-I
# CO-XZQ10-262-I
# CO-XZQ10-740-I
# CO-XZQ10-750-I

# ----------------------------------------------------------------------------------
# Modify this variable to select your module
if {![info exists module_name]} {set module_name CO-XZQ10-111-I}
# ----------------------------------------------------------------------------------

# ----------------------------------------------------------------------------------
# Don't modify anything beyond this line
# ----------------------------------------------------------------------------------

#if any file argument are present, use this value
if {[lindex $argv 0] != ""} { set module_name [lindex $argv 0] }

set module Cosmos_XZQ10

switch $module_name {
  CO-XZQ10-111-I {
    set part xc7z030fbg676-2 
    set PL_DDR CO-XZQ10-111-I
  }
  CO-XZQ10-262-I {
    set part xc7z030ffg676-2 
    set PL_DDR CO-XZQ10-262-I
  }
  CO-XZQ10-740-I {
    set part xc7z045ffg676-2 
    set PL_DDR CO-XZQ10-740-I
  }
  CO-XZQ10-750-I {
    set part xc7z045ffg676-2 
    set PL_DDR CO-XZQ10-750-I
  }
  default {
    puts "$module_name not available"
    break
  }
}

#create project name for design
if {![info exists project_name]} {
  set project_name ${module}
  if {[info exists baseboard]} {
    lappend project_name ${baseboard}
    puts $project_name
  } else {
    lappend project_name "top"
    puts $project_name
  }
  set project_name [string map {" " "_"} "${project_name}"]
}

puts "INFO: settings.tcl file loaded."

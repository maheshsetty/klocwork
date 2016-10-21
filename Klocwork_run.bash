#!/bin/bash
#create a local project by specifying server project
kwcheck create --url http://192.168.9.253:8080/BEL_VMS
#
#Clean your project.. <your clean command>
make clean
#
#
# Create Klocwork buildspec file (.out).
#For example : kwinject.out -o <build_spec_neme>.out <your_native_build_command>
kwinject -o kw_buildspec.out make
#The above command will generate my_project_buildspec.out in present working directory
#
# Import Klocwork buildspec file into local project for analysis
# For example, kwcheck import <Buildspec_name>.out
kwcheck import kw_buildspec.out
# port or hostname in the license file has been changed.
kwcheck set license.host=192.168.9.253 license.port=27000
#Initiate Klocwork local analysis
kwcheck run -pd .kwlp

# Export all issues in xml format
kwcheck list -pd .kwlp -y -F xml >kw_report_xml.xml


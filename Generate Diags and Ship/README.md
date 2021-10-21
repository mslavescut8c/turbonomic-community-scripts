### DISCLAIMER OF WARRANTIES:

THESE SCRIPTS AND EXAMPLE FILES ARE PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED WARRANTIES OF MERCHANTIBILITY AND FITNESS FOR A PARTICULAR PURPOSE.

UNDER NO CIRCUMSTANCES SHALL TURBONOMIC INC BE LIABLE TO YOU OR ANY OTHER PERSON FOR ANY INDIRECT, SPECIAL, INCIDENTAL, OR CONSEQUENTIAL DAMAGES OF ANY KIND RELATED TO OR ARISING OUT OF YOUR USE OF THE SCRIPTS AND EXAMPLE FILES, EVEN IF TURBONOMIC INC HAS BEEN INFORMED OF THE POSSIBILITY OF SUCH DAMAGES.

### Usage

1.	Please Open the script and provide values for the following Variables:

   * OPS_MANAGER_USERNAME=TurboAdminAcc

   * OPS_MANAGER_PASSWORD= TurboAdminAccPass

   * DIAG_PATH="PATH/TO/DIAG/FOLDER” – Leave the quotes in place.

2.	Upload the script to the Turbo Instance OVA
3.	Run the script to test the process
4.	Schedule a Cron Job

### Script Steps

1.	Gets the date and time
2.	The namespace is hard coded as turbonomic
3.	Gets the IP of the instance
4.	Logs into the instance and generates a JSESSION
5.	Creates the following directory $HOME/syslog/$namespace
6.	Sets SYSLOG_HOME variable to $HOME/syslog/$namespace
7.	Uses the JSESSIONID and runs a command to generate the diagnostic bundle
8.	Creates the log file for the script in $SYSLOG_HOME
9.	Copies the diagnostic bundle to the $DIAG_PATH
10.	Deletes logs and diags that are older than five days from the $SYSLOG_HOME directory

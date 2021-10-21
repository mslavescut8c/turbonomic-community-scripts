Usage

1.	Please Open the script and provide values for the following Variables:

    •	OPS_MANAGER_USERNAME=TurboAdminAcc

    •	OPS_MANAGER_PASSWORD= TurboAdminAccPass

    •	DIAG_PATH="PATH/TO/DIAG/FOLDER” – Leave the quotes in place.

2.	Rename the script to Gen_Diags_And_Copy.sh or whatever name you are comfortable with
3.	Upload the script to the Turbo Instance OVA
4.	Run the script to test the process
5.	Schedule a Cron Job

Script Steps

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



# #################################
# 
# #################################

# ```````````````````````````````````````````````````
# Variables to store remote server properties
astro_username=dgettings  # ** CHANGE THIS ONE, OBVIOUSLY **
astro_server=login.astro.ufl.edu
# ```````````````````````````````````````````````````

# Make an Environment Variable to simplify commands that work with
# remote servers, such as `ssh', `scp', and `sftp'
export R=${astro_username}@${astro_server}  # 'R' for 'Remote'

# Alias for quick login to remote network
alias astro="ssh -XY ${R}"

# -----------------------------
# Function for Remote Printing
# -----------------------------
remote_print (){
    # Usage: remote_print printer_name [local_file]
    # Examples: 
    #    remote_print dept ~/Desktop/local_paper.pdf
    #    remote_print --help

    user=$astro_username
    host=$astro_server

    # ## PRINTING FUNCTION ##
    [[ $# -eq 2 && ($1 != -h && $1 != --help) ]] && {
	printer_name=$1; local_file=$2; 
	ssh ${user}@${host} "lp -q 100 -H immediate -d ${printer_name} -" < ${local_file}; return; }

    ## OTHER STUFF ##
    # If no parameters given, show usage information
    [[ $# -eq 0 ]] && { 
	echo "Usage: remote_print printer_name [local_file]"; echo "Try \`remote_print --help' for more information"; 
	return; }
    # If more than 2 arguments are specified, FAIL
    [[ $# -gt 2 ]] && { echo "Too many arguments!" >&2; exit 1; }
    # Check Printer Status (Not really documented right now)
    #[[ $# -eq 1 && ($1 != -h && $1 != --help) ]] && { ssh ${user}@${host} "echo; lpstat -p ${1}; lpq -P ${1}"; return; }
    [[ $# -eq 1 && ($1 != -h && $1 != --help) ]] && { $astro "echo; lpstat -p ${1}; lpq -P ${1}"; return; }
    # Help documentation
    [[ $# -ge 1 && ($1 = -h || $1 = --help) ]] && {
    	echo "Usage: remote_print printer_name [local_file]"; echo; echo "Uses SSH to connect to the remote machine, then uses the remote machine's \`lp'";
	echo "command to send \`local_file' to the printer named \`printer_name'."; echo; echo "The remote machine hostname and username, needed for establishing the SSH";
	echo "connection, are specified in the body of the function. After calling this"; echo "function you will be prompted for your password. If you are at the UF Astronomy";
	echo "Department, you will need to be connected to the VPN for the SSH connection to"; echo "Department, you will need to be connected to the VPN for the SSH connection to";
	echo "be successful."; echo; echo "Example:"; echo "   # Prints the given PDF (from your machine) to the remote printer \`dept'"; echo "   remote_print dept ~/Desktop/local_paper.pdf";
	echo; echo "Current SSH settings:"; echo "   host = ${host}"; echo "   user = ${user}"; return; }
}


# A great guide to BASH stuff can be found here: 
#    http://mywiki.wooledge.org/BashGuide

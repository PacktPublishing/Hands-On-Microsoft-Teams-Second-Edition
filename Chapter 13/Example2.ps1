#Establishing a team owner and a new channel name definition.
$teamOwnerEmail = "john@funskating.com"
$channelName = "Procedures"

#Connecting to Microsoft Teams and getting all the teams to which the user belongs. This will include those teams where the user is an owner and member
Connect-MicrosoftTeams
$teamsWhereIam = Get-Team -User $teamOwnerEmail

#Looping through all the teams
for ($i=0; $i -lt $teamsWhereIam.length; $i++) {
	#Getting the current team group ID and the list of owners
	$groupId = $teamsWhereIam[$i].GroupId
	$teamOwners = Get-TeamUser -GroupId $groupId -Role Owner
	#Looping through the owners of the team
	for ($j=0; $j -lt $teamOwners.length; $j++) {
		#Comparing the current owner of the team with the email defined at the top of the script. If the condition is true, this means that the current team is owned by John and a new channel is then created on it
		if($teamOwners[$j].User -eq $teamOwnerEmail){
			New-TeamChannel -GroupId $groupId -DisplayName $channelName
		}
	}
}
Disconnect-MicrosoftTeams

#Define the team settings
$teamName = "Project Y"
$teamDescription = "The new generation of electric skateboards"
$teamOwner = "joao@funskating.com"
$teamVisibility = "Private"
$teamEditMessagesPolicy = $false
$teamDeliteMessagesPolicy = $false

#Define the team default channels
$teamChannels = @("Procedures", "Legal")

#Define the team default members
$teamMembers = @("josh@funskating.com", "adele@funskating.com")

#Establishing a connection to Microsoft Teams: Using this cmdlet without parameters will open a login popup and will authenticate you in your organization tenant
Connect-MicrosoftTeams

#Create the team: The result is saved to a variable to use the group ID in the following instructions
New-Team -DisplayName $teamName -Description $teamDescription -Owner $teamOwner -Visibility $teamVisibility -AllowUserEditMessages $teamEditMessagesPolicy -AllowOwnerDeleteMessages $teamDeliteMessagesPolicy

$teamDetails=Get-Team -DisplayName $teamName

#Create the channel: This loops through the channel list to create the channel. The group ID was saved in the New-Team instruction
for ($i=0; $i -lt $teamChannels.length; $i++) {
	New-TeamChannel -GroupId $teamDetails.GroupId -DisplayName $teamChannels[$i]
}

#Add the default members to the team: This loops through the array of users and adds them to the team as members
for ($i=0; $i -lt $teamMembers.length; $i++) {
	Add-TeamUser -GroupId $teamDetails.GroupId -User $teamMem-bers[$i] -role "Member"
}
Disconnect-MicrosoftTeams

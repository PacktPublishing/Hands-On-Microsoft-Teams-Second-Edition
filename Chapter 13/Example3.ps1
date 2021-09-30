#Define the list of users to whom the policy will be applied and the policy name
$users = @("joshua@handsontek.net","fred@handsontek.net")
$policyName = "CustomNewsApp"

#Establish a connection to Microsoft Teams using PowerShell
Connect-MicrosoftTeams

#Apply a batch Policy assignment to modify the Teams App Setup Policy to the users defined in the list
New-CsBatchPolicyAssignmentOperation -PolicyType TeamsApp-SetupPolicy -PolicyName $policyName -Identity $users

$NewUsers = (Import-csv C:\tmp\Accounts.csv)
$Group = 'Users'

foreach ($user in $NewUsers)
{
    $Username = $user.Username
    $Password = (ConvertTo-SecureString $user.Password -AsPlainText -Force)
    $FirstName = $user.FirstName
    $LastName = $user.LastName
    $Members = ((Get-LocalGroupMember $Group).Name -match $Username)

	if($Members)
	{
		Write-OutPut "$Username already exists"
	}
    
    else
    {
        New-LocalUser `
        -Description "$username's account" `
        -FullName "$FirstName $LastName" `
        -Name  $Username `
        -Password $Password `

        Add-LocalGroupMember -Group $Group -Member $Username
    }
}
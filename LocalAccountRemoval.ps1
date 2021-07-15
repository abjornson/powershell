#$usernames	= (Get-Content "C:\tmp\usernames.txt")
#$password	= (Read-Host -Prompt "Password" -AsSecureString) 
$NewUsers = (Import-csv C:\tmp\Accounts.csv)

foreach ($user in $NewUsers)
{
    $Username = $user.Username

	if($user)
	{
		Remove-LocalUser -Name $Username
	}
}
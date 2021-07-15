$NewUsers = (Import-csv C:\tmp\Accounts.csv)

foreach ($user in $NewUsers)
{
    $Username = $user.Username

	if($user)
	{
		Remove-LocalUser -Name $Username
	}
}
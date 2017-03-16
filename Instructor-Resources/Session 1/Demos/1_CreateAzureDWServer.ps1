######################################################################
##                PART I: Creating the Azure SQL Server             ##
######################################################################


# Sign in to Azure and set the WINDOWS AZURE subscription to work with your subscription id by replacing the xxx in the quotes.
$SubscriptionId = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxx"

Add-AzureRmAccount
Set-AzureRmContext -SubscriptionId $SubscriptionId

# CREATE A RESOURCE GROUP replacing the resource group name and resource group location with values with meaning to you
$resourceGroupName = "cto_ads_prep_rg"
$rglocation = "North Europe"

New-AzureRmResourceGroup -Name $resourceGroupName -Location $rglocation

# CREATE A SERVER with a server name, a server location that is the same as the resource group location. And a Server admin name with values with meaning to you
$serverName = "xxxxxxxxxxx"
$serverVersion = "12.0"
$serverLocation = "North Europe"

$serverAdmin = "xxxxxxxxxxx"
$serverPassword = "P@ssw0rd" 
$securePassword = ConvertTo-SecureString –String $serverPassword –AsPlainText -Force
$serverCreds = New-Object –TypeName System.Management.Automation.PSCredential –ArgumentList $serverAdmin, $securePassword

$sqlDbServer = New-AzureRmSqlServer -ResourceGroupName $resourceGroupName -ServerName $serverName -Location $serverLocation -ServerVersion $serverVersion -SqlAdministratorCredentials $serverCreds

# CREATE A SERVER FIREWALL RULE - Note that this may set the local ip address and will need checking in the Azure Portal. Also there is no option to "Allow Azure Services to access this resource" and this needs to be set in the portal
$ip = (Test-Connection -ComputerName $env:COMPUTERNAME -Count 1 -Verbose).IPV4Address.IPAddressToString
$firewallRuleName = 'Client IP address'
$firewallStartIp = $ip
$firewallEndIp = $ip

$fireWallRule = New-AzureRmSqlServerFirewallRule -ResourceGroupName $resourceGroupName -ServerName $serverName -FirewallRuleName $firewallRuleName -StartIpAddress $firewallStartIp -EndIpAddress $firewallEndIp

######################################################################
##   DO NOT EXECUTE - JUST SHOW - LOOKING AT T-SQL EXAMPLES LATER   ##
######################################################################
##               PART II: Creating the Azure DW Database            ##
######################################################################



# CREATE A SQL DATABASE
#$databaseName = "ContosoRetailDW"
#$databaseEdition = "DataWarehouse"
#$RequestedServiceObjectiveName = "DW400"

#$sqlDatabase = New-AzureRmSqlDatabase -ResourceGroupName $resourceGroupName -RequestedServiceObjectiveName $RequestedServiceObjectiveName -ServerName $serverName -DatabaseName $databaseName -Edition $databaseEdition 



# REMOVE ALL RESOURCES THE SCRIPT JUST CREATED
#Remove-AzureRmResourceGroup -Name $resourceGroupName
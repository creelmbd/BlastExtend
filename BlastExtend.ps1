$Cred = Get-Credential -Credential support@halohealth.com
#Import-Csv -Path C:\Scripts\BlastExtend\Users.csv
$Users = Import-Csv -Path 'C:\Scripts\BlastExtend\Users.csv'
$EmailBody = @"

We are reaching out to make you aware that you are using an outdated version of Halo. You will likely experience degraded performance and might be missing key features that are in use at your organization. 

To upgrade open the app store (Apple Store for iOS and Google Play Store for Android), search for Halo Health and download the application.


"@
Foreach ($User in $Users) {
$ToAddress = $User.Email
     Write-Host "Sending notification to $ToAddress" -ForegroundColor Red
Send-MailMessage -From support@halohealth.com -Subject Testing -To $User.Email -Body $EmailBody -Credential $Cred -SmtpServer smtp-mail.outlook.com -UseSsl
}


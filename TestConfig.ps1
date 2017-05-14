Configuration TeamCity
{
  Import-DscResource -ModuleName cChoco

  Node "localhost"
  {
      cChocoInstaller InstallChoco
      {
         InstallDir = "c:\choco"
       }
      Script installTeamCity
      {
        GetScript = {@{}}
        SetScript = {
          choco feature enable -n=allowGlobalConfirmation
          choco install teamcity
        }
        TestScript = {$false}

      }
   }
}

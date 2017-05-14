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
        SetScript = {choco install teamcity -y}
        TestScript = {$false}

      }
   }
}

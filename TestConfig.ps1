Configuration TeamCity
{
  Import-DscResource -ModuleName cChoco

  Node "localhost"
  {
      cChocoInstaller InstallChoco
      {
         InstallDir = "c:\choco"
       }
       File CreateFile
       {
           DestinationPath = "c:\Test.txt"
           Ensure = "Present"
           Contents = "Hello DSC from ARM with Choco"
       }
       cChocoPackageInstaller installTeamCity
 +       {
 +         Name = "teamcity"
 +         DependsOn = "[cChocoInstaller]installChoco"
 +       }

   }
}

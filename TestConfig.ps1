Configuration TeamCity
{
  Import-DscResource -ModuleName cChoco

  Node "localhost"
  {
      cChocoInstaller InstallChoco
      {
         InstallDir = "c:\choco"
       }
   }
}

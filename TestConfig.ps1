Configuration TeamCity
{
  Import-DscResource -ModuleName cChoco

  param ($MachineName)

  Node $MachineName
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
   }
}

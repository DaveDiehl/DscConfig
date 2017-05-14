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
      Script installManageDisk
      {
        GetScript = {@{}}
        SetScript = {
          Get-Disk | `
          Where partitionstyle -eq 'raw' | `
          Initialize-Disk -PartitionStyle MBR -PassThru | `
          New-Partition -AssignDriveLetter -UseMaximumSize | `
          Format-Volume -FileSystem NTFS -NewFileSystemLabel "datadisk" -Confirm:$false
        }
        TestScript = {$false}

      }
   }
}

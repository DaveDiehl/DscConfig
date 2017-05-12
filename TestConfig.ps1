Configuration TeamCity
{
  param ($MachineName)

  Node $MachineName
  {
       File CreateFile
       {
           DestinationPath = "c:\Test.txt"
           Ensure = "Present"
           Contents = "Hello DSC from ARM"
       }
   }
}

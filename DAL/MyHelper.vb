Imports System.Configuration

NotInheritable Class MyHelper

    Public Shared Function GetConnStr() As String
        Return ConfigurationManager.ConnectionStrings("SampleAPIDbConnectionString").ConnectionString
    End Function

End Class

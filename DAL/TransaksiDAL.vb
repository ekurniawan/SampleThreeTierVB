Imports System.Data.SqlClient
Imports System.Transactions
Imports Dapper
Imports Model

Public Class TransaksiDAL
    Public Function InsertTransaksi(trans As Transaksi, conn As SqlConnection) As Integer
        Dim strSql = "insert into Transaksi(Nim,IdJenis,Debet,Kredit) 
                          values(@Nim,@IdJenis,@Debet,@Kredit);
                          select @@identity"
        Dim param = New With {.Nim = trans.Nim, .IdJenis = trans.IdJenis,
            .Debet = trans.Debet, .Kredit = trans.Kredit}
        Try
            Dim transId = CInt(conn.ExecuteScalar(strSql, param))
            Return transId
        Catch sqlEx As SqlException
            Throw New Exception($"Error: {sqlEx.Message}")
        End Try
    End Function

    Public Function GetBalanceByUser(user As String, conn As SqlConnection) As Decimal
        Dim strSql = "select * from ViewBalance where Nim=@Nim"
        Dim param = New With {.Nim = user}
        Dim result = conn.QuerySingle(Of ViewBalance)(strSql, param)
        If Not IsNothing(result) Then
            Return result.Balance
        Else
            Throw New Exception("Data tidak ditemukan")
        End If
    End Function

    Public Sub UpdateBalance(transaksiID As Integer, currBalance As Decimal, conn As SqlConnection)

        Dim strSql = "update Transaksi set CurrBalance=@CurrBalance 
                          where TransaksiID=@TransaksiID"
        Dim param = New With {.CurrBalance = currBalance,
            .TransaksiID = transaksiID}
        Try
            conn.Execute(strSql, param)
        Catch sqlEx As SqlException
            Throw New Exception($"Error {sqlEx.Message}")
        End Try
    End Sub

    Public Sub InsertTransaksiBL(_trans As Transaksi)
        Using scope As New TransactionScope
            Using conn As New SqlConnection(MyHelper.GetConnStr())
                Try
                    Dim transId = InsertTransaksi(_trans, conn)
                    Dim currBalance = GetBalanceByUser(_trans.Nim, conn)
                    UpdateBalance(transId, currBalance, conn)

                    scope.Complete()
                Catch ex As Exception
                    Throw New Exception(ex.Message)
                End Try
            End Using
        End Using
    End Sub
End Class

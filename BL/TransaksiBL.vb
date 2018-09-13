Imports Model
Imports DAL

Public Class TransaksiBL
    Public Sub InsertTransaksiBL(_trans As Transaksi)
        'area untuk validasi inputan
        If _trans.Debet < 0 Then
            Throw New Exception("Kesalahan: Debet tidak boleh negatif")
        End If

        Dim _dalTrans As New TransaksiDAL
        Try
            _dalTrans.InsertTransaksiBL(_trans)
        Catch ex As Exception
            Throw New Exception($"{ex.Message}")
        End Try

    End Sub
End Class

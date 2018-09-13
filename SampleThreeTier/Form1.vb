Imports BL
Imports Model

Public Class Form1

    'menambahkan di tombol submit
    Private Sub btnSubmit_Click(sender As Object, e As EventArgs) Handles btnSubmit.Click
        Dim _transBL As New TransaksiBL
        Dim newData As New Transaksi With {
            .Nim = txtNim.Text,
            .IdJenis = CInt(txtIDJenis.Text),
            .Debet = CDec(txtDebet.Text),
            .Kredit = CDec(txtKredit.Text)}

        Try
            _transBL.InsertTransaksiBL(newData)
            MessageBox.Show("Data Berhasil Ditambah", "Keterangan")
        Catch ex As Exception
            MessageBox.Show($"Kesalahan:{ex.Message}", "Keterangan")
        End Try
    End Sub
End Class

-- 1. Buat tabel detail
CREATE TABLE PesananDetail (
    PesananDetailID INT IDENTITY(1,1) PRIMARY KEY,
    PesananID INT NOT NULL,
    ProdukID INT NOT NULL,
    Jumlah INT NOT NULL,

    CONSTRAINT FK_Detail_Header
        FOREIGN KEY (PesananID)
        REFERENCES PesananHeader(PesananID),

    CONSTRAINT FK_Detail_Produk
        FOREIGN KEY (ProdukID)
        REFERENCES Produk(ProdukID)
);
GO

-- 2. Coba hapus Pelanggan (diperkirakan gagal karena masih direferensikan)
PRINT 'Mencoba menghapus Pelanggan... (diperkirakan gagal)';

BEGIN TRY
    DROP TABLE Pelanggan;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- 3. Coba hapus PesananHeader (diperkirakan gagal karena masih direferensikan)
PRINT 'Mencoba menghapus PesananHeader... (diperkirakan gagal)';

BEGIN TRY
    DROP TABLE PesananHeader;
END TRY
BEGIN CATCH
    PRINT ERROR_MESSAGE();
END CATCH;
GO

-- 4. Hapus tabel secara berurutan, dari anak ke induk
PRINT 'Menghapus PesananDetail (tabel anak) terlebih dahulu...';
DROP TABLE PesananDetail;
GO

PRINT 'Menghapus PesananHeader (induk dari detail)...';
DROP TABLE PesananHeader;
GO

PRINT 'Menghapus Pelanggan (induk dari header)...';
DROP TABLE Pelanggan;
GO
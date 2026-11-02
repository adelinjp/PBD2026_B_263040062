    CREATE TABLE PesananHeader (
    PesananID INT IDENTITY(1,1) PRIMARY KEY,
    TanggalPesanan DATETIME2 NOT NULL,
    PelangganID INT NOT NULL,
    StatusPesanan VARCHAR(10) NOT NULL,

    CONSTRAINT FK_Pesanan_Pelanggan
        FOREIGN KEY (PelangganID)
        REFERENCES Pelanggan(PelangganID),

    CONSTRAINT CHK_StatusPesanan
        CHECK (StatusPesanan IN ('Baru', 'Proses', 'Selesai'))
);
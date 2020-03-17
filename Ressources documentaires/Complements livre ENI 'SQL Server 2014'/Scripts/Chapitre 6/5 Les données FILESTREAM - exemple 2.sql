
ALTER DATABASE gescom
  ADD FILEGROUP FilestreamGroup CONTAINS FILESTREAM;
GO
ALTER DATABASE gescom
  ADD FILE(
    name='gescom_images',
    filename=N'c:\gescom\images'
    )TO FILEGROUP FilestreamGroup;

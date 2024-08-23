-- Create table for customer accounts
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY IDENTITY(1,1),
    FullName NVARCHAR(100),
    PhoneNumber NVARCHAR(15) UNIQUE,
    Password NVARCHAR(100),
    Address NVARCHAR(255)
);

-- Create table for admin accounts
CREATE TABLE Admins (
    AdminID INT PRIMARY KEY IDENTITY(1,1),
    PhoneNumber NVARCHAR(15) UNIQUE,
    Password NVARCHAR(100)
);
CREATE TABLE QuanAoTreEm (
    maQuanAo VARCHAR(50) PRIMARY KEY,
    tenQuanAo VARCHAR(100) NOT NULL,
    gia INT NOT NULL,
    tinhTrang VARCHAR(50),
    loaiQuanAo VARCHAR(50),
    anh VARBINARY(MAX)
);

-- Insert admin account
INSERT INTO Admins (PhoneNumber, Password) VALUES ('0354142887', '19032002');
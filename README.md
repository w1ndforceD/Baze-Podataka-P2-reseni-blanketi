# Baze-Podataka-P2-reseni-blanketi
Repo sadrži zadatke i primere za **2. kolokvijum iz Baza podataka** (tema: **ADO.NET**).  
Cilj je da kroz kratke primere pokažem rad sa bazom iz C# aplikacije: konekcija, upiti, parametri, transakcije, prikaz podataka i osnovni CRUD.

---

## Tehnologije
- **C# / .NET** (Console ili WinForms/WPF – zavisi od foldera)
- **ADO.NET** (`SqlConnection`, `SqlCommand`, `SqlDataReader`, `SqlDataAdapter`, `DataSet`)
- **SQL Server** (ili druga baza ako je prilagođeno u connection stringu)

---

## Šta ima u repou
- `01-Connection/` – konekcija + test ping prema bazi
- `02-Select-Reader/` – SELECT preko `SqlDataReader`
- `03-ParameterizedQueries/` – parametri (bez SQL injection)
- `04-CRUD/` – INSERT / UPDATE / DELETE
- `05-Transactions/` – transakcije (commit/rollback)
- `06-DataAdapter-DataSet/` – rad preko `SqlDataAdapter` i `DataSet`
- `db/` – SQL skripte (kreiranje tabela, test podaci)


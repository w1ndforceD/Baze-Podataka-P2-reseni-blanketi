using System;
using Oracle.ManagedDataAccess.Client;

namespace ZaposleniProdavci
{
    class Program
    {
        static void Main(string[] args)
        {
            Console.Write("Unesite ID kompanije: ");
            int idk = int.Parse(Console.ReadLine());

            string connectionString =
                "User Id=YOUR_USER;Password=YOUR_PASSWORD;Data Source=localhost:1521/XEPDB1";

            OracleConnection conn = new OracleConnection(connectionString);

            try
            {
                conn.Open();

                string sql = @"SELECT z.ime, z.prezime
                               FROM zaposleni z, radno_mesto rm
                               WHERE z.jmbg = rm.zjmbg
                                 AND rm.idk = :idk
                                 AND rm.pozicija = 'prodavac'
                                 AND rm.datumdo IS NULL";

                OracleCommand cmd = new OracleCommand(sql, conn);
                cmd.Parameters.Add(new OracleParameter("idk", idk));

                OracleDataReader reader = cmd.ExecuteReader();

                Console.WriteLine("\nZaposleni koji trenutno rade kao prodavci:\n");

                bool imaPodataka = false;

                while (reader.Read())
                {
                    imaPodataka = true;
                    Console.WriteLine(
                        reader.GetString(0) + " " + reader.GetString(1));
                }

                if (!imaPodataka)
                {
                    Console.WriteLine("Nema zaposlenih koji ispunjavaju uslov.");
                }

                reader.Close();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Greška: " + ex.Message);
            }
            finally
            {
                conn.Close();
            }

            Console.ReadLine();
        }
    }
}

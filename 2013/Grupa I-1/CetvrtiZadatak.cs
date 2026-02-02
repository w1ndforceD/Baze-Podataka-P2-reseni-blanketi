using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Oracle.ManagedDataAccess.Client;
using System.Data;
using System.Data.OracleClient;
/*
 * 2013 II kolokvijum grupa: I-1
4)Korišćenjem programskog jezika C# i ADO.NET biblioteke napisati program (Main funkciju) koja za dokument čiji 
se naziv unosi sa tastature prikazuje matične brojeve, imena i prezimena svih zaposlenih koji imaju privilegiju za 
pisanje nad tim dokumentom. (35 poena) 
*/
namespace cetvrti_zadatak
{
    class Program
    {
        static void Main(string[] args)
        {
            OracleConnection con = new OracleConnection("Data Source=160.99.12.92/GISLAB_PD;User Id= ; Password= ");
            try
            {
                con.Open();
                
                Console.Write("Unesite naziv dokumenta: ");
                string nazivDok=Console.ReadLine();
                string upit = "select z.MBR, z.ime, z.prezime from Zaposleni z, Dokument d, pravo_pristupa p where z.mbr=p.zaposleni and d.id_dokumenta=p.dokument and p.pravo='P' and d.naziv='" + nazivDok + "'";

                OracleCommand cmd = new OracleCommand(upit, con);

                OracleDataReader dt = cmd.ExecuteReader();
                if (dt.HasRows){
                    while (dt.Read()){
                        Console.WriteLine(dt["MBR"].ToString() + " " + dt["Ime"] + " " + dt["prezime"]);
                    }
                }
                else{
                    Console.WriteLine("Niko nema pristup");
                }
            }
            catch(Exception ex)
            {
                Console.WriteLine("Greska: " + ex.ToString());
            }
            finally
            {
                con.Close();
            }
        }
    }
}
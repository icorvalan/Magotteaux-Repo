using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Excel = Microsoft.Office.Interop.Excel;
using System.Threading;
using System.IO;
using System.Windows.Forms;

namespace SQLapi
{
    class SQL_Bridge
    {

        SerialBridge.EthernetIP EthernetIP = new SerialBridge.EthernetIP();



        private string connectionString = "datasource=127.0.0.1;port=3306;username=root;password=;database=";
        private string query = "SELECT * FROM ";
        private string BaseDatos_root = "magotteaux";
        public string g_TablActual, g_CLASSNAME = "SQL_Bridge";
        public string[] g_Cabecera = new string[13];
        public string[] g_PatternCacebera = new string[4];
        public string[] g_ColumnasPallet = new string[13];
        public string[] g_BD_Pallet_Name = new string[6];
        public string[] g_CoreGlobalPallet = new string[6];
        public string[] columnaRam_ = new string[16];
        string[,] g_matrix = new string[10, 5];
        public string g_SQL_Pattern = "";
        MySqlDataReader reader;

        public SQL_Bridge(string IPplc)
        {
            GlobalPallet_view = new string[Size_Hypercubo, Size_Hypercubo, Size_Hypercubo, Size_Hypercubo];
            Init_Cabecera();
            EthernetIP.Ethernet_Init(IPplc);
        }

        /// <summary>
        /// Envia info al PLC
        /// </summary>
        public void SendEthernetIP(string Tag, string Valor)
        {

            EthernetIP.Escritura_tag(Tag, Valor);
        }
        public void SendEthernetIP(string Tag, int Valor)
        {

            EthernetIP.Escritura_tag(Tag, Valor);
        }

        public string ReadEthernetIP(string Tag)
        {
            string ValueRead = EthernetIP.Lectura_tag(Tag);

            return ValueRead;

        }
        /// <summary>
        /// Init Clase
        /// </summary>
        public bool SQL_Init(string BaseDatos)
        {
            connectionString = connectionString + BaseDatos + ";";
            Init_Cabecera();

            try
            {

                string query_Local = "SHOW FULL TABLES FROM  magotteaux";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();

                reader = commandDatabase.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0) };

                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                databaseConnection.Close();

            }
            catch (Exception err)
            {


                DarkDemo.Form1.Show_Mesaje_Log(err);
            }


            return true;
        }

        public void Set_SQL_TablaActual(string Tabla)
        {
            g_TablActual = Tabla;
        }



        /// <summary>
        /// Extarigo a informacion de GLOBAL PALLET
        /// </summary>
        /// <returns></returns>
        public List<string[]> Get_Actives_Cores()
        {


            String[] Tablas = new string[10000];
  
            try
            {

                string query_Local = "SELECT * FROM `global_pallet` ";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;
                List<string[]> GlobalPallet = new List<string[]>();

                databaseConnection.Open();

                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        string[] Cores = { reader.GetString(1).ToLower(),
                            reader.GetString(2).ToLower(),
                            reader.GetString(3).ToLower(),
                            reader.GetString(4).ToLower()};

                        if (Cores[0] == "" || Cores[0] == " ")
                        {
                            break;
                        }
                        GlobalPallet.Add(Cores);
                    }
                }
                else
                {

                }

                databaseConnection.Close();


                return GlobalPallet;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                
                return null;
            }

            return null;

        }



        /// <summary>
        /// Extarigo TODA la informacion de GLOBAL PALLET
        /// </summary>
        /// <returns></returns>
        public string[] Get_All_Actives_Cores(int ID)
        {


            //            
            string query_Local = "SELECT * FROM `global_pallet` WHERE `ID` =" + ID.ToString();
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> ActualCore = new List<string[]>();


            int N_Entidades = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows && (reader.Read()))
                {


                    string[] row = { reader.GetString(0).ToString(), reader.GetString(1).ToString(), reader.GetString(2).ToString(), reader.GetString(3).ToString(), reader.GetString(4).ToString(), reader.GetString(5).ToString(), reader.GetString(6).ToString() };

                    databaseConnection.Close();
                    return row;

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                    return null;
                }

                // Cerrar la conexión

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
            databaseConnection.Close();


            return null;

        }




        public string[] get_Tablas_Activas()
        {
            String[] Tablas = new string[10000];
            try
            {

                string query_Local = "SHOW FULL TABLES FROM  magotteaux";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();

                reader = commandDatabase.ExecuteReader();
                int Ntablas = 0;
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        Tablas[Ntablas] = reader.GetString(0).ToLower();
                        Ntablas++;
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                databaseConnection.Close();

                Array.Resize(ref Tablas, Ntablas);

                Array.Sort(Tablas);

                return Tablas;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

            }

            return null;


        }
        /// <summary>
        /// Init cabecera de la tabla
        /// </summary>
        private void Init_Cabecera()
        {


            g_Cabecera[0] = "RamCodificacion";
            g_Cabecera[1] = "Cod Core";
            g_Cabecera[2] = "Entidad_ID";
            g_Cabecera[3] = "Profundidad Agujero";
            g_Cabecera[4] = "Ref Pos X";
            g_Cabecera[5] = "Ref Pos Y";
            g_Cabecera[6] = "Ref Pos Z";
            g_Cabecera[7] = "Ref Pos A";
            g_Cabecera[8] = "Ref Pos B";
            g_Cabecera[9] = "Ref Pos C";
            g_Cabecera[10] = "DiametroTomaCore[mm]";
            g_Cabecera[11] = "PorcentajeDeteccion Core";
            g_Cabecera[12] = "Altura Patron Entidad";

            g_ColumnasPallet[0] = "C1";
            g_ColumnasPallet[1] = "C2";
            g_ColumnasPallet[2] = "C3";

            g_ColumnasPallet[3] = "Core";
            g_ColumnasPallet[4] = "P1";
            g_ColumnasPallet[5] = "P2";
            g_ColumnasPallet[6] = "P3";
            g_ColumnasPallet[7] = "P4";
            g_ColumnasPallet[8] = "P5";
            g_ColumnasPallet[9] = "P6";
            g_ColumnasPallet[10] = "P7";
            g_ColumnasPallet[11] = "P8";
            g_ColumnasPallet[12] = "P9";


            g_PatternCacebera[0] = "ID Pattern";
            g_PatternCacebera[1] = "Conteo Produccion";
            g_PatternCacebera[2] = "Limite Produccion";
            g_PatternCacebera[3] = "Sprue Position";

            g_BD_Pallet_Name[0] = "Pallet_1";
            g_BD_Pallet_Name[1] = "Pallet_2";
            g_BD_Pallet_Name[2] = "Pallet_3";
            g_BD_Pallet_Name[3] = "Pallet_4";
            g_BD_Pallet_Name[4] = "Pallet_5";
            g_BD_Pallet_Name[5] = "Pallet_6";



            g_CoreGlobalPallet[0] = "Core";
            g_CoreGlobalPallet[1] = "Pallet";
            g_CoreGlobalPallet[2] = "Segmento";
            g_CoreGlobalPallet[3] = "Cantidad";
            g_CoreGlobalPallet[4] = "Codificacion";
            g_CoreGlobalPallet[5] = "EsApilado";





            columnaRam_[0] = "Pattern";
            columnaRam_[1] = "RamCodificacion";
            columnaRam_[2] = "Cod Core";
            columnaRam_[3] = "Entidad_ID";
            columnaRam_[4] = "Profundidad Agujero";
            columnaRam_[5] = "Ref Pos X";
            columnaRam_[6] = "Ref Pos Y";
            columnaRam_[7] = "Ref Pos Z";
            columnaRam_[8] = "Ref Pos A";
            columnaRam_[9] = "Ref Pos B";
            columnaRam_[10] = "Ref Pos C";
            columnaRam_[11] = "DiametroTomaCore[mm]";
            columnaRam_[12] = "Core";
            columnaRam_[13] = "Pallet";
            columnaRam_[14] = "Segmento";
            columnaRam_[15] = "Cantidad";


        }

        /// <summary>
        /// Eliminar Tabla
        /// </summary>
        /// <param name="Tabla"></param>
        /// <returns></returns>
        public bool DropTable(string Tabla)
        {

            try
            {

                string query_Local = "DROP TABLE `" + Tabla + "`";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();
                return true;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                return false;
            }


        }
        /// <summary>
        /// Creo una Tabla en la BD
        /// </summary>       
        public bool Set_Crear_Tabla(string N_Pattern, string[] Columna)
        {
            try
            {
                string New_Col = "";
                for (int i = 0; i < Columna.Length; i++)
                {
                    New_Col = New_Col + "`" + Columna[i] + "` VARCHAR(255) NOT NULL,";

                }


                N_Pattern = "`" + N_Pattern + "`";

                string query_Local = "CREATE TABLE `magotteaux`." + N_Pattern + "( `ID` BIGINT NOT NULL AUTO_INCREMENT," + New_Col + "PRIMARY KEY(`ID`)) ENGINE = InnoDB;";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();
                return true;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
            return false;
        }

        /// <summary>
        /// Actualizo la Tabla con columna valor e ID a cambiar
        /// </summary>
        public void Set_Update_BD(string Tabla, string columna, string Valor_toChange, int WhereID)
        {
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            try
            {

                string query_Local = "UPDATE `" + Tabla + "` SET `" + columna + "` = '" + Valor_toChange + "' WHERE `" + Tabla + "`.`ID` = " + WhereID;
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                databaseConnection.Close();
            }


        }

        /// <summary>
        /// Actualizo la Tabla con nombre de columna valor e ID a cambiar
        /// </summary>
        public void Set_Update_BD_byColum(string Tabla, string columna, string Valor_toChange, string ColumnaCondicion, string WhereValor)
        {
            try
            {

                string query_Local = "UPDATE `" + Tabla + "` SET `" + columna + "` = '" + Valor_toChange + "' WHERE `" + Tabla + "`.`" + ColumnaCondicion + "` = " + WhereValor;
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

            }


        }


        /// <summary>
        /// Actualizo la Tabla con nombre de columna valor e ID a cambiar
        /// </summary>
        public void Set_Update_BD_byColum_and_More(string Tabla, string columna, string Valor_toChange, string CoreName, string pallet, string segmento)
        {
            try
            {

                string query_Local = "UPDATE `" + Tabla + "` SET `" + columna + "` = '" + Valor_toChange + "' WHERE `" + Tabla + "`.`Core` = '" + CoreName + "' AND `" + Tabla + "`.`Pallet` = '" + pallet + "'" + " AND `" + Tabla + "`.`Segmento` = '" + segmento + "'";
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

            }


        }

        /// <summary>
        /// Seteo los valores de la tabla
        /// </summary>
        /// <param name="Tabla">"Tabla de datos"</param>
        /// <param name="Columnas">"Nombre de columna"</param>
        /// <param name="ValToAdd">"Valor a agregar"</param>
        public void Set_Data_To_BD(string Tabla, string[] Columnas, string[] ValToAdd)
        {

            string New_Col = "";
            for (int i = 0; i < Columnas.Length; i++)
            {
                if (i == 0)
                {
                    New_Col = "`" + Columnas[i] + "`";
                }
                else
                {
                    New_Col = New_Col + "," + "`" + Columnas[i] + "`";
                }

            }


            string New_Add = "";
            for (int i = 0; i < ValToAdd.Length; i++)
            {
                if (i == 0)
                {
                    New_Add = "'" + ValToAdd[i] + "'";
                }
                else
                {
                    New_Add = New_Add + "," + "'" + ValToAdd[i] + "'";
                }

            }

            string query = "INSERT INTO `" + Tabla + "`(" + New_Col + ") VALUES (" + New_Add + " )";

            // Que puede ser traducido con un valor a:
            // INSERT INTO user(`id`, `first_name`, `last_name`, `address`) VALUES (NULL, 'Bruce', 'Wayne', 'Wayne Manor')

            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            try
            {
                databaseConnection.Open();
                MySqlDataReader myReader = commandDatabase.ExecuteReader();

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

            }

            databaseConnection.Close();
        }

        /// <summary>
        /// Obtengo toda la info de la BD
        /// </summary>
        public void Get_Data_Full()
        {
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            List<string> Columna = new List<string>();


            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                int Index_Fila = 1;

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0),
                                         reader.GetString(1) };

                        for (int Index_Col = 0; Index_Col < row.Length; Index_Col++)
                        {
                            g_matrix[Index_Fila, Index_Col] = row[Index_Col];

                        }
                        Index_Fila++;
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }


        }
        /// <summary>
        /// Obtengo toda la info de  de una columna en especifica de la tabla
        /// </summary>

        public string[] Get_Columna(string Columna_Name, string Tabla_Name)
        {
            String[] Columnas_Names = new string[1000];

            int Limite = 1000, Nelementos = 0;
            for (int i = 0; i < Limite; i++)
            {
                string Elemento = Get_Columna_Generic(Columna_Name, Tabla_Name, (i + 1).ToString());

                if (Elemento == " " || Elemento == "")
                {
                    Nelementos = i;
                    break;
                }

                Columnas_Names[i] = Elemento;
            }

            Array.Resize(ref Columnas_Names, Nelementos);
            return Columnas_Names;


        }
        public string Get_Columna_Generic(string Columna_Name, string Tabla_Name, string ID)
        {
            string Columnas_Names = "";

            string query_Local = "SELECT `" + Columna_Name + "` FROM " + '`' + Tabla_Name + "`  WHERE ID=" + ID;
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            string[,] matrix = new string[100, 100];
            int Ntablas = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        Columnas_Names = reader.GetString(0);
                        Ntablas++;
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();

                //Array.Resize(ref Columnas_Names, Ntablas);

                //          Array.Sort(Columnas_Names);

                return Columnas_Names;
            }
            catch (Exception err)
            {
                databaseConnection.Open();
                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }



        }


        public string[] Get_Cores_and_mangas_from_BDE(string Tabla_Name)
        {
         

            string Columna_Name = "Cod Core";
            string query_Local = "SELECT  `" + Columna_Name + "` FROM " + '`' + Tabla_Name + "` WHERE `Entidad_ID`>=2  AND `Entidad_ID`<=3";
            //SELECT `ID`,`Cod Core` FROM `6004799` WHERE `Entidad_ID`>=2 AND `Entidad_ID`<=3
            //    query_Local = "SELECT * FROM `6004799`";   
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            string[] ActualCore = new string[1000];

            int index = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();


                
                if (reader.HasRows)
                {
                    while ((reader.Read()))
                    {

                        string row = reader.GetString(0).ToString();
                        // Console.WriteLine(reader.GetString(0) + " - " + reader.GetString(1));

                        ActualCore[index] = row;
                        index++;

                        //   databaseConnection.Close();
                        //  return row;
                    }
                   
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                    return null;
                }

                // Cerrar la conexión

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
            databaseConnection.Close();

            if (index>0)
            {
                Array.Resize(ref ActualCore, index);
                Array.Sort( ActualCore);
                return ActualCore;
            }

            return null;


        }


        /// <summary>
        /// Entrego la cantidad de entidades de la BD
        /// </summary>
        public int Get_N_Entidades(string Columna_Name, string Tabla_Name)
        {

            string query_Local = "SELECT " + Columna_Name + " FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            int N_Entidades = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0) };
                        N_Entidades++;
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return N_Entidades;

        }


        /// <summary>
        /// Entrega la informacion de los Cores ubicados en cada pallet y segmento asociado.
        /// </summary>
        /// <param name="Core"></param>
        /// <param name="Tabla_Name"></param>
        /// <returns></returns>
        public List<string[]> Get_OrdenCores(string Core, string Tabla_Name)
        {

            //                    SELECT * FROM `global_pallet` WHERE Core = 'CLR' AND Cantidad> 0 
            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`" + " WHERE Core = '" + Core + "'  AND Cantidad > 0 ";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> ActualCore = new List<string[]>();
            int N_Entidades = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6) };
                        ActualCore.Add(row);
                        N_Entidades++;
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                    return null;
                }

                // Cerrar la conexión
                databaseConnection.Close();
                return ActualCore;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
            databaseConnection.Close();


            return null;

        }



        /// <summary>
        /// Leo el excel dinamico donde esta almacenada la informacion de los patterns a usar y la dstribucion de los pallet
        /// cargado la info en la BD Dinamica
        /// 
        /// </summary>
        /// <param name="Path_Excel"></param>
        /// <param name="TipoBD">"Dinamica" o "Estatica" </param>
        /// <returns></returns>
        Excel.Application xlApp;
        Excel.Workbook xlWorkBook;
        Excel.Worksheet xlWorkSheet;
        int Size_Hypercubo = 20;
        public string[,,,] GlobalPallet_view;
        public string[] g_PatternList = new string[10];
        /// <summary>
        /// Funcion que lee el archivo de la base esatatica y dinamica
        /// </summary>
        /// <param name="Path_Excel">Ruta </param>
        /// <param name="TipoBD"> Estatica o Dinamica </param>
        /// <returns></returns>
        public bool Excel(string Path_Excel, string TipoBD)
        {


            xlApp = new Excel.Application();

            if (TipoBD == "Dinamica")
            {
                try
                {


                    xlWorkBook = xlApp.Workbooks.Open(Path_Excel, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);
                    //   GlobalPallet_view = null;

                    for (int i = 0; i < Size_Hypercubo - 1; i++)
                    {
                        for (int j = 0; j < Size_Hypercubo - 1; j++)
                        {
                            for (int l = 0; l < Size_Hypercubo - 1; l++)
                            {
                                for (int k = 0; k < Size_Hypercubo - 1; k++)
                                {
                                    GlobalPallet_view[i, j, k, l] = "";
                                }
                            }
                        }
                    }


                    var TablasActivas = get_Tablas_Activas();

                    int Largo_Vector = 1500, ptr_BDdin = 1;
                    string[] SheetExcel = new string[Largo_Vector];
                    for (int i = 1; i < Largo_Vector; i++)
                    {
                        try
                        {
                            var NameSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(i);
                            if (NameSheet.Name == "BD DINAMICA")
                            {
                                ptr_BDdin = i;
                            }
                            SheetExcel[i - 1] = NameSheet.Name;

                        }
                        catch (Exception err)
                        {

                            // DarkDemo.Form1.Show_Mesaje_Log(err);

                            Array.Resize(ref SheetExcel, i - 1);
                            break;

                        }

                    }
                    xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(ptr_BDdin);

                    Excel.Worksheet excelSheet = xlWorkBook.ActiveSheet;

                    Set_BD_toWhite();
                    int PatternMaximos = 60;
                    string[] PatternList = new string[PatternMaximos];
                    string[] SpruesPatterns = new string[PatternList.Length];
                    string[] RepeticionesPattern = new string[PatternList.Length];

                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        PatternList[i] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + 4, 2]).Value2);
                        if (PatternList[i] == null)
                        {
                            Array.Resize(ref PatternList, i);
                            Array.ReferenceEquals(g_PatternList, i);
                        }
                    }


                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        SpruesPatterns[i] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + 4, 3]).Value2);

                        /*                       if (SpruesPatterns[i] == null)
                                               {
                                                   Array.Resize(ref SpruesPatterns, i);
                                                   break;}
                        */
                    }



                    for (int i = 0; i <= PatternList.Length; i++)
                    {
                        RepeticionesPattern[i] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + 4, 4]).Value2);
                        if (RepeticionesPattern[i] == null)
                        {
                            Array.Resize(ref RepeticionesPattern, i);
                            break;
                        }
                    }

                    /// Global de Patterns
                    g_PatternList = PatternList;
                    ///////////////////////////////////////////////////////


                    int RowInit = 5, ColInit = 6;
                    var pallet_1 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 6;
                    var pallet_2 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 6;
                    var pallet_3 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);

                    RowInit = 5; ColInit = 11;
                    var pallet_4 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 11;
                    var pallet_5 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 11;
                    var pallet_6 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);

                    List<string[,]> Raw_PalletList = new List<string[,]>();
                    Raw_PalletList.Add(pallet_1);
                    Raw_PalletList.Add(pallet_2);
                    Raw_PalletList.Add(pallet_3);
                    Raw_PalletList.Add(pallet_4);
                    Raw_PalletList.Add(pallet_5);
                    Raw_PalletList.Add(pallet_6);

                    Set_Update_BD_Pallet(pallet_1, g_BD_Pallet_Name[0]);
                    Set_Update_BD_Pallet(pallet_2, g_BD_Pallet_Name[1]);
                    Set_Update_BD_Pallet(pallet_3, g_BD_Pallet_Name[2]);
                    Set_Update_BD_Pallet(pallet_4, g_BD_Pallet_Name[3]);
                    Set_Update_BD_Pallet(pallet_5, g_BD_Pallet_Name[4]);
                    Set_Update_BD_Pallet(pallet_6, g_BD_Pallet_Name[5]);

                    ////////////////////////////////////////////////////////////////////////////////
                    Send_Pallet_To_Use(pallet_1, pallet_2, pallet_3, pallet_4, pallet_5, pallet_6);
                    Send_WHITE_Patter_List_to_PLC();
                    Send_Patter_List_to_PLC();
                    //////////////////////////////////////////////////////////////////////////////////
                    // Capturo la cantidad de entidades
                    //////////////////////////////////////////////////////////////////////////////////
                    RowInit = 5; ColInit = 16;
                    var NCores_pallet_1 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 16;
                    var NCores_pallet_2 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 16;
                    var NCores_pallet_3 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);

                    RowInit = 5; ColInit = 21;
                    var NCores_pallet_4 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 21;
                    var NCores_pallet_5 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 21;
                    var NCores_pallet_6 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    //////////////////////////////////////////////////////////////////////////////////
                    // Capturo si corresponden estan ordenados como columnas fijas
                    //////////////////////////////////////////////////////////////////////////////////

                    RowInit = 5; ColInit = 26;
                    var NColum_pallet_1 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 26;
                    var NColum_pallet_2 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 26;
                    var NColum_pallet_3 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);

                    RowInit = 5; ColInit = 31;
                    var NColum_pallet_4 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 13; ColInit = 31;
                    var NColum_pallet_5 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);
                    RowInit = 21; ColInit = 31;
                    var NColum_pallet_6 = Get_Pallet_user_info(excelSheet, RowInit, ColInit);

                    List<string[,]> EsApilado_List = new List<string[,]>();
                    EsApilado_List.Add(NColum_pallet_1);
                    EsApilado_List.Add(NColum_pallet_2);
                    EsApilado_List.Add(NColum_pallet_3);
                    EsApilado_List.Add(NColum_pallet_4);
                    EsApilado_List.Add(NColum_pallet_5);
                    EsApilado_List.Add(NColum_pallet_6);

                    /////////////////////////////////////////////////////////////////////////////


                    // Genero el vector globlal
                    List<string[,]> OrdenList = new List<string[,]>();
                    OrdenList.Add(NCores_pallet_1);
                    OrdenList.Add(NCores_pallet_2);
                    OrdenList.Add(NCores_pallet_3);
                    OrdenList.Add(NCores_pallet_4);
                    OrdenList.Add(NCores_pallet_5);
                    OrdenList.Add(NCores_pallet_6);


                    var segmentos_Pallet1 = Set_orden_Cores(pallet_1);
                    //                    Set_Update_BD_Pallet_orden(segmentos_Pallet1, g_BD_Pallet_Name[0]);
                    var segmentos_Pallet2 = Set_orden_Cores(pallet_2);
                    //                   Set_Update_BD_Pallet_orden(segmentos_Pallet2, g_BD_Pallet_Name[1]);
                    var segmentos_Pallet3 = Set_orden_Cores(pallet_3);
                    //                    Set_Update_BD_Pallet_orden(segmentos_Pallet3, g_BD_Pallet_Name[2]);
                    var segmentos_Pallet4 = Set_orden_Cores(pallet_4);
                    //                    Set_Update_BD_Pallet_orden(segmentos_Pallet4, g_BD_Pallet_Name[3]);
                    var segmentos_Pallet5 = Set_orden_Cores(pallet_5);
                    //                    Set_Update_BD_Pallet_orden(segmentos_Pallet5, g_BD_Pallet_Name[4]);
                    var segmentos_Pallet6 = Set_orden_Cores(pallet_6);
                    //                    Set_Update_BD_Pallet_orden(segmentos_Pallet6, g_BD_Pallet_Name[5]);


                    Get_Cores_segement_and_cant(pallet_1, NCores_pallet_1);
                    // Genero el vector globlal
                    List<string[,]> PalletList = new List<string[,]>();
                    PalletList.Add(segmentos_Pallet1);
                    PalletList.Add(segmentos_Pallet2);
                    PalletList.Add(segmentos_Pallet3);
                    PalletList.Add(segmentos_Pallet4);
                    PalletList.Add(segmentos_Pallet5);
                    PalletList.Add(segmentos_Pallet6);

                    ////////////////////////////////////////////////////////////////////////////////////
                    // Identifico los Pallet disponibles (los que tienen algo ) y envio la info al PLC
                    Get_Available_Pallet_And_SendTo_PLC(PalletList);
                    ////////////////////////////////////////////////////////////////////////////////////

                    ///////////////////////////////////////////////////////////////////////////////////

                    string[,] GlobalPallet = new string[20, 20];
                    string[] Vector_Cores_Existentes = new string[100];
                    int index = 0;
                    for (int i = 0; i < segmentos_Pallet1.GetLength(1); i++) { if (segmentos_Pallet1[i, 0] == null) { break; } else { GlobalPallet[0, i] = segmentos_Pallet1[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet1[i, 0]; index++; } }
                    for (int i = 0; i < segmentos_Pallet2.GetLength(1); i++) { if (segmentos_Pallet2[i, 0] == null) { break; } else { GlobalPallet[1, i] = segmentos_Pallet2[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet2[i, 0]; index++; } }
                    for (int i = 0; i < segmentos_Pallet3.GetLength(1); i++) { if (segmentos_Pallet3[i, 0] == null) { break; } else { GlobalPallet[2, i] = segmentos_Pallet3[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet3[i, 0]; index++; } }
                    for (int i = 0; i < segmentos_Pallet4.GetLength(1); i++) { if (segmentos_Pallet4[i, 0] == null) { break; } else { GlobalPallet[3, i] = segmentos_Pallet4[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet4[i, 0]; index++; } }
                    for (int i = 0; i < segmentos_Pallet5.GetLength(1); i++) { if (segmentos_Pallet5[i, 0] == null) { break; } else { GlobalPallet[4, i] = segmentos_Pallet5[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet5[i, 0]; index++; } }
                    for (int i = 0; i < segmentos_Pallet6.GetLength(1); i++) { if (segmentos_Pallet6[i, 0] == null) { break; } else { GlobalPallet[5, i] = segmentos_Pallet6[i, 0]; Vector_Cores_Existentes[index] = segmentos_Pallet6[i, 0]; index++; } }

                    Array.Resize(ref Vector_Cores_Existentes, index);


                    // Genero el vector con los cores y si cantidad
                    string[,] Raw_Vector_Core = new string[5000, 2];
                    int ptroRaw = 0;
                    try
                    {
                        for (int idx = 0; idx < Raw_PalletList.Count; idx++)
                        {


                            string[,] TempCore = Raw_PalletList[idx];
                            string[,] TempCant = OrdenList[idx];



                            for (int i = 0; i < TempCore.GetLength(0); i++)
                            {
                                for (int j = 0; j < TempCore.GetLength(1); j++)
                                {
                                    string Raw_Core = TempCore[i, j];
                                    string Raw_Cant = TempCant[i, j];

                                    //if (Raw_Core == " ") {continue;}

                                    string[] Raw_Core_V = Raw_Core.Split(';');
                                    string[] Raw_Cant_V = Raw_Cant.Split(';');

                                    for (int k = 0; k < Raw_Core_V.Length; k++)
                                    {
                                        Raw_Vector_Core[ptroRaw, 0] = Raw_Core_V[k];
                                        Raw_Vector_Core[ptroRaw, 1] = Raw_Cant_V[k];
                                        ptroRaw++;
                                    }

                                }
                            }


                        }



                    }
                    catch (Exception)
                    {


                        throw;

                    }


                    //Obtengo el codigo de los cores a utilizar
                    var OrdenCore = Get_CoresExistentes(Vector_Cores_Existentes);

                    // Ordeno el hyper cubo con la info
                    //No se utiliza el segemento [0,0,0,0] a [0,0,0,1]
                    // Cantidad segmento pallet CodCore 
                    //  [a]     [b]     [c]       [d]


                    //Ingreso los Cores
                    for (int i = 1; i <= OrdenCore.Length; i++)
                    {
                        GlobalPallet_view[0, 0, 0, i] = OrdenCore[i - 1];
                    }

                    //Busco el core en los pallet

                    for (int Ncore = 1; Ncore < GlobalPallet_view.GetLength(3); Ncore++)
                    {
                        string Coretemp = GlobalPallet_view[0, 0, 0, Ncore];
                        int ptro_Cant_Core = 1;

                        for (int Npallet = 0; Npallet < PalletList.Count; Npallet++)
                        {
                            string[,] PalletTemp = PalletList[Npallet];

                            int LimiteVector = PalletTemp.GetLength(1) - 1;
                            for (int ptro_ReccoroPallet = 0; ptro_ReccoroPallet < PalletTemp.GetLength(0) - 1; ptro_ReccoroPallet++)
                            {



                                if (Coretemp == PalletTemp[ptro_ReccoroPallet, 0])
                                {
                                    for (int Segmento = 1; Segmento < PalletTemp.GetLength(1) - 1; Segmento++)
                                    {
                                        ptro_Cant_Core = 1;
                                        int SegmentoPallet_Ram = Convert.ToInt32(PalletTemp[ptro_ReccoroPallet, Segmento]);
                                        if (PalletTemp[ptro_ReccoroPallet, Segmento] == null)
                                        {
                                            break;
                                        }
                                        // Guardo los segmentos que existe el core Ncore en el Pallet Npallet+1                          
                                        GlobalPallet_view[0, Segmento, Npallet + 1, Ncore] = PalletTemp[ptro_ReccoroPallet, Segmento];
                                        // busco en el segemento del pallet el core

                                        string[,] Pallet_ram = Raw_PalletList[Npallet];
                                        string[,] CantCore_ram = OrdenList[Npallet];
                                        int[] Index_ram = get_SegmentoTomatrix(Convert.ToInt32(GlobalPallet_view[0, Segmento, Npallet + 1, Ncore]));

                                        string[] Core_ram = Pallet_ram[Index_ram[0], Index_ram[1]].Split(';');
                                        int Ptero_toCant = 0;
                                        for (int ptro_ram = 0; ptro_ram < Core_ram.Length; ptro_ram++)
                                        {
                                            if (Coretemp == Core_ram[ptro_ram])
                                            {
                                                Ptero_toCant = ptro_ram;
                                                string[] Cant_ram = CantCore_ram[Index_ram[0], Index_ram[1]].Split(';');

                                                string CantidadCoreInSegmento = Cant_ram[Ptero_toCant];

                                                GlobalPallet_view[ptro_Cant_Core, Segmento, Npallet + 1, Ncore] = CantidadCoreInSegmento;
                                                ptro_Cant_Core++;
                                            }
                                        }


                                    }


                                }

                            }

                        }

                    }


                    /////////////////////////////////////////////////////////////////////////
                    // Inserto los datos de Patter y Sprue Relacionado a la Tabla Ram Sprue
                    //          Set_Ram_BD_Sprue(PatternList);
                    /////////////////////////////////////////////////////////////////////////

                    //MODIFICAR GLOBAL PALLET
                    Set_Update_BD_GlobalPallet(GlobalPallet_view, "global_pallet");
                    Set_Update_BD_Pattern(PatternList, RepeticionesPattern, SpruesPatterns);

                    Set_CodigCore_to_GlobalPallet();

                    var ColCore = Get_Columna("Core", "global_pallet");
                    var ColPallet = Get_Columna("Pallet", "global_pallet");
                    var ColSegmento = Get_Columna("Segmento", "global_pallet");



                    for (int Index = 0; Index < ColCore.Length; Index++)
                    {

                        if (ColCore[Index] == " ")
                        {
                            break;
                        }

                        int PalletSelect_int = Convert.ToInt16(ColPallet[Index]);
                        var PalletSelect = EsApilado_List[PalletSelect_int - 1];
                        var RawPallet = Raw_PalletList[PalletSelect_int - 1];

                        int Row = 0, Col = 0, ValorSegmento_int = 0;
                        string ValorSegmento = "";
                        string RawCore = "";
                        int SegmentoToCheck = Convert.ToInt16(ColSegmento[Index].ToString());

                        switch (SegmentoToCheck)
                        {
                            // segmento 1
                            case 1:
                                Row = 0; Col = 0;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 2:
                                Row = 0; Col = 1;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 3:
                                Row = 0; Col = 2;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 4:
                                Row = 1; Col = 0;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 5:
                                Row = 1; Col = 1;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;

                            case 6:
                                Row = 1; Col = 2;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 7:
                                Row = 2; Col = 0;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 8:
                                Row = 2; Col = 1;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                            case 9:
                                Row = 2; Col = 2;
                                ValorSegmento = PalletSelect[Row, Col];
                                RawCore = RawPallet[Row, Col];
                                break;
                        }


                        // Busco el subsegmento del core

                        var RawCores_SubSeg = RawCore.Split(';');
                        var ValorSegmento_sub = ValorSegmento.Split(';');
                        int ValSubsegmento = 0;
                        for (int i = 0; i < RawCores_SubSeg.Length; i++)
                        {
                            if (ColCore[Index] == RawCores_SubSeg[i])
                            {
                                ValSubsegmento = i;
                                break;
                            }
                        }

                        ValorSegmento = ValorSegmento_sub[ValSubsegmento].ToUpper();

                        //////////////////////////////////////////////////////////////////////////////////////
                        /// Defino traduccion de segmento, por si es apilado o Vertical                 //////
                        //////////////////////////////////////////////////////////////////////////////////////
                        if (ValorSegmento == "SI")
                        {
                            ValorSegmento_int = 1;
                        }
                        else if (ValorSegmento == "NO")
                        {
                            ValorSegmento_int = 0;
                        }
                        else if (ValorSegmento == "VERTICAL")
                        {
                            ValorSegmento_int = 2;
                        }
                        //////////////////////////////////////////////////////////////////////////////////////

                        Set_Update_BD_byColum_and_More("global_pallet", "EsApilado",
                            ValorSegmento_int.ToString(), ColCore[Index], PalletSelect_int.ToString(), 
                            SegmentoToCheck.ToString());
                    }



                    xlWorkBook.Close(false, null, null);
                    xlApp.Quit();


                    return true;

                }
                catch (Exception err)
                {
                    DarkDemo.Form1.Show_Mesaje_Log(err);

                }
            }

            if (TipoBD == "Estatica")
            {
                try
                {
                    xlWorkBook = xlApp.Workbooks.Open(Path_Excel, 0, true, 5, "", "", true, Microsoft.Office.Interop.Excel.XlPlatform.xlWindows, "\t", false, false, 0, true, 1, 0);


                    int Largo_Vector = 1500;

                    string[] PatternList = new string[Largo_Vector];
                    for (int i = 1; i < Largo_Vector; i++)
                    {
                        try
                        {
                            var NameSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(i);
                            PatternList[i - 1] = NameSheet.Name.ToLower();

                        }
                        catch (Exception ex)
                        {
                            Array.Resize(ref PatternList, i - 1);
                            break;

                        }

                    }



                    string[] TablaActiva = get_Tablas_Activas();
                    var TablaToDrop = "";
                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        bool Next = false;
                        for (int j = 0; j < TablaActiva.Length; j++)
                        {

                            if (TablaActiva[j] == PatternList[i])
                            {
                                TablaToDrop = TablaActiva[j];
                                Next = true;
                                break;
                            }
                        }


                        if (Next) { DropTable(TablaToDrop); Next = false; }


                        xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(i + 1);


                        DarkDemo.Form1.g_LogTextMain = "Creando Pattern ID -> " + PatternList[i];

                        Excel.Worksheet excelSheet = xlWorkSheet;/// xlWorkBook.ActiveSheet;

                        var Infopattern = Get_Pattern_Cake(excelSheet);

                        string[] NewFila = new string[Infopattern.GetLength(1)];

                        for (int l = 0; l < Infopattern.GetLength(0); l++)
                        {

                            for (int k = 0; k < Infopattern.GetLength(1); k++)
                            {
                                NewFila[k] = Infopattern[l, k];
                            }
                            if (l == 0)
                            {
                                Set_Crear_Tabla(PatternList[i], g_Cabecera);
                            }

                            Set_Data_To_BD(PatternList[i], g_Cabecera, NewFila);

                        }




                    }
                    xlWorkBook.Close(true, null, null);
                    xlApp.Quit();

                    DarkDemo.Form1.g_LogTextMain = "Carga de Datos EXITOSA!";

                    return true;

                }
                catch (Exception err)
                {

                    DarkDemo.Form1.Show_Mesaje_Log(err);
                }
            }

            
            xlWorkBook.Close(false, Path_Excel, false);
            xlApp.Quit();

            return false;
        }


        /// <summary>
        /// Genero codigos que debo compartir con la base de datos estatica
        /// </summary>
        private void Set_CodigCore_to_GlobalPallet()
        {
            var Cores_Activos = Get_Columna(g_CoreGlobalPallet[0], "global_pallet");
            int Coding_Int = 101;

            Set_Update_BD("global_pallet", g_CoreGlobalPallet[4], Coding_Int.ToString(), 1);




            for (int i = 1; i < Cores_Activos.Length; i++)
            {

                if (Cores_Activos[i] == " ") { break; }

                if (Cores_Activos[i] == Cores_Activos[i - 1])
                {
                    Set_Update_BD("global_pallet", g_CoreGlobalPallet[4], Coding_Int.ToString(), i + 1);
                }
                else
                {

                    Coding_Int = Coding_Int + 1;
                    Set_Update_BD("global_pallet", g_CoreGlobalPallet[4], Coding_Int.ToString(), i + 1);

                }
            }
        }


        /// <summary>
        /// Borro los elementos escritos en el vector
        /// </summary>
        private void Send_Patter_List_to_PLC()
        {
            string TagToWrite = "_EBD_I_PatternList[";
            for (int i = 0; i < g_PatternList.Length; i++)
            {

                try
                {
                    string TagPLC = TagToWrite + (i + 1).ToString() + "]";
                    EthernetIP.Escritura_tag(TagPLC, g_PatternList[i]);

                }
                catch (Exception err)
                {

                    DarkDemo.Form1.Show_Mesaje_Log(err);
                    //   EthernetIP.Escritura_tag(TagToWrite + (i).ToString() + "]", " ");
                }

            }
        }

        private void Send_WHITE_Patter_List_to_PLC()
        {
            string TagToWrite = "_EBD_I_PatternList[";
            for (int i = 0; i < g_PatternList.Length; i++)
            {

                try
                {
                    string TagPLC = TagToWrite + (i + 1).ToString() + "]";
                    EthernetIP.Escritura_tag(TagPLC, "");

                }
                catch (Exception err)
                {

                    DarkDemo.Form1.Show_Mesaje_Log(err);
                    //   EthernetIP.Escritura_tag(TagToWrite + (i).ToString() + "]", " ");
                }

            }
        }

        /// <summary>
        /// Escribe en la variable del PLC si el Pallet esta disponible.
        /// </summary>
        /// <param name="pallet_1"></param>
        /// <param name="pallet_2"></param>
        /// <param name="pallet_3"></param>
        /// <param name="pallet_4"></param>
        /// <param name="pallet_5"></param>
        /// <param name="pallet_6"></param>
        private void Send_Pallet_To_Use(string[,] pallet_1, string[,] pallet_2, string[,] pallet_3, string[,] pallet_4, string[,] pallet_5, string[,] pallet_6)
        {
            int[] Pallet_To_Use = new int[6];

            Pallet_To_Use[0] = Get_Pallet_to_Use(pallet_1);
            Pallet_To_Use[1] = Get_Pallet_to_Use(pallet_2);
            Pallet_To_Use[2] = Get_Pallet_to_Use(pallet_3);
            Pallet_To_Use[3] = Get_Pallet_to_Use(pallet_4);
            Pallet_To_Use[4] = Get_Pallet_to_Use(pallet_5);
            Pallet_To_Use[5] = Get_Pallet_to_Use(pallet_6);

            string TagToWrite = "_EBD_I_Pallet_a_Usar.";

            for (int i = 0; i < Pallet_To_Use.Length; i++)
            {
                EthernetIP.Escritura_tag(TagToWrite + (i + 1).ToString(), Pallet_To_Use[i]);
            }
        }

        private static int Get_Pallet_to_Use(string[,] pallet_1)
        {
            int Conteo = 0;
            for (int i = 0; i < pallet_1.GetLength(0); i++)
            {
                for (int j = 0; j < pallet_1.GetLength(1); j++)
                {
                    if (pallet_1[i, j] == " ")
                    {
                        Conteo++;
                    }
                }

            }

            if (Conteo == pallet_1.Length)
            {
                return 0;
            }

            return 1;

        }

        /// <summary>
        /// Inserto las variables iniciales del la Ram_Sprue, como existentes.
        /// </summary>
        /// <param name="PatternList"></param>
        private void Set_Ram_BD_Sprue(string[] PatternList)
        {
            int NCol = 1, N_Col = 8;
            for (int i = 0; i < PatternList.Length; i = i + 2)
            {
                Set_Update_BD("ram_sprues", "N" + (NCol).ToString(), PatternList[i], 1);
                NCol++;
            }
            NCol = 1;
            for (int i = 1; i <= (PatternList.Length / 2); i++)
            {
                Set_Update_BD("ram_sprues", "N" + (i).ToString(), "O", 2);

            }
        }

        /// <summary>
        /// Envio los pallet activos al PLC luego de cargar la BDD
        /// </summary>
        /// <param name="PalletList"></param>
        private void Get_Available_Pallet_And_SendTo_PLC(List<string[,]> PalletList)
        {
            int[] Vector_Pallet_Toused = new int[PalletList.Count];

            for (int i = 0; i < PalletList.Count; i++)
            {
                int ContVacios = 0;
                var PalletRam = PalletList[i];

                for (int j = 0; j < PalletRam.GetLength(0); j++)
                {
                    for (int k = 0; k < PalletRam.GetLength(1); k++)
                    {
                        if (PalletRam[j, k] == null)
                        {
                            ContVacios++;
                        }

                        int MatrixRam = PalletRam.GetLength(0) * PalletRam.GetLength(1);

                        if (ContVacios == MatrixRam)
                        {
                            Vector_Pallet_Toused[i] = 0;
                        }
                        else
                        {
                            Vector_Pallet_Toused[i] = 1;
                        }

                    }
                }

            }

            for (int i = 0; i < Vector_Pallet_Toused.Length; i++)
            {

                string Tag = "_EBD_I_Pallet_a_Usar." + (i + 1).ToString();

                SendEthernetIP(Tag, Vector_Pallet_Toused[i].ToString());
            }
        }

        public void Close_Excel()
        {
            try
            {
                xlApp.Quit();
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

            }
        }
        private string[,] Get_Pallet_user_info(Excel.Worksheet excelSheet, int RowInit, int ColInit)
        {
            string[,] Pallet_Core = new string[3, 3];
            int Nnulls = 0;
            for (int i = 0; i < Pallet_Core.GetLength(0); i++)
            {
                for (int j = 0; j < Pallet_Core.GetLength(0); j++)
                {
                    Pallet_Core[i, j] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + RowInit, j + ColInit]).Value2);
                    if (Pallet_Core[i, j] == null)
                    {
                        Pallet_Core[i, j] = " ";
                        Nnulls++;
                    }
                }

            }
            return Pallet_Core;
        }
        private void Set_Update_BD_Pallet(string[,] pallet, string Pallet_Name)
        {
            for (int i = 0; i < pallet.GetLength(0); i++)
            {
                for (int j = 0; j < pallet.GetLength(0); j++)
                {
                    Set_Update_BD(Pallet_Name, g_ColumnasPallet[j], pallet[i, j], i + 1);
                }

            }
        }
        /// <summary>
        /// Seteo los valores para deternimar el numero de veces que se a producido cada pattern
        /// </summary>
        /// <param name="pattern_Name"></param>
        /// <param name="LimiteProduccion"></param>
        private void Set_Update_BD_Pattern(string[] pattern_Name, string[] LimiteProduccion, string[] SpruesPosition)
        {
            for (int i = 0; i < pattern_Name.Length; i++)
            {
                Set_Update_BD("pattern_produccion", g_PatternCacebera[0], pattern_Name[i], i + 1);
                Set_Update_BD("pattern_produccion", g_PatternCacebera[1], "0", i + 1);
                Set_Update_BD("pattern_produccion", g_PatternCacebera[2], LimiteProduccion[i], i + 1);

                if (SpruesPosition[i] == null)
                {

                    string NO_Position = "X";
                    Set_Update_BD("pattern_produccion", g_PatternCacebera[3], NO_Position, i + 1);


                }
                else
                {

                    Set_Update_BD("pattern_produccion", g_PatternCacebera[3], SpruesPosition[i], i + 1);

                }


            }

        }
        private string[,] Get_Pattern_Cake(Excel.Worksheet excelSheet)
        {
            string[,] Pattern_info = new string[5000, 20];

            int asd = Pattern_info.GetLength(0);

            for (int i = 0; i < Pattern_info.GetLength(0); i++)
            {
                for (int j = 0; j < Pattern_info.GetLength(1); j++)
                {

                    Pattern_info[i, j] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + 2, j + 1]).Value2);

                    if (Pattern_info[i, j] == null)
                    {
                        break;
                    }
                }

            }

            int maxFila = 1, maxCol = 1;
            for (int i = 0; i < Pattern_info.GetLength(0); i++)
            {
                if (Pattern_info[i, 0] == null)
                {
                    maxFila = i;
                    break;
                }

            }
            for (int i = 0; i < Pattern_info.GetLength(1); i++)
            {
                if (Pattern_info[0, i] == null)
                {
                    maxCol = i;
                    break;
                }

            }


            string[,] NewPattern_info = new string[maxFila, maxCol];
            for (int i = 0; i < maxFila; i++)
            {
                for (int j = 0; j < maxCol; j++)
                {
                    NewPattern_info[i, j] = Pattern_info[i, j];

                    if (Pattern_info[i, j] == null)
                    {
                        break;
                    }
                }

            }


            return NewPattern_info;

        }
        private string[,] Set_orden_Cores(string[,] Cores)
        {

            // 1.* Paso a vector
            int Nelementos = 0, idexVector = 0;
            string[] VectorCores = new string[100];
            string[] VectorCores_Aux = new string[9];
            for (int i = 0; i < Cores.GetLength(0); i++)
            {
                string Newvector = "";
                for (int j = 0; j < Cores.GetLength(1); j++)
                {
                    Newvector = Cores[i, j];
                    VectorCores_Aux[idexVector] = Cores[i, j];
                    idexVector++;

                    var AuxVector = Newvector.Split(';');

                    for (int k = 0; k < AuxVector.Length; k++)
                    {
                        VectorCores[Nelementos] = AuxVector[k];
                        Nelementos++;
                    }

                }

            }

            Array.Resize(ref VectorCores, Nelementos);

            string[,] CoresFilter = new string[Nelementos, 100];

            // Busco en que segmento se encuentra cada uno
            int ptro_idx = 0;
            for (int i = 0; i < VectorCores.Length; i++)
            {
                string CoreTemp = VectorCores[i];
                if (CoreTemp == " ")
                {
                    continue;
                }

                for (int j = 0; j < VectorCores.Length; j++)
                {
                    if (CoreTemp == VectorCores[j])
                    {
                        VectorCores[j] = " ";
                    }
                }


                //busco en la matrix
                int index = 0;
                CoresFilter[ptro_idx, index] = CoreTemp;
                index++;
                for (int k = 0; k < VectorCores_Aux.Length; k++)
                {

                    string Newvector = VectorCores_Aux[k];

                    var AuxVector = Newvector.Split(';');

                    for (int h = 0; h < AuxVector.Length; h++)
                    {
                        if (CoreTemp == AuxVector[h])
                        {
                            CoresFilter[ptro_idx, index] = (k + 1).ToString();
                            index++;
                        }

                    }


                }

                ptro_idx++;

            }


            return CoresFilter;
        }

        public string Get_BD_Pallet_ToSendSerial(string Tabla_Name)
        {


            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            string[,] matrix = new string[100, 100];
            int fila = 0;
            string DataSendSerial = "";
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                string[] Filas = new string[3];
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        Filas[fila] = reader.GetString(1) + "||" + reader.GetString(2) + "||" + reader.GetString(3);

                        fila++;
                    }
                    DataSendSerial = Filas[0] + "#" + Filas[1] + "#" + Filas[2];
                    return DataSendSerial;
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                databaseConnection.Close();
            }
            return DataSendSerial;

        }

        private void Set_Update_BD_Pallet_orden(string[,] pallet, string Pallet_Name)
        {
            try
            {


                for (int i = 0; i < pallet.GetLength(0); i++)
                {
                    for (int j = 0; j < pallet.GetLength(1); j++)
                    {
                        if (pallet[i, j] == null)
                        {
                            break;
                        }

                        Set_Update_BD(Pallet_Name, g_ColumnasPallet[3 + j], pallet[i, j], i + 1);
                    }

                }

            }
            catch (Exception)
            {

                int asd = 0;
            }

        }
        /// <summary>
        /// Desde el hypercubo seteo el global pallet indicando donde esta cada elemento.
        /// </summary>
        /// <param name="Global_Pallet"></param>
        /// <param name="Pallet_Name"></param>
        private void Set_Update_BD_GlobalPallet(string[,,,] Global_Pallet, string Pallet_Name)
        {
            string core = "";
            int IDglobal = 1;

            //1.- Busco el core que se me esta preguntando
            int largo = Global_Pallet.GetLength(0) - 1;
            int ptro_Core = 0;

            for (int j = 1; j < largo; j++)
            {
                if (Global_Pallet[0, 0, 0, j] == null)
                {
                    break;
                }

                core = Global_Pallet[0, 0, 0, j];

                ptro_Core = j;


                //2. busco los pallets en que se encuentra.

                for (int ptro_Pallet_Prod = 1; ptro_Pallet_Prod < largo; ptro_Pallet_Prod++)
                {
                    for (int ptro_segmento = 1; ptro_segmento < largo; ptro_segmento++)
                    {
                        for (int ptro_cantidad = 1; ptro_cantidad < largo; ptro_cantidad++)
                        {
                            string Val = Global_Pallet[ptro_cantidad, ptro_segmento, ptro_Pallet_Prod, ptro_Core];
                            if (Val == null || Val == "")
                            {
                                continue;
                            }
                            string SegmentoUtil = Global_Pallet[0, ptro_segmento, ptro_Pallet_Prod, ptro_Core];


                            string Info = "El Core " + Global_Pallet[0, 0, 0, ptro_Core] + " en el PALLET " + ptro_Pallet_Prod.ToString() + " en SEGMENTO " + SegmentoUtil + " Tiene " + Val.ToString() + " [Und]";

                            DarkDemo.Form1.g_LogTextMain = Info;

                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[0], Global_Pallet[0, 0, 0, ptro_Core], IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[1], ptro_Pallet_Prod.ToString(), IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[2], SegmentoUtil, IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[3], Val.ToString(), IDglobal);


                            //       while (DarkDemo.Form1.g_LogTextMain != "-1") { }
                            IDglobal++;
                            // MessageBox.Show("Continuar?");
                        }

                    }




                }





            }




        }


        private string[] Get_CoresExistentes(string[] Vector_Cores_Existentes)
        {

            var CopyAux = Vector_Cores_Existentes;

            //busco si se repiten los pallet
            string CoreTemp = CopyAux[0];
            string[] OrdenCore = new string[Vector_Cores_Existentes.Length];
            OrdenCore[0] = CoreTemp;
            int contador = 0;

            for (int i = 0; i < Vector_Cores_Existentes.Length; i++)
            {
                OrdenCore[contador] = CopyAux[i];
                if (OrdenCore[contador] == null || OrdenCore[contador] == "")
                {
                    continue;
                }
                for (int j = 0; j < Vector_Cores_Existentes.Length; j++)
                {
                    if (OrdenCore[contador] == CopyAux[j])
                    {
                        CopyAux[j] = "";
                    }
                }
                contador++;
            }
            Array.Resize(ref OrdenCore, contador);

            return OrdenCore;

        }
        private void Get_Cores_segement_and_cant(string[,] Cores, string[,] Cant)
        {
            // 1.* Paso a vector
            int Nelementos = 0, idexVector = 0;
            string[] VectorCores = new string[100];
            string[] VectorCores_Aux = new string[9];
            for (int i = 0; i < Cores.GetLength(0); i++)
            {
                string Newvector = "";
                for (int j = 0; j < Cores.GetLength(1); j++)
                {
                    Newvector = Cores[i, j];
                    VectorCores_Aux[idexVector] = Cores[i, j];
                    idexVector++;

                    var AuxVector = Newvector.Split(';');

                    for (int k = 0; k < AuxVector.Length; k++)
                    {
                        VectorCores[Nelementos] = AuxVector[k];
                        Nelementos++;
                    }

                }

            }

            Array.Resize(ref VectorCores, Nelementos);



            // 1.* Paso a vector
            int Nelementos_ctn = 0, idexVector_ctn = 0;
            string[] VectorCores_ctn = new string[100];
            string[] VectorCores_Aux_ctn = new string[9];
            for (int i = 0; i < Cores.GetLength(0); i++)
            {
                string Newvector = "";
                for (int j = 0; j < Cores.GetLength(1); j++)
                {
                    Newvector = Cant[i, j];
                    VectorCores_Aux_ctn[idexVector_ctn] = Cores[i, j];
                    idexVector_ctn++;

                    var AuxVector = Newvector.Split(';');

                    for (int k = 0; k < AuxVector.Length; k++)
                    {
                        VectorCores_ctn[Nelementos] = AuxVector[k];
                        Nelementos_ctn++;
                    }

                }

            }

            Array.Resize(ref VectorCores_ctn, Nelementos_ctn);


        }
        private int[] get_SegmentoTomatrix(int segmento)
        {

            int[] matrix = new int[2];

            if (segmento == 1 || segmento == 2 || segmento == 3) { matrix[0] = 0; }
            if (segmento == 4 || segmento == 5 || segmento == 6) { matrix[0] = 1; }
            if (segmento == 7 || segmento == 8 || segmento == 9) { matrix[0] = 2; }

            if (segmento == 1 || segmento == 4 || segmento == 7) { matrix[1] = 0; }
            if (segmento == 2 || segmento == 5 || segmento == 8) { matrix[1] = 1; }
            if (segmento == 3 || segmento == 6 || segmento == 9) { matrix[1] = 2; }

            return matrix;


        }




        /// <summary>
        /// Funcion que actuliza la tabla de produccion actual
        /// </summary>
        /// <param name="IDPatter"> Codigo del patter (Ej.6000733) </param>
        /// <param name="indexCore">inde x del orden de insercion </param>
        /// <returns></returns>
        public bool Get_Ram_Info(int IDPatter, int indexCore)
        {

            try
            {
                string Pattern = Get_IdPattern(IDPatter + 1);
                string[] PatternActual = Get_IdPattern_Insercion(Pattern, indexCore);

                string CoreActual = PatternActual[1].ToUpper();

                /////////////////////////////////////////////////
                /// Seteo la Codificacion a 0 por defecto //////
                string TagToWrite = "_EV01_I_CodEntidad";
                SendEthernetIP(TagToWrite, 0);
                /////////////////////////////////////////////////
                if (CoreActual == "PIN1" || CoreActual == "PIN2")
                {
                    Send_Info_Pines(Pattern, PatternActual);
                }
                else if (CoreActual.Contains("LOC"))
                {
                    Send_Info_Localicator(Pattern, PatternActual, CoreActual);
                }
                else if (CoreActual == "SPRUE")
                {
                    int SprueSeccion = Get_SpruesActives(Pattern);
                    string N_PosicionRack = Get_VectorSpruesActives(Pattern);
                    Set_Ram_Sprue(SprueSeccion - 1, "X");
                    Send_Info_Sprues(Pattern, PatternActual, SprueSeccion.ToString());

                }
                else if (CoreActual == "NUMDEC")
                {
                    int Decena, Unidad, DecenaAnt, UnidadAnt;
                    Get_DecenaAndUnidad(out Decena, out Unidad, "Actual");
                    Get_DecenaAndUnidad(out DecenaAnt, out UnidadAnt, "Anterior");

                    Send_Info_NUMS(Pattern, PatternActual, Decena, DecenaAnt);
                }
                else if (CoreActual == "NUMUNID")
                {
                    int Decena, Unidad, DecenaAnt, UnidadAnt;
                    Get_DecenaAndUnidad(out Decena, out Unidad, "Actual");
                    Get_DecenaAndUnidad(out DecenaAnt, out UnidadAnt, "Anterior");

                    Send_Info_NUMS(Pattern, PatternActual, Unidad, UnidadAnt);



                }
                else if (CoreActual.Contains("DOWEL"))
                {


                    Send_Info_Dowel(Pattern, PatternActual, CoreActual);
                }

                else if (CoreActual.Contains("LID") == true)
                {

                    Send_Info_Lid(Pattern, PatternActual, CoreActual);


                }
                else if (CoreActual.Contains("SLEEVE") == true)
                {

                    Send_Info_Sleeve(Pattern, PatternActual, CoreActual);


                }
                else if (CoreActual.Contains("PATTERN"))
                {
                    Send_Info_Pattern(Pattern, PatternActual, CoreActual);
                }
                else
                {
                    if (Send_Info_Cores(Pattern, PatternActual, CoreActual))
                    {
                        return true;
                    }
                    else
                    {

                        return false;
                    }
                }

                return true;

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                return false;
            }

            // actualizo el core, ya que se eliminara 1


        }



        /// <summary>
        /// ENVIO DE PULSOS BD
        /// </summary>
        /// <param name="Procesando"></param>
        public void Send_Procesando_BD(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD_I_Procesando", Procesando);

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }


        }
        public void Send_Resultado_BD(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD_I_Resultado", Procesando);
                Thread.Sleep(100);
                EthernetIP.Escritura_tag("_EBD_I_Resultado", 0);
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }


        }
        public void Send_ProcesandoAndResultado(int Procesando, int Resultado)
        {

            try
            {
                EthernetIP.Escritura_tag("_EBD_I_Resultado", Resultado);
                EthernetIP.Escritura_tag("_EBD_I_Procesando", Procesando);
                Thread.Sleep(100);
                EthernetIP.Escritura_tag("_EBD_I_Resultado", 0);

            }
            catch (Exception err)
            {

                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
        }

        public void Send_Pulso_PLC(string tag, int ValorOn, int ValorOff, int Delay)
        {
            try
            {
                EthernetIP.Escritura_tag(tag, ValorOn);
                Thread.Sleep(Delay);
                EthernetIP.Escritura_tag(tag, ValorOff);

            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
        }
        public void Send_Pulse_Error()
        {
            //////////////////////////////////
            Send_Procesando_BD(0); ///////////
            Send_Resultado_BD(2);  ///////////
            //////////////////////////////////
        }

        private void Send_Pulse_Finish()
        {

            //////////////////////////////////
            Send_Procesando_BD(0); ///////////
            Send_Resultado_BD(1);  ///////////                         
                                   //////////////////////////////////
        }


        private void Send_Pulse_Init()
        {

            //////////////////////////////////
            Send_Procesando_BD(1); ///////////
            Send_Resultado_BD(0);  ///////////                         
            //////////////////////////////////
        }




        private void Get_DecenaAndUnidad(out int Decena, out int Unidad, string ActualORAnterior)
        {
            string[] ConteoColum = Get_Columna("Conteo Produccion", "pattern_produccion");
            string[] PatternColum = Get_Columna("ID Pattern", "pattern_produccion");
            int FlagToPattern = 0;
            for (int i = 0; i < PatternColum.Length - 1; i++)
            {
                if (PatternColum[i] == Get_PatternString())
                {
                    FlagToPattern = i;
                    break;
                }

            }
            int NumActualPatter = Convert.ToInt16(ConteoColum[FlagToPattern]);

            if (ActualORAnterior == "Anterior")
            {
                NumActualPatter = NumActualPatter - 1;
            }

            // Convierto NumActualPatter a un string de 2 valores
            Decena = NumActualPatter / 10;
            Unidad = Convert.ToInt16((-Convert.ToDouble(Decena) * 10) + Convert.ToDouble(NumActualPatter));
        }
        private bool Send_Info_Cores(string Pattern, string[] PatternActual, string CoreActual)
        {


            SendEthernetIP("_EV01_I_CodEntidad", 0);
            SendEthernetIP("_EV01_I_FotoApilado", 0);


            var Cores_Distribution = Get_OrdenCores(CoreActual, "global_pallet");
            if (Cores_Distribution == null)
            {
                Send_Pulse_Error();
                DarkDemo.Form1.Show_Mesaje_Log("### ERROR de STOCK en CORE -> " + CoreActual);
                return false;
            }


            var CantCore = Cores_Distribution[0];

            int ValorActualDeCore = Convert.ToInt16(CantCore[4].ToString());

            string[] Core_Actual = Cores_Distribution[0];

            int LargoVector = PatternActual.Length + Core_Actual.Length + 3;

            string[] Valores = new string[LargoVector];
            Valores[0] = Pattern;
            for (int i = 1; i <= PatternActual.Length; i++)
            {
                Valores[i] = PatternActual[i - 1];
            }
            for (int i = 0; i < Core_Actual.Length; i++)
            {
                Valores[PatternActual.Length + 1 + i] = Core_Actual[i];
            }

            /*
                        for (int Npattern = 0; Npattern < g_PatternList.Length - 1; Npattern++)
                        {
                            if (Valores[0] == g_PatternList[Npattern])
                            {

                                var ValoresSprue = Get_SpruesPositionActives(Npattern);
                                Valores[17] = ValoresSprue[0];
                            }
                        }
            */


            ///CAMBIAR EL LIMITE
            for (int i = 0; i <= 11; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i], 1);
            }

            for (int i = 12; i <= 15; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i + 1], 1);
            }



            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores[3]);

            //////////////////////////////////////////////
            // PENDIENTE agregar el Z optimo
            ///////////////////////////////////////////////
            TagToWrite = "_EV01_I_EjeZZ";
            SendEthernetIP(TagToWrite, "1100");

            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores[i] = new string(charArr);
                        break;
                    }
                }



            }

            double Offset_X = 0, Offset_Y = 0, Offset_Z = 0;
            double Val_X = Convert.ToDouble(Valores[5]) + Offset_X;
            double Val_Y = Convert.ToDouble(Valores[6]) + Offset_Y;
            double Val_Z = Convert.ToDouble(Valores[7]) + Offset_Z;
            Valores[5] = Val_X.ToString();
            Valores[6] = Val_Y.ToString();
            Valores[7] = Val_Z.ToString();


            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores[5 + i]);
            }

            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores[14]);

            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, Valores[15]);

            //////////////////
            /// Codificacion
            ///////////////// 
            TagToWrite = "_EV01_I_CodEntidad";
            SendEthernetIP(TagToWrite, Core_Actual[5]);
            Set_Update_BD("ram_actualproduction", "RamCodificacion", Core_Actual[5], 1);

            ////////////////
            /// EsApilado
            ////////////////

            TagToWrite = "_EV01_I_FotoApilado";
            if (Valores[4] == "SI_Apilado")
            {
                SendEthernetIP(TagToWrite, 1);
                Set_Update_BD("ram_actualproduction", "EsApilado", "1", 1);
            }
            else
            {
                SendEthernetIP(TagToWrite, 0);
                Set_Update_BD("ram_actualproduction", "EsApilado", "0", 1);
            }




            return true;

        }
        private bool Send_Info_Sleeve(string Pattern, string[] PatternActual, string CoreActual)
        {
            SendEthernetIP("_EV01_I_CodEntidad", 0);
            SendEthernetIP("_EV01_I_FotoApilado", 0);

            var Cores_Distribution = Get_OrdenCores(CoreActual, "global_pallet");
            if (Cores_Distribution == null)
            {
                //   Send_Pulse_Error();
                DarkDemo.Form1.Show_Mesaje_Log("### ERROR de STOCK en CORE -> " + CoreActual);
                return false;
            }

            var CantCore = Cores_Distribution[0];

            int ValorActualDeCore = Convert.ToInt16(CantCore[4].ToString());

            string[] Core_Actual = Cores_Distribution[0];

            int LargoVector = PatternActual.Length + Core_Actual.Length + 3;


            string[] Valores = new string[LargoVector];
            Valores[0] = Pattern;
            for (int i = 1; i <= PatternActual.Length; i++)
            {
                Valores[i] = PatternActual[i - 1];
            }
            for (int i = 0; i < Core_Actual.Length; i++)
            {
                Valores[PatternActual.Length + 1 + i] = Core_Actual[i];
            }






            ///CAMBIAR EL LIMITE
            for (int i = 0; i <= 11; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i], 1);
            }

            for (int i = 12; i <= 15; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i + 1], 1);
            }


            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores[3]);

            //////////////////////////////////////////////
            // PENDIENTE agregar el Z optimo
            ///////////////////////////////////////////////

            TagToWrite = "_EV01_I_EjeZZ";
            SendEthernetIP(TagToWrite, "2430");



            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores[i] = new string(charArr);
                        break;
                    }
                }



            }

            double Offset_X = 0, Offset_Y = -10 * 0, Offset_Z = 0;
            double Val_X = Convert.ToDouble(Valores[5]) + Offset_X;
            double Val_Y = Convert.ToDouble(Valores[6]) + Offset_Y;
            double Val_Z = Convert.ToDouble(Valores[7]) + Offset_Z;
            Valores[5] = Val_X.ToString();
            Valores[6] = Val_Y.ToString();
            Valores[7] = Val_Z.ToString();


            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores[5 + i]);
            }

            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores[14]);

            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, "1");


            //////////////////
            /// Codificacion
            ///////////////// 
            TagToWrite = "_EV01_I_CodEntidad";
            SendEthernetIP(TagToWrite, Core_Actual[5]);
            Set_Update_BD("ram_actualproduction", "RamCodificacion", Core_Actual[5], 1);

            ////////////////
            /// EsApilado
            ////////////////

            TagToWrite = "_EV01_I_FotoApilado";

            SendEthernetIP(TagToWrite, 0);
            Set_Update_BD("ram_actualproduction", "EsApilado", "0", 1);




            return true;
        }
        private bool Send_Info_Lid(string Pattern, string[] PatternActual, string CoreActual)
        {


            int LargoVector = PatternActual.Length + 1 + 3;



            string[] Valores = new string[LargoVector];
            Valores[0] = Pattern;
            for (int i = 1; i <= PatternActual.Length; i++)
            {
                Valores[i] = PatternActual[i - 1];
            }





            ///CAMBIAR EL LIMITE
            for (int i = 0; i < 12; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i], 1);
            }


            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores[3]);

            //////////////////////////////////////////////
            // PENDIENTE agregar el Z optimo
            ///////////////////////////////////////////////

            return true;
        }
        private bool Send_Info_Dowel(string Pattern, string[] PatternActual, string CoreActual)
        {


            int LargoVector = PatternActual.Length + 1 + 3;



            string[] Valores = new string[LargoVector];
            Valores[0] = Pattern;
            for (int i = 1; i <= PatternActual.Length; i++)
            {
                Valores[i] = PatternActual[i - 1];
            }





            ///CAMBIAR EL LIMITE
            for (int i = 0; i < 12; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i], 1);
            }


            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores[3]);

            //////////////////////////////////////////////
            // PENDIENTE agregar el Z optimo
            ///////////////////////////////////////////////

            return true;
        }
        private bool Send_Info_Pattern(string Pattern, string[] PatternActual, string CoreActual)
        {


            int LargoVector = PatternActual.Length + 1 + 3;



            string[] Valores = new string[LargoVector];
            Valores[0] = Pattern;
            for (int i = 1; i <= PatternActual.Length; i++)
            {
                Valores[i] = PatternActual[i - 1];
            }





            ///CAMBIAR EL LIMITE
            for (int i = 0; i < 12; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores[i], 1);
            }


            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores[3]);

            //////////////////////////////////////////////
            // PENDIENTE agregar el Z optimo
            ///////////////////////////////////////////////

            return true;
        }

        private void Send_Info_Pines(string Pattern, string[] PatternActual)
        {



            string[] Valores_ = new string[columnaRam_.Length];
            Valores_[0] = Pattern;
            for (int i = 1; i <= columnaRam_.Length - 1; i++)
            {
                if (i > 11)
                {
                    Valores_[i] = "0";
                }
                else
                {
                    Valores_[i] = PatternActual[i - 1];
                }


            }



            for (int i = 0; i < Valores_.Length - 1 + 1; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores_[i], 1);
            }

            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores_[3]);

            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores_[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores_[i] = new string(charArr);
                        break;
                    }
                }



            }
            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores_[5 + i]);
            }


            TagToWrite = "_EBD_I_PinDist";
            SendEthernetIP(TagToWrite, Valores_[4]);


            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores_[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores_[13]);

            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, Valores_[14]);
        }
        // Variable que me indica que si el numero es decena o unidad
        public int g_ConteoNumeros = 0;
        public const int DECENA = 1;
        public const int UNIDAD = 2;

        private void Send_Info_NUMS(string Pattern, string[] PatternActual, int NumActual, int NumAnterior)
        {
            g_ConteoNumeros++;


            string[] Valores_ = new string[columnaRam_.Length];
            Valores_[0] = Pattern;
            for (int i = 1; i <= columnaRam_.Length - 1; i++)
            {
                if (i > 11)
                {
                    Valores_[i] = "0";
                }
                else
                {
                    Valores_[i] = PatternActual[i - 1];
                }

            }


            /// Modifico los valores de ABC para enviar el numero que debe ir
            /// VALOR A CAMBIAR||
            Valores_[9] = NumActual.ToString();    // <- Valor de B
            Valores_[10] = NumAnterior.ToString();  // <- Valor de C
            ///////////////////////////////////////////////////////////////////
            Valores_[13] = "0";
            Valores_[14] = "0";
            ///////////////////////////////////////////////////////////////////

            for (int i = 0; i < Valores_.Length - 1 + 1; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores_[i], 1);
            }

            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores_[3]);

            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores_[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores_[i] = new string(charArr);
                        break;
                    }
                }



            }
            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores_[5 + i]);
            }

            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores_[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores_[13]);

            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, Valores_[14]);
        }
        private static void Get_NumAnterior_to_Robot(int NumAnterior, out int Decena_Ant, out int Unidad_Ant)
        {
            int NumActualPatter = NumAnterior;

            // Convierto NumActualPatter a un string de 2 valores
            Decena_Ant = NumActualPatter / 10;
            Unidad_Ant = Convert.ToInt16((-Convert.ToDouble(Decena_Ant) * 10) + Convert.ToDouble(NumActualPatter));
        }
        private void Send_Info_Localicator(string Pattern, string[] PatternActual, string CoreActual)
        {



            string[] Valores_ = new string[columnaRam_.Length];
            Valores_[0] = Pattern;
            for (int i = 1; i <= columnaRam_.Length - 1; i++)
            {
                if (i > 11)
                {
                    Valores_[i] = "0";
                }
                else
                {
                    Valores_[i] = PatternActual[i - 1];
                }

            }


            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores_[3]);

            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores_[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores_[i] = new string(charArr);
                        break;
                    }
                }

            }

            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores_[5 + i]);
            }

            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores_[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores_[13]);

            char[] Localizador = CoreActual.ToCharArray();

            int SizeVector = Localizador.Length;

            string SegmentoLocalizator = (Convert.ToInt16(Localizador[SizeVector - 2] - 48) * 10 + Convert.ToInt16(Localizador[SizeVector - 1] - 48)).ToString();
            Valores_[14] = SegmentoLocalizator;


            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, Valores_[14]);


            for (int i = 0; i < Valores_.Length - 1 + 1; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores_[i], 1);
            }


        }
        private void Send_Info_Sprues(string Pattern, string[] PatternActual, string segmento)
        {



            string[] Valores_ = new string[columnaRam_.Length];
            Valores_[0] = Pattern;
            for (int i = 1; i <= columnaRam_.Length - 1; i++)
            {
                if (i > 11)
                {
                    Valores_[i] = "0";
                }
                else
                {
                    Valores_[i] = PatternActual[i - 1];
                }


            }

            string TagToWrite = "_EBD_I_NumEntidad";
            SendEthernetIP(TagToWrite, Valores_[3]);

            for (int i = 5; i < 11; i++)
            {

                char[] charArr = Valores_[i].ToCharArray();
                for (int j = 0; j < charArr.Length; j++)
                {
                    if (charArr[j] == ',')
                    {
                        charArr[j] = '.';
                        Valores_[i] = new string(charArr);
                        break;
                    }
                }



            }
            string[] PosVector = { "X", "Y", "Z", "A", "B", "C" };
            TagToWrite = "_EBD_I_Eje";
            for (int i = 0; i <= PosVector.Length - 1; i++)
            {
                SendEthernetIP(TagToWrite + PosVector[i], Valores_[5 + i]);
            }

            TagToWrite = "_EBD_I_Diametro";
            SendEthernetIP(TagToWrite, Valores_[11]);

            TagToWrite = "_EBD_I_PalletIr";
            SendEthernetIP(TagToWrite, Valores_[13]);


            Valores_[14] = segmento;
            TagToWrite = "_EBD_I_SegmentoIr";
            SendEthernetIP(TagToWrite, Valores_[14]);

            for (int i = 0; i < Valores_.Length - 1 + 1; i++)
            {
                Set_Update_BD("ram_actualproduction", columnaRam_[i], Valores_[i], 1);
            }
        }
        private string Get_IdPattern(int ID)
        {

            string query_Local = "SELECT * FROM `pattern_produccion` WHERE ID = " + ID.ToString();
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> ActualCore = new List<string[]>();

            string Pattern = "";
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0), reader.GetString(1) };
                        Pattern = row[1];
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }


                // Cerrar la conexión
                databaseConnection.Close();

                return Pattern;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return "";

        }
        private string[] Get_IdPattern_Insercion(string Pattern, int ID)
        {

            string query_Local = "SELECT * FROM `" + Pattern + "` WHERE ID = " + ID.ToString();
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> ActualCore = new List<string[]>();


            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = {reader.GetString(1),
                                        reader.GetString(2),
                                        reader.GetString(3),
                                        reader.GetString(4),
                                        reader.GetString(5),
                                        reader.GetString(6),
                                        reader.GetString(7),
                                        reader.GetString(8),
                                        reader.GetString(9),
                                        reader.GetString(10),
                                        reader.GetString(11),

                        };
                        // Cerrar la conexión
                        databaseConnection.Close();

                        return row;
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }



            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return null;

        }
        private void Get_Core_Disponibility(string core)
        {


            var Global_Pallet = GlobalPallet_view;


            //1.- Busco el core que se me esta preguntando
            int largo = Global_Pallet.GetLength(0) - 1;
            int ptro_Core = 0;
            for (int i = 0; i <= largo; i++)
            {
                if (core == Global_Pallet[0, 0, 0, i])
                {
                    ptro_Core = i;
                }
            }


            for (int j = 1; j < largo; j++)
            {
                if (Global_Pallet[0, 0, 0, j] == null)
                {
                    break;
                }

                core = Global_Pallet[0, 0, 0, j];

                ptro_Core = j;





                //2. busco los pallets en que se encuentra.

                for (int ptro_Pallet_Prod = 1; ptro_Pallet_Prod < largo; ptro_Pallet_Prod++)
                {
                    for (int ptro_segmento = 1; ptro_segmento < largo; ptro_segmento++)
                    {
                        for (int ptro_cantidad = 1; ptro_cantidad < largo; ptro_cantidad++)
                        {
                            string Val = Global_Pallet[ptro_cantidad, ptro_segmento, ptro_Pallet_Prod, ptro_Core];
                            if (Val == null)
                            {
                                continue;
                            }
                            string SegmentoUtil = Global_Pallet[0, ptro_segmento, ptro_Pallet_Prod, ptro_Core];

                            string Info = "El Core " + Global_Pallet[0, 0, 0, ptro_Core] + " en el PALLET " + ptro_Pallet_Prod.ToString() + " en SEGMENTO " + SegmentoUtil + " Tiene " + Val.ToString() + " [Und]";

                            //label1.Text = Info;


                            // MessageBox.Show("Continuar?");
                        }

                    }




                }

            }


        }


        /// <summary>
        /// Carga nueva informacion en la BD dinamica, eliminando todos los residuos previos.
        /// </summary>
        public void Set_BD_toWhite()
        {

            string[] Tablas = { "global_pallet",
                                "pallet_1",
                                "pallet_2",
                                "pallet_3",
                                "pallet_4",
                                "pallet_5",
                                "pallet_6",
                                "pattern_produccion",
                                "ram_actualproduction",
                                "ram_sprues",
                                "Ram_Tapas",
                                "Ram_Localizadores",
                                "Ram_Numeros",
                                "Ram_PatternProductionLine"
                                };

            for (int i = 0; i < Tablas.Length; i++)
            {
                DropTable(Tablas[i]);
            }

            string[] addV = new string[g_ColumnasPallet.Length];
            for (int k = 0; k < g_ColumnasPallet.Length - 1; k++) { addV[k] = " "; }

            for (int i = 1; i < 7; i++)
            {
                Set_Crear_Tabla("Pallet_" + i.ToString(), g_ColumnasPallet);

                int largo = 30;
                for (int k = 0; k < largo; k++)
                {
                    Set_Data_To_BD("Pallet_" + i.ToString(), g_ColumnasPallet, addV);
                }

            }


            Set_Crear_Tabla("Global_Pallet", g_CoreGlobalPallet);
            string[] addVls = new string[g_CoreGlobalPallet.Length];
            for (int k = 0; k < g_CoreGlobalPallet.Length - 1; k++) { addVls[k] = " "; }
            int largoStandar = 200;
            for (int k = 0; k < largoStandar; k++)
            {
                Set_Data_To_BD("Global_Pallet", g_CoreGlobalPallet, addVls);
            }


            Set_Crear_Tabla("Pattern_produccion", g_PatternCacebera);
            int largoproduccion = 150;
            string[] text = new string[1]; text[0] = "ID pattern";
            string[] text2 = new string[1]; text2[0] = " ";
            for (int j = 0; j < largoproduccion; j++)
            {
                Set_Data_To_BD("Pattern_produccion", text, text2);
            }



            string[] Ram_Cabecera = new string[100];
            Ram_Cabecera[0] = "Pattern";
            for (int id = 0; id < g_Cabecera.Length - 1; id++)
            {
                Ram_Cabecera[id + 1] = g_Cabecera[id];
            }

            for (int id = 0; id < g_CoreGlobalPallet.Length; id++)
            {
                Ram_Cabecera[id + g_Cabecera.Length] = g_CoreGlobalPallet[id];
            }


            int LargoRam = g_Cabecera.Length + g_CoreGlobalPallet.Length;
            //////////////////////////////////////////////////////////////
            Ram_Cabecera[LargoRam] = "Sprue Position";
            Ram_Cabecera[LargoRam + 1] = "Sprue Exist";
            LargoRam = LargoRam + 2;
            //////////////////////////////////////////////////////////////
            Array.Resize(ref Ram_Cabecera, LargoRam);

            Ram_Cabecera[19] = "PorctCoreDetection";
            Set_Crear_Tabla("Ram_ActualProduction", Ram_Cabecera);
            string[] addVlsRam = new string[LargoRam];
            for (int k = 0; k < Ram_Cabecera.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_ActualProduction", g_CoreGlobalPallet, addVls);


            int N_Sprues = 8, N_Localizador = 12, N_Tapas = 10, N_Numeros = 10, N_Prod = 1;
            string[] Ram_Sprues = new string[N_Sprues];
            string[] Ram_Localizador = new string[N_Localizador];
            string[] Ram_Tapas = new string[N_Tapas];
            string[] Ram_Numeros = new string[N_Numeros];
            string[] Ram_PatternProductionLine = new string[N_Prod];


            for (int id = 0; id < Ram_Sprues.Length; id++) { Ram_Sprues[id] = "N" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Sprues", Ram_Sprues);
            Array.Resize(ref addVls, N_Sprues);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Sprues", Ram_Sprues, addVls);
            Set_Data_To_BD("Ram_Sprues", Ram_Sprues, addVls);

            for (int id = 0; id < Ram_Tapas.Length; id++) { Ram_Tapas[id] = "N" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Tapas", Ram_Tapas);
            Array.Resize(ref addVls, N_Tapas);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Tapas", Ram_Tapas, addVls);
            Set_Data_To_BD("Ram_Tapas", Ram_Tapas, addVls);

            for (int id = 0; id < Ram_Localizador.Length; id++) { Ram_Localizador[id] = "N" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Localizadores", Ram_Localizador);
            Array.Resize(ref addVls, N_Localizador);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Localizadores", Ram_Localizador, addVls);
            Set_Data_To_BD("Ram_Localizadores", Ram_Localizador, addVls);


            for (int id = 0; id < Ram_Numeros.Length; id++) { Ram_Numeros[id] = "N" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Numeros", Ram_Numeros);
            Array.Resize(ref addVls, N_Numeros);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Numeros", Ram_Numeros, addVls);
            Set_Data_To_BD("Ram_Numeros", Ram_Numeros, addVls);


            Ram_PatternProductionLine[0] = "PatterInConveyor";
            Set_Crear_Tabla("Ram_PatternProductionLine", Ram_PatternProductionLine);
            Array.Resize(ref addVls, N_Prod);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            for (int i = 0; i < 10; i++)
            {
                Set_Data_To_BD("Ram_PatternProductionLine", Ram_PatternProductionLine, addVls);

            }

        }

        /// <summary>
        /// Seteo la extraccion / insercion de los sprues,  
        /// </summary>
        /// <param name="Numero">  Numero de patter a usar respecto al orden. Numero debe estar entre 1 y 12 </param>
        /// <param name="Sprue_IN_OUT"> X es extraccion O es reposicion </param>
        public bool Set_Ram_Sprue(int Numero_pallet, string Sprue_IN_OUT)
        {


            string PatternSelect = g_PatternList[Numero_pallet];

            int PosicionPattern = Get_SpruesActives(PatternSelect);
            if (PosicionPattern >= 1)
            {
                Set_Update_BD("ram_sprues", "N" + PosicionPattern.ToString(), Sprue_IN_OUT, 2);
                return true;
            }
            else
            {

                return false;

            }


        }

        /// <summary>
        /// Devuelve si el numero de pallet tiene activo el Sprue para poder ir a buscarlo con el Robot
        /// </summary>
        /// <param name="Numero_Pallet"></param>
        /// <returns> -1 -> No Aplica 0-> No existe en Rack 1-> Si existe en Rack </returns>
        public int Get_Ram_Sprue(int Numero_pallet)
        {

            string PatternSelect = g_PatternList[Numero_pallet];

            int PosicionPattern = Get_SpruesActives(PatternSelect);
            if (PosicionPattern >= 1)
            {

                return 1;
            }

            return -1;
        }

        /// <summary>
        /// Devuelve el numero de Sprue Asociado al Pattern
        /// </summary>
        /// <param name="Core"></param>
        /// <param name="Tabla_Name"></param>
        /// <returns></returns>
        public int Get_SpruesActives(string Pattern)
        {
            string Tabla_Name = "pattern_produccion";
            string query_Local = "SELECT * FROM `pattern_produccion` ORDER BY `ID` ASC ";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> PatternsWhitSprues = new List<string[]>();

            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4) };
                        PatternsWhitSprues.Add(row);

                    }

                }
                else
                {
                    DarkDemo.Form1.g_LogTextMain = "No se encontraron datos en BD Linea 2307";
                    Console.WriteLine("No se encontraron datos.");
                    return -1;
                }

                // Cerrar la conexión
                databaseConnection.Close();


                // Busco si el pattern existe en la lista y devuelvo la posicion 
                int LargoVector = PatternsWhitSprues.Count();
                var Patt_ram = PatternsWhitSprues[0];

                for (int i = 0; i < LargoVector; i++)
                {
                    if (Pattern == PatternsWhitSprues[i][0])
                    {
                        return (Convert.ToInt16(PatternsWhitSprues[i][3]));

                    }

                }

                return -1;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return -1;

        }

        /// <summary>
        /// Devuelve si existe Sprue del numero de pattern consultado 
        /// </summary>
        /// <param name="Pattern"> Numero de pattern que ingresa al sistema Comienza en 1</param>
        /// <returns>[0] -> Existe [1]-> Posicion </returns>
        public string[] Get_SpruesPositionActives(int Pattern)
        {



            string Tabla_Name = "ram_sprues";
            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`" + " WHERE ID = 1";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> PatternsWhitSprues = new List<string[]>();
            string[] InfoRam = new string[2];
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetString(8) };
                        PatternsWhitSprues.Add(row);

                    }

                }
                else
                {
                    DarkDemo.Form1.g_LogTextMain = "No se encontraron datos en BD Linea 2199";
                    Console.WriteLine("No se encontraron datos.");
                    return InfoRam;
                }



                if (Pattern > g_PatternList.Length)
                {
                    try
                    {
                        var Variable = g_PatternList[Pattern];
                    }
                    catch (Exception err)
                    {

                        DarkDemo.Form1.Show_Mesaje_Log(err);
                        return InfoRam;
                    }
                }
                // Busco si el pattern existe en la lista y devuelvo la posicion 
                int LargoVector = PatternsWhitSprues[0].Count(), PatterACtive = 0;
                var Patt_ram = PatternsWhitSprues[0];
                for (int i = 0; i < LargoVector; i++)
                {
                    if (g_PatternList[Pattern] == Patt_ram[i])
                    {
                        PatterACtive = i + 1;
                        break;
                    }

                }

                databaseConnection.Close();


                string query_Local2 = "SELECT * FROM " + '`' + Tabla_Name + "`" + " WHERE ID = 2";

                MySqlConnection databaseConnection2 = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase2 = new MySqlCommand(query_Local2, databaseConnection2);
                commandDatabase2.CommandTimeout = 60;

                databaseConnection2.Open();
                reader = commandDatabase2.ExecuteReader();

                string ValorActualSprue = "";

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {


                        string[] row = { reader.GetString(PatterACtive) };

                        PatternsWhitSprues.Add(row);

                    }

                }



                var RamSprue = PatternsWhitSprues[1];

                if (RamSprue[0] == "O")
                {
                    InfoRam[0] = "1";

                }
                if (RamSprue[0] == "X")
                {
                    InfoRam[0] = "0";
                }




                // Cerrar la conexión
                databaseConnection2.Close();

                return InfoRam;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return InfoRam;

        }



        /// <summary>
        ///  Devuelve la informacion completa de la tabla PatternProduccion
        /// </summary>
        /// <returns></returns>
        public List<string[]> Get_PatternProduction()
        {
            string Tabla_Name = "pattern_produccion";

            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            List<string[]> Receta = new List<string[]>();

            string[,] matrix = new string[100, 100];

            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4) };

                        if (row[1] == "" || row[1] == " ")
                        {
                            // Cerrar la conexión
                            databaseConnection.Close();
                            return Receta;
                        }

                        Receta.Add(row);
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();



                return Receta;
            }
            catch (Exception err)
            {
                databaseConnection.Close();

                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }


        }






        /// <summary>
        /// Obtengo la data filtrada que R2 debera utilizar desde la receta
        /// </summary>
        /// <returns></returns>
        public string[] Get_DataR2(string Columna_Name, string Tabla_Name)
        {
            String[] Columnas_Names = new string[10000];

            string query_Local = "SELECT " + Columna_Name + " FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            string[,] matrix = new string[100, 100];
            int Ntablas = 0;
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        Columnas_Names[Ntablas] = reader.GetString(0);
                        Ntablas++;
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();

                Array.Resize(ref Columnas_Names, Ntablas);


                return Columnas_Names;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }


        }

        /// <summary>
        /// Obtengo la Receta que R2 debera utilizar desde la receta
        /// </summary>
        /// <returns></returns>
        public List<string[]> Get_DataRecetaR2(string Tabla_Name)
        {

            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            List<string[]> Receta = new List<string[]>();

            string[,] matrix = new string[100, 100];

            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetString(8), reader.GetString(9), reader.GetString(10), reader.GetString(11), reader.GetString(12), reader.GetString(13) };
                        Receta.Add(row);
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();



                return Receta;
            }
            catch (Exception err)
            {
                databaseConnection.Close();

                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }


        }



        public static bool g_Estado_RecetaR2 = true;
        /// <summary>
        /// Se inserta la informacion a la BDD R2
        /// </summary>
        /// <param name="PATTERN_R2"></param>
        /// <param name="ListaBusqueda"></param>
        /// <param name="BaseDatosName"></param>
        /// <param name="Header"> Encabezado BDD R2</param>
        /// <param name="Data"></param>
        /// <param name="i"> Index de insercion</param>
        /// <param name="GrabarDatoenBDD"> Graba BDD? </param>
        /// <returns></returns>
        public string[] InsertarBDD_R2(string PATTERN_R2, string[] ListaBusqueda, string BaseDatosName, string[] Header, string[] Data, int i, bool GrabarDatoenBDD)
        {
            Data[0] = Data[0].ToUpper();
            if (Data[0].Contains(ListaBusqueda[0]))
            {
                Data[7] = "1";
                var NEntidad = Data[0].ToUpper().Split('C');
                int Entidad_Int = Convert.ToInt16(NEntidad[1]);
                Data[8] = Entidad_Int.ToString(); // Segmento


            }
            else if (Data[0].Contains(ListaBusqueda[1]))
            {
                var DataSprue = Get_PatternProduction();

                for (int j = 0; j < DataSprue.Count; j++)
                {
                    if (PATTERN_R2 == DataSprue[j][1])
                    {

                        Data[7] = "4"; // numEntidad
                        Data[8] = DataSprue[j][4]; // Segmento
                        if (Data[8] == "X")
                        {
                            ////////////////////////////
                            //// PENDIENTE ENVIAR ERROR
                            ////////////////////////////
                            GrabarDatoenBDD = false;
                            DarkDemo.Form1.g_LogTextMain = "### ERROR ###  PATTERN NO EXiste en BD Dinamica ROBOT 2. Se ha creado la BDD SIN SEGMENTO SPRUE";

                            Data[7] = "4"; // numEntidad
                            Data[8] = "5"; // Segmento

                            g_Estado_RecetaR2 = false;


                        }


                    }
                }
            }
            else if (Data[0].ToUpper().Contains(ListaBusqueda[2]))
            {

                Data[7] = "8";
                var NEntidad = Data[0].ToUpper().Split('D');
                int Entidad_Int = Convert.ToInt16(NEntidad[1]);
                Data[8] = Entidad_Int.ToString(); // Segmento


            }
            else if (Data[0].Contains(ListaBusqueda[3]))
            {

                Data[7] = "10";
                Data[8] = "0";


            }
            else if (Data[0].Contains(ListaBusqueda[4]))
            {

                Data[7] = "9";
                Data[8] = "0";


            }


            if (Data[7] == null || Data[8] == null)
            {
                ///////////////////////////////////////
                //// Pattern NO EXISTE en BD dinamica
                ////////////////////////////////////////
            }

            if (GrabarDatoenBDD)
            {
                for (int j = 0; j < Header.Length; j++)
                {
                    Set_Update_BD(BaseDatosName, Header[j], Data[j], i + 1);
                }

            }



            return Data;

        }

        /// <summary>
        /// Obtengo la Receta que R2 debera utilizar desde la receta
        /// </summary>
        /// <returns></returns>
        public List<string[]> Get_FilaTabla(string Tabla_Name, string Fila)
        {

            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "` WHERE ID=" + Fila;
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            List<string[]> Receta = new List<string[]>();

            string[,] matrix = new string[100, 100];

            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(0), reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetString(8), reader.GetString(9), reader.GetString(10) };
                        Receta.Add(row);
                    }
                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();



                return Receta;
            }
            catch (Exception err)
            {
                databaseConnection.Close();

                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }


        }


        /// <summary>
        /// Funcion SerialBridge
        /// </summary>
        /// <param name="Tabla_Name"></param>
        /// <returns></returns>
        public string Get_RamBD_ToSendSerial(string Tabla_Name)
        {


            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;

            string[,] matrix = new string[100, 100];

            string DataSendSerial = "";
            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                int ArrayRZ = 0;
                string[] Filas = new string[100];
                if (reader.HasRows)
                {
                    int ColumnasMax = reader.FieldCount;
                    while (reader.Read())
                    {

                        for (int fila = 0; fila < ColumnasMax; fila++)
                        {
                            Filas[fila] = reader.GetString(fila);
                            ArrayRZ = fila;
                        }

                    }

                    Array.Resize(ref Filas, ArrayRZ + 1);
                    for (int i = 0; i < Filas.Length; i++)
                    {
                        DataSendSerial = DataSendSerial + Filas[i] + "#";
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                // Cerrar la conexión
                databaseConnection.Close();

            }
            catch (Exception ex)
            {

                databaseConnection.Close();
            }

            return DataSendSerial;
        }



        /// <summary>
        /// Devuelve el numero de Sprue Asociado al Pattern. Comienza desde el 1
        /// </summary>
        /// <param name="Core"></param>
        /// <param name="Tabla_Name"></param>
        /// <returns></returns>
        public string Get_VectorSpruesActives(string Pattern)
        {
            string Tabla_Name = "ram_sprues";
            string query_Local = "SELECT * FROM " + '`' + Tabla_Name + "`" + " WHERE ID = 1";
            string query_Local2 = "SELECT * FROM " + '`' + Tabla_Name + "`" + " WHERE ID = 2";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> PatternsWhitSprues = new List<string[]>();

            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetString(8) };
                        PatternsWhitSprues.Add(row);

                    }

                }
                else
                {
                    DarkDemo.Form1.g_LogTextMain = "No se encontraron datos en BD Linea 2307";
                    Console.WriteLine("No se encontraron datos.");
                    return null;
                }

                // Cerrar la conexión
                databaseConnection.Close();



                databaseConnection.Open();
                commandDatabase = new MySqlCommand(query_Local2, databaseConnection);
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = { reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4), reader.GetString(5), reader.GetString(6), reader.GetString(7), reader.GetString(8) };
                        PatternsWhitSprues.Add(row);

                    }

                }
                databaseConnection.Close();

                // Busco si el pattern existe en la lista y devuelvo la posicion 
                int LargoVector = PatternsWhitSprues[0].Count();
                var Patt_ram = PatternsWhitSprues[0];
                var PattEstado_ram = PatternsWhitSprues[1];
                for (int i = 0; i < LargoVector; i++)
                {
                    if (Pattern == Patt_ram[i])
                    {
                        string Estado = Pattern + ";" + (i + 1).ToString() + ";" + PattEstado_ram[i];
                        return Estado;

                    }

                }

                return null;
            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
            }



            return null;

        }



        /// <summary>
        /// seteo el pattern actual
        /// </summary>
        /// <param name="Patt"></param>
        public void Set_PatternString(string Patt)
        {
            g_SQL_Pattern = Patt;
        }
        /// <summary>
        /// Obtengo pattern que actualmente esta en uso
        /// </summary>
        /// <returns></returns>
        public string Get_PatternString()
        {


            return g_SQL_Pattern;



        }
        public string Get_PatternString(int Index)
        {
            try
            {

                if (g_SQL_Pattern != "")
                {
                    return g_SQL_Pattern;
                }
                string PatternActual = "";

                if (g_SQL_Pattern == "")
                {

                    var PatternsBDD = Get_Active_Patterns();

                    var PatternBDDNow = PatternsBDD[Index];
                    g_SQL_Pattern = PatternBDDNow[1];
                    return g_SQL_Pattern;

                }


            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);

                return "";
            }


            return "";


        }


        /// <summary>
        /// Extraigo la lista de Patterns de la BDD
        /// </summary>
        /// <returns></returns>
        public List<string[]> Get_Active_Patterns()
        {

            string query_Local = "SELECT* FROM `pattern_produccion`";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
            commandDatabase.CommandTimeout = 60;
            // Genero el vector Consulta
            List<string[]> ActualCore = new List<string[]>();


            try
            {

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();

                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        string[] row = {reader.GetString(0),
                                        reader.GetString(1),
                                        reader.GetString(2),
                                        reader.GetString(3),

                        };
                        ActualCore.Add(row);
                    }

                }
                else
                {
                    Console.WriteLine("No se encontraron datos.");
                }

                databaseConnection.Close();
                return ActualCore;



            }
            catch (Exception err)
            {
                DarkDemo.Form1.Show_Mesaje_Log(err);
                return null;
            }



            return null;
        }



        /// <summary>
        /// Ejemplo de como se debe exporta/importar archivo .sql
        /// </summary>
        public void Set_BackUp_SQL(string PathFile)
        {

            Make_Database_Root(BaseDatos_root);
       //     Import_Sql(PathFile);


        }

        /// <summary>
        /// Genero la base de datos Raiz 
        /// </summary>
        /// <param name="Bd_Raiz"></param>
        public void Make_Database_Root(string Bd_Raiz)
        {
            string connectionString_tocreate = "datasource=127.0.0.1;port=3306;username=root;password=";
            string query_Local = "CREATE DATABASE IF NOT EXISTS `" + Bd_Raiz + "`;";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString_tocreate);

            try
            {
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                commandDatabase.ExecuteNonQuery();


            }
            catch (Exception err)
            {


                DarkDemo.Form1.Show_Mesaje_Log(err);
            }
            databaseConnection.Close();

        }


        /// <summary>
        /// Guardo un archivo sql que contiene todas las tablas
        /// </summary>
        public void Backup_Sql(string PathToSave)
        {
            try
            {


                string constring = connectionString;
                DateTime Fecha = DateTime.Now;
                string NameFile = "TeachMode_DataBase_" + Fecha.Month + "_" + Fecha.Day +"_" + Fecha.Year+"-"+ Fecha.Hour + "_" + Fecha.Minute + "_" + Fecha.Second+".sql";
                
                ///////////////////////////////////////////////////////
                string file = PathToSave + NameFile;
                //////////////////////////////////////////////////////
                using (MySqlConnection conn = new MySqlConnection(constring))
                {
                    using (MySqlCommand cmd = new MySqlCommand())
                    {
                        using (MySqlBackup mb = new MySqlBackup(cmd))
                        {
                            cmd.Connection = conn;
                            conn.Open();
                            mb.ExportToFile(file);
                            conn.Close();
                        }
                    }
                }
                DialogResult dialog = MessageBox.Show("The Data Base File was create in the Path\n+"+PathToSave+"\n Do you want copy this file in a USB pendrive?","File Created",MessageBoxButtons.YesNo,MessageBoxIcon.Information);


                if (dialog == DialogResult.Yes)
                {
                    string FolderChose_toMove = "";
                    using (var fd = new FolderBrowserDialog())
                    {
                        if (fd.ShowDialog() == System.Windows.Forms.DialogResult.OK && !string.IsNullOrWhiteSpace(fd.SelectedPath))
                        {
                            FolderChose_toMove = fd.SelectedPath;
                        }
                    }


                    if (File.Exists(FolderChose_toMove + @"\" + NameFile)) { File.Delete(FolderChose_toMove + @"\" + NameFile); }

                    File.Move(file, FolderChose_toMove + @"\" + NameFile);

                    MessageBox.Show("The Data Base File was create in the Path ");
                    System.Diagnostics.Process.Start(FolderChose_toMove);
                }
               
            }
            catch (Exception err)
            {

                MessageBox.Show("### ERRROR #### I Can´t create or save the file. Look this sistem report -> " + err.Message);
            }

        }




        /// <summary>
        /// Importo y subo la informacion del arquivo sql previamente guardado
        /// Antes de importar es necesario cargar la Base de datos Root
        /// </summary>
        public void Import_Sql(string PathFile)
        {
            string constring = connectionString;

            /////////////////////////////////////////////////////////
            // Important Additional Connection Options
            constring += "charset=utf8;convertzerodatetime=true;";
            /////////////////////////////////////////////////////////
            string file = PathFile;
            /////////////////////////////////////////////////////////



            using (MySqlConnection conn = new MySqlConnection(constring))
            {
                using (MySqlCommand cmd = new MySqlCommand())
                {
                    using (MySqlBackup mb = new MySqlBackup(cmd))
                    {
                        cmd.Connection = conn;
                        conn.Open();
                        mb.ImportFromFile(file);
                        conn.Close();
                    }
                }
            }

        }

        #region Definicion de funciones para el manejo de datos en validacion de Sprue
        /// <summary>
        /// Funcion que obtiene datos respecto al nombre de  una tabla
        /// </summary>
        /// <param name="NameTable"></param>
        public List<string> get_Data(string NameTable)
        {
             
            string query = "SELECT `Altura Patron Entidad` FROM" + '`' + NameTable+ '`'+ "where `Cod Core` = 'SPRUE' ";
            MySqlConnection databaseConnection = new MySqlConnection(connectionString);
            MySqlCommand commandDatabase = new MySqlCommand(query, databaseConnection);
            List<string> data = new List<string>();
            try
            {
                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {

                        data.Add(reader.GetString(0));
                    }

                }
               

                return data;
            }
            catch (Exception ex)
            {

                throw;
            }

        }
        #endregion















    }
}

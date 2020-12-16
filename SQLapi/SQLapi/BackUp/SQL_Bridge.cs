using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using MySql.Data.MySqlClient;
using Excel = Microsoft.Office.Interop.Excel;

namespace SQLapi
{
    class SQL_Bridge
    {

        Bridge_EthernetIP.EthernetIP EthernetIP = new Bridge_EthernetIP.EthernetIP();


        private string connectionString = "datasource=127.0.0.1;port=3306;username=root;password=;database=";
        private string query = "SELECT * FROM ";
        public string g_TablActual,g_CLASSNAME="SQL_Bridge";
        public string[] g_Cabecera = new string[11];
        public string[] g_PatternCacebera = new string[1];
        public string[] g_ColumnasPallet = new string[13];
        public string[] g_BD_Pallet_Name = new string[6];
        public string[] g_CoreGlobalPallet = new string[4];
        string[,] g_matrix = new string[10, 5];
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

                
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                throw;
            }


            return true;
        }

        public void Set_SQL_TablaActual(string Tabla)
        {
            g_TablActual = Tabla;
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
                        Tablas[Ntablas] = reader.GetString(0);
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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                throw;

            }



        }
        /// <summary>
        /// Init cabecera de la tabla
        /// </summary>
        private void Init_Cabecera()
        {


            g_Cabecera[0] = "insercionID";
            g_Cabecera[1] = "Cod Core";
            g_Cabecera[2] = "Entidad_ID";
            g_Cabecera[3] = "Metodo de toma";
            g_Cabecera[4] = "Ref Pos X";
            g_Cabecera[5] = "Ref Pos Y";
            g_Cabecera[6] = "Ref Pos Z";
            g_Cabecera[7] = "Ref Pos A";
            g_Cabecera[8] = "Ref Pos B";
            g_Cabecera[9] = "Ref Pos C";
            g_Cabecera[10] = "DiametroTomaCore[mm]";


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


        }

        /// <summary>
        /// Eliminar Tabla
        /// </summary>
        /// <param name="Tabla"></param>
        /// <returns></returns>
        private bool DropTable(string Tabla)
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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;
           


                Form1.g_LogTextMain = "### ERROR ### en CLASE "+ Clase +" , en Metodo  "+metodo+ " en LINEA de programa " + LineaError.ToString();

            }
            return false;
        }

        /// <summary>
        /// Actualizo la Tabla con columna valor e ID a cambiar
        /// </summary>
        public void Set_Update_BD(string Tabla, string columna, string Valor_toChange, int WhereID)
        {
            try
            {

                string query_Local = "UPDATE `" + Tabla + "` SET `" + columna + "` = '" + Valor_toChange + "' WHERE `" + Tabla + "`.`ID` = " + WhereID;
                MySqlConnection databaseConnection = new MySqlConnection(connectionString);
                MySqlCommand commandDatabase = new MySqlCommand(query_Local, databaseConnection);
                commandDatabase.CommandTimeout = 60;

                databaseConnection.Open();
                reader = commandDatabase.ExecuteReader();
                databaseConnection.Close();

            }
            catch (Exception err)
            {
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


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



                databaseConnection.Close();
            }
            catch (Exception err)
            {
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


            }


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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

            }


        }
        /// <summary>
        /// Obtengo toda la info de  de una columna en especifica de la tabla
        /// </summary>
        public string[] Get_Columna(string Columna_Name, string Tabla_Name)
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

                Array.Sort(Columnas_Names);

                return Columnas_Names;
            }
            catch (Exception err)
            {
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                return null;
            }



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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

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

                        string[] row = { reader.GetString(1), reader.GetString(2), reader.GetString(3), reader.GetString(4) };
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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

            }



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

                            StackTrace st = new StackTrace(err, true);
                            StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                                 && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                                 && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                                 && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                            string MachineName = System.Environment.MachineName;
                            string UserName = System.Environment.UserName.ToUpper();
                            string Mensaje = err.Message;
                            int LineaError = frame.GetFileLineNumber();
                            string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                            string Clase = frame.GetMethod().DeclaringType.Name;
                            string metodo = frame.GetMethod().Name;



                            Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


                            Array.Resize(ref SheetExcel, i - 1);
                            break;

                        }

                    }
                    xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(ptr_BDdin);

                    Excel.Worksheet excelSheet = xlWorkBook.ActiveSheet;

                    Set_BD_toWhite();

                    string[] PatternList = new string[30];

                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        PatternList[i] = Convert.ToString(((Excel.Range)excelSheet.Cells[i + 4, 2]).Value2);
                        if (PatternList[i] == null)
                        {
                            Array.Resize(ref PatternList, i);
                            Array.ReferenceEquals(g_PatternList, i);
                        }
                    }
                    g_PatternList = PatternList;
                    ///////////////////////////////////////////////////////
                    // ETHERNET. Envio la enformacion de Patterns a utilizar en 
                    ///////////////////////////////////////////////////////
                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        string TagName = "EC_O_Patter[" + i.ToString() + "]";
                        SendEthernetIP(TagName, PatternList[i]);

                    }
                    ////////////////////////////////////////////////////////


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

                    // Capturo la cantidad de entidades
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

                    // Genero el vector globlal
                    List<string[,]> OrdenList = new List<string[,]>();
                    OrdenList.Add(NCores_pallet_1);
                    OrdenList.Add(NCores_pallet_2);
                    OrdenList.Add(NCores_pallet_3);
                    OrdenList.Add(NCores_pallet_4);
                    OrdenList.Add(NCores_pallet_5);
                    OrdenList.Add(NCores_pallet_6);

                    var segmentos_Pallet1 = Set_orden_Cores(pallet_1);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet1, g_BD_Pallet_Name[0]);
                    var segmentos_Pallet2 = Set_orden_Cores(pallet_2);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet2, g_BD_Pallet_Name[1]);
                    var segmentos_Pallet3 = Set_orden_Cores(pallet_3);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet3, g_BD_Pallet_Name[2]);
                    var segmentos_Pallet4 = Set_orden_Cores(pallet_4);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet4, g_BD_Pallet_Name[3]);
                    var segmentos_Pallet5 = Set_orden_Cores(pallet_5);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet5, g_BD_Pallet_Name[4]);
                    var segmentos_Pallet6 = Set_orden_Cores(pallet_6);
                    Set_Update_BD_Pallet_orden(segmentos_Pallet6, g_BD_Pallet_Name[5]);


                    Get_Cores_segement_and_cant(pallet_1, NCores_pallet_1);
                    // Genero el vector globlal
                    List<string[,]> PalletList = new List<string[,]>();
                    PalletList.Add(segmentos_Pallet1);
                    PalletList.Add(segmentos_Pallet2);
                    PalletList.Add(segmentos_Pallet3);
                    PalletList.Add(segmentos_Pallet4);
                    PalletList.Add(segmentos_Pallet5);
                    PalletList.Add(segmentos_Pallet6);

                    // Identifico los Pallet disponibles (los que tienen algo ) y envio la info al PLC
                    Get_Available_Pallet_And_SendTo_PLC(PalletList);
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
                    string[,] Raw_Vector_Core = new string[100, 2];
                    int ptroRaw = 0;
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


                            for (int ptro_ReccoroPallet = 0; ptro_ReccoroPallet < PalletTemp.GetLength(1) - 1; ptro_ReccoroPallet++)
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







                    //MODIFICAR GLOBAL PALLET
                    Set_Update_BD_GlobalPallet(GlobalPallet_view, "global_pallet");
                    Set_Update_BD_Pattern(PatternList);


                    xlWorkBook.Close(true, null, null);
                    xlApp.Quit();
                    return true;

                }
                catch (Exception err)
                {
                    StackTrace st = new StackTrace(err, true);
                    StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                         && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                         && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                         && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                    string MachineName = System.Environment.MachineName;
                    string UserName = System.Environment.UserName.ToUpper();
                    string Mensaje = err.Message;
                    int LineaError = frame.GetFileLineNumber();
                    string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                    string Clase = frame.GetMethod().DeclaringType.Name;
                    string metodo = frame.GetMethod().Name;



                    Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


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
                            PatternList[i - 1] = NameSheet.Name;

                        }
                        catch (Exception)
                        {
                            Array.Resize(ref PatternList, i - 1);
                            break;

                        }

                    }

                    string[] TablaActiva = get_Tablas_Activas();

                    for (int i = 0; i < PatternList.Length; i++)
                    {
                        bool Next = false;
                        for (int j = 0; j < TablaActiva.Length; j++)
                        {

                            if (TablaActiva[j] == PatternList[i])
                            {
                                Next = true;
                                break;
                            }
                        }

                        if (Next) { continue; }


                        xlWorkSheet = (Excel.Worksheet)xlWorkBook.Worksheets.get_Item(i + 1);



                        Excel.Worksheet excelSheet = xlWorkBook.ActiveSheet;

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
                    return true;

                }
                catch (Exception err)
                {

                    StackTrace st = new StackTrace(err, true);
                    StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                         && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                         && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                         && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                    string MachineName = System.Environment.MachineName;
                    string UserName = System.Environment.UserName.ToUpper();
                    string Mensaje = err.Message;
                    int LineaError = frame.GetFileLineNumber();
                    string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                    string Clase = frame.GetMethod().DeclaringType.Name;
                    string metodo = frame.GetMethod().Name;



                    Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                }
            }

            xlApp.Quit();
            return false;
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

                string Tag = "EC_O_PalletUsar" + i.ToString();

                SendEthernetIP(Tag, Vector_Pallet_Toused[i]);
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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


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
        private void Set_Update_BD_Pattern(string[] pattern_Name)
        {
            for (int i = 0; i < pattern_Name.Length; i++)
            {
                Set_Update_BD("pattern_produccion", "Id Pattern", pattern_Name[i], i + 1);
            }

        }
        private string[,] Get_Pattern_Cake(Excel.Worksheet excelSheet)
        {
            string[,] Pattern_info = new string[500, 20];

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

            string[,] CoresFilter = new string[Nelementos, 10];

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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                databaseConnection.Close();
            }
            return DataSendSerial;

        }

        private void Set_Update_BD_Pallet_orden(string[,] pallet, string Pallet_Name)
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
                            if (Val == null)
                            {
                                continue;
                            }
                            string SegmentoUtil = Global_Pallet[0, ptro_segmento, ptro_Pallet_Prod, ptro_Core];

                            string Info = "El Core " + Global_Pallet[0, 0, 0, ptro_Core] + " en el PALLET " + ptro_Pallet_Prod.ToString() + " en SEGMENTO " + SegmentoUtil + " Tiene " + Val.ToString() + " [Und]";

                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[0], Global_Pallet[0, 0, 0, ptro_Core], IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[1], ptro_Pallet_Prod.ToString(), IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[2], SegmentoUtil, IDglobal);
                            Set_Update_BD(Pallet_Name, g_CoreGlobalPallet[3], Val.ToString(), IDglobal);
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
                string Pattern = Get_IdPattern(IDPatter);
                string[] PatternActual = Get_IdPattern_Insercion(Pattern, indexCore);

                string CoreActual = PatternActual[1];

                if (CoreActual == "PIN1" || CoreActual == "PIN2")
                {



                    string[] columnaRam_ = new string[16];
                    columnaRam_[0] = "Pattern";
                    columnaRam_[1] = "insercionID";
                    columnaRam_[2] = "Cod Core";
                    columnaRam_[3] = "Entidad_ID";
                    columnaRam_[4] = "Metodo de toma";
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


                    string[] Valores_ = new string[columnaRam_.Length];
                    Valores_[0] = Pattern;
                    for (int i = 1; i <= columnaRam_.Length - 1; i++)
                    {
                        if (i > 11)
                        {
                            Valores_[i] = "X";
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

                    string[] PosVector = { "X", "Y", "Z", "A,", "B", "C" };
                    TagToWrite = "_EBD_I_Eje";
                    for (int i = 0; i < PosVector.Length - 1; i++)
                    {
                        SendEthernetIP(TagToWrite + PosVector[i], Valores_[5 + i]);
                    }

                    TagToWrite = "_EBD_I_Diametro";
                    SendEthernetIP(TagToWrite, Valores_[11]);

                    TagToWrite = "_EBD_I_PalletIr";
                    SendEthernetIP(TagToWrite, Valores_[13]);

                    TagToWrite = "_EBD_I_SegementoIr";
                    SendEthernetIP(TagToWrite, Valores_[14]);
                }
                else
                {


                    var Cores_Distribution = Get_OrdenCores(CoreActual, "global_pallet");
                    string[] Core_Actual = Cores_Distribution[0];

                    int LargoVector = PatternActual.Length + Core_Actual.Length + 1;

                    string[] columnaRam = new string[16];
                    columnaRam[0] = "Pattern";
                    columnaRam[1] = "insercionID";
                    columnaRam[2] = "Cod Core";
                    columnaRam[3] = "Entidad_ID";
                    columnaRam[4] = "Metodo de toma";
                    columnaRam[5] = "Ref Pos X";
                    columnaRam[6] = "Ref Pos Y";
                    columnaRam[7] = "Ref Pos Z";
                    columnaRam[8] = "Ref Pos A";
                    columnaRam[9] = "Ref Pos B";
                    columnaRam[10] = "Ref Pos C";
                    columnaRam[11] = "DiametroTomaCore[mm]";
                    columnaRam[12] = "Core";
                    columnaRam[13] = "Pallet";
                    columnaRam[14] = "Segmento";
                    columnaRam[15] = "Cantidad";

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

                    for (int i = 0; i < LargoVector; i++)
                    {
                        Set_Update_BD("ram_actualproduction", columnaRam[i], Valores[i], 1);
                    }


                    string TagToWrite = "_EBD_I_NumEntidad";
                    SendEthernetIP(TagToWrite, Valores[3]);

                    string[] PosVector = { "X", "Y", "Z", "A,", "B", "C" };
                    TagToWrite = "_EBD_I_Eje";
                    for (int i = 0; i < PosVector.Length - 1; i++)
                    {
                        SendEthernetIP(TagToWrite + PosVector[i], Valores[3 + i]);
                    }

                    TagToWrite = "_EBD_I_Diametro";
                    SendEthernetIP(TagToWrite, Valores[11]);

                    TagToWrite = "_EBD_I_PalletIr";
                    SendEthernetIP(TagToWrite, Valores[13]);

                    TagToWrite = "_EBD_I_SegementoIr";
                    SendEthernetIP(TagToWrite, Valores[14]);
                }
                return true;

            }
            catch (Exception err)
            {
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

                return false;
            }

            // actualizo el core, ya que se eliminara 1


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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

            }



            return "";

        }
        private string[] Get_IdPattern_Insercion(string Pattern, int ID)
        {

            string query_Local = "SELECT * FROM `" + Pattern + "` WHERE InsercionID = " + ID.ToString();
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
                StackTrace st = new StackTrace(err, true);
                StackFrame frame = st.GetFrames().Where(f => !String.IsNullOrEmpty(f.GetFileName())
                     && f.GetILOffset() != StackFrame.OFFSET_UNKNOWN
                     && f.GetNativeOffset() != StackFrame.OFFSET_UNKNOWN
                     && !f.GetMethod().Module.Assembly.GetName().Name.Contains("mscorlib")).First();
                string MachineName = System.Environment.MachineName;
                string UserName = System.Environment.UserName.ToUpper();
                string Mensaje = err.Message;
                int LineaError = frame.GetFileLineNumber();
                string Proyecto = frame.GetMethod().Module.Assembly.GetName().Name;
                string Clase = frame.GetMethod().DeclaringType.Name;
                string metodo = frame.GetMethod().Name;



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();

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
                                "ram_sprues"
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
            int largoproduccion = 20;
            string[] text = new string[1]; text[0] = "ID pattern";
            string[] text2 = new string[1]; text2[0] = " ";
            for (int j = 0; j < largoproduccion; j++)
            {
                Set_Data_To_BD("Pattern_produccion", text, text2);
            }



            string[] Ram_Cabecera = new string[100];
            Ram_Cabecera[0] = "Pattern";
            for (int id = 0; id < g_Cabecera.Length; id++)
            {
                Ram_Cabecera[id + 1] = g_Cabecera[id];
            }

            for (int id = 0; id < g_CoreGlobalPallet.Length; id++)
            {
                Ram_Cabecera[id + g_Cabecera.Length + 1] = g_CoreGlobalPallet[id];
            }
            int LargoRam = g_Cabecera.Length + g_CoreGlobalPallet.Length + 1;

            Array.Resize(ref Ram_Cabecera, LargoRam);

            Set_Crear_Tabla("Ram_ActualProduction", Ram_Cabecera);
            string[] addVlsRam = new string[LargoRam];
            for (int k = 0; k < Ram_Cabecera.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_ActualProduction", g_CoreGlobalPallet, addVls);


            int N_Sprues = 8,N_Localizador=12,N_Tapas = 10, N_Numeros = 10;
            string[] Ram_Sprues      = new string[N_Sprues];
            string[] Ram_Localizador = new string[N_Localizador];
            string[] Ram_Tapas       = new string[N_Tapas];
            string[] Ram_Numeros     = new string[N_Numeros];



            for (int id = 0; id < Ram_Sprues.Length; id++) { Ram_Sprues[id] = "N"+(id+1).ToString(); }
            Set_Crear_Tabla("Ram_Sprues", Ram_Sprues);
            Array.Resize(ref addVls, N_Sprues);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Sprues", Ram_Sprues, addVls);



            /*
            for (int id = 0; id < Ram_Tapas.Length - 1; id++) { Ram_Tapas[id] = "N°" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Tapas", Ram_Tapas);
            Array.Resize(ref addVls, N_Tapas);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Tapas", Ram_Tapas, addVls);



            for (int id = 0; id < Ram_Localizador.Length - 1; id++) { Ram_Localizador[id] = "N°" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Localizadores", Ram_Localizador);
            Array.Resize(ref addVls, N_Localizador);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Localizadores", Ram_Localizador, addVls);



            for (int id = 0; id < Ram_Numeros.Length - 1; id++) { Ram_Numeros[id] = "N°" + (id + 1).ToString(); }
            Set_Crear_Tabla("Ram_Numeros", Ram_Numeros);
            Array.Resize(ref addVls, N_Numeros);
            for (int k = 0; k < addVls.Length - 1; k++) { addVlsRam[k] = " "; }
            Set_Data_To_BD("Ram_Numeros", Ram_Numeros, addVls);


    */

        }
    }




}

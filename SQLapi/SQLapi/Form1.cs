using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO;
using MySql.Data.MySqlClient;
using System.Xml;

namespace SQLapi
{

    public partial class Form1 : Form
    {


        MySqlDataReader reader;
        public EthernetIP EthernetIP = new EthernetIP();
        Thread Thrd_Main, Thrd_BitVida, Thrd_LogTex, Thrd_GetPatterId, Thrd_NCoresActivos,Thrd_BD_R2;
        SQL_Bridge SQL;
        // Creamos el evento

        string g_IP_PLC = "192.168.1.10";
        public static string g_LogTextMain = "-1";
        public delegate void MyDelegado(string text);
        public delegate void ShowmessageBDE(string Path,string Metodo);
        //  public double g_matriz_Error_R1_to_R2 = { -1.16, 11.63 + 1.3, -32 + 13.15 };
        double[] g_matriz_Error_R1_to_R2 = new double[]
         {
            -1.16,  11.63 + 1.3, -32 + 13.15
         };






        /////////////////////////////////////////////////////////////////////////
        public void XMlTest() {
            XmlWriter w = XmlWriter.Create(@"C:\Img\miXML.xml");
            w.WriteStartElement("MiInfo");
            w.WriteElementString("TextBox", "Hola");
            w.WriteElementString("CheckBox", "Nacho");
            w.WriteEndElement();
            w.Close();
          /// XMLRead();
        }


        public void XMLRead() {

            XmlReader r = XmlReader.Create(@"C:\Img\miXML.xml");
            r.ReadStartElement("MiInfo");
            string nn= r.ReadElementContentAsString();
            string gg= (r.ReadElementContentAsString());
            r.Close();
        }
/////////////////////////////////////////////////////////////////////////




        public Form1()
        {

            InitializeComponent();
            /// Instruccion para deshabilidar los problemas de variables de di distintas clasess
            Control.CheckForIllegalCrossThreadCalls = false;
            ///  **********************************************************************************
         ///  XMlTest();
            EthernetIP.Ethernet_Init(g_IP_PLC);

            List<string> TagsPLC = EthernetIP.Get_Tags();

            while (TagsPLC.Count == 0)
            {
                EthernetIP.CloseEthernetIP();
                EthernetIP.Ethernet_Init(g_IP_PLC);
                TagsPLC = EthernetIP.Get_Tags();


            }


            SQL = new SQL_Bridge(g_IP_PLC);

            SQL.SQL_Init("magotteaux");
            //SQL.Set_SQL_TablaActual("6000733");

            EthernetIP.Ethernet_Init(g_IP_PLC);

            string[] Tags = EthernetIP.Get_Tag_List();
            try
            {
                for (int i = 0; i < Tags.Length - 1; i++)
                {
                    comboBox1.Items.Add(Tags[i]);
                }
            }
            catch (Exception err)
            {
                Form1.Show_Mesaje_Log(err);

            }

            Thread.Sleep(500);

            Thrd_Main = new Thread(new ThreadStart(Thread_Main));
            Thrd_Main.Start();
            Thrd_LogTex = new Thread(new ThreadStart(LogTexto));
            Thrd_GetPatterId = new Thread(new ThreadStart(PatternIdNow));
            Thrd_GetPatterId.Start();




            Thrd_NCoresActivos = new Thread(new ThreadStart(ActiveCore));
            Thrd_NCoresActivos.Start();
            Thrd_BitVida = new Thread(new ThreadStart(BitVida));
            Thrd_BitVida.Start();
            Thrd_BD_R2 = new Thread(new ThreadStart(BaseDatos_Robot_2));
            Thrd_BD_R2.Start();

        }

        public void BaseDatos_Robot_2() {


            while (false) {

                try
                {


                    string Tag_Cmd = "_EBD2_O_CmdDatos";
                    string ComandoRobot = EthernetIP.Lectura_tag(Tag_Cmd);

                    string Tag_MakeBDD_R2 = "_EV02_I_EjeZZ";
                    int MakeBDD_R2 = Convert.ToInt16( EthernetIP.Lectura_tag(Tag_MakeBDD_R2) );



                    string PATTERN_R2 = EthernetIP.Lectura_tag("_EBD_O_ListPattSelR02");

                    DerivadaPatternR2[1] = PATTERN_R2;


                    //////////////////////////////////////
                    /// _EV02_I_EjeZZ = 10 -> make BDD
                    //////////////////////////////////////

                    if (MakeBDD_R2 == 10 || DerivadaPatternR2[1]!= DerivadaPatternR2[0])
                    {
                        
                        Make_BDD_R2();

                        if (!SQL_Bridge.g_Estado_RecetaR2)
                        {
                            string Tag_Estado_RectaR2 = "_EBD2_I_EstadoReceta";
                            /////////////
                            /// Error de receta en R2
                            ///////////////

                        }


                    }


                    /////////////////////////////////////////
                    /// Se setea perocesando a 0 por seguridad
                    ////////////////////////////////////////

                    int ResultadoFalla = Convert.ToInt16(EthernetIP.Lectura_tag("_EBD_I_Resultado"));

                    if (ResultadoFalla > 1)
                    {
                        Thread.Sleep(100);
                        Send_Resultado_BD(0);
                    }

                    if (ComandoRobot != null && Convert.ToInt32(ComandoRobot) > 100 && Convert.ToInt32(ComandoRobot) < 255)
                    {
                        g_LogTextMain = "Solicitud R2-> "+ ComandoRobot;

                        Send_Pulse_Init_R2();

                
                        int IndexBd = Convert.ToInt16(ComandoRobot) - 100;

                        var ram_Fila_Data_R2 = SQL.Get_FilaTabla("bddin_r2", IndexBd.ToString());
                        string[] Tag_To_Write = {   "_EBD2_I_EjeX",
                                                    "_EBD2_I_EjeY",
                                                    "_EBD2_I_EjeZ",
                                                    "_EBD2_I_EjeA",
                                                    "_EBD2_I_EjeB",
                                                    "_EBD2_I_EjeC",
                                                    "_EV02_I_NumEntidad",
                                                    "_EV02_I_Segmento",
                                                    "_EV02_I_Segmento2"     };



                        /// Si no existen mas elementos que enviar envio un 255

                        if (ram_Fila_Data_R2[0][1] == " ")
                        {
                            for (int i = 0; i < Tag_To_Write.Length; i++)   {EthernetIP.Escritura_tag(Tag_To_Write[i], 0); }

                            EthernetIP.Escritura_tag(Tag_To_Write[6], 255);
                            g_LogTextMain = "Envio de Datos R2 Finalizada";
                        }
                        else {
                        

                            for (int i = 0; i < Tag_To_Write.Length; i++)
                            {
                                EthernetIP.Escritura_tag(Tag_To_Write[i], ram_Fila_Data_R2[0][i + 2]);
                            }
                        }

                        Send_Pulse_Finish_R2();
                        g_LogTextMain = "Solicitud R2-> Finalizada.......... " ;

                    }



                }
                catch (Exception err)
                {

                    g_LogTextMain = err.Message;
                }
            }


        }






        /// <summary>
        /// Se realiza la BD R2 con la informacion del pattern actual en R2
        /// </summary>
        /// 

        string[] DerivadaPatternR2 = new string[2];
        private void Make_BDD_R2()
        {
            try
            {
                string Tag_MakeBDD_R2 = "_EV02_I_EjeZZ";
                int Tag_MakeBDD_R2_plc = Convert.ToInt16(EthernetIP.Lectura_tag(Tag_MakeBDD_R2));

                SQL_Bridge.g_Estado_RecetaR2 = true;
                //////////////////////////////////////////////////////////////////
                ///  Obtengo el pattern que esta en R2
                //////////////////////////////////////////////////////////////////
                ///
                var PatternR2 = SQL.Get_DataR2("ID Pattern", "pattern_produccion");

                string PATTERN_R2 = EthernetIP.Lectura_tag("_EBD_O_ListPattSelR02");



                //    PATTERN_R2 = "6000782";

                DerivadaPatternR2[1] = PATTERN_R2;


                g_LogTextMain = "Adquiriendo Receta R2 -> " + PATTERN_R2;

                label_pattern_r2.Text = DerivadaPatternR2[1];


                if ((PATTERN_R2 != null && (DerivadaPatternR2[0] != DerivadaPatternR2[1])) || Tag_MakeBDD_R2_plc == 10)
                {

                    EthernetIP.Escritura_tag(Tag_MakeBDD_R2, 0);
                    var Receta = SQL.Get_DataRecetaR2(PATTERN_R2);
                    List<string[]> RecetaR2 = new List<string[]>();
                    List<string[]> RecetaR2_Ordenada = new List<string[]>();

                    List<string[]> RecetaR2_Tapas = new List<string[]>();
                    List<string[]> RecetaR2_Localizadores = new List<string[]>();
                    List<string[]> RecetaR2_Sprues = new List<string[]>();

                    string[] ListaBusqueda = { "LOC", "SPRUE", "LID", "PATTERN", "DOWEL", "SANDMIXER" };

                    for (int i = 0; i < Receta.Count; i++)
                    {
                        string[] AuxReceta = Receta[i];

                        if (AuxReceta[2].ToUpper().Contains(ListaBusqueda[0]) ||
                            AuxReceta[2].ToUpper().Contains(ListaBusqueda[1]) ||
                            AuxReceta[2].ToUpper().Contains(ListaBusqueda[2]) ||
                            AuxReceta[2].ToUpper().Contains(ListaBusqueda[3]) ||
                            AuxReceta[2].ToUpper().Contains(ListaBusqueda[4]) ||
                            AuxReceta[2].ToUpper().Contains(ListaBusqueda[5])
                            )
                        {
                            RecetaR2.Add(AuxReceta);
                        }
                    }





                    //             serialPort2.Write(DataToR2);


                    ////////////////////////////////////////////////////////
                    /// una vez creada la BD se carga la informacion filtrada
                    /// //////////////////////////////////////////////////////
                    string BaseDatosName = "BDDin_R2";
                    SQL.DropTable(BaseDatosName);

                    int Nelementos = 40;
                    int Idex_Insercion_BDDR2 = 0;
                    string[] Header = { "Tipo", "X", "Y", "Z", "A", "B", "C", "NumEntidad", "Segmento", "Insertar/Sacar" };
                    SQL.Set_Crear_Tabla(BaseDatosName, Header);

                    for (int i = 0; i < RecetaR2.Count; i++)
                    {
                        string[] Data = new string[Header.Length];

                        Data[0] = RecetaR2[i][2];
                        Data[1] = RecetaR2[i][5];
                        Data[2] = RecetaR2[i][6];
                        Data[3] = RecetaR2[i][7];
                        Data[4] = RecetaR2[i][8];
                        Data[5] = RecetaR2[i][9];
                        Data[6] = RecetaR2[i][10];
                        //Entidad
                        Data[7] = Receta[i][3];
                        //Dato random
                        Data[8] = Receta[i][11];



                        SQL.InsertarBDD_R2(PATTERN_R2, ListaBusqueda, BaseDatosName, Header, Data, Idex_Insercion_BDDR2, true);
                        Idex_Insercion_BDDR2++;
                    }






                    ////////////////////////////////////////////////////////
                    /// Se insertan los elementos en la BDD por Extraccion
                    ////////////////////////////////////////////////////////

                    g_LogTextMain = "Receta R2 -> " + PATTERN_R2 + " CREADA";


                }

                DerivadaPatternR2[0] = DerivadaPatternR2[1];

            }
            catch (Exception err)
            {

                g_LogTextMain = err.Message;
                Thread.Sleep(1000);
            }
        }


        public void ActiveCore() {
            Thread.Sleep(1000);
            int UmbralNcores = 5;
            while (true)
            {
                try
                {
                    var Cores = SQL.Get_Actives_Cores();


                    if (Cores != null)
                    {
                        int[] NelementosCores = new int[Cores.Count()];

                        for (int i = 0; i < NelementosCores.Length; i++)
                        {
                            var Ncores = Cores[i];
                            string Corecant = Ncores[3];
                            NelementosCores[i] = Convert.ToInt16(Corecant);
                        }



                        for (int i = 0; i < NelementosCores.Length; i++)
                        {
                            var CoresAlerta = Cores[i];
                            string Corename = CoresAlerta[0];
                            string Pallet = CoresAlerta[1];
                            if (NelementosCores[i] <= UmbralNcores)
                            {
                                //       g_LogTextMain = " ### ALERTA ### Core tipo  -> " + Corename + " Bajo en Stock en PALLET -> " + Pallet;
                                //      gTextMain = " ### ALERTA ### Core tipo  -> " + Corename + " Bajo en Stock en PALLET -> " + Pallet;
                                //       Agregar_texto_Visor_Log(g_LogTextMain);
                            }

                        }
                    }


                }
                catch (Exception err)
                {

                    Show_Mesaje_Log(err);
                }


                Thread.Sleep(5000);
            }
        }



        private void EthernetIP_plc_DataReceived1(object sender, MfgControl.AdvancedHMI.Drivers.Common.PlcComEventArgs e)
        {
            //MessageBox.Show("DataRX");

            Form1.g_LogTextMain = "RECIBI DATO";

            // throw new NotImplementedException();
        }


        /// <summary>
        /// Mata todos los procesos EXCEL
        /// </summary>
        public void Kill_Excel_Process()
        {
            foreach (Process proceso in Process.GetProcesses())
            {
                if (proceso.ProcessName == "EXCEL")
                {
                    proceso.Kill();
                }
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Kill_Excel_Process();
            Thrd_LogTex.Start();
            this.WindowState = FormWindowState.Minimized;


        }

        private void button1_Click(object sender, EventArgs e)
        {
        }

        private void button2_Click(object sender, EventArgs e)
        {
        }

        private void button3_Click(object sender, EventArgs e)
        {

            try
            {
                var tablas = SQL.get_Tablas_Activas();

                if (tablas.Length == 0)
                {

                    string[] addV = new string[SQL.g_ColumnasPallet.Length];
                    for (int k = 0; k < SQL.g_ColumnasPallet.Length - 1; k++) { addV[k] = " "; }

                    for (int i = 1; i < 7; i++)
                    {
                        SQL.Set_Crear_Tabla("Pallet_" + i.ToString(), SQL.g_ColumnasPallet);

                        int largo = 30;
                        for (int k = 0; k < largo; k++)
                        {
                            SQL.Set_Data_To_BD("Pallet_" + i.ToString(), SQL.g_ColumnasPallet, addV);
                        }

                    }


                    SQL.Set_Crear_Tabla("Global_Pallet", SQL.g_CoreGlobalPallet);
                    string[] addVls = new string[SQL.g_CoreGlobalPallet.Length];
                    for (int k = 0; k < SQL.g_CoreGlobalPallet.Length - 1; k++) { addVls[k] = " "; }
                    int largoStandar = 200;
                    for (int k = 0; k < largoStandar; k++)
                    {
                        SQL.Set_Data_To_BD("Global_Pallet", SQL.g_CoreGlobalPallet, addVls);
                    }




                    SQL.Set_Crear_Tabla("Pattern_produccion", SQL.g_PatternCacebera);
                    int largoproduccion = 20;
                    string[] text = new string[1]; text[0] = "ID pattern";
                    string[] text2 = new string[1]; text2[0] = " ";
                    for (int j = 0; j < largoproduccion; j++)
                    {
                        SQL.Set_Data_To_BD("Pattern_produccion", text, text2);
                    }



                    string[] Ram_Cabecera = new string[100];
                    Ram_Cabecera[0] = "Pattern";
                    for (int id = 0; id < SQL.g_Cabecera.Length; id++)
                    {
                        Ram_Cabecera[id + 1] = SQL.g_Cabecera[id];
                    }

                    for (int id = 0; id < SQL.g_CoreGlobalPallet.Length; id++)
                    {
                        Ram_Cabecera[id + SQL.g_Cabecera.Length + 1] = SQL.g_CoreGlobalPallet[id];
                    }
                    int LargoRam = SQL.g_Cabecera.Length + SQL.g_CoreGlobalPallet.Length + 1;

                    Array.Resize(ref Ram_Cabecera, LargoRam);

                    SQL.Set_Crear_Tabla("Ram_ActualProduction", Ram_Cabecera);
                    string[] addVlsRam = new string[LargoRam];
                    for (int k = 0; k < Ram_Cabecera.Length - 1; k++) { addVlsRam[k] = " "; }


                    SQL.Set_Data_To_BD("Ram_ActualProduction", SQL.g_CoreGlobalPallet, addVls);



                    MessageBox.Show("Tablas Creadas bro!");
                }
                else
                {

                    MessageBox.Show("Ya existen tablas, revisa el XAMP");

                }
            }
            catch (Exception err)
            {
                Form1.Show_Mesaje_Log(err);
            }

        }

        private void groupBox1_Enter(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {

          
        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }




        // #############################################################################
        // #############################################################################
        bool g_DinamicActive = false;
        private void abrirExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            open.Filter = "Hoja de cálculo de Microsoft Office Excel (.xlsx)|*.xlsx";
            if (open.ShowDialog() == DialogResult.OK)
            {

                bool Ack_Plc = true;
                int ConteoError = 0;
                try
                {


                    while (Ack_Plc && ConteoError < 3)
                    {
                        g_StartToCheck = false;
                        if (SQL.Excel(open.FileName, "Dinamica"))
                        {

                            ////////////////////////////////////////////
                            ///// ETHERTNET ////////////////////////////
                            ///COMUNCACION PLC /////////////////////////
                            ////////////////////////////////////////////
                            string TagDestino = "_EBD_I_DatosIngresadosDin";
                            EthernetIP.Escritura_tag(TagDestino, 1);
                            Thread.Sleep(50);
                            string AckPlc_str = EthernetIP.Lectura_tag("_EBD_O_DatosIngresadosDinACK");
                            EthernetIP.Escritura_tag(TagDestino, 0);

                            Ack_Plc = Convert.ToBoolean(AckPlc_str);
                            Ack_Plc = !Ack_Plc;
                            ConteoError++;
                            ///////////////////////////////////////////
                            g_DinamicActive = true;
                            MessageBox.Show("Pallet Recipe Load!");
                        }
                        else
                        {
                            
                            MessageBox.Show("I Can't load Excel File. please Ceck the file and the information.");
                        }
                        g_StartToCheck = true;

                    }

                }
                catch (Exception err)
                {
                    Show_Mesaje_Log(err);
                    Send_Procesando_BD(0);
                    Send_Resultado_BD(2);
                }

            }
            open.Dispose();
        }

        private void groupBox3_Enter(object sender, EventArgs e)
        {

        }


        public void Load_BD_Estatica(string Path,string Metodo) {

            if (SQL.Excel(Path, Metodo))
            {
                ////////////////////////////////////////////
                ///// ETHERTNET ////////////////////////////
                ///COMUNCACION PLC /////////////////////////
                ////////////////////////////////////////////
                string TagDestino = "_EBD_I_DatosIngresadosEst";
                EthernetIP.Escritura_tag(TagDestino, 1);
                Thread.Sleep(500);
                EthernetIP.Escritura_tag(TagDestino, 0);
                ///////////////////////////////////////////

         //       MessageBox.Show("Wena Watshoooo!!, Archivo Cargado en la Base de Datos Estatica");
            }
            else
            {
                MessageBox.Show("No se pudo cargar el Excel, revisa que volá");
            }
        }



        private void cargarRecetaPatternToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            open.Filter = "Hoja de cálculo de Microsoft Office Excel (.xlsx)|*.xlsx";
            if (open.ShowDialog() == DialogResult.OK)
            {
                open.Dispose();
                g_PathBDE = open.FileName;
                g_Metodo = "Estatica";
                g_Active_Load_BDE = true;

            }

           
        }



        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {

            Thrd_Main.Abort();
            Thrd_BitVida.Abort();
            Thrd_LogTex.Abort();
            Thrd_GetPatterId.Abort();
            SQL.Close_Excel();
            Thrd_NCoresActivos.Abort();
            Thrd_BD_R2.Abort();

            Kill_Excel_Process();

        }


        bool g_Active_Load_BDE = false;
        string g_PathBDE="",g_Metodo="";
        public void LogTexto()
        {

            while (true)
            {

                //Agregar_texto_Visor_Log( g_LogTextMain);

                MyDelegado MD2 = new MyDelegado(Agregar_texto_Visor_Log);
                MD2(g_LogTextMain);


              
            }

        }
        public void Agregar_texto_Visor_Log(string Texto)
        {
            if (Texto != "-1")
            {
                try
                {
                    DateTime Hora = DateTime.Now;
                    string HoraLog = Hora.Day.ToString() + "/" + Hora.Month.ToString() + "/" + Hora.Year.ToString() + " " + Hora.Hour.ToString() + ":" + Hora.Minute.ToString() + ":" + Hora.Second.ToString() + "." + Hora.Millisecond.ToString() + " || ";
                    LogText.AppendText(HoraLog + Texto + "\n");
                    LogText.SelectionStart = LogText.Text.Length;
                    LogText.ScrollToCaret();
                    g_LogTextMain = "-1";
                }
                catch (Exception err)
                {

                    Form1.Show_Mesaje_Log(err);
                }

            }

     //       Thread.Sleep(5);

        }


        private void button1_Click_2(object sender, EventArgs e)
        {
          

        }

        private void archivoToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            var sl = SQL.Get_OrdenCores("CLR", "global_pallet");
        }

        private void button5_Click(object sender, EventArgs e)
        {




        }






        private void button6_Click(object sender, EventArgs e)
        {
            SQL.Set_BD_toWhite();
        }



        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //##################   Comienzo de Programa automatico ##################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################





        public bool g_StartToCheck = true;
        public void PatternIdNow()
        {
            LED_BDD.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Red;
            LED_BDD.Value = true;

            Thread.Sleep(5000);
            while (true)
            {
                try
                {
                    while (true)
                    {
                        try
                        {



                            //***************************************************************
                            // Leo el pulso que me indica que a llegado un nuevo pattern
                            //                       ¡PENDIENTE!
                            //***************************************************************

                            //Tag_Cmd = "_EBD01_O_CmdDatos";
                            //string PulsoNewPatten = EthernetIP.Lectura_tag(Tag_Cmd);


                            if (g_StartToCheck)
                            {
                                Get_CambioPattern();
                                Get_BDD_Dinamica();
                            }
                            


                            if (g_Active_Load_BDE)
                            {
                                g_Active_Load_BDE = false;

                                g_LogTextMain = " Iniciando Carga de Recetas en BD";

                                ShowmessageBDE MD3 = new ShowmessageBDE(Load_BD_Estatica);
                                MD3(g_PathBDE, g_Metodo);
                                // this.Invoke(MD3, new object[] { g_PathBDE, g_Metodo });



                            }



                            Thread.Sleep(500);

                        }
                        catch (Exception)
                        {

                            throw;
                        }
                    }

                }
                catch (Exception)
                {

                    int FalloThread = 0;
                }
              
            }




        }





        /// <summary>
        /// Leo de manera automatica la BDD Dinamica en un archivo definido.
        /// </summary>

        private void Get_BDD_Dinamica()
        {

            try
            {

                // Lectura automatica de la base de datos dinamica.
                string PathFile = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD";

                // PathFile = @"C:\Users\Usuario\Dropbox (MIRS)\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD";
                string[] filePaths = Directory.GetFiles(PathFile, "*.xlsx");

                int N_SubCarpetas = 7;

                for (int i = 0; i < filePaths.Length; i++)
                {
                    string[] PosibleArchivo = filePaths[i].Split('\\');

                    string BDD_NameFile = PosibleArchivo[N_SubCarpetas];

                    // Busco si el archivo contiene BDD de base de datos dinaimca
                    if (BDD_NameFile.Contains("BDD") && !BDD_NameFile.Contains("~"))
                    {

                      
                        // Extraigo la fecha

                        string[] Fecha = BDD_NameFile.Split('_');

                        // verifico si la fecha corresponde 
                        //////////////
                        ///Pendiente//
                        //////////////


                        // Cargo el archivo
                        if (Cargar_BDD(filePaths[i]))
                        {
                            Set_Ram_Numeros_BDD_to_Vision();

                            //Muevo el archivo y cargo la BD
                            string PathToMove = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\Old_BDD\" + BDD_NameFile;
                            File.Move(filePaths[i], PathToMove);

                            g_LogTextMain = " ### ->  Se a cargado la BDD  <- ###";
                            // Thread.Sleep(1500);

                        }
                        else {

                            Set_Ram_Numeros_BDD_to_Vision();

                            //Muevo el archivo y cargo la BD
                            string PathToMove = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\Error_BDD\" + BDD_NameFile;
                            File.Move(filePaths[i], PathToMove);

                            g_LogTextMain = " ### ERROR ###  No lo logro cargar la BDD dinamica ###";
                            // Thread.Sleep(1500);
                            MessageBox.Show("Data Base is don't posible load. Please Check you config File", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);

                        }




                    }

                }


            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);

            }

        }

        /// <summary>
        /// Seteo de variables al OPC dinamico que enlaza BDD y Vision1
        /// </summary>
        private void Set_Ram_Numeros_BDD_to_Vision()
        {
            SQL.Set_Update_BD("ram_numeros", "N1", "0", 1);
            SQL.Set_Update_BD("ram_numeros", "N1", "Ultimo Cmd BDD R1", 2);

            SQL.Set_Update_BD("ram_numeros", "N2", "1", 1);
            SQL.Set_Update_BD("ram_numeros", "N2", "Cambio de Pattern", 2);


        }

        public void BitVida()
        {
            while (true)
            {
                EthernetIP.Funtion_Bit_Vida("_EBD_O_BitCom", "_EBD_I_BitCom");
                Thread.Sleep(1000);
            }

        }




        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //##################            MAIN                   ##################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################
        //#######################################################################



        /// <summary>
        /// Funcion que realiza una lectura continua del comando, para enviar los datos que correspondan
        /// </summary>
        public string[] g_DerivadaPattern = new string[2];
        public void Thread_Main()
        {
            while (true)
            {
                try
                {
                    string Tag_Cmd = "_EBD_O_CmdDatos";
                    string ComandoRobot = EthernetIP.Lectura_tag(Tag_Cmd);
                    /////////////////////////////////////////
                    /// Se setea perocesando a 0 por seguridad
                    ////////////////////////////////////////

                    int  ResultadoFalla = Convert.ToInt16( EthernetIP.Lectura_tag("_EBD_I_Resultado")  ) ;

                    if (ResultadoFalla>1)
                    {
                        Thread.Sleep(100);
                        Send_Resultado_BD(0);
                    }

                    if (ComandoRobot != null && Convert.ToInt32(ComandoRobot) > 100 && Convert.ToInt32(ComandoRobot) < 255)
                    {
           
                        string TextoVisor = "Solicitud de Comando -> " + ComandoRobot;
                        // Agregar_texto_Visor_Log(ref TextoVisor);

                        MyDelegado MD = new MyDelegado(Agregar_texto_Visor_Log);
                        this.Invoke(MD, new object[] { TextoVisor });

                        Send_Pulse_Init();

                        // Enviar Datos de RAM
                        if (Get_RamValue(Convert.ToInt32(ComandoRobot)))
                        {

                            string NumEntidad =EthernetIP.Lectura_tag("_EBD_I_NumEntidad");

                            TextoVisor = "Solicitud cargada........  NumEntidad -> "+NumEntidad;

                            MyDelegado MD2 = new MyDelegado(Agregar_texto_Visor_Log);
                            this.Invoke(MD2, new object[] { TextoVisor });


                            SQL.Set_Update_BD("ram_numeros", "N1", ComandoRobot, 1);
                            SQL.Set_Update_BD("ram_numeros", "N1", "Ultimo Cmd BDD R1", 2);
                            Send_Pulse_Finish();

                        }
                        else {
                            TextoVisor = "#### ERROR ### -> Solicitud NO Cargada........";

                            MyDelegado MD2 = new MyDelegado(Agregar_texto_Visor_Log);
                            this.Invoke(MD2, new object[] { TextoVisor });
                            Send_Pulse_Error();

                        }
                    }


                    ComandoRobot = EthernetIP.Lectura_tag(Tag_Cmd);
                    int ComandoRobot_Int = Convert.ToInt16(ComandoRobot);
 


                    /////////////////////////////////////////////
                    //// Enviar la base de datos Dinamica..
                    ////////////////////////////////////////////




                }
                catch (Exception err)
                {
                    Form1.Show_Mesaje_Log(err);
                    Send_Pulse_Error();
                }


           //     Thread.Sleep(200);
            }

        }

        /// <summary>
        /// Verifico si existe un cambio de pattern y envio pulso a variable
        /// _EBD_I_CambioPattern
        /// </summary>
        public int[] g_DerIndexPattern = new int[2];
        public string[] g_DerIndexPatternStr = new string[2];
        private void Get_CambioPattern()
        {

            try
            {

                if (g_DinamicActive)
                {


                    /// Verifico el Pattern actual y envio señal al PLC
                    string Tag = "_EBD_O_IdPatternUsar";

                    string IndexPattern_str = SQL.ReadEthernetIP(Tag);
                    int IndexPattern = Convert.ToInt16(IndexPattern_str);

                    string TagPattertSelect = "_EBD_I_PattActEnR01";// "_EBD_I_PatternList[" + (IndexPattern + 1).ToString() + "]";//;/// 

                    string Pattern_str = SQL.ReadEthernetIP(TagPattertSelect);
                    g_DerIndexPatternStr[0] = Pattern_str;


                    //////////////////////////
                    //IndexPattern = 0;
                    //////////////////////////
                    ///
                    var PatternList = SQL.g_PatternList;
                    int largoElementos = PatternList.Length;


                    /// Busco el index que corresponde
                    IndexPattern = -1;
                    for (int i = 0; i <= largoElementos - 1; i++)
                    {
                        string Patt = Pattern_str.ToUpper();
                        string patt2 = PatternList[i].ToUpper();

                        if (patt2== Patt)
                        {
                            int nn = 0;
                        }
                        if (Pattern_str.ToUpper() == PatternList[i].ToUpper())
                        {
                            IndexPattern = i;
                            break;
                        }
                    }

                    g_DerIndexPattern[0] = IndexPattern;
                    Console.WriteLine("------------------------------------");
                    Console.WriteLine("Pattern Actual -> {0}", Pattern_str);
                    Console.WriteLine("------------------------------------");
                    if ((IndexPattern >= 0) )
                    {
                        labelPattern.Text = PatternList[IndexPattern];

                        g_DerivadaPattern[0] = PatternList[IndexPattern];

                        if ((g_DerivadaPattern[0] != g_DerivadaPattern[1])  || g_Load)
                        {
                            g_Load= false;
                            string[] RamActual = SQL.Get_Columna("Conteo Produccion", "pattern_produccion");
                            var Select_T = RamActual[0];
                            int ConteopActual = Convert.ToInt16(RamActual[Convert.ToInt32(IndexPattern)]);

                            SQL.Set_Update_BD("pattern_produccion", "Conteo Produccion", (ConteopActual + 1).ToString(), (Convert.ToInt32(IndexPattern) + 1));
                            SQL.Set_PatternString(g_DerivadaPattern[0]);
                            SQL.Set_Update_BD("ram_patternproductionline", "PatterInConveyor", g_DerivadaPattern[0], 1);

                            g_DerivadaPattern[1] = g_DerivadaPattern[0];
                            Tag = "_EBD_I_CambioPattern";
                            Send_Pulso_PLC(Tag, 1, 0, 500);

                            ////////////////////////////////////////////
                            /// Defino los apilados y la codificacion
                            /// para guardarla en BDE y luego enviarla 
                            ////////////////////////////////////////////
                            Get_Codifico_Apilado_and_Set_BDE(Pattern_str);

                        }
                        else
                        {
                            //  Show_Mesaje_Log("Elemento Seleccionado en PLC NO VALIDO");
                        }
                    }

                    if (IndexPattern == -1)
                    {
                        g_LogTextMain = "ERROR Ningun Pattern Seleccionado";
                        labelPattern.Text = "No Seleccionado";
                    }
                    else {


                        /////////////////////////////////////////////////////
                        /// Verifico Que ConteoProduccion NO se quede en 0    
                        ////////////////////////////////////////////////////
                        ///
                        try
                        {
                            string[] RamActual = SQL.Get_Columna("Conteo Produccion", "pattern_produccion");
                            var Select_T = RamActual[0];
                            int ConteopActual = Convert.ToInt16(RamActual[Convert.ToInt32(IndexPattern)]);

                            if (ConteopActual == 0)
                            {
                                SQL.Set_Update_BD("pattern_produccion", "Conteo Produccion", (ConteopActual + 1).ToString(), (Convert.ToInt32(IndexPattern) + 1));


                            }

                        }
                        catch (Exception err2)
                        {

                            Show_Mesaje_Log(err2);
                        }
                    }


                    if (g_DinamicActive)
                    {
                        g_DerIndexPattern[1] = g_DerIndexPattern[0];
                        g_DerIndexPatternStr[0] = g_DerIndexPatternStr[1];
                    }


                   


                  



                }

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
            }


           

        }


        /// <summary>
        /// Seteo en BDE la codificacion y si es apilado o no 
        /// </summary>
        /// <param name="Pattern_str"></param>
        private void Get_Codifico_Apilado_and_Set_BDE(string Pattern_str)
        {
            List<string[]> GlobalPallet = new List<string[]>();
            int idexBDD = 1;
            var CodCore_BDE = SQL.Get_Columna("Cod Core", Pattern_str);

            while (true)
            {
                var ActualCore = SQL.Get_All_Actives_Cores(idexBDD);
                if (ActualCore[1] == " ")
                {
                    break;
                }
                GlobalPallet.Add(ActualCore);

                idexBDD++;

            }

            ////////////////////////////////////////////////////////////////
            // Obtengo el nombre de los corea a utilizar en la BBD Actual
            ////////////////////////////////////////////////////////////////


            for (int i = 0; i < GlobalPallet.Count; i++)
            {
                var Data_BDD = GlobalPallet[i];
                string Core_To_Find = Data_BDD[1];
                string Coding = Data_BDD[5];
                string esApilado = Data_BDD[6];

                for (int j = 0; j < CodCore_BDE.Length; j++)
                {
                    if (Core_To_Find == CodCore_BDE[j])
                    {
                        SQL.Set_Update_BD(Pattern_str, SQL.g_Cabecera[0], Coding, j + 1);

                        if (esApilado == "1")
                        {
                            SQL.Set_Update_BD(Pattern_str, SQL.g_Cabecera[3], "SI_Apilado", j + 1);
                        }
                        else if (esApilado == "0")
                        {

                            SQL.Set_Update_BD(Pattern_str, SQL.g_Cabecera[3], "NO_Apilado", j + 1);
                        }
                        else if (esApilado == "2")
                        {

                            SQL.Set_Update_BD(Pattern_str, SQL.g_Cabecera[3], "Vertical_Core", j + 1);
                        }

                    }
                }

            }

        }

        public void Send_Procesando_BD(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD_I_Procesando", Procesando);

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
            }


        }
        public void Send_Resultado_BD(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD_I_Resultado", Procesando);
             //   Thread.Sleep(30);
             //   EthernetIP.Escritura_tag("_EBD_I_Resultado", 0);

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
            }


        }

        public void Send_Procesando_BD_R2(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD2_I_Procesando", Procesando);

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
            }


        }
        public void Send_Resultado_BD_R2(int Procesando)
        {
            try
            {
                EthernetIP.Escritura_tag("_EBD2_I_Resultado", Procesando);
                //   Thread.Sleep(30);
                //   EthernetIP.Escritura_tag("_EBD_I_Resultado", 0);

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
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

                Show_Mesaje_Log(err);
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

                Show_Mesaje_Log(err);
            }
        }




        public bool Cargar_BDD(string FileName) {



            bool Ack_Plc = true;
            int ConteoError = 0;
            try
            {


                while (Ack_Plc && ConteoError < 3)
                {

                    if (SQL.Excel(FileName, "Dinamica"))
                    {

                        ////////////////////////////////////////////
                        ///// ETHERTNET ////////////////////////////
                        ///COMUNCACION PLC /////////////////////////
                        ////////////////////////////////////////////
                        string TagDestino = "_EBD_I_DatosIngresadosDin";
                        EthernetIP.Escritura_tag(TagDestino, 1);
                        Thread.Sleep(50);
                        string AckPlc_str = EthernetIP.Lectura_tag("_EBD_O_DatosIngresadosDinACK");
                        EthernetIP.Escritura_tag(TagDestino, 0);

                        Ack_Plc = Convert.ToBoolean(AckPlc_str);
                        Ack_Plc = !Ack_Plc;
                        ConteoError++;
                        /////////////////////////////////////////// cuando
                        g_DinamicActive = true;
                        g_LogTextMain = " ### -> Base de datos Dinamica Cargada con EXITO <- ###";
                        LED_BDD.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
                        LED_BDD.Value = true;
                        return true;
                    }
                    else
                    {
                        ConteoError++;

                        LED_BDD.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
                        LED_BDD.Value = true;

                        g_LogTextMain = " ### -> Error de carga de BDD, reintento N°"+ ConteoError .ToString()+ " <- ###";

                    }





                }

                return false;

            }
            catch (Exception err)
            {
                Show_Mesaje_Log(err);
                Send_Procesando_BD(0);
                Send_Resultado_BD(2);
                return false;
            }


        }


        private void groupBox3_Enter_1(object sender, EventArgs e)
        {

        }


        //#######################################################################
        //#######################################################################

        /// <summary>
        /// Segun el Comando que lea, se entrega la informacion de la BBD RAM a los Perifericos.
        /// </summary>
        /// <param name="RobotCmd"> el comando es _</param>
        public bool Get_RamValue(int RobotCmd)
        {
            //###################################################################
            try
            {


                string Tag = "_EBD_O_IdPatternUsar";
                int ComandoRobot = RobotCmd;

                string PatternIdToUse = SQL.ReadEthernetIP(Tag);

                int PattToUse = Convert.ToInt16(PatternIdToUse);


                if (ComandoRobot > 100 && PattToUse >= 0)
                {


                    if (SQL.Get_PatternString(PattToUse) == "")
                    {

                        Send_Pulse_Error();
                    }
                    string TagToWrite = "_EBD_I_numEntidad";





                    
                    int N_EntidadesMax = SQL.Get_N_Entidades("ID", SQL.Get_PatternString());

                    int IdxPattern = Convert.ToInt32(PatternIdToUse);
                    int IdxEntidadToUse = ComandoRobot - 100;

                    var IDPattern = SQL.Get_Columna("ID Pattern", "pattern_produccion");
                    var ConteoProduccion = SQL.Get_Columna("Conteo Produccion", "pattern_produccion");


                    for (int i = 0; i < IDPattern.Length; i++)
                    {

                        if (IDPattern[i] == SQL.Get_PatternString())
                        {
                            IdxPattern = i;
                            break;
                        }
                    }
                    //Escribo el numero de iteracion en produccion 
                    string TagToWriteNumPattern = "_EBD_I_NumPatter";
  ///-> Descomentar                  EthernetIP.Escritura_tag(TagToWriteNumPattern, (Convert.ToInt32(ConteoProduccion[IdxPattern])));

                    ///#####################################################
                    /// Si el ID solicitado es mayor al numero de entidades
                    /// envio un 255
                    ///#####################################################

                     if (N_EntidadesMax < Convert.ToInt32(IdxEntidadToUse))
                    {
                        Form1.g_LogTextMain = " ### EXITO ### Pattern FINALIZADo :)";
                        SQL.SendEthernetIP(TagToWrite, 255);
                        //Borro el pattern actual y lo transfiero a R2
                        SQL.Set_Update_BD("ram_patternproductionline", "PatterInConveyor", "", 1);
                        SQL.Set_Update_BD("ram_patternproductionline", "PatterInConveyor", SQL.Get_PatternString(), 2);

                        Send_Pulse_Finish();
                        return true;
                    }
                    ///#####################################################


                    ///#####################################################
                    /// Adquiero el valor de la Ram de BD
                    ///#####################################################
                    if (SQL.Get_Ram_Info(IdxPattern, IdxEntidadToUse))
                    {
                        Send_Pulse_Finish();
                        return true;
                    }
                    else {
                        Send_Pulse_Error();
                        return false;
                    }
                    //******************************************************
               
                }
                else
                {

                    Form1.g_LogTextMain = "### ERROR ### Se a enviado un Pattern con index Negativo ";
                    Send_Pulse_Error();
                    return false;
                }


            }
            catch (Exception err)
            {

                Show_Mesaje_Log(err);
                Send_Pulse_Error();

            }

            //###################################################################
            return false;


        }


        public int g_RetardoEnvioSpsRobot = 20;
        public void Send_Pulse_Error()
        {
            Form1.g_LogTextMain = "### Pulso Error  ### ->Procesando =0 || Resultado = 2 ";
            //////////////////////////////////
            Send_Procesando_BD(0); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD(2);  ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////
        }

        private void Send_Pulse_Finish()
        {

         //   Form1.g_LogTextMain = "### Pulso Final  ### ->Procesando =0 || Resultado = 1 ";
            //////////////////////////////////
            Send_Procesando_BD(0); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD(1);  ///////////                         
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////

        }


        private void Send_Pulse_Init()
        {
        //    Form1.g_LogTextMain = "### Pulso Inicio  ### ->Procesando =1 || Resultado = 0 ";
            //////////////////////////////////
            Send_Procesando_BD(1); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD(0);  /////////// 
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////
        }

/// <summary>
/// Pulso error para R2
/// </summary>
        public void Send_Pulse_Error_R2()
        {
            Form1.g_LogTextMain = "### Pulso Error  ### ->Procesando =0 || Resultado = 2 ";
            //////////////////////////////////
            Send_Procesando_BD_R2(0); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD_R2(2);  ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////
        }

        private void Send_Pulse_Finish_R2()
        {

            //   Form1.g_LogTextMain = "### Pulso Final  ### ->Procesando =0 || Resultado = 1 ";
            //////////////////////////////////
            Send_Procesando_BD_R2(0); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD_R2(1);  /////////// 
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////

        }


        private void Send_Pulse_Init_R2()
        {
            //    Form1.g_LogTextMain = "### Pulso Inicio  ### ->Procesando =1 || Resultado = 0 ";
            //////////////////////////////////
            Send_Procesando_BD_R2(1); ///////////
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            Send_Resultado_BD_R2(0);  /////////// 
            Thread.Sleep(g_RetardoEnvioSpsRobot);
            //////////////////////////////////
        }




        private void button2_Click_2(object sender, EventArgs e)
        {

        }

        private void button1_Click_3(object sender, EventArgs e)
        {
            string Tag_MakeBDD_R2 = "_EV02_I_EjeZZ";
            EthernetIP.Escritura_tag(Tag_MakeBDD_R2, "10");
        }

        private void button3_Click_1(object sender, EventArgs e)
        {

            DialogResult dialog = MessageBox.Show("Are you sure that want close Data Base System?","Data Base", MessageBoxButtons.YesNo, MessageBoxIcon.Information);

            if (dialog == DialogResult.Yes)
            {

                this.Close();

            }
        }

        private void menuStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {

        }

        public bool g_Load = false;
        private void button8_Click(object sender, EventArgs e)
        {
            g_Load = true;

        }

        private void button7_Click(object sender, EventArgs e)
        {
            LogText.Clear();
        }

        //#######################################################################
        //#######################################################################






        public static void Show_Mesaje_Log(Exception err)
        {
            try
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



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString() + " -> " + Mensaje;

            }
            catch (Exception)
            {


            }



        }



        public static void Show_Mesaje_Log(Exception err, string tagName)
        {
            try
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



                Form1.g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString() + " -> " + Mensaje + "<- Tag -> " + tagName;

            }
            catch (Exception)
            {


            }


        }

        public static void Show_Mesaje_Log(string Mensaje)
        {
            try
            {
             
                Form1.g_LogTextMain = "### ERROR ###   " + Mensaje;

            }
            catch (Exception)
            {


            }



        }

















    }
}

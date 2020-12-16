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


namespace SQLapi
{

    public partial class Form1 : Form
    {


        MySqlDataReader reader;
        public EthernetIP EthernetIP = new EthernetIP();
        Thread Thrd_Main, Thrd_BitVida, Thrd_LogTex, Thrd_GetPatterId;
        SQL_Bridge SQL;
        // Creamos el evento

        string g_IP_PLC = "192.168.1.10";
        public static string g_LogTextMain = "-1";
        delegate void MyDelegado(string text);

        public Form1()
        {

            InitializeComponent();
            /// Instruccion para deshabilidar los problemas de variables de di distintas clasess
            Control.CheckForIllegalCrossThreadCalls = false;
            ///  **********************************************************************************




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


            Thrd_Main = new Thread(new ThreadStart(Thread_Main));
            Thrd_Main.Start();
            Thrd_BitVida = new Thread(new ThreadStart(BitVida));
            Thrd_BitVida.Start();
            Thrd_LogTex = new Thread(new ThreadStart(LogTexto));
            Thrd_GetPatterId = new Thread(new ThreadStart(PatternIdNow));
            Thrd_GetPatterId.Start();

        }

        private void EthernetIP_plc_DataReceived1(object sender, MfgControl.AdvancedHMI.Drivers.Common.PlcComEventArgs e)
        {
            //MessageBox.Show("DataRX");

            Form1.g_LogTextMain = "RECIBI DATO";

            // throw new NotImplementedException();
        }


        private void Form1_Load(object sender, EventArgs e)
        {

            Thrd_LogTex.Start();
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

            try
            {
                if (SQL.Set_Crear_Tabla(PatternName_txbx.Text, SQL.g_Cabecera))
                {
                    MessageBox.Show("Tabla Creada bro!");
                }
                else
                {
                    MessageBox.Show("No se pudo crear la tabla, revisa que volá");
                }
            }
            catch (Exception err)
            {
                Form1.Show_Mesaje_Log(err);
            }

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
                            MessageBox.Show("Archivo Cargado en la Base de Datos Dínamica");
                        }
                        else
                        {

                            MessageBox.Show("No se pudo cargar el Excel, revisa que volá");
                        }





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

        private void cargarRecetaPatternToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            open.Filter = "Hoja de cálculo de Microsoft Office Excel (.xlsx)|*.xlsx";
            if (open.ShowDialog() == DialogResult.OK)
            {

                if (SQL.Excel(open.FileName, "Estatica"))
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

                    MessageBox.Show("Wena Watshoooo!!, Archivo Cargado en la Base de Datos Estatica");
                }
                else
                {
                    MessageBox.Show("No se pudo cargar el Excel, revisa que volá");
                }

            }
            open.Dispose();
        }

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {

            Thrd_Main.Abort();
            Thrd_BitVida.Abort();
            Thrd_LogTex.Abort();
            Thrd_GetPatterId.Abort();
            SQL.Close_Excel();
        }



        public void LogTexto()
        {

            while (true)
            {

                //Agregar_texto_Visor_Log( g_LogTextMain);

                MyDelegado MD2 = new MyDelegado(Agregar_texto_Visor_Log);
                this.Invoke(MD2, new object[] { g_LogTextMain });


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


        }


        private void button1_Click_2(object sender, EventArgs e)
        {
            string core = textBox1.Text;
            var Global_Pallet = SQL.GlobalPallet_view;


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
                            Agregar_texto_Visor_Log(Info);

                            // MessageBox.Show("Continuar?");
                        }

                    }




                }

            }

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



            if (SQL.Get_Ram_Info(Convert.ToInt32(textBox2.Text), Convert.ToInt32(textBox3.Text)))
            {
                MessageBox.Show("Se ha cargado la informacion de produccion");
                return;
            }
            else
            {

                MessageBox.Show("Fea la Volá...NOOO se ha cargado la informacion de produccion");
                return;
            }

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






        public void PatternIdNow()
        {
            Thread.Sleep(3000);
            while (true)
            {

                Get_CambioPattern();
                Thread.Sleep(1500);
            }

        }


        public void BitVida()
        {
            while (true)
            {
                EthernetIP.Funtion_Bit_Vida("_EBD_O_BitCom", "_EBD_I_BitCom");
                Thread.Sleep(1000);
            }

        }



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
                    string Tag_Cmd = "_EV01_O_CmdDatos";
                    string ComandoRobot = EthernetIP.Lectura_tag(Tag_Cmd);

                    if (ComandoRobot != null && Convert.ToInt32(ComandoRobot) > 100)
                    {
                        string TextoVisor = "Solicitud de Comando -> " + ComandoRobot;
                        // Agregar_texto_Visor_Log(ref TextoVisor);

                        MyDelegado MD = new MyDelegado(Agregar_texto_Visor_Log);
                        this.Invoke(MD, new object[] { TextoVisor });

                        Send_Pulse_Init();

                        // Enviar Datos de RAM
                        if (Get_RamValue(Convert.ToInt32(ComandoRobot)))
                        {
                            TextoVisor = "Solicitud cargada........";

                            MyDelegado MD2 = new MyDelegado(Agregar_texto_Visor_Log);
                            this.Invoke(MD2, new object[] { TextoVisor });


                            Send_Pulse_Finish();
                        }
                    }



                    Thread.Sleep(100);
                    // Lectura automatica de la base de datos dinamica.
                    string PathFile = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD";

                    PathFile = @"C:\Users\Usuario\Dropbox (MIRS)\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD";
                    string[] filePaths = Directory.GetFiles(PathFile, "*.xlsx");






                }
                catch (Exception err)
                {
                    Form1.Show_Mesaje_Log(err);
                    Send_Pulse_Error();
                }

   

            }

        }

        /// <summary>
        /// Verifico si existe un cambio de pattern y envio pulso a variable
        /// _EBD_I_CambioPattern
        /// </summary>
        public int[] g_DerIndexPattern = new int[2];
        private void Get_CambioPattern()
        {
            /// Verifico el Pattern actual y envio señal al PLC
            string Tag = "_EBD_O_IdPatternUsar";

            string IndexPattern_str = SQL.ReadEthernetIP(Tag);
            int IndexPattern = Convert.ToInt16(IndexPattern_str) -5;
            //////////////////////////
            //IndexPattern = 0;
            //////////////////////////
            ///
            var PatternList = SQL.g_PatternList;
            int largoElementos = PatternList.Length;




            g_DerIndexPattern[0] = IndexPattern;
            if ((IndexPattern >= 0) && g_DinamicActive && (IndexPattern<=largoElementos) )
            {
             
                g_DerivadaPattern[0] = PatternList[IndexPattern];

                if ((g_DerivadaPattern[0] != g_DerivadaPattern[1]))
                {
                    string[] RamActual = SQL.Get_Columna("Conteo Produccion", "pattern_produccion");
                    int ConteopActual = Convert.ToInt16(RamActual[Convert.ToInt32(IndexPattern)]);
                    SQL.Set_Update_BD("pattern_produccion", "Conteo Produccion", (ConteopActual + 1).ToString(), (Convert.ToInt32(IndexPattern) + 1));
                    SQL.Set_PatternString(g_DerivadaPattern[0]);
                    SQL.Set_Update_BD("ram_patternproductionline", "PatterInConveyor", g_DerivadaPattern[0], 1);

                    g_DerivadaPattern[1] = g_DerivadaPattern[0];
                    Tag = "_EBD_I_CambioPattern";
                    Send_Pulso_PLC(Tag, 1, 0, 200);

                    /////////////////////////////////////////////////
                    // Se debera leer BD Produccion y alertar cuando
                    // un pattern cumpla las Iteraciones Maximas.

                        

                    /////////////////////////////////////////////////

                }
                else
                {
                  //  Show_Mesaje_Log("Elemento Seleccionado en PLC NO VALIDO");
                }
            }


            g_DerIndexPattern[1] = g_DerIndexPattern[0];
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
                Thread.Sleep(100);
                EthernetIP.Escritura_tag("_EBD_I_Resultado", 0);
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
                    if (SQL.Get_PatternString() == "")
                    {

                        Send_Pulse_Error();
                    }
                    string TagToWrite = "_EBD_I_numEntidad";

                    int N_EntidadesMax = SQL.Get_N_Entidades("insercionID", SQL.Get_PatternString());

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
                    EthernetIP.Escritura_tag(TagToWriteNumPattern, (Convert.ToInt32(ConteoProduccion[IdxPattern])));

                    ///#####################################################
                    /// Si el ID solicitado es mayor al numero de entidades
                    /// envio un 255
                    ///#####################################################

                    if (N_EntidadesMax < Convert.ToInt32(IdxEntidadToUse))
                    {

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
                    SQL.Get_Ram_Info(IdxPattern, IdxEntidadToUse);
                    Send_Pulse_Finish();
                    //******************************************************
                    return true;
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

        private void Send_Pulse_Error()
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

        private void button2_Click_2(object sender, EventArgs e)
        {

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

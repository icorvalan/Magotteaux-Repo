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

using MySql.Data.MySqlClient;


namespace SQLapi
{

    public partial class Form1 : Form
    {


        MySqlDataReader reader;
        public Bridge_EthernetIP.EthernetIP EthernetIP = new Bridge_EthernetIP.EthernetIP();
        Thread Thrd_Main, Thrd_BitVida,Thrd_LogTex;
        SQL_Bridge SQL;
        // Creamos el evento
        // serialPort.DataReceived += new SerialDataReceivedEventHandler(SerialPort_DataReceived);
        string g_IP_PLC = "192.168.1.20";
        public static string g_LogTextMain = "-1";

        public Form1()
        {

            InitializeComponent();
            /// Instruccion para deshabilidar los problemas de variables de di distintas clasess
            Control.CheckForIllegalCrossThreadCalls = false;
            ///  **********************************************************************************
  



            SQL = new SQL_Bridge(g_IP_PLC);

            SQL.SQL_Init("magotteaux");
            SQL.Set_SQL_TablaActual("6000733");


            EthernetIP.EthernetIP_plc.DataReceived += EthernetIP_plc_DataReceived1;

            Thrd_Main = new Thread(new ThreadStart(Thread_Main));
            Thrd_Main.Start();
            Thrd_BitVida = new Thread(new ThreadStart(BitVida));
            Thrd_BitVida.Start();
            Thrd_LogTex = new Thread(new ThreadStart(LogTexto));
            Thrd_LogTex.Start();



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



                 g_LogTextMain = "### ERROR ### en CLASE " + Clase + " , en Metodo  " + metodo + " en LINEA de programa " + LineaError.ToString();


            }



        }

        private void EthernetIP_plc_DataReceived1(object sender, MfgControl.AdvancedHMI.Drivers.Common.PlcComEventArgs e)
        {
            MessageBox.Show("DataRX");
            throw new NotImplementedException();
        }

        // 
        private void EthernetIP_plc_DataReceived(object sender, MfgControl.AdvancedHMI.Drivers.Common.PlcComEventArgs e)
        {
            MessageBox.Show("Se ha recibido un dato");
            throw new NotImplementedException();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
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

                MessageBox.Show(err.Message);
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

                MessageBox.Show(err.Message);
            }

        }

        private void button1_Click_1(object sender, EventArgs e)
        {

        }




        // #############################################################################
        // #############################################################################
        private void abrirExcelToolStripMenuItem_Click(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            open.Filter = "Hoja de cálculo de Microsoft Office Excel (.xlsx)|*.xlsx";
            if (open.ShowDialog() == DialogResult.OK)
            {

                if (SQL.Excel(open.FileName, "Dinamica"))
                {

                    ////////////////////////////////////////////
                    ///// ETHERTNET ////////////////////////////
                    ///COMUNCACION PLC /////////////////////////
                    ////////////////////////////////////////////
                    string TagDestino = "EC_O_DatosIngresados";
                    EthernetIP.Escritura_tag(TagDestino, 1);
                    ///////////////////////////////////////////

                    MessageBox.Show("Archivo Cargado en la Base de Datos Dínamica");
                }
                else
                {

                    ////////////////////////////////////////////
                    ///// ETHERTNET ////////////////////////////
                    ///COMUNCACINO PLC /////////////////////////
                    ////////////////////////////////////////////
                    string TagDestino = "EC_O_DatosIngresados";
                    EthernetIP.Escritura_tag(TagDestino, 0);
                    ///////////////////////////////////////////

                    MessageBox.Show("No se pudo cargar el Excel, revisa que volá");
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
            SQL.Close_Excel();
        }



        public void LogTexto() {

            while (true)
            {

                Agregar_texto_Visor_Log(ref g_LogTextMain);
            }

        }
        public void  Agregar_texto_Visor_Log(ref string Texto)
        {
            if (Texto != "-1")
            {
                LogText.AppendText(Texto + "\n");
                LogText.SelectionStart = LogText.Text.Length;
                LogText.ScrollToCaret();
                Texto = "-1";
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
                            Agregar_texto_Visor_Log(ref Info);

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
        //##################   Comienzo de Programa automatico ##################
        //#######################################################################





        public void BitVida()
        {

            //#################### EthernetIP.Funtion_Bit_Vida("_EBD_O_BitCom", "_EBD_I_BitCom");

        }



        /// <summary>
        /// Funcion que realiza una lectura continua del comando, para enviar los datos que correspondan
        /// </summary>
        public void Thread_Main()
        {
            while (true)
            {
                try
                {
                    string Tag_Cmd = "_EV1_O_CmdDatos";
                    string ComandoRobot = EthernetIP.Lectura_tag(Tag_Cmd);

                    // Enviar Datos de RAM
                    Get_RamValue(Convert.ToInt32(ComandoRobot));
                    // Enviar Datos de Sprue
                    // -> Falta
                    // Enviar Datos de tapas
                    // -> Falta
                    // Enviar Datos de Localizadores
                    // -> Falta
                   

                }
                catch (Exception err)
                {
                    /// Enviar comendo de error al ROBOT.
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

        }


        //#######################################################################
        //#######################################################################

        /// <summary>
        /// Segun el Comando que lea, se entrega la informacion de la BBD RAM a los Perifericos.
        /// </summary>
        /// <param name="RobotCmd"></param>
        public void Get_RamValue(int RobotCmd)
        {
            //###################################################################

            string Tag = "EC_O_IDPatterUsar";
            int ComandoRobot = RobotCmd;

            if (ComandoRobot > 100)
            {
                string PatternIdToUse = SQL.ReadEthernetIP(Tag);
                string TagToWrite = "_EBD_I_numEntidad";

                var PatternList = SQL.g_PatternList;
                int N_EntidadesMax = SQL.Get_N_Entidades("insercionID", PatternList[Convert.ToInt32(PatternIdToUse)]);


                ///#####################################################
                /// Si el ID solicitado es mayor al numero de entidades
                /// envio un 255
                ///#####################################################

                if (N_EntidadesMax < Convert.ToInt32(PatternIdToUse))
                {
                    SQL.SendEthernetIP(TagToWrite, 255);
                    return;
                }
                ///#####################################################

                int IdxPattern = Convert.ToInt32(PatternIdToUse);
                int IdxEntidadToUse = ComandoRobot - 100;

                SQL.Get_Ram_Info(IdxPattern, IdxEntidadToUse);


                string TagResponsive = "_EBD_I_AckBd";
                SQL.SendEthernetIP(TagResponsive, 1);
                // AGREGAR PAUSA DE 1 SEG
                Thread.Sleep(1000);
                SQL.SendEthernetIP(TagResponsive, 0);



            }


            //###################################################################



        }

        //#######################################################################
        //#######################################################################

















    }
}

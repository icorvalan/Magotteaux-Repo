using MGTX_arenado;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DarkDemo
{
    public partial class Form1 : Form
    {
        string[] g_Entidades = { "PIN", "CORE", "SLEEVE", "SPRUE", "LOC", "NUMBER", "LID", "PATTERN", "SAND MIXER", "Core Vert" };
        string[] g_Tool = { "Griper", "Pin Tool", "Vacuum", "Punzon" };
        int[] g_Elementos_totales = new int[20];
        const int g_PIN = 0, g_CORE = 1, g_SLEEVE = 2, g_SPRUE = 3, g_LOC = 4, g_NUMBER = 5, g_LID = 6, g_PATTERN = 7, g_SANDMIXER = 8, g_CORE_VERT = 9;
        public const int g_PIN1_ent = 6,
                            g_PIN2_ent = 7,
                            g_CORE_ent = 2,
                            g_SLEEVE_ent = 3,
                            g_SPRUE_ent = 4,
                            g_LOC_ent = 1,
                            g_NUMBER_ent = 5,
                            g_LID_ent = 8,
                            g_PATTERN_ent = 10,
                            g_SANDMIXER_ent = 11,
                            g_CoreVertical = 12;
        public static string g_LogTextMain = "-1";
        string[] Header = new string[13];
        int insercionID = 1, Entidad_ID, Diametro = 0, ProfundidadPin = 5;
        double Porcentaje_deteccion = 0.1;
        string PatternName = "";
        string CodCore = "";
        double X, Y, Z, A, B, C;
        SerialBridge.EthernetIP EthernetIP = new SerialBridge.EthernetIP();
        ExcelClass ExcelClass = new ExcelClass();
        ExcelClass ExcelClass_BDD = new ExcelClass();
        ClassMGTXArenado MGTXARENADO = new ClassMGTXArenado(); 
        SQLapi.SQL_Bridge SQL;
        Form2 LoadingForm;

        Data_BD_Dinamica data_BD_Dinamica = new Data_BD_Dinamica();

        public delegate void MyDelegado(Form2 form2);
        public delegate void ShowmessageBDE(string Path, string Metodo);

        StreamWriter fichero;

        string path_folder_txt = @"C:\TeachModeBackUp";
        string path_txt = @"C:\TeachModeBackUp\corelist.txt";
        string path_folder_backup_txt = @"C:\TeachModeBackUp\backup.txt";




        int g_AlturaForm = 775;
        public Form1()
        {
            InitializeComponent();


        }

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



                Form1.g_LogTextMain = "### ERROR ### in CLASS " + Clase + " , in  Metohd  " + metodo + " in LINE of program " + LineaError.ToString() + " -> " + Mensaje;

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



                Form1.g_LogTextMain = "### ERROR ### in CLASS " + Clase + " , in  Metohd " + metodo + " in LINE of program " + LineaError.ToString() + " -> " + Mensaje + "<- Tag -> " + tagName;

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

        string g_Path_Files = "";
        public void Init_Form()
        {

            panel2.Enabled = false;
            label51.Text = "Waiting for PLC Conection...";
            string IP_Plc = "192.168.1.10";

            EthernetIP.Ethernet_Init(IP_Plc);


            SQL = new SQLapi.SQL_Bridge(IP_Plc);
            SQL.SQL_Init("magotteaux");

            var TablasActivas = SQL.get_Tablas_Activas();

            List<string> TagsPLC = new List<string>();
            data_BD_Dinamica.Init_Data_BD_Dinamica();

            textBox3.Text = "BlankRecipe";
            textBox3.Enabled = false;


            int Conteo_int_conexion = 0;
            //////////////////////////////////////////////////////////
            bool DEBUG_OFF_PLC = false;
            //////////////////////////////////////////////////////////

            while (TagsPLC.Count == 0 && Conteo_int_conexion < 12)
            {
                EthernetIP.CloseEthernetIP();
                EthernetIP.Ethernet_Init(IP_Plc);
                TagsPLC = EthernetIP.Get_Tags();

                Conteo_int_conexion++;
                label51.Text = "Waiting for PLC Conection... Test " + Conteo_int_conexion.ToString() + " failed. \n  Try a new conection.";
            }


            Header[0] = "insercionID";
            Header[1] = "Cod Core";
            Header[2] = "Entidad_ID";
            Header[3] = "Profundidad de Toma";
            Header[4] = "Ref Pos X";
            Header[5] = "Ref Pos Y";
            Header[6] = "Ref Pos Z";
            Header[7] = "Ref Pos A";
            Header[8] = "Ref Pos B";
            Header[9] = "Ref Pos C";
            Header[10] = "DiametroTomaCore[mm]";
            Header[11] = "PorcentajeDeteccion Core";
            Header[12] = "Altura";


            groupBox8.Enabled = false;
            groupBox9.Enabled = false;
            groupBox3.Enabled = false;
            groupBox11.Enabled = false;
            groupBox17.Enabled = false;
            groupBox30.Enabled = false;
            groupBox38.Enabled = false;

            button24.Enabled = false;
            button12.Enabled = false;


            ///////////////////////////////////////////////////////////////////
            //// Ruta donde estan los modelos 3d´s
            ///////////////////////////////////////////////////////////////////

            string Path = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\SFM_CORES";
            //string Path = @"C:\SFM_Cores";
            g_Path_Files = Path;
            string[] ficheros = Directory.GetDirectories(Path);
            ///////////////////////////////////////////////////////////////////


            if (Conteo_int_conexion < 10)
            {
                simpleLED1.Value = true;
                label51.Text = "PLC Conection Ready";
                simpleLED1.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            }
            else
            {
                simpleLED1.Value = true;
                simpleLED1.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Red;
                label51.Text = "PLC DisConected... Just Offline work";

            }

            #region  ///////////// - >  Seteo los combo box de todas las pestañas <- /////////////////////////
            for (int i = 0; i < g_Entidades.Length; i++)
            {
                comboBox3.Items.Add(g_Entidades[i]);

            }

            comboBox3.SelectedItem = 0;


            for (int i = 0; i < ficheros.Length; i++)
            {
                var Elemento = ficheros[i].Split('\\');

                int Last_index = Elemento[0].Length;

                comboBox2.Items.Add(Elemento[Last_index]);

            }



            for (int i = 1; i < 150; i++)
            {
                comboBox1.Items.Add(i.ToString() + " [mm]");

            }

            for (int i = 0; i < 100; i++)
            {
                comboBox32.Items.Add(i.ToString());
                comboBox31.Items.Add(i.ToString());
                comboBox30.Items.Add(i.ToString());
                comboBox29.Items.Add(i.ToString());
                comboBox28.Items.Add(i.ToString());
                comboBox27.Items.Add(i.ToString());
                comboBox26.Items.Add(i.ToString());

            }

            for (int i = 5; i < 1000; i++)
            {
                comboBox4.Items.Add(i.ToString() + " [mm]");
            }

            double Portc = 0.01;
            while (Portc <= 1)
            {

                comboBox25.Items.Add(Portc.ToString());
                Portc = Portc + 0.01;
                Portc = Math.Round(Portc, 2);
            }




            panel2.Size = new Size(715, 0);
            panel3.Size = new Size(715, 0);
            panel4.Size = new Size(715, 0);

            comboBox26.SelectedIndex = 0;
            comboBox27.SelectedIndex = 0;
            comboBox28.SelectedIndex = 0;
            comboBox29.SelectedIndex = 0;
            comboBox30.SelectedIndex = 0;
            comboBox31.SelectedIndex = 0;
            comboBox32.SelectedIndex = 0;


            #endregion




            ficheros = Set_Table_Dinamic_BD(ficheros);

            
            Set_Table_Pattern_BDD();


            timer1.Enabled = true;



            ///////////////////////////////////////////////////////////////////
            //// Ruta donde estan el excel de Respaldo
            ///////////////////////////////////////////////////////////////////
            //         string PathBackup = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\Backup_recipie\" + g_BackUpFile_Excel + ".xlsx";

            //           if (File.Exists(PathBackup))
            //           {
            //              File.Delete(PathBackup);
            //          }


            dataGridView1.Enabled = false;

        }

        private string[] Set_Table_Dinamic_BD(string[] ficheros)
        {
            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3, Cantidad_col = 4, Apilado_Col = 5, Vertical_col = 6;


            //  DataGridViewTextBoxCol rty dataGridView1.Rows[0].Cells[0] = "asd";


            DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[0];
            rowss.Cells[0].Value = "1";
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {

                DataGridViewComboBoxCell comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                for (int i = 1; i < 7; i++) { comboBoxCell.Items.Add(i.ToString()); }

                comboBoxCell = (row.Cells[Segmento_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();

                for (int i = 1; i < 10; i++) { comboBoxCell.Items.Add(i.ToString()); }

                comboBoxCell = (row.Cells[tipo_core_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                ficheros = Directory.GetDirectories(g_Path_Files);
                for (int i = 0; i < ficheros.Length; i++)
                {
                    var Elemento = ficheros[i].Split('\\');
                    int Last_index = Elemento.Length;

                    comboBoxCell.Items.Add(Elemento[Last_index - 1]);

                }


                comboBoxCell = (row.Cells[Cantidad_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }

                DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                chk.Value = chk.FalseValue;
                chk = (DataGridViewCheckBoxCell)row.Cells[Vertical_col];
                chk.Value = chk.FalseValue;


            }

            return ficheros;
        }

        private void Set_Table_Pattern_BDD()
        {
            int index_Patter = 1, sprue_Pos_col = 2, repetition_col = 3, CopeOrDrag_Col = 4;
            int UltimaFila = dataGridView2.RowCount;
            DataGridViewRow rowss = (DataGridViewRow)dataGridView2.Rows[0];
            rowss.Cells[0].Value = "1";

            var tablasActivas = SQL.get_Tablas_Activas();
            string[] TablasValidas = new string[5000];

            int indexTval = 0;
            for (int i = 0; i < tablasActivas.Length; i++)
            {
                if (tablasActivas[i].ToLower().Contains("ram") || tablasActivas[i].ToLower().Contains("pallet") || tablasActivas[i].ToLower().Contains("pattern"))
                {
                    continue;
                }
                TablasValidas[indexTval] = tablasActivas[i];
                indexTval++;
            }
            Array.Resize(ref TablasValidas, indexTval);

            foreach (DataGridViewRow row in dataGridView2.Rows)
            {
                DataGridViewComboBoxCell comboBoxCell = (row.Cells[sprue_Pos_col] as DataGridViewComboBoxCell);
                if (comboBoxCell.RowIndex == UltimaFila - 1)
                {
                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 9; i++) { comboBoxCell.Items.Add(i.ToString()); }


                    comboBoxCell = (row.Cells[repetition_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }





                    comboBoxCell = (row.Cells[index_Patter] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 0; i < TablasValidas.Length; i++) { comboBoxCell.Items.Add(TablasValidas[i]); }




                }

            }
        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        public bool g_preguntaTipoReceta = false;
        private void button9_Click(object sender, EventArgs e)
        {

            try
            {

                if (string.IsNullOrWhiteSpace(this.textBox1.Text))
                {
                    MessageBox.Show("Put in pattern id", "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    DialogResult dialogResult = MessageBox.Show("The Pattern ID Selected is " + textBox1.Text + " Are you sure?", "Finish Recipe", MessageBoxButtons.YesNo);

                    if (dialogResult == DialogResult.Yes)
                    {

                        DialogResult dialogResult2 = MessageBox.Show("The Pattern ID Selec is a COPE?", "Finish Recipe", MessageBoxButtons.YesNo);

                        if (dialogResult2 == DialogResult.Yes)  /// -> es un cope
                        {

                            PatternName = textBox1.Text + "_Cope";
                            ExcelClass.Crear_Bd_Estatica(PatternName);
                            groupBox30.Enabled = true;
                            g_preguntaTipoReceta = true;
                            g_WhiteRecipe = false;
                            panel2.Enabled = true;

                        }
                        else
                        {                            /////-> es un drag

                            PatternName = textBox1.Text + "_Drag";
                            ExcelClass.Crear_Bd_Estatica(PatternName);
                            groupBox30.Enabled = true;
                            g_preguntaTipoReceta = true;
                            g_WhiteRecipe = false;
                            panel2.Enabled = true;

                        }
                    }
                }

            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);

            }


        }

        private void button10_Click(object sender, EventArgs e)
        {
            //  Thread.Sleep(2000);

            label2.Text = " Pattern Found!";

            simpleLED1.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            //  groupBox11.Enabled = true;
        }

        private void button11_Click(object sender, EventArgs e)
        {

        }

        bool g_Permiso_Inicio = false;
        private void button10_Click_1(object sender, EventArgs e)
        {
            simpleLED1.LED_Blink = true;
            simpleLED1.LED_BlinkInterval = 100;
            //         Thread.Sleep(2000);

            label4.Text = " Pattern Found!";
            simpleLED1.LED_BlinkInterval = 500;
            simpleLED1.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            simpleLED1.Value = true;
            simpleLED1.LED_Blink = true;
            //  groupBox11.Enabled = true;
            groupBox30.Enabled = true;


            //   string Path = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\11.- TeachMode Soft\TeachMode\Patron2.png";

            //      pictureBox1.Image = Image.FromFile(Path);


        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.label3.Text = String.Empty;
            label30.Text = String.Empty;
            label16.Text = String.Empty;
            label17.Text = String.Empty;
            label18.Text = String.Empty;
            label19.Text = String.Empty;
            label20.Text = String.Empty;
            label21.Text = String.Empty;
            label22.Text = String.Empty;
            label23.Text = String.Empty;
            label24.Text = String.Empty;
            label25.Text = String.Empty;
            label26.Text = String.Empty;
            label49.Text = String.Empty;


            this.groupBox8.Enabled = false;
            this.groupBox9.Enabled = false;
            this.groupBox3.Enabled = false;
            this.groupBox11.Enabled = false;
            this.groupBox38.Enabled = false;
            this.groupBox21.Enabled = false;

            this.richTextBox1.Clear();

            clean_groupbox_combobox();





            if (g_Permiso_Inicio)
            {
                if (g_preguntaTipoReceta && !g_WhiteRecipe)
                {
                    //          DialogResult dialogResult4 = MessageBox.Show("Do you want make a white recepe?", "Finish Recipe", MessageBoxButtons.YesNo);
                    if (g_WhiteRecipe)
                    {
                        button24.Enabled = true; button12.Enabled = false; g_preguntaTipoReceta = false;

                    }
                    else { button12.Enabled = true; button24.Enabled = false; g_preguntaTipoReceta = false; }

                    g_preguntaTipoReceta = false;
                }

                if (g_WhiteRecipe)
                {
                    button24.Enabled = true; button12.Enabled = false;
                    //     g_WhiteRecipe = false;
                }

                panel2.Size = new Size(715, g_AlturaForm);
            }

            panel4.Size = new Size(715, 10);

        }

        private void button3_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {


            panel2.Size = new Size(715, 10);
            panel4.Size = new Size(715, 10);
            // Thread.Sleep(1);

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

            var selectedValue = comboBox2.Items[comboBox2.SelectedIndex];
            string Valor = selectedValue.ToString();
            CodCore = Valor;
            try
            {

                bool validar_core = same_Core();
                List<List<string>> matriz = getCoreInList();
                if (validar_core)
                {
                    comboBox25.Enabled = false;
                    comboBox4.Enabled = false;
                    for (int i = 0; i < matriz.Count(); i++)
                    {
                        if (matriz[i][0].Equals(comboBox2.SelectedItem.ToString()))
                        {

                            comboBox4.Text = matriz[i][1];
                            comboBox25.Text = matriz[i][2];
                            break;
                        }
                    }


                }
                else
                {
                    comboBox25.Enabled = true;
                    comboBox4.Enabled = true;
                }

            }
            catch (Exception ex)
            {
                MessageBox.Show("Problem Reading" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }

        /// <summary>
        /// Mata todos los procesos EXCEL
        /// </summary>
        public void Kill_Excel_Process()
        {
            try
            {
                foreach (Process proceso in Process.GetProcesses())
                {
                    if (proceso.ProcessName == "EXCEL")
                    {
                        proceso.Kill();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            MGTXARENADO.form = this;
            try
            {
                if (!File.Exists(path_txt))
                {
                    System.IO.Directory.CreateDirectory(path_folder_txt);
                    fichero = File.CreateText(path_txt);
                    fichero.Close();
                }
                else
                {
                    if (!File.Exists(path_folder_backup_txt))
                    {
                        File.Copy(path_txt, path_folder_backup_txt);
                    }
                    else
                    {
                        update_Filetxt_backup();
                    }
                }
                Kill_Excel_Process();
                panel2.Size = new Size(715, 10);
                panel4.Size = new Size(715, 10);

                timer1.Enabled = true;
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Load of form" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }


        }

        public void update_Filetxt_backup()
        {
            try
            {
                StreamReader lectura = new StreamReader(path_txt);
                string leer = lectura.ReadToEnd();
                lectura.Close();

                StreamWriter escritura = new StreamWriter(path_folder_backup_txt);
                escritura.Write(leer);
                escritura.Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Updating BACKUP" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        //****************************************
        #region ############  CHEQUEO DE CHECHBOX LOCALIZADORES ####################

        private void checkBox4_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox4.Checked)
            {
                CodCore = "LOC01"; Diametro = 0; ProfundidadPin = 0;
                checkBox3.Checked = false;
                checkBox6.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox3_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox3.Checked)
            {
                CodCore = "LOC02";
                Diametro = 0; ProfundidadPin = 0;

                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }


        }

        private void checkBox6_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox6.Checked)
            {
                CodCore = "LOC03"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox5_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox5.Checked)
            {
                CodCore = "LOC04"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox10_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox10.Checked)
            {
                CodCore = "LOC05"; Diametro = 0; ProfundidadPin = 0;


                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox9_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox9.Checked)
            {
                CodCore = "LOC06"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox8_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox8.Checked)
            {
                CodCore = "LOC07"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox7_CheckedChanged(object sender, EventArgs e)
        {
            
            if (checkBox7.Checked)
            {
                CodCore = "LOC08"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }
        }

        private void checkBox13_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox13.Checked)
            {
                CodCore = "LOC09"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox12.Checked = false;
                checkBox11.Checked = false;
            }

        }

        private void checkBox12_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox12.Checked)
            {
                CodCore = "LOC10"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox11.Checked = false;
            }

        }

        private void checkBox11_CheckedChanged(object sender, EventArgs e)
        {
           
            if (checkBox11.Checked)
            {
                CodCore = "LOC11"; Diametro = 0; ProfundidadPin = 0;
                checkBox4.Checked = false;
                checkBox6.Checked = false;
                checkBox3.Checked = false;
                checkBox5.Checked = false;
                checkBox10.Checked = false;
                checkBox9.Checked = false;
                checkBox8.Checked = false;
                checkBox7.Checked = false;
                checkBox13.Checked = false;
                checkBox12.Checked = false;
            }

        }

        #endregion
        //*****************************************


        private void checkBox15_CheckedChanged(object sender, EventArgs e)
        {
            Diametro = 0; ProfundidadPin = 0;
            if (checkBox15.Checked)
            {
                CodCore = "NUMDEC";
                checkBox14.Checked = false;
            }
        }

        private void checkBox14_CheckedChanged(object sender, EventArgs e)
        {
            Diametro = 0; ProfundidadPin = 0;

            if (checkBox14.Checked)
            {
                CodCore = "NUMUNID";
                checkBox15.Checked = false;
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            try
            {

                //string PathFile = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\SFM_CORES\";
                string PathFile = @"C:\SFM_CORES\";
                PathFile = PathFile + PatternName + ".csv";

                FileInfo fi = new FileInfo(PathFile);


                if (File.Exists(PathFile))
                {
                    System.Diagnostics.Process.Start(PathFile);
                }
                else
                {
                    //file doesn't exist
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Reading File SFM_CORE", "ERROR" + ex, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void groupBox20_Enter(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            int asd =  dataGridView1.RowCount;
            dataGridView1.Rows.Clear();

            dataGridView2.Rows.Clear();
            dataGridView1.Enabled = false;

            panel2.Size = new Size(715, 0);
            panel4.Size = new Size(715, g_AlturaForm);
        }

        private void groupBox4_Enter(object sender, EventArgs e)
        {

        }


        public bool g_getWidth = false;
        private void button17_Click(object sender, EventArgs e)
        {


            if (g_Permiso_EsquinaIzq)
            {

                DialogResult dialogResult = MessageBox.Show("Is the robot placed in the Lower right corner?", "Robot Position", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);


                if (dialogResult == DialogResult.Yes)
                {
                    ProfundidadPin = 0;
                    string Eje = "_EV01_O_EJE";
                    string[] Coordenada = { "X", "Y", "Z" };
                    double[] PosRobot = new double[6];
                    for (int i = 0; i < Coordenada.Length; i++)
                    {
                        string Ejecoordenado = Eje + Coordenada[i];
                        string ValorEje = EthernetIP.Lectura_tag(Ejecoordenado);
                        double ValorEje_dou = Convert.ToDouble(ValorEje) / 10e3 - 4e3;
                        PosRobot[i] = ValorEje_dou;
                    }



                    X = Math.Abs(PosRobot[0]); Y = Math.Abs(PosRobot[1]); Z = Math.Abs(PosRobot[2]);

                    label20.Text = PosRobot[0].ToString();
                    label21.Text = PosRobot[1].ToString();
                    label22.Text = PosRobot[2].ToString();


                    g_acceso_por_Pattern = false; /// -> Habilito el acceso a guardar data
                    MessageBox.Show("You have now the pattern dimension.\nSave the data to coninue", "Robot Position", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

                    if (!g_WhiteRecipe)
                    {
                        button12.Enabled = true; button24.Enabled = false;
                    }
                    else
                    {
                        button12.Enabled = false; button24.Enabled = true;
                    }
                }
                else
                {
                    MessageBox.Show("You Need the upper left Corner Firts. Please go it");

                }
            }
            else
            {

                MessageBox.Show("You Need the upper left Corner Firts. Please go it");

            }

        }

        public bool g_Permiso_EsquinaIzq = false, g_acceso_por_Pattern = false;
        private void button18_Click(object sender, EventArgs e)
        {

            DialogResult dialogResult = MessageBox.Show("Is the robot placed in the upper left corner ?", "Robot Position", MessageBoxButtons.YesNo);


            if (dialogResult == DialogResult.Yes)
            {

                g_acceso_por_Pattern = true;
                CodCore = g_Entidades[7];
                Entidad_ID = 10;
                ProfundidadPin = 0;
                string Eje = "_EV01_O_EJE";
                string[] Coordenada = { "X", "Y", "Z" };
                double[] PosRobot = new double[6];
                for (int i = 0; i < Coordenada.Length; i++)
                {
                    string Ejecoordenado = Eje + Coordenada[i];
                    string ValorEje = EthernetIP.Lectura_tag(Ejecoordenado);
                    double ValorEje_dou = Convert.ToDouble(ValorEje) / 10e3 - 4e3;
                    PosRobot[i] = ValorEje_dou;
                }


                A = PosRobot[0]; B = PosRobot[1]; C = PosRobot[2];

                label23.Text = PosRobot[0].ToString();
                label24.Text = PosRobot[1].ToString();
                label25.Text = PosRobot[2].ToString();


                Diametro = 0;
                Porcentaje_deteccion = 1;

                g_Permiso_EsquinaIzq = true;
                button17.Enabled = true;

                MessageBox.Show("Data of Position Saved", "Position Left Corner", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

            }
        }


        string[] Pattern_Stock = new string[100];
        private void button16_Click(object sender, EventArgs e)
        {





        }




        private void button6_Click(object sender, EventArgs e)
        {

        }

        private void mushroomButton1_Click(object sender, EventArgs e)
        {

        }

        private void panel4_Paint(object sender, PaintEventArgs e)
        {

        }

        private void comboBox25_SelectedIndexChanged(object sender, EventArgs e)
        {

            Porcentaje_deteccion = Convert.ToDouble(comboBox25.Items[comboBox25.SelectedIndex]);

        }



        /// <summary>
        /// Boton que captura los datos de elementos iniciales
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        int g_TotalPines, g_TotalCores, g_TotalTapas, g_TotalSprue, g_TotalLoc, g_TotalNum, g_TotalMangas, g_TotalPatterns;


        bool g_WhiteRecipe = false;

        private void Form1_FormClosing(object sender, FormClosingEventArgs e)
        {
            ExcelClass.CloseExel();
            ExcelClass_BDD.CloseExel();

            Kill_Excel_Process();

        }

        private void comboBox33_SelectedValueChanged(object sender, EventArgs e)
        {
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView1_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            try
            {

           
            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3,
                Cantidad_col = 4, Apilado_Col = 5, Vertical_Col = 6;


            int UltimaFila = dataGridView1.RowCount;


            // Se setean los elementos
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                DataGridViewComboBoxCell comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);
                if (comboBoxCell.RowIndex == UltimaFila - 1)
                {
                    DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[UltimaFila - 1];
                    rowss.Cells[0].Value = (UltimaFila).ToString();


                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                    comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 7; i++) { comboBoxCell.Items.Add(i.ToString()); }

                    comboBoxCell = (row.Cells[Segmento_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();

                    for (int i = 1; i < 10; i++) { comboBoxCell.Items.Add(i.ToString()); }

                    comboBoxCell = (row.Cells[tipo_core_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();

                    for (int i = 0; i < g_CoresInTheRecepie.Length; i++)
                    {

                        comboBoxCell.Items.Add(g_CoresInTheRecepie[i]);

                    }


                    comboBoxCell = (row.Cells[Cantidad_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                    DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                    chk.Value = chk.TrueValue;
                    chk = (DataGridViewCheckBoxCell)row.Cells[Vertical_Col];
                    chk.Value = chk.FalseValue;




                }



            }
            }
            catch (Exception)
            {

            }
        }

        /// <summary>
        /// Guardo los elementos de la tabla dinamica
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        /// 
        public string g_Path_Bdd_excel = "";
        private void button26_Click(object sender, EventArgs e)
        {

            try
            {


                ////////////////////////////////////////////////////////////////////////////////////
                /// Cada posicion  corresponde a un pallet, dentro cada pos corresponde al segmento
                ////////////////////////////////////////////////////////////////////////////////////
                List<string[]> Core_in_Pallets = new List<string[]>();
                List<string[]> Core_in_Cantidad = new List<string[]>();
                List<string[]> Core_in_Apilado = new List<string[]>();

                //////////////////////////////////////////////////////////
                //// Clear all data
                ///////////////////////////////////////////////////////////
                data_BD_Dinamica.Pallets = new List<string[]>();
                data_BD_Dinamica.Pallets_Cantidad = new List<string[]>();
                data_BD_Dinamica.Pallets_Apilado = new List<string[]>();
                data_BD_Dinamica.Pattern_list = new List<string[]>();
                for (int i = 0; i < 10; i++)
                {
                    string[] Aux = new string[10];
                    string[] Aux1 = new string[10];
                    string[] Aux2 = new string[10];


                    data_BD_Dinamica.Pallets.Add(Aux);
                    data_BD_Dinamica.Pallets_Cantidad.Add(Aux1);
                    data_BD_Dinamica.Pallets_Apilado.Add(Aux2);


                }



                //////////////////////////////////////////////////////////
                /// Coherencia de datos en cores y mangas
                //////////////////////////////////////////////////////////
                if (dataGridView1.Rows.Count > 1 && dataGridView2.Rows.Count > 1)
                {


                    for (int rows = 0; rows < dataGridView1.Rows.Count - 1; rows++)
                    {
                        string[] value = new string[10];
                        for (int col = 0; col < dataGridView1.Rows[rows].Cells.Count; col++)
                        {
                            try
                            {
                                value[col] = dataGridView1.Rows[rows].Cells[col].Value.ToString();


                                switch (col)
                                {
                                    case 0: /// Index
                                        continue;

                                    case 1: /// Entidad
                                        if (value[col].ToLower().Contains("sleeve"))
                                        {
                                            // Siempre la manga va en el primer segmento
                                            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3,
                                                Cantidad_col = 4, Apilado_Col = 5, Vertical_Col = 6;

                                            foreach (DataGridViewRow row in dataGridView1.Rows)
                                            {

                                                DataGridViewComboBoxCell comboBoxCell = (row.Cells[tipo_core_col] as DataGridViewComboBoxCell);
                                                int UltimaFila = dataGridView1.RowCount;


                                                if (comboBoxCell.RowIndex == rows)
                                                {
                                                    DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[rows];

                                                    comboBoxCell = (row.Cells[Segmento_col] as DataGridViewComboBoxCell);
                                                    comboBoxCell.Value = comboBoxCell.Items[0];

                                                    DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                                                    chk.Value = chk.FalseValue;
                                                    chk = (DataGridViewCheckBoxCell)row.Cells[Vertical_Col];
                                                    chk.Value = chk.FalseValue;
                                                }



                                            }
                                        }

                                        continue;

                                    case 2: /// Pallet Number
                                        continue;

                                    case 3: /// Segmento
                                        continue;
                                    case 4: /// Cantidad
                                        continue;

                                    case 5: /// Apilado
                                        continue;

                                    case 6: /// Core Vertical
                                        continue;

                                    default:
                                        continue;
                                }


                            }
                            catch (Exception)
                            {
                                value[col] = "False";
                            }

                        }

                        if (value[1] == "False" || value[2] == "False" || value[3] == "False" || value[4] == "False") { MessageBox.Show("Please Check Row " + (rows + 1) + " You need complete All values", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation); return; }

                        else
                        {
                            Core_in_Pallets.Add(value);
                        }

                    }

                    //////////////////////////////////////////////////////////////////////
                    /// Ingreso datos del listado de patterns
                    //////////////////////////////////////////////////////////////////////
                    for (int rows = 0; rows < dataGridView2.Rows.Count - 1; rows++)
                    {
                        string[] value = new string[4];

                        for (int col = 0; col < dataGridView2.Rows[rows].Cells.Count; col++)
                        {

                            value[col] = dataGridView2.Rows[rows].Cells[col].Value.ToString();
                        }
                        /*                    if (value[1].ToLower() =="whiterecipie")
                                            {
                                                value[1] = value[1] + "_" + value[4];
                                            }
                       */
                        //     Array.Resize(ref value, value.Length - 1);
                        data_BD_Dinamica.Pattern_list.Add(value);
                    }

                    //////////////////////////////////////////////////////////////////////
                    /// Coherencia de datos que limite una manga y core en el mismo punto
                    //////////////////////////////////////////////////////////////////////



                    ///////////////////////////////////////////
                    //// Filtro la matriz de elementos por pallet
                    /// y los guardo de manera ordenada
                    //////////////////////////////////////////

                    for (int i = 1; i <= Core_in_Pallets.Count; i++)
                    {

                        for (int pallet = 1; pallet < 7; pallet++)
                        {


                            for (int segmento = 1; segmento < 10; segmento++)
                            {

                                string[] Core_Actual = Core_in_Pallets[i - 1];

                                int pallet_Actual = Convert.ToInt16(Core_Actual[2]);
                                int segmento_Actual = Convert.ToInt16(Core_Actual[3]);

                                if (pallet_Actual == pallet && segmento_Actual == segmento)
                                {
                                    /////////////////////////////////////////////////////////////////////////////////////
                                    /// Le quito el  _3D al nombre del archivo de SLEEVE
                                    ///////////////////////////////////////////////////////////////////////////////////// 
                                    if (Core_Actual[1].Contains("sleeve") && false)
                                    {
                                        var ConvertirSleeveAformato = Core_Actual[1].ToCharArray();
                                        Array.Resize(ref ConvertirSleeveAformato, ConvertirSleeveAformato.Length - 3);
                                        string CoreResize = ConvertirSleeveAformato.ToString();
                                        Core_Actual[1] = CoreResize;
                                    }
                                    /////////////////////////////////////////////////////////////////////////////////////

                                    data_BD_Dinamica.Set_Info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[1]);
                                    data_BD_Dinamica.Set_cant_info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[4]);

                                    if (Core_Actual[5] == "True") { Core_Actual[5] = "SI"; } else { Core_Actual[5] = "NO"; }
                                    if (Core_Actual[6] == "True") { Core_Actual[5] = "VERTICAL"; }

                                    data_BD_Dinamica.Set_Apilado_info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[5]);

                                }


                            }
                        }


                    }



                    /////////////////////////////////////////////////////////
                    /// Genero el Excel con la informacion cargada
                    /// Guardo la ruta del excel para luego cargar la BDD
                    //////////////////////////////////////////////////////
                    g_Path_Bdd_excel = ExcelClass.Crear_Excel_Bdd(data_BD_Dinamica);

                    MessageBox.Show("All Data is Saved. ", "Data Saved", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
                }
                else
                {


                    MessageBox.Show("You need insert data first", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

                }
            }
            catch (Exception ex)
            {

                MessageBox.Show("### ERROR ###.  I can´t create de excel file. " + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }




        }

        private void button27_Click(object sender, EventArgs e)
        {

            int Indextabla = (int)numericUpDown1.Value - 1;

            int IndextablaMax = dataGridView1.RowCount;


            DialogResult dialogResult = MessageBox.Show(" Are you sure that you want delete the Row number -> " + (Indextabla + 1).ToString() + " ?", "Delete Data", MessageBoxButtons.YesNo);

            if (IndextablaMax > Indextabla && dialogResult == DialogResult.Yes)
            {

                try
                {

                    dataGridView1.Rows[Indextabla].Selected = true;

                    foreach (DataGridViewRow item in this.dataGridView1.SelectedRows)
                    {
                        dataGridView1.Rows.RemoveAt(item.Index);
                    }

                    int FilaActual = 1;
                    foreach (DataGridViewRow row in dataGridView1.Rows)
                    {

                        DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[FilaActual - 1];
                        rowss.Cells[0].Value = (FilaActual).ToString();
                        FilaActual++;
                    }

                }
                catch (Exception)
                {


                }


            }
        }

        private void dataGridView2_RowsAdded(object sender, DataGridViewRowsAddedEventArgs e)
        {
            int id = 0, index_Patter = 1, sprue_Pos_col = 2, repetition_col = 3, CopeOrDrag_Col = 4;
            int UltimaFila = dataGridView2.RowCount;
            var tablasActivas = SQL.get_Tablas_Activas();
            string[] TablasValidas = new string[5000];

            int indexTval = 0;
            for (int i = 0; i < tablasActivas.Length; i++)
            {
                if (tablasActivas[i].ToLower().Contains("ram") || tablasActivas[i].ToLower().Contains("pallet") || tablasActivas[i].ToLower().Contains("pattern"))
                {
                    continue;
                }
                TablasValidas[indexTval] = tablasActivas[i];
                indexTval++;
            }
            Array.Resize(ref TablasValidas, indexTval);
            foreach (DataGridViewRow row in dataGridView2.Rows)
            {
                DataGridViewComboBoxCell comboBoxCell = (row.Cells[sprue_Pos_col] as DataGridViewComboBoxCell);
                if (comboBoxCell.RowIndex == UltimaFila - 1)
                {
                    DataGridViewRow rowss = (DataGridViewRow)dataGridView2.Rows[UltimaFila - 1];
                    rowss.Cells[id].Value = (UltimaFila).ToString();

                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 9; i++) { comboBoxCell.Items.Add(i.ToString()); }


                    comboBoxCell = (row.Cells[repetition_col] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                    comboBoxCell = (row.Cells[index_Patter] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 0; i < TablasValidas.Length; i++) { comboBoxCell.Items.Add(TablasValidas[i]); }

                }

            }


        }


        /// <summary>
        /// Funcion encargada de tomar el item seleccionado de combobox
        /// </summary>
        public void getSelectedItemInComboBoxView2()
        {
            int ultimaFila = dataGridView2.RowCount - 1;
            string value = String.Empty;
            foreach (DataGridViewRow item in dataGridView2.Rows)
            {
                value = (string)item.Cells["Pattern"].Value;
            }
            MessageBox.Show(value);
            

        }

        public void Actualizar_Combobox_Patterns()
        {
            try
            {
                int id = 0, index_Patter = 1, sprue_Pos_col = 2, repetition_col = 3, CopeOrDrag_Col = 4;
                int UltimaFila = dataGridView2.RowCount;
                var tablasActivas = SQL.get_Tablas_Activas();
                string[] TablasValidas = new string[5000];

                int indexTval = 0;
                for (int i = 0; i < tablasActivas.Length; i++)
                {
                    if (tablasActivas[i].ToLower().Contains("ram") || tablasActivas[i].ToLower().Contains("pallet") || tablasActivas[i].ToLower().Contains("pattern"))
                    {
                        continue;
                    }
                    TablasValidas[indexTval] = tablasActivas[i];
                    indexTval++;
                }
                Array.Resize(ref TablasValidas, indexTval);
                foreach (DataGridViewRow row in dataGridView2.Rows)
                {
                    DataGridViewComboBoxCell comboBoxCell = (row.Cells[sprue_Pos_col] as DataGridViewComboBoxCell);


                    comboBoxCell = (row.Cells[index_Patter] as DataGridViewComboBoxCell);
                    comboBoxCell.Items.Clear();
                    for (int i = 0; i < TablasValidas.Length; i++) { comboBoxCell.Items.Add(TablasValidas[i]); }





                }
            }
            catch(Exception ex)
            {
                MessageBox.Show("Error" + ex.Message, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            

        }

        private void button7_Click(object sender, EventArgs e)
        {

            int Indextabla = (int)numericUpDown2.Value - 1;

            int IndextablaMax = dataGridView2.RowCount;


            DialogResult dialogResult = MessageBox.Show(" Are you sure that you want delete the Row number -> " + (Indextabla + 1).ToString() + " ?", "Delete Data", MessageBoxButtons.YesNo);

            if (IndextablaMax > Indextabla && dialogResult == DialogResult.Yes)
            {

                try
                {

                    dataGridView2.Rows[Indextabla].Selected = true;

                    foreach (DataGridViewRow item in this.dataGridView2.SelectedRows)
                    {
                        dataGridView2.Rows.RemoveAt(item.Index);
                    }

                    int FilaActual = 1;
                    foreach (DataGridViewRow row in dataGridView2.Rows)
                    {

                        DataGridViewRow rowss = (DataGridViewRow)dataGridView2.Rows[FilaActual - 1];
                        rowss.Cells[0].Value = (FilaActual).ToString();
                        FilaActual++;
                    }

                }
                catch (Exception)
                {


                }


            }
        }


        public void Visor_de_Carga(Form2 form2)
        {
            form2 = new Form2();
            form2.StartPosition = FormStartPosition.CenterParent;
            form2.Show();
        }
        public void Kill_Visor_de_Carga(Form2 form2)
        {
            form2.Close();
            form2.Dispose();
        }

        private void button8_Click(object sender, EventArgs e)
        {


            if (File.Exists(g_Path_Bdd_excel))
            {
                if (SQL.Excel(g_Path_Bdd_excel, "Dinamica"))
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
                    MessageBox.Show("File Loaded in Dinamic Database");
                }
                else
                {

                    MessageBox.Show("Error to Load Excel", "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }


            }





        }

        private void button13_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dialogResult = MessageBox.Show("Do you want Export the actual Data Base File?", "Export Information", MessageBoxButtons.YesNo);

                if (dialogResult == DialogResult.Yes)
                {
                    string PathToSave = @"C:\BackUP_DataBase\";
                    SQL.Backup_Sql(PathToSave);
                }

            }
            catch (Exception)
            {

            }

        }

        private void button21_Click(object sender, EventArgs e)
        {
            //boton no  programado
        }

        private void button20_Click(object sender, EventArgs e)
        {
            //boton no programado
        }

        private void button25_Click(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("The Pattern ID Selected is " + textBox3.Text + " Are you sure?", "Finish Recipe", MessageBoxButtons.YesNo);

            if (dialogResult == DialogResult.Yes)
            {
                PatternName = textBox3.Text;
                ExcelClass.Crear_Bd_Estatica(PatternName);
                groupBox30.Enabled = true;
                g_preguntaTipoReceta = false;
                panel2.Enabled = true;
                g_WhiteRecipe = true;
            }

        }

        private void comboBox26_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox26.Items[comboBox26.SelectedIndex].ToString());

            g_Elementos_totales[g_CORE] = selectedValue;
        }

        private void button6_Click_1(object sender, EventArgs e)
        {
            try
            {


                ////////////////////////////////////////////////////////////////////////////////////
                /// Cada posicion  corresponde a un pallet, dentro cada pos corresponde al segmento
                ////////////////////////////////////////////////////////////////////////////////////
                List<string[]> Core_in_Pallets = new List<string[]>();
                List<string[]> Core_in_Cantidad = new List<string[]>();
                List<string[]> Core_in_Apilado = new List<string[]>();

                //////////////////////////////////////////////////////////
                //// Clear all data
                ///////////////////////////////////////////////////////////
                data_BD_Dinamica.Pallets = new List<string[]>();
                data_BD_Dinamica.Pallets_Cantidad = new List<string[]>();
                data_BD_Dinamica.Pallets_Apilado = new List<string[]>();
                data_BD_Dinamica.Pattern_list = new List<string[]>();
                for (int i = 0; i < 10; i++)
                {
                    string[] Aux = new string[10];
                    string[] Aux1 = new string[10];
                    string[] Aux2 = new string[10];


                    data_BD_Dinamica.Pallets.Add(Aux);
                    data_BD_Dinamica.Pallets_Cantidad.Add(Aux1);
                    data_BD_Dinamica.Pallets_Apilado.Add(Aux2);


                }



                //////////////////////////////////////////////////////////
                /// Coherencia de datos en cores y mangas
                //////////////////////////////////////////////////////////
                if (dataGridView1.Rows.Count > 1 && dataGridView2.Rows.Count > 1)
                {


                    for (int rows = 0; rows < dataGridView1.Rows.Count - 1; rows++)
                    {
                        string[] value = new string[10];
                        for (int col = 0; col < dataGridView1.Rows[rows].Cells.Count; col++)
                        {
                            try
                            {
                                value[col] = dataGridView1.Rows[rows].Cells[col].Value.ToString();


                                switch (col)
                                {
                                    case 0: /// Index
                                        continue;

                                    case 1: /// Entidad
                                        if (value[col].ToLower().Contains("sleeve"))
                                        {
                                            // Siempre la manga va en el primer segmento
                                            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3,
                                                Cantidad_col = 4, Apilado_Col = 5, Vertical_Col = 6;

                                            foreach (DataGridViewRow row in dataGridView1.Rows)
                                            {

                                                DataGridViewComboBoxCell comboBoxCell = (row.Cells[tipo_core_col] as DataGridViewComboBoxCell);
                                                int UltimaFila = dataGridView1.RowCount;


                                                if (comboBoxCell.RowIndex == rows)
                                                {
                                                    DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[rows];

                                                    comboBoxCell = (row.Cells[Segmento_col] as DataGridViewComboBoxCell);
                                                    comboBoxCell.Value = comboBoxCell.Items[0];

                                                    DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                                                    chk.Value = chk.FalseValue;
                                                    chk = (DataGridViewCheckBoxCell)row.Cells[Vertical_Col];
                                                    chk.Value = chk.FalseValue;
                                                }



                                            }
                                        }

                                        continue;

                                    case 2: /// Pallet Number
                                        continue;

                                    case 3: /// Segmento
                                        continue;
                                    case 4: /// Cantidad
                                        continue;

                                    case 5: /// Apilado
                                        continue;

                                    case 6: /// Core Vertical
                                        continue;

                                    default:
                                        continue;
                                }


                            }
                            catch (Exception)
                            {
                                value[col] = "False";
                            }

                        }

                        if (value[1] == "False" || value[2] == "False" || value[3] == "False" || value[4] == "False") { MessageBox.Show("Please Check Row " + (rows + 1) + " You need complete All values", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation); return; }

                        else
                        {
                            Core_in_Pallets.Add(value);
                        }

                    }

                    //////////////////////////////////////////////////////////////////////
                    /// Ingreso datos del listado de patterns
                    //////////////////////////////////////////////////////////////////////
                    for (int rows = 0; rows < dataGridView2.Rows.Count - 1; rows++)
                    {
                        string[] value = new string[4];

                        for (int col = 0; col < dataGridView2.Rows[rows].Cells.Count; col++)
                        {

                            value[col] = dataGridView2.Rows[rows].Cells[col].Value.ToString();
                        }
                        /*                    if (value[1].ToLower() =="whiterecipie")
                                            {
                                                value[1] = value[1] + "_" + value[4];
                                            }
                       */
                        //     Array.Resize(ref value, value.Length - 1);
                        data_BD_Dinamica.Pattern_list.Add(value);
                    }

                    //////////////////////////////////////////////////////////////////////
                    /// Coherencia de datos que limite una manga y core en el mismo punto
                    //////////////////////////////////////////////////////////////////////



                    ///////////////////////////////////////////
                    //// Filtro la matriz de elementos por pallet
                    /// y los guardo de manera ordenada
                    //////////////////////////////////////////

                    for (int i = 1; i <= Core_in_Pallets.Count; i++)
                    {

                        for (int pallet = 1; pallet < 7; pallet++)
                        {


                            for (int segmento = 1; segmento < 10; segmento++)
                            {

                                string[] Core_Actual = Core_in_Pallets[i - 1];

                                int pallet_Actual = Convert.ToInt16(Core_Actual[2]);
                                int segmento_Actual = Convert.ToInt16(Core_Actual[3]);

                                if (pallet_Actual == pallet && segmento_Actual == segmento)
                                {
                                    data_BD_Dinamica.Set_Info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[1]);
                                    data_BD_Dinamica.Set_cant_info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[4]);

                                    if (Core_Actual[5] == "True") { Core_Actual[5] = "SI"; } else { Core_Actual[5] = "NO"; }
                                    if (Core_Actual[6] == "True") { Core_Actual[5] = "VERTICAL"; }

                                    data_BD_Dinamica.Set_Apilado_info_Pallet(pallet_Actual, segmento_Actual, ref Core_Actual[5]);

                                }


                            }
                        }


                    }




                }
                else
                {


                    MessageBox.Show("You need insert data first", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);

                }
            }
            catch (Exception)
            {

                MessageBox.Show("### ERROR ###.   can´t create excel file. ");
            }


        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox1.Checked)
            {
                checkBox2.Checked = false;
                CodCore = "PIN1";
            }

        }

        private void comboBox32_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox32.Items[comboBox32.SelectedIndex].ToString());

            g_Elementos_totales[g_SLEEVE] = selectedValue;
        }

        private void comboBox28_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox28.Items[comboBox28.SelectedIndex].ToString());

            g_Elementos_totales[g_LOC] = selectedValue;
        }

        private void comboBox29_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox29.Items[comboBox29.SelectedIndex].ToString());

            g_Elementos_totales[g_LID] = selectedValue;
        }

        private void timer_pestana_Tick(object sender, EventArgs e)
        {
            timer_pestana.Enabled = false;

            System.Diagnostics.Process.Start(ExcelClass.g_PathUltimoExcel);
            panel2.Size = new Size(715, 10);
            panel4.Size = new Size(715, 10);
            g_Permiso_Inicio = false;
            panel2.Enabled = false;

            timer2.Enabled = true;
        }

        private void groupBox10_Enter(object sender, EventArgs e)
        {

        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }

        /// <summary>
        ///  Chequeo que los checkBox no esten repetidos
        ///  Apilado O vertical, no ambos
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void dataGridView1_CellMouseClick(object sender, DataGridViewCellMouseEventArgs e)
        {
            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3,
                    Cantidad_col = 4, Apilado_Col = 5, Vertical_Col = 6;

            int UltimaFila = dataGridView1.RowCount;
            // Se setean los elementos
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {


                DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                var Apilado = chk.Value;

                DataGridViewCheckBoxCell chk2 = (DataGridViewCheckBoxCell)row.Cells[Vertical_Col];
                var Vertical = chk2.Value;

            }

        }

        private void comboBox30_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox30.Items[comboBox30.SelectedIndex].ToString());

            g_Elementos_totales[g_SPRUE] = selectedValue;
        }

        private void checkBox2_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox2.Checked)
            {
                checkBox1.Checked = false;
                CodCore = "PIN2";
            }


        }

        private void bx_num_index_ID_ValueChanged(object sender, EventArgs e)
        {
            if (bx_num_index_ID.Value == 0)
            {
                bx_num_index_ID.Value = 1;
            }


            ExcelClass.Index_base_datos = (int)bx_num_index_ID.Value + 1;



        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
           
            
            Lectura_Pos_RobotToShow();
            timer2.Enabled = true;
        }

        public bool g_ShowExcel = true;
        public bool g_activeGridCores = false;
        public string[] g_CoresInTheRecepie = new string[100];
        /// <summary>
        /// Boton que setea los elementos disponibles a ingresar a la abse de datos deinamica
        /// 
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button4_Click_1(object sender, EventArgs e)
        {

            try
            {

                string[] patternsToUseInBdd = new string[100];
                for (int rows = 0; rows < dataGridView2.Rows.Count - 1; rows++)
                {
                    string[] value = new string[4];

                    int Index_Pattern = 1;
                    for (int col = 0; col < dataGridView2.Rows[rows].Cells.Count; col++)
                    {

                        value[col] = dataGridView2.Rows[rows].Cells[col].Value.ToString();
                    }

                    patternsToUseInBdd[rows] = value[1];
                }

                Array.Resize(ref patternsToUseInBdd, dataGridView2.Rows.Count - 1);


                string[] CoresSleevesInPattern = new string[1000];
                int Index_Elementos = 0;

                for (int i = 0; i < patternsToUseInBdd.Length; i++)
                {
                    var CoresAndSleeve = SQL.Get_Cores_and_mangas_from_BDE(patternsToUseInBdd[i]);

                    if (CoresAndSleeve == null)
                    {
                        continue;
                    }
                    for (int j = 0; j < CoresAndSleeve.Length; j++)
                    {
                        CoresSleevesInPattern[Index_Elementos] = CoresAndSleeve[j];
                        Index_Elementos++;
                    }
                }

                Array.Resize(ref CoresSleevesInPattern, (Index_Elementos));
                Array.Sort(CoresSleevesInPattern);


                // filtro los elementos repetidos
                for (int i = 0; i < CoresSleevesInPattern.Length; i++)
                {
                    string AuxCore = CoresSleevesInPattern[i];
                    for (int j = 0; j < CoresSleevesInPattern.Length; j++)
                    {
                        if (AuxCore == "-1")
                        {
                            break;
                        }

                        if (i != j && (AuxCore == CoresSleevesInPattern[j])) // <- que no se sobre escriba a si mismo
                        {
                            CoresSleevesInPattern[j] = "-1";
                        }
                    }

                }


                int indexCoreSleeveTotal = 0;
                string[] CoresSleevesFiltrado = new string[500];

                for (int i = 0; i < CoresSleevesInPattern.Length; i++)
                {
                    if (CoresSleevesInPattern[i] != "-1")
                    {
                        CoresSleevesFiltrado[indexCoreSleeveTotal] = CoresSleevesInPattern[i];
                        indexCoreSleeveTotal++;
                    }
                }



                ////
                // Se ingresar los elementos filtrados 
                ///

                Array.Resize(ref CoresSleevesFiltrado, indexCoreSleeveTotal);
                Array.Sort(CoresSleevesFiltrado);

                ActualizarTablaDeCores(CoresSleevesFiltrado);
                dataGridView1.Enabled = true;

                Array.Resize(ref g_CoresInTheRecepie, 200);
                for (int i = 0; i < CoresSleevesFiltrado.Length; i++)
                {
                    g_CoresInTheRecepie[i] = CoresSleevesFiltrado[i];

                }

                Array.Resize(ref g_CoresInTheRecepie, indexCoreSleeveTotal);

                MessageBox.Show("Now you can write the Dinamic recepie\n whit the correct Cores and Sleeves", "Danamic recepie", MessageBoxButtons.OK, MessageBoxIcon.Information);



            }
            catch (Exception err)
            {
                MessageBox.Show("Please cheack all in the pattern seccion\n" + err.Message, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);


            }






        }


        public void ActualizarTablaDeCores(string[] CoresDisponibles)
        {
            int index_col = 0, tipo_core_col = 1, Pallet_col = 2, Segmento_col = 3,
           Cantidad_col = 4, Apilado_Col = 5, Vertical_Col = 6;


            int UltimaFila = dataGridView1.RowCount;


            // Se setean los elementos
            foreach (DataGridViewRow row in dataGridView1.Rows)
            {
                DataGridViewComboBoxCell comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);

                DataGridViewRow rowss = (DataGridViewRow)dataGridView1.Rows[UltimaFila - 1];
                rowss.Cells[0].Value = (UltimaFila).ToString();


                comboBoxCell.Items.Clear();
                for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                comboBoxCell = (row.Cells[Pallet_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                for (int i = 1; i < 7; i++) { comboBoxCell.Items.Add(i.ToString()); }

                comboBoxCell = (row.Cells[Segmento_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();

                for (int i = 1; i < 10; i++) { comboBoxCell.Items.Add(i.ToString()); }

                comboBoxCell = (row.Cells[tipo_core_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();

                for (int i = 0; i < CoresDisponibles.Length; i++)
                {

                    comboBoxCell.Items.Add(CoresDisponibles[i]);

                }


                comboBoxCell = (row.Cells[Cantidad_col] as DataGridViewComboBoxCell);
                comboBoxCell.Items.Clear();
                for (int i = 1; i < 200; i++) { comboBoxCell.Items.Add(i.ToString()); }


                DataGridViewCheckBoxCell chk = (DataGridViewCheckBoxCell)row.Cells[Apilado_Col];
                chk.Value = chk.TrueValue;
                chk = (DataGridViewCheckBoxCell)row.Cells[Vertical_Col];
                chk.Value = chk.FalseValue;








            }

        }

        private void button8_Click_1(object sender, EventArgs e)
        {

        }



        public string g_BackUpFile_Excel = "BackUp_recipie";

        /// <summary>
        /// Timer que guarda el excel Cada 1 minuto
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void timer3_Tick(object sender, EventArgs e)
        {
            timer3.Enabled = false;
            ExcelClass.Save_Excel(g_BackUpFile_Excel, false);

        }

        private void button22_Click(object sender, EventArgs e)
        {
            ExcelClass.Show_Excel(g_ShowExcel);


            if (g_ShowExcel)
            {
                button22.Text = "Hide Excel";
            }
            else
            {

                button22.Text = "Show Excel";
            }

            g_ShowExcel = !g_ShowExcel;

        }

        private void timer4_Tick(object sender, EventArgs e)
        {

        }
        /// <summary>
        /// lectura de archivo y paso de datos a matriz de lista
        /// </summary>
        /// <returns></returns>
        public List<List<string>> getCoreInList()
        {

            List<List<string>> matriz = new List<List<string>>();
            string[] strLineas = File.ReadAllLines(path_txt);
            string[] campos;

            foreach (string linea in strLineas)
            {
                //Declaramos una lista para los campos de la linea concreta
                //que estamos recorriendo
                List<string> lineaMatriz = new List<string>();
                //Partimos la linea con el caracter separador ";" indicado
                campos = linea.Split(";".ToCharArray());
                //Agregamos todos los campos obtenidos al partir la linea a la 
                //fila de la matriz
                lineaMatriz.AddRange(campos.ToList());
                //agregamos a la matriz la fila leida.
                matriz.Add(lineaMatriz);
            }

            return matriz;
        }
        /// <summary>
        /// Función que busca desde el ficherodarkdeo cores iguales
        /// </summary>
        /// <returns></returns>
        /// 
        public bool same_Core()
        {
            bool validar_core = false;
            List<List<string>> matriz = new List<List<string>>();
            matriz = getCoreInList();
            for (int i = 0; i < matriz.Count(); i++)
            {
                if (matriz[i][0].ToString() == comboBox2.SelectedItem.ToString())
                {
                    validar_core = true;
                    break;
                }
                else
                {
                    validar_core = false;
                }
            }


            return validar_core;
        }




        private void button11_Click_2(object sender, EventArgs e)
        {
            ExcelClass.erase_Data_No_ID(bx_num_index_ID.Value);
            if (this.bx_num_index_ID.Value <= 0)
            {
                this.bx_num_index_ID.Value = this.bx_num_index_ID.Value + 1;
            }
            else
            {
                this.bx_num_index_ID.Value = this.bx_num_index_ID.Value - 1;
            }
        }

        private void comboBox3_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void btn_Update_Core_Click(object sender, EventArgs e)
        {
            try
            {
                bool validar_core = same_Core();
                if (validar_core)
                {
                    DialogResult r = MessageBox.Show("this core exists,do you want to update?", "CORE REPEATED", MessageBoxButtons.YesNo);
                    if (r == DialogResult.Yes)
                    {
                        string[] line = File.ReadAllLines(path_txt);
                        for (int i = 0; i < line.Length; i++)
                        {
                            if (line[i].Contains(comboBox2.SelectedItem.ToString()))
                            {
                                line[i] = "";
                            }

                        }

                        File.WriteAllLines(path_txt, line.Where(x => !string.IsNullOrWhiteSpace(x)).ToArray());
                        comboBox4.Enabled = true;
                        comboBox25.Enabled = true;
                        comboBox2.Enabled = false;
                        btn_Update_Core.Enabled = true;
                        btn_Update_Core.Text = "Update Core";
                        MessageBox.Show("SELECT BUTTON UPDATE CORE TO UPDATE");


                    }

                }
                else
                {
                    btn_Update_Core.Text = "Save Core";
                    fichero = File.AppendText(path_txt);
                    List<string> list = new List<string>();
                    list.Add(comboBox2.SelectedItem.ToString() + ";" + comboBox4.SelectedItem.ToString() + ";" + comboBox25.SelectedItem.ToString());
                    foreach (string item in list)
                    {
                        fichero.WriteLine(item);
                    }

                    fichero.Close();
                    update_Filetxt_backup();

                    //fichero = new StreamWriter();
                    comboBox2.Enabled = true;
                    comboBox25.Enabled = false;
                    comboBox4.Enabled = false;



                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error READING" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }



        }

        public void clean_groupbox_combobox()
        {
            //limpiando groupbox
            foreach (Control chk in groupBox8.Controls)
            {
                if (chk is CheckBox)
                {
                    CheckBox c;
                    c = (CheckBox)chk;
                    c.Checked = false;
                }
            }

            foreach (Control chk in groupBox9.Controls)
            {
                if (chk is CheckBox)
                {
                    CheckBox c;
                    c = (CheckBox)chk;
                    c.Checked = false;
                }
            }

            foreach (Control chk in groupBox38.Controls)
            {
                if (chk is CheckBox)
                {
                    CheckBox c;
                    c = (CheckBox)chk;
                    c.Checked = false;
                }
            }

            foreach (Control chk in groupBox11.Controls)
            {
                if (chk is CheckBox)
                {
                    CheckBox c;
                    c = (CheckBox)chk;
                    c.Checked = false;
                }
            }
            //seteando a default combobox
            comboBox1.Text = "";
            comboBox2.Text = "";
            comboBox25.Text = "";
            comboBox4.Text = "";
        }

        private void comboBox3_SelectedIndexChanged_1(object sender, EventArgs e)
        {
            try
            {
                clean_groupbox_combobox();
            }
            catch (Exception ex)
            {
                MessageBox.Show("PROBLEMS TO CLEAN COMBOBOX AND CHECKBOX", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }


        public string g_PathReloadBddPattern="";
        private  void button3_Click_1(object sender, EventArgs e)
        {
            OpenFileDialog open = new OpenFileDialog();

            open.Filter = "Hoja de cálculo de Microsoft Office Excel (.xlsx)|*.xlsx";
            if (open.ShowDialog() == DialogResult.OK)
            {
                g_PathReloadBddPattern = open.FileName;
                open.Dispose();

                Cargar_BDD_estatica_reLoadForm();
                
            

                MessageBox.Show("Saved Pattern!", "Info", MessageBoxButtons.OK, MessageBoxIcon.Asterisk);
            }

        }

        private void comboPosSprue_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void dataGridView2_CurrentCellDirtyStateChanged(object sender, EventArgs e)
        {
            
        }
        //Variable global para tomar variables de comboboxs
        ComboBox combo;
        private void dataGridView2_EditingControlShowing(object sender, DataGridViewEditingControlShowingEventArgs e)
        {
            //Asignacion de instancia a combo
            combo = e.Control as ComboBox;
            if (combo!=null)
            {
                //Se crea un evento cada vez que se seleccione un objeto dentro del combobox
                combo.SelectedIndexChanged -= new EventHandler(Combo_SelectedIndexChanged);
                //Se llama al objeto que contiene el elemento dentro del combobox
                combo.SelectedIndexChanged += Combo_SelectedIndexChanged;
                
            }
        }
        List<string> g_data = new List<string>();
        int g_pos = 0;
        private void Combo_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                //Fila seleccionada en datagridview
                int index = dataGridView2.CurrentRow.Index;
                //obteniendo elemento dentro del combobox
                string selected = (sender as ComboBox).SelectedItem.ToString();
                
                if (selected.Contains("drag"))
                {
                    int prevRow = index - 1;
                    if (prevRow >= 0)
                    {
                        DataGridViewComboBoxCell comboView = (DataGridViewComboBoxCell)(dataGridView2.Rows[index].Cells[2]);
                        comboView.Value = g_pos.ToString();
                    }
                }
                else
                {
                    g_data.Clear();
                    g_data = SQL.get_Data(selected);

                    if (g_data.Count.Equals(1))
                    {
                        DataGridViewComboBoxCell comboView = (DataGridViewComboBoxCell)(dataGridView2.Rows[index].Cells[2]);
                        bool firstPattern = true;
                        int auxPos = evaluatePosition(Convert.ToInt32(g_data.ElementAt(0)));
                        switch (auxPos)
                        {
                            case 1:
                                if (g_pos.Equals(auxPos))
                                {
                                    g_pos += 1;
                                    comboView.Value = (g_pos).ToString();
                                    firstPattern = false;

                                }
                                if (g_pos.Equals(auxPos + 1))
                                {
                                    if (firstPattern)
                                    {
                                        g_pos = auxPos;
                                        comboView.Value = g_pos.ToString();
                                    }
                                }
                                else
                                {
                                    g_pos = auxPos;
                                    comboView.Value = g_pos.ToString();
                                }
                                break;
                            case 2:
                                if (g_pos.Equals(auxPos))
                                {
                                    g_pos += 1;
                                    comboView.Value = (g_pos).ToString();
                                    firstPattern = false;
                                }
                                if (g_pos.Equals(auxPos + 1))
                                {
                                    if (firstPattern)
                                    {
                                        g_pos = auxPos+2;
                                        comboView.Value = g_pos.ToString();
                                    }
                                }
                                else
                                {
                                    g_pos = auxPos + 1;
                                    comboView.Value = g_pos.ToString();
                                }
                                
                                break;
                                case 3:
                                if (g_pos.Equals(auxPos))
                                {
                                    g_pos += 1;
                                    comboView.Value = (g_pos).ToString();
                                    firstPattern = false;
                                }
                                if (g_pos.Equals(auxPos + 2))
                                {
                                    if (firstPattern)
                                    {
                                        g_pos = auxPos + 3;
                                        comboView.Value = g_pos.ToString();
                                    }
                                }
                                else
                                {
                                    g_pos = auxPos + 2;
                                    comboView.Value = g_pos.ToString();
                                }
                                break;
                            


                            
                        }
                      

                        

                    }
                    else
                    {
                        MessageBox.Show("Inconsistency in the Sprue number on the prescription:" + selected, "Warning", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                    }
                }
            }
            catch (Exception ex)
            {

                
            }
            

            
            

        }

        public int evaluatePosition(int type)
        { 
            int newPos=0;
            switch (type)
            {
                case 1:
                    newPos = 1;
                    break;
                case 2:
                    newPos = 2;
                    break;
                case 3:
                    newPos = 3;
                    break;
            }

            return newPos;
        }


        /// <summary>
        /// Boton de FInish Data Adquisition
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button23_Click(object sender, EventArgs e)
        {
            try
            {
                

                List<string> list_data = new List<string>();
                
                list_data = ExcelClass.find_White_Space_Excel();
                if (list_data.Count() != 0)
                {
                    string display = String.Join(Environment.NewLine, list_data);
                    MessageBox.Show(display, "Blank Row", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    DialogResult dialogResult = MessageBox.Show("Are you sure that you want finish the position adquisition?", "Finish Recipe", MessageBoxButtons.YesNo);

                    if (dialogResult == DialogResult.Yes)
                    {
                        FinishData_adq();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error in adquisition of data" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }






        }




        /// <summary>
        /// Funcion  Finish DAta adquisicion
        /// </summary>
        public async void FinishData_adq()
        {
            
            try
            {
                var Total_entidades = ExcelClass.Get_elemetos_totales();

                int[] Delta_Elementos = new int[300];

                Delta_Elementos[g_PIN] = g_TotalPines - (Total_entidades[g_PIN1_ent] + Total_entidades[g_PIN2_ent]);
                Delta_Elementos[g_LOC] = g_TotalLoc - Total_entidades[g_LOC_ent];
                Delta_Elementos[g_CORE] = g_TotalCores - Total_entidades[g_CORE_ent];
                Delta_Elementos[g_SPRUE] = g_TotalSprue - Total_entidades[g_SPRUE_ent];
                Delta_Elementos[g_LID] = g_TotalTapas - Total_entidades[g_LID_ent];
                Delta_Elementos[g_SLEEVE] = g_TotalMangas - Total_entidades[g_SLEEVE_ent];
                Delta_Elementos[g_NUMBER] = g_TotalNum - Total_entidades[g_NUMBER_ent];
                Delta_Elementos[g_PATTERN] = g_TotalPatterns - Total_entidades[g_PATTERN_ent];
                string Mensaje = "";
                bool dataCoherence = true;
                
                for (int i = 0; i < Delta_Elementos.Length; i++)
                {
                    if (Delta_Elementos[i] != 0)
                    {
                        Mensaje = Mensaje + "-> " + g_Entidades[i] + " <- need check the coherence of data. I have " + Delta_Elementos[i].ToString() + " of diference \n";

                        dataCoherence = false;
                    }
                }

                if (!dataCoherence)
                {
                    MessageBox.Show(Mensaje);
                    richTextBox1.Text = Mensaje;
                }
                else if (ExcelClass.getSprueRepetidas(g_WhiteRecipe))
                {
                    MessageBox.Show("Problems with data content entered in argument [SPRUE]", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else if (ExcelClass.Get_FilasRepetidas_Excel(g_WhiteRecipe))
                {
                    MessageBox.Show("Problems with data content entered", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    return;
                }
                else
                {
                    
                   
                

                    Mensaje = " All data is coherence. ";
                    //   MessageBox.Show(Mensaje);
                    richTextBox1.Text = Mensaje;
                    DialogResult dialogResult2 = MessageBox.Show("do you want save all data?", "Finish Recipe", MessageBoxButtons.YesNo);
                    if (dialogResult2 == DialogResult.Yes)
                    {
                        //Evaluando si es una receta en blanco o no
                        if (!g_WhiteRecipe)
                        {
                            //Lista para guardar data relacionada a sprue o lid y Pattern
                            List<string> data = new List<string>();
                            //Asignación de datos a lista
                            data = ExcelClass.inspectExcel();
                            //Lectura de datos y creacion de matriz de rangos para identificar cada elemento
                            MGTXARENADO.ReadExcel(data);
                            //Creacion de cuadro delimietador para encerrar el elemento encontrado
                            MGTXARENADO.findZone();
                            //Guardado de camino de robot
                            MGTXARENADO.GuardadoDeDatosExcel(ExcelClass);
                        }

                        Show_loadingForm();
                        Task oTask = new Task(Cargar_BDD_estatica);
                        oTask.Start();
                        await oTask;
                        Close_loadingForm();
                        ExcelClass.Index_base_datos = 2;//<- Inicializo el index de base de datos
                        timer_pestana.Enabled = true;

                        Actualizar_Combobox_Patterns();


                        // Se borra la info inicial
                        /*              this.textBox1.Clear();
                                      comboBox32.SelectedIndex = 0;
                                      comboBox31.SelectedIndex = 0;
                                      comboBox30.SelectedIndex = 0;
                                      comboBox29.SelectedIndex = 0;
                                      comboBox28.SelectedIndex = 0;
                                      comboBox27.SelectedIndex = 0;
                                      comboBox26.SelectedIndex = 0;
                  */
                        var asd = Process.GetProcesses();
                        Kill_Excel_Process();

                        ///////////////////////////////////////////////////////////////////
                        //// Ruta donde estan el excel de Respaldo
                        ///////////////////////////////////////////////////////////////////
                        string PathBackup = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\Backup_recipie\" + g_BackUpFile_Excel + ".xlsx";

                        if (File.Exists(PathBackup))
                        {
                            File.Delete(PathBackup);
                        }

                    }

                }
            }
            catch (Exception errn)
            {

                MessageBox.Show(errn.Message);

            }
            





        }

        public void Cargar_BDD_estatica()
        {
            string PathToSave = ExcelClass.Save_Excel(PatternName);
            bool BdCargada = Load_BD_Estatica(PathToSave, "Estatica");

            if (BdCargada)
            {
                //////////////////
                /// Agregar
                //////////////////
            }

        }

        public void Cargar_BDD_estatica_reLoadForm()
        {
           
            bool BdCargada = Load_BD_Estatica(g_PathReloadBddPattern, "Estatica");

            if (BdCargada)
            {
                //////////////////
                /// Agregar
                //////////////////
            }

        }

        public void Show_loadingForm()
        {
            LoadingForm = new Form2();
            LoadingForm.StartPosition = FormStartPosition.CenterParent;
            LoadingForm.Show();

        }

        public void Close_loadingForm()
        {

            if (LoadingForm != null)
            {
                LoadingForm.Hide();
            }
        }

        public bool Load_BD_Estatica(string Path, string Metodo)
        {

            if (SQL.Excel(Path, Metodo))
            {
                ////////////////////////////////////////////
                ///// ETHERTNET ////////////////////////////
                ///COMUNCACION PLC /////////////////////////
                ////////////////////////////////////////////

                //   MessageBox.Show("Pattern ID \n" + PatternName + "\n is saved in the DATA BASE");
                return true;
            }
            else
            {
                MessageBox.Show("Error cant load Excel", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                return false;
            }
        }


        private void comboBox27_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox27.Items[comboBox27.SelectedIndex].ToString());

            g_Elementos_totales[g_PIN] = selectedValue;
        }

        private void groupBox32_Enter(object sender, EventArgs e)
        {

        }

        private void checkBox22_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox22.Checked)
            {
                CodCore = "LID05"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox21_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox21.Checked)
            {
                CodCore = "LID06"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox20_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox20.Checked)
            {
                CodCore = "LID07"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox19_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox19.Checked)
            {
                CodCore = "LID08"; Diametro = 0; ProfundidadPin = 0;
            }
           
        }





        private void Get_DataCoherence()
        {


            ///////////////////////////////////////////////////
            ///// Chech data coherence
            if (Entidad_ID == 2)
            {
                if (Diametro == 0 || Porcentaje_deteccion == 0)
                {
                    MessageBox.Show("Please Check Diameter and Porct Detection");
                    return;
                }
            }
            else if (Entidad_ID == 3)
            {

                if (Diametro == 0)
                {
                    MessageBox.Show("Please Check Diameter ");
                    return;
                }
            }
            else if (Entidad_ID == 6 || Entidad_ID == 7)
            {

                try
                {

                    if (comboBox1.SelectedIndex < 0)
                    {
                        MessageBox.Show("Please Check -> Pin Deeper <- ");
                        return;
                    }
                }
                catch (Exception)
                {


                }

            }
            /////////////////////////////////////////////////////

            bx_num_index_ID.Value = (ExcelClass.Index_base_datos - 1);

            string Filename = textBox1.Text;
            var file = @g_Path_Files + Filename + ".csv";


            ExcelClass.set_index_excel(this.bx_num_index_ID.Value);
            ExcelClass.Get_FilasRepetidas_Excel(g_WhiteRecipe);







            var Total_entidades = ExcelClass.Get_elemetos_totales();

            int[] Delta_Elementos = new int[30];

            Delta_Elementos[g_PIN] = g_TotalPines - (Total_entidades[g_PIN1_ent] + Total_entidades[g_PIN2_ent]);
            Delta_Elementos[g_LOC] = g_TotalLoc - Total_entidades[g_LOC_ent];
            Delta_Elementos[g_CORE] = g_TotalCores - Total_entidades[g_CORE_ent];
            Delta_Elementos[g_SPRUE] = g_TotalSprue - Total_entidades[g_SPRUE_ent];
            Delta_Elementos[g_LID] = g_TotalTapas - Total_entidades[g_LID_ent];
            Delta_Elementos[g_SLEEVE] = g_TotalMangas - Total_entidades[g_SLEEVE_ent];
            Delta_Elementos[g_NUMBER] = g_TotalNum - Total_entidades[g_NUMBER_ent];

            string Mensaje = "";

            for (int i = 0; i < Delta_Elementos.Length; i++)
            {
                if (Delta_Elementos[i] != 0)
                {
                    Mensaje = Mensaje + "-> " + g_Entidades[i] + " <- need check the coherence of data. I have " + Delta_Elementos[i].ToString() + " of diference \n";
                }
            }

            richTextBox1.Text = Mensaje;
            label52.Text = Mensaje;



            string Valores = insercionID + ";" + CodCore + ";" + Entidad_ID + ";" + ProfundidadPin + ";" + Porcentaje_deteccion.ToString();
            string csvRow = string.Format("{0};{1};{2};{3};{4};{5}", X, Y, Z, A, B, C);
            Valores = Valores + ";" + csvRow + ";" + Diametro;





        }


        private void comboBox31_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedValue = Convert.ToInt16(comboBox31.Items[comboBox31.SelectedIndex].ToString());

            g_Elementos_totales[g_NUMBER] = selectedValue;
        }

        private void checkBox23_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox23.Checked)
            {
                CodCore = "LID04"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox24_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox24.Checked)
            {
                CodCore = "LID03"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox25_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox25.Checked)
            {
                CodCore = "LID02"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void checkBox26_CheckedChanged(object sender, EventArgs e)
        {
            if (checkBox26.Checked)
            {
                CodCore = "LID01"; Diametro = 0; ProfundidadPin = 0;
            }
        }

        private void groupBox13_Enter(object sender, EventArgs e)
        {

        }



        private void button19_Click(object sender, EventArgs e)
        {

            try
            {

                g_TotalNum = Convert.ToInt16(comboBox31.Items[comboBox31.SelectedIndex]);
                g_TotalCores = Convert.ToInt16(comboBox26.Items[comboBox26.SelectedIndex]);
                g_TotalPines = Convert.ToInt16(comboBox27.Items[comboBox27.SelectedIndex]);
                g_TotalLoc = Convert.ToInt16(comboBox28.Items[comboBox28.SelectedIndex]);
                g_TotalTapas = Convert.ToInt16(comboBox29.Items[comboBox29.SelectedIndex]);
                g_TotalSprue = Convert.ToInt16(comboBox30.Items[comboBox30.SelectedIndex]);
                g_TotalMangas = Convert.ToInt16(comboBox32.Items[comboBox32.SelectedIndex]);
                g_TotalPines = Convert.ToInt16(comboBox27.Items[comboBox27.SelectedIndex]);
                g_TotalPatterns = 1;

                string mensaje = "All Parameters to be saved\n" +
                                "Numbers-> " + g_TotalNum + "\n" +
                                "Pins-> " + g_TotalPines + "\n" +
                                "Cores-> " + g_TotalCores + "\n" +
                                "Sleeves-> " + g_TotalMangas + "\n" +
                                "Locator-> " + g_TotalLoc + "\n" +
                                "Lids-> " + g_TotalTapas + "\n" +
                                "Sprue-> " + g_TotalSprue + "\n" + "\n \n" +
                                "Is all OK?"


                                ;



                DialogResult dialogResult = MessageBox.Show(mensaje, "Pieces of Recipe", MessageBoxButtons.YesNo, MessageBoxIcon.Exclamation);

                if (dialogResult == DialogResult.Yes)
                {
                    g_Permiso_Inicio = true;
                }
            }
            catch (Exception)
            {

                MessageBox.Show("Select the numbers clicking the mouse", "Pieces of Recipe", MessageBoxButtons.YesNo, MessageBoxIcon.Warning);

            }


        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            try
            {
                Init_Form();
            }
            catch (Exception ex)
            {
                timer1.Enabled = false;
                MessageBox.Show("Error" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                Application.Exit();
            }




            string Eje = "_EV01_O_EJE";
            string[] Coordenada = { "X", "Y", "Z", "A", "B", "C" };
            double[] PosRobot = new double[6];
            for (int i = 0; i < Coordenada.Length; i++)
            {
                string Ejecoordenado = Eje + Coordenada[i];
                
                string ValorEje = EthernetIP.Lectura_tag(Ejecoordenado);
                double ValorEje_dou = Convert.ToDouble(ValorEje) / 10e3 - 4e3;
                PosRobot[i] = ValorEje_dou;
            }

            //Random random = new Random();
            X = PosRobot[0];
            Y = PosRobot[1];
            Z = PosRobot[2];
            A = PosRobot[3];
            B = PosRobot[4];
            C = PosRobot[5];

            label5.Text = "X= " + X.ToString() + " Y= " + Y.ToString() + " Z= " + Z.ToString();

            timer1.Enabled = false;
            timer2.Enabled = true;




        }

        double[] g_posRobotShow = new double[6];

        public void Lectura_Pos_RobotToShow()
        {
            try
            {
                 string Eje = "_EV01_O_EJE";
                string[] Coordenada = { "X", "Y", "Z", "A", "B", "C" };
                double[] PosRobot = new double[6];
                string Msj = "";
                for (int i = 0; i < Coordenada.Length; i++)
                {
                    string Ejecoordenado = Eje + Coordenada[i];
                    
                    string ValorEje = EthernetIP.Lectura_tag(Ejecoordenado);
                    double ValorEje_dou = Convert.ToDouble(ValorEje) / 10e3 - 4e3;
                    g_posRobotShow[i] = Math.Round(ValorEje_dou, 2);

                    Msj = Eje + Coordenada[i] + ": " + g_posRobotShow[i].ToString() + "\n";
                }




                label29.Text = "X= " + g_posRobotShow[0].ToString() + "Y=" + g_posRobotShow[1].ToString() + " Z=" + g_posRobotShow[2].ToString() + "\n" + "A=" + g_posRobotShow[3].ToString() + " B=" + g_posRobotShow[4].ToString() + " C=" + g_posRobotShow[5].ToString();

            }
            catch (Exception)
            {

                
            }
           

        }


        public void Lectura_Pos_Robot()
        {
            string Eje = "_EV01_O_EJE";
            string[] Coordenada = { "X", "Y", "Z", "A", "B", "C" };
            double[] PosRobot = new double[6];
            for (int i = 0; i < Coordenada.Length; i++)
            {
                string Ejecoordenado = Eje + Coordenada[i];
                string ValorEje = EthernetIP.Lectura_tag(Ejecoordenado);
                double ValorEje_dou = Convert.ToDouble(ValorEje) / 10e3 - 4e3;
                PosRobot[i] = Math.Round(ValorEje_dou, 2);
            }

            //Random random = new Random();
            X = PosRobot[0];
            Y = PosRobot[1];
            Z = PosRobot[2];
            A = PosRobot[3];
            B = PosRobot[4];
            C = PosRobot[5];

            label5.Text = "X= " + X.ToString() + " Y= " + Y.ToString() + " Z= " + Z.ToString();


        }


        public bool g_ActivarBackUp_Save = false;
        /// <summary>
        /// Boton de SAVE POSITION
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button12_Click(object sender, EventArgs e)
        {

            g_ActivarBackUp_Save = true;


            if (g_ActivarBackUp_Save)
            {
                timer3.Enabled = true;

            }


            if (Entidad_ID != g_PATTERN_ent)
            {
                Lectura_Pos_Robot();
            }

            Save_Position();

        }

        private void button24_Click(object sender, EventArgs e)
        {
            if (Entidad_ID != g_PATTERN_ent)
            {

                X = 0; Y = 0; Z = -1000; A = 0; B = 0; C = 0;
                label5.Text = "X= " + X.ToString() + " Y= " + Y.ToString() + " Z= " + Z.ToString();

            }

            Save_Position();
        }


        /// <summary>
        /// Save data in Excel
        /// </summary>
        private void Save_Position()
        {
            //ExcelClass.find_White_Space_Excel();

            ///////////////////////////////////////////////////
            ///// Chech data coherence
            if (Entidad_ID == g_SLEEVE_ent)
            {
                if (Diametro == 0 || Porcentaje_deteccion == 0)
                {
                    MessageBox.Show("Please Check Diameter and Porct Detection");
                    return;
                }
            }
            else if (Entidad_ID == g_CORE_ent)
            {

                if (Diametro == 0)
                {
                    MessageBox.Show("Please Check Diameter ");
                    return;
                }
                if (Porcentaje_deteccion == 0 || Porcentaje_deteccion == 0)
                {
                    MessageBox.Show("Please Check  ");
                    return;
                }




            }
            else if (Entidad_ID == g_PIN1_ent || Entidad_ID == g_PIN2_ent)
            {

                try
                {
                    if (CodCore == "PIN")
                    {
                        MessageBox.Show("You need select PIN1 or PIN2\nPlease Select one option.", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }
                    if (comboBox1.SelectedIndex < 0)
                    {
                        MessageBox.Show("Please Check -> Pin Deeper <- ");
                        return;
                    }
                }
                catch (Exception)
                {


                }

            }
            else if (Entidad_ID == g_LID_ent)
            {

                try
                {
                    if (CodCore == "LID")
                    {
                        MessageBox.Show("You need check a LID \nPlease Select one option.", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }

                }
                catch (Exception)
                {


                }

            }
            else if (Entidad_ID == g_NUMBER)
            {
                try
                {
                    if (CodCore == "NUMBER")
                    {
                        MessageBox.Show("You need check a NUMBER \nPlease Select one option.", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                        return;
                    }

                }
                catch (Exception)
                {


                }

            }
            if (Entidad_ID == g_SPRUE_ent)
            {
                try
                {
                    if (comboPosSprue.SelectedIndex < 0)
                    {
                        MessageBox.Show("Select a position for SPRUE", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }

                }
                catch (Exception)
                {   


                }

            }
            if (Entidad_ID == g_LOC_ent)
            {
                try
                {
                    if (CodCore.Equals("LOC"))
                    {
                        MessageBox.Show("Select a LOC type", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                        return;
                    }
                }
                catch (Exception ex)
                {

                }
            }

            /////////////////////////////////////////////////////



            if (!g_acceso_por_Pattern)////// < - Si toma datos de la esquina suo izquierda no guarda datos hasta obtiene las 2 esquina DER e IZQ
            {

                bx_num_index_ID.Value = (ExcelClass.Index_base_datos - 1);

                string Filename = textBox1.Text;
                var file = @g_Path_Files + Filename + ".csv";
                string[] Vector_Info = new string[ExcelClass.g_Cabecera.Length];

                Vector_Info[1] = CodCore;
                Vector_Info[2] = Entidad_ID.ToString();
                Vector_Info[3] = ProfundidadPin.ToString();
                Vector_Info[4] = X.ToString();
                Vector_Info[5] = Y.ToString();
                Vector_Info[6] = Z.ToString();
                Vector_Info[7] = A.ToString();
                Vector_Info[8] = B.ToString();
                Vector_Info[9] = C.ToString();
                Vector_Info[10] = Diametro.ToString();
                Vector_Info[11] = Porcentaje_deteccion.ToString();
                if (this.comboBox3.SelectedItem.Equals("SPRUE"))
                {
                    Vector_Info[12] = this.comboPosSprue.SelectedItem.ToString();
                }
                else
                {
                    Vector_Info[12] = "1";
                }


                try
                {
                    if (ExcelClass.validate_data_excel(bx_num_index_ID.Value))
                    {
                        if (!ExcelClass.count_row_excel(this.bx_num_index_ID.Value))
                        {
                            ExcelClass.Insertar_Info(Vector_Info);
                            ExcelClass.set_index_excel(this.bx_num_index_ID.Value);
                            bool Have_Repetida = ExcelClass.Get_FilasRepetidas_Excel(g_WhiteRecipe);
                            if (ExcelClass.getSprueRepetidas(g_WhiteRecipe))
                            {
                                MessageBox.Show("Sprue Repeated .\nPlease Check the Excel File", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                            }
                            if (Have_Repetida && !g_WhiteRecipe)
                            {
                                MessageBox.Show("You have a repeated row .\nPlease Check the Excel File", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                                //   return;
                            }


                        }
                        else
                        {

                            MessageBox.Show("You need the position the rown that you want write.", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                            return;
                        }



                    }
                    else
                    {

                        int indice = ExcelClass.Index_base_datos - 1;
                        MessageBox.Show("Row :" + " " + indice + " " + " Have Data \nPlease Erase or Move de Pointer Index in  -> ID SELECT <- to " + (indice + 1).ToString(), "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        return;
                    }
                }
                catch (Exception ex)
                {

                    MessageBox.Show("Problem Reading" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }





                var Total_entidades = ExcelClass.Get_elemetos_totales();

                int[] Delta_Elementos = new int[30];

                Delta_Elementos[g_PIN] = g_TotalPines - (Total_entidades[g_PIN1_ent] + Total_entidades[g_PIN2_ent]);
                Delta_Elementos[g_LOC] = g_TotalLoc - Total_entidades[g_LOC_ent];
                Delta_Elementos[g_CORE] = g_TotalCores - Total_entidades[g_CORE_ent];
                Delta_Elementos[g_SPRUE] = g_TotalSprue - Total_entidades[g_SPRUE_ent];
                Delta_Elementos[g_LID] = g_TotalTapas - Total_entidades[g_LID_ent];
                Delta_Elementos[g_SLEEVE] = g_TotalMangas - Total_entidades[g_SLEEVE_ent];
                Delta_Elementos[g_NUMBER] = g_TotalNum - Total_entidades[g_NUMBER_ent];

                string Mensaje = "";

                for (int i = 0; i < Delta_Elementos.Length; i++)
                {
                    if (Delta_Elementos[i] != 0)
                    {
                        Mensaje = Mensaje + "-> " + g_Entidades[i] + " <- need check the coherence of data. I have " + Delta_Elementos[i].ToString() + " of diference \n";
                    }
                }

                richTextBox1.Text = Mensaje;
                label52.Text = Mensaje;



                string Valores = insercionID + ";" + CodCore + ";" + Entidad_ID + ";" + ProfundidadPin + ";" + Porcentaje_deteccion.ToString();
                string csvRow = string.Format("{0};{1};{2};{3};{4};{5}", X, Y, Z, A, B, C);
                Valores = Valores + ";" + csvRow + ";" + Diametro;




                label16.Text = (ExcelClass.Index_base_datos - 2).ToString();
                label17.Text = CodCore;
                label18.Text = Entidad_ID.ToString();
                label19.Text = ProfundidadPin.ToString();
                label20.Text = X.ToString();
                label21.Text = Y.ToString();
                label22.Text = Z.ToString();
                label23.Text = A.ToString();
                label24.Text = B.ToString();
                label25.Text = C.ToString();
                label26.Text = Diametro.ToString();
                label49.Text = Porcentaje_deteccion.ToString();

                MessageBox.Show("Data Saved!", "Data", MessageBoxButtons.OK, MessageBoxIcon.Information);

            }
            else { MessageBox.Show("I need that you insert the position of the right down corner Pattern first", "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation); }



        }

        private void comboBox4_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                var selectedValue = comboBox4.Items[comboBox4.SelectedIndex];

                string Valor = selectedValue.ToString();
                var ValorStr = Valor.Split('[');
                Diametro = Convert.ToInt16(ValorStr[0].ToString());
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message);
               
            }
           
        }

        private void button11_Click_1(object sender, EventArgs e)
        {
            ///boton Go To find no programado
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {
            int selectedIndex = comboBox1.SelectedIndex;
            var selectedValue = comboBox1.Items[comboBox1.SelectedIndex];

            string Valor = selectedValue.ToString();
            var ValorStr = Valor.Split('[');
            ProfundidadPin = Convert.ToInt16(ValorStr[0].ToString());
        }

        string g_EntidadSeleccionada = "";
        bool g_ActivarLecturaPosicion = true;
        private void comboBox3_SelectedValueChanged(object sender, EventArgs e)
        {
            try
            {
                groupBox8.Enabled = false;
                groupBox9.Enabled = false;
                groupBox3.Enabled = false;
                groupBox11.Enabled = false;
                groupBox17.Enabled = false;
                groupBox38.Enabled = false;
                groupBox21.Enabled = false;
                comboBox2.Enabled = false;
                comboBox4.Enabled = false;
                comboBox25.Enabled = false;

                button18.Enabled = false;
                button17.Enabled = false;
               btn_Update_Core.Enabled = false;

                int selectedIndex = comboBox3.SelectedIndex;
                var selectedValue = comboBox3.Items[comboBox3.SelectedIndex];
                g_EntidadSeleccionada = selectedValue.ToString();

                if (g_EntidadSeleccionada == "PIN")
                {
                    groupBox8.Enabled = true;
                    label3.Text = g_Tool[1];
                    Entidad_ID = 6;
                    CodCore = "PIN";
                    Diametro = 0;
                    Porcentaje_deteccion = 1;
                }
                if (g_EntidadSeleccionada == "LOC")
                {
                    groupBox9.Enabled = true;
                    label3.Text = g_Tool[0];
                    Entidad_ID = 1;
                    CodCore = "LOC";
                    Porcentaje_deteccion = 1;

                }

                if (g_EntidadSeleccionada == "NUMBER")
                {
                    Entidad_ID = 5;
                    CodCore = "NUMBER";
                    label3.Text = g_Tool[2];
                    groupBox11.Enabled = true;
                    Porcentaje_deteccion = 1;

                }


                if (g_EntidadSeleccionada == "SPRUE")
                {
                    groupBox17.Enabled = true;
                    label30.Text = "Pos Sprue";
                    label3.Text = g_Tool[0];
                    Entidad_ID = 4;
                    CodCore = "SPRUE";
                    Diametro = 124;
                    Porcentaje_deteccion = 1;


                }
                if (g_EntidadSeleccionada == "CORE")
                {
                    //Porcentaje_deteccion = 0.1;
                   
                    groupBox3.Enabled = true;
                    comboBox2.Enabled = true;
                    comboBox4.Enabled = true;
                    comboBox25.Enabled = true;
                    CodCore = "CORE";
                    label3.Text = g_Tool[0];
                    Entidad_ID = 2;
                    ProfundidadPin = 0;

                    comboBox2.Items.Clear();

                    string[] ficheros = Directory.GetDirectories(g_Path_Files);


                    for (int i = 0; i < ficheros.Length; i++)
                    {
                        if (!ficheros[i].Contains("sleeve"))
                        {

                            var Elemento = ficheros[i].Split('\\');

                            comboBox2.Items.Add(Elemento[5]);
                        }
                    }

                    btn_Update_Core.Enabled = true;


                }



                if (g_EntidadSeleccionada == "SLEEVE")
                {

                    Porcentaje_deteccion = 1;

                    groupBox3.Enabled = true;
                    label3.Text = g_Tool[0];
                    Entidad_ID = 3;
                    CodCore = "SLEEVE";
                    groupBox3.Enabled = true;
                    comboBox2.Enabled = true;
                    comboBox4.Enabled = true;
                    comboBox25.Enabled = true;

                    comboBox2.Items.Clear();

                    string[] ficheros = Directory.GetDirectories(g_Path_Files);


                    for (int i = 0; i < ficheros.Length; i++)
                    {
                        if (ficheros[i].Contains("sleeve"))
                        {

                            var Elemento = ficheros[i].Split('\\');

                            comboBox2.Items.Add(Elemento[5]);
                        }
                    }


                    groupBox38.Enabled = false;
                    groupBox21.Enabled = false;
                    btn_Update_Core.Enabled = true;

                }


                if (g_EntidadSeleccionada == "PATTERN")
                {
                    Porcentaje_deteccion = 1;

                    groupBox3.Enabled = true;
                    label3.Text = g_Tool[0];
                    CodCore = g_Entidades[7];
                    Entidad_ID = 10;

                    comboBox2.Items.Clear();


                    button18.Enabled = true;
                    button17.Enabled = false;
                    groupBox21.Enabled = true;

                    button12.Enabled = false;
                    button24.Enabled = false;


                }


                if (g_EntidadSeleccionada == "LID")
                {
                    Porcentaje_deteccion = 1;

                    groupBox3.Enabled = true;
                    groupBox38.Enabled = true;

                    label3.Text = g_Tool[0];
                    Entidad_ID = 8;
                    CodCore = "LID";
                    comboBox2.Items.Clear();
                    groupBox21.Enabled = false;
                }

                if (g_EntidadSeleccionada == "SAND MIXER")
                {
                    label3.Text = g_Tool[3];
                    CodCore = "SANDMIXER";
                    Entidad_ID = 12;
                    ProfundidadPin = 0;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Error Reading" + ex, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }

        }
    }
}

/* This is a template C# project for using HALCON programs exported
 * from HDevelop for 'C# - HALCON/.NET' and the Template Window Export. You
 * need to add the generated source code to this project before compiling.
 */

using System;
using System.Drawing;
using System.Collections;
using System.ComponentModel;
using System.Windows.Forms;
using System.Data;
using System.Threading;
using HalconDotNet;
using System.IO;

namespace HDevelopTemplate
{
    /// <summary>
    /// Summary description for Form1.
    /// </summary>
    public class HDevelopTemplate : System.Windows.Forms.Form
    {
        // The class HDevelopExport will be defined in the HALCON program
        // exported from HDevelop for 'C# - HALCON/.NET' and the Template
        // Window Export.
        private HDevelopExport HDevExp;
        private System.Windows.Forms.Button Run;
        private System.Windows.Forms.Label Status;
        private HalconDotNet.HWindowControl HWinCtrl;
        private ComboBox comboBox_Modelo3ds;
        private GroupBox groupBox1;
        private IContainer components;
        private GroupBox groupBox2;
        private Button button1;
        private Button button_updateSTL;
        private NumericUpDown numericUpDown_X;
        private GroupBox groupBox4;
        private Label label4;
        private Label label5;
        private Label label6;
        private NumericUpDown numericUpDown_A;
        private NumericUpDown numericUpDown_B;
        private NumericUpDown numericUpDown_C;
        private GroupBox groupBox3;
        private Label label3;
        private Label label2;
        private Label label1;
        private NumericUpDown numericUpDown_Z;
        private NumericUpDown numericUpDown_Y;
        private GroupBox groupBox5;
        private GroupBox groupBox6;
        private Button button3;
        private PictureBox pictureBox1;
        private System.Windows.Forms.Timer timer1;
        private Button button2;
        private Label label7;
        private Label label8;
        public static string g_Path_Modelos3D = "";
        public static bool g_ShowGroupBox = true;
        public HDevelopTemplate()
        {
            //
            // Required for Windows Form Designer support
            //
            InitializeComponent();

              g_Path_Modelos3D = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\SFM_CORES";
           // g_Path_Modelos3D = @"C:\SFM_CORES";
            HDevExp = new HDevelopExport();

            try
            {


                string[] ficheros = Directory.GetDirectories(g_Path_Modelos3D);

                for (int i = 0; i < ficheros.Length - 1; i++)
                {
                    var AuxFile = ficheros[i].Split('\\');
                    string AuxFile_3d = AuxFile[AuxFile.Length - 1];
                    comboBox_Modelo3ds.Items.Add(AuxFile_3d);


                }

            }
            catch (Exception)
            {

                MessageBox.Show("Ocurrio un problema en la carga de los modelos existente", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
            initHalcon();

        }

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                if (components != null)
                {
                    components.Dispose();
                }
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code
        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(HDevelopTemplate));
            this.HWinCtrl = new HalconDotNet.HWindowControl();
            this.Run = new System.Windows.Forms.Button();
            this.Status = new System.Windows.Forms.Label();
            this.comboBox_Modelo3ds = new System.Windows.Forms.ComboBox();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox6 = new System.Windows.Forms.GroupBox();
            this.button3 = new System.Windows.Forms.Button();
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.numericUpDown_Z = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown_Y = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown_X = new System.Windows.Forms.NumericUpDown();
            this.button_updateSTL = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.label4 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.numericUpDown_A = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown_B = new System.Windows.Forms.NumericUpDown();
            this.numericUpDown_C = new System.Windows.Forms.NumericUpDown();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.button2 = new System.Windows.Forms.Button();
            this.label7 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox6.SuspendLayout();
            this.groupBox5.SuspendLayout();
            this.groupBox3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_Z)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_Y)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_X)).BeginInit();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_A)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_B)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_C)).BeginInit();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).BeginInit();
            this.SuspendLayout();
            // 
            // HWinCtrl
            // 
            this.HWinCtrl.BackColor = System.Drawing.Color.Black;
            this.HWinCtrl.BorderColor = System.Drawing.Color.Black;
            this.HWinCtrl.ImagePart = new System.Drawing.Rectangle(0, 0, 512, 512);
            this.HWinCtrl.Location = new System.Drawing.Point(6, 5);
            this.HWinCtrl.Name = "HWinCtrl";
            this.HWinCtrl.Size = new System.Drawing.Size(511, 512);
            this.HWinCtrl.TabIndex = 0;
            this.HWinCtrl.WindowSize = new System.Drawing.Size(511, 512);
            // 
            // Run
            // 
            this.Run.Location = new System.Drawing.Point(-8, 94);
            this.Run.Name = "Run";
            this.Run.Size = new System.Drawing.Size(65, 25);
            this.Run.TabIndex = 1;
            this.Run.Text = "Run";
            this.Run.Click += new System.EventHandler(this.Run_Click);
            // 
            // Status
            // 
            this.Status.Location = new System.Drawing.Point(160, 530);
            this.Status.Name = "Status";
            this.Status.Size = new System.Drawing.Size(608, 17);
            this.Status.TabIndex = 2;
            // 
            // comboBox_Modelo3ds
            // 
            this.comboBox_Modelo3ds.FormattingEnabled = true;
            this.comboBox_Modelo3ds.Location = new System.Drawing.Point(3, 23);
            this.comboBox_Modelo3ds.Name = "comboBox_Modelo3ds";
            this.comboBox_Modelo3ds.Size = new System.Drawing.Size(286, 21);
            this.comboBox_Modelo3ds.TabIndex = 3;
            this.comboBox_Modelo3ds.SelectedIndexChanged += new System.EventHandler(this.comboBox_Modelo3ds_SelectedIndexChanged);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.groupBox6);
            this.groupBox1.Controls.Add(this.groupBox5);
            this.groupBox1.Controls.Add(this.comboBox_Modelo3ds);
            this.groupBox1.ForeColor = System.Drawing.SystemColors.Control;
            this.groupBox1.Location = new System.Drawing.Point(527, 105);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(295, 412);
            this.groupBox1.TabIndex = 4;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Core and Sleeves";
            // 
            // groupBox6
            // 
            this.groupBox6.Controls.Add(this.button3);
            this.groupBox6.ForeColor = System.Drawing.Color.White;
            this.groupBox6.Location = new System.Drawing.Point(9, 293);
            this.groupBox6.Name = "groupBox6";
            this.groupBox6.Size = new System.Drawing.Size(280, 107);
            this.groupBox6.TabIndex = 9;
            this.groupBox6.TabStop = false;
            this.groupBox6.Text = "Vision System Surface Model";
            // 
            // button3
            // 
            this.button3.ForeColor = System.Drawing.Color.White;
            this.button3.Location = new System.Drawing.Point(41, 46);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(161, 31);
            this.button3.TabIndex = 5;
            this.button3.Text = "Make Surface Model";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.groupBox3);
            this.groupBox5.Controls.Add(this.button_updateSTL);
            this.groupBox5.Controls.Add(this.groupBox4);
            this.groupBox5.ForeColor = System.Drawing.Color.White;
            this.groupBox5.Location = new System.Drawing.Point(4, 81);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(285, 182);
            this.groupBox5.TabIndex = 8;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "Offset Model";
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.label3);
            this.groupBox3.Controls.Add(this.label2);
            this.groupBox3.Controls.Add(this.label1);
            this.groupBox3.Controls.Add(this.numericUpDown_Z);
            this.groupBox3.Controls.Add(this.numericUpDown_Y);
            this.groupBox3.Controls.Add(this.numericUpDown_X);
            this.groupBox3.ForeColor = System.Drawing.Color.White;
            this.groupBox3.Location = new System.Drawing.Point(14, 18);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(116, 107);
            this.groupBox3.TabIndex = 6;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Translation";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 81);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(14, 13);
            this.label3.TabIndex = 10;
            this.label3.Text = "Z";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(16, 50);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(14, 13);
            this.label2.TabIndex = 9;
            this.label2.Text = "Y";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(16, 21);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(14, 13);
            this.label1.TabIndex = 8;
            this.label1.Text = "X";
            // 
            // numericUpDown_Z
            // 
            this.numericUpDown_Z.DecimalPlaces = 2;
            this.numericUpDown_Z.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_Z.Location = new System.Drawing.Point(32, 80);
            this.numericUpDown_Z.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_Z.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_Z.Name = "numericUpDown_Z";
            this.numericUpDown_Z.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_Z.TabIndex = 7;
            // 
            // numericUpDown_Y
            // 
            this.numericUpDown_Y.DecimalPlaces = 2;
            this.numericUpDown_Y.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_Y.Location = new System.Drawing.Point(32, 48);
            this.numericUpDown_Y.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_Y.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_Y.Name = "numericUpDown_Y";
            this.numericUpDown_Y.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_Y.TabIndex = 6;
            // 
            // numericUpDown_X
            // 
            this.numericUpDown_X.DecimalPlaces = 2;
            this.numericUpDown_X.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_X.Location = new System.Drawing.Point(32, 19);
            this.numericUpDown_X.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_X.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_X.Name = "numericUpDown_X";
            this.numericUpDown_X.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_X.TabIndex = 5;
            // 
            // button_updateSTL
            // 
            this.button_updateSTL.ForeColor = System.Drawing.Color.White;
            this.button_updateSTL.Location = new System.Drawing.Point(14, 145);
            this.button_updateSTL.Name = "button_updateSTL";
            this.button_updateSTL.Size = new System.Drawing.Size(96, 31);
            this.button_updateSTL.TabIndex = 4;
            this.button_updateSTL.Text = "Update STL File";
            this.button_updateSTL.UseVisualStyleBackColor = true;
            this.button_updateSTL.Click += new System.EventHandler(this.button2_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.label4);
            this.groupBox4.Controls.Add(this.label5);
            this.groupBox4.Controls.Add(this.label6);
            this.groupBox4.Controls.Add(this.numericUpDown_A);
            this.groupBox4.Controls.Add(this.numericUpDown_B);
            this.groupBox4.Controls.Add(this.numericUpDown_C);
            this.groupBox4.ForeColor = System.Drawing.Color.White;
            this.groupBox4.Location = new System.Drawing.Point(152, 18);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(115, 107);
            this.groupBox4.TabIndex = 7;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "Rotacional";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(16, 81);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(14, 13);
            this.label4.TabIndex = 10;
            this.label4.Text = "A";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(16, 50);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(14, 13);
            this.label5.TabIndex = 9;
            this.label5.Text = "B";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(16, 21);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(14, 13);
            this.label6.TabIndex = 8;
            this.label6.Text = "C";
            // 
            // numericUpDown_A
            // 
            this.numericUpDown_A.DecimalPlaces = 2;
            this.numericUpDown_A.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_A.Location = new System.Drawing.Point(32, 80);
            this.numericUpDown_A.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_A.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_A.Name = "numericUpDown_A";
            this.numericUpDown_A.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_A.TabIndex = 7;
            // 
            // numericUpDown_B
            // 
            this.numericUpDown_B.DecimalPlaces = 2;
            this.numericUpDown_B.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_B.Location = new System.Drawing.Point(32, 48);
            this.numericUpDown_B.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_B.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_B.Name = "numericUpDown_B";
            this.numericUpDown_B.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_B.TabIndex = 6;
            // 
            // numericUpDown_C
            // 
            this.numericUpDown_C.DecimalPlaces = 2;
            this.numericUpDown_C.Increment = new decimal(new int[] {
            1,
            0,
            0,
            131072});
            this.numericUpDown_C.Location = new System.Drawing.Point(32, 19);
            this.numericUpDown_C.Maximum = new decimal(new int[] {
            5000,
            0,
            0,
            0});
            this.numericUpDown_C.Minimum = new decimal(new int[] {
            5000,
            0,
            0,
            -2147483648});
            this.numericUpDown_C.Name = "numericUpDown_C";
            this.numericUpDown_C.Size = new System.Drawing.Size(75, 20);
            this.numericUpDown_C.TabIndex = 5;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.button1);
            this.groupBox2.ForeColor = System.Drawing.Color.White;
            this.groupBox2.Location = new System.Drawing.Point(527, 5);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(295, 88);
            this.groupBox2.TabIndex = 5;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Open a new 3d Model";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(64, 30);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(177, 30);
            this.button1.TabIndex = 0;
            this.button1.Text = "Select STL File";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // pictureBox1
            // 
            this.pictureBox1.Image = global::HDevelopTemplate.Properties.Resources.mirs;
            this.pictureBox1.Location = new System.Drawing.Point(827, 10);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(198, 180);
            this.pictureBox1.TabIndex = 6;
            this.pictureBox1.TabStop = false;
            this.pictureBox1.Click += new System.EventHandler(this.pictureBox1_Click);
            // 
            // timer1
            // 
            this.timer1.Interval = 500;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // button2
            // 
            this.button2.ForeColor = System.Drawing.Color.White;
            this.button2.Location = new System.Drawing.Point(828, 204);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(197, 65);
            this.button2.TabIndex = 7;
            this.button2.Text = "Close System";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click_1);
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.ForeColor = System.Drawing.Color.White;
            this.label7.Location = new System.Drawing.Point(339, 462);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(93, 13);
            this.label7.TabIndex = 9;
            this.label7.Text = "Model Dimensions";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.ForeColor = System.Drawing.Color.White;
            this.label8.Location = new System.Drawing.Point(344, 483);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(37, 13);
            this.label8.TabIndex = 10;
            this.label8.Text = "_____";
            // 
            // HDevelopTemplate
            // 
            this.AutoScaleBaseSize = new System.Drawing.Size(5, 13);
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(40)))), ((int)(((byte)(47)))));
            this.ClientSize = new System.Drawing.Size(1039, 527);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.Status);
            this.Controls.Add(this.HWinCtrl);
            this.Controls.Add(this.Run);
            this.Controls.Add(this.pictureBox1);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label7);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.None;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "HDevelopTemplate";
            this.Text = "HDevelop Template";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox6.ResumeLayout(false);
            this.groupBox5.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_Z)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_Y)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_X)).EndInit();
            this.groupBox4.ResumeLayout(false);
            this.groupBox4.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_A)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_B)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numericUpDown_C)).EndInit();
            this.groupBox2.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox1)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }
        #endregion Windows Form Designer generated code

        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Application.Run(new HDevelopTemplate());
        }

        private void Form1_Load(object sender, System.EventArgs e)
        {
            HDevExp.InitHalcon();

            this.StartPosition = FormStartPosition.CenterScreen;

            timer1.Enabled = true;
        }

        private void RunExport()
        {
            HTuple WindowHandle = HWinCtrl.HalconWindow;
            HDevExp.RunHalcon(WindowHandle);

         
        }

        private void RunExport_Modelos()
        {
            HDevelopTemplate.g_ShowGroupBox = false;

            HTuple WindowHandle = HWinCtrl.HalconWindow;
            HDevExp.VerModelos3ds(WindowHandle, g_ruta3dModelo);

            HDevelopTemplate.g_ShowGroupBox = true;

        }

        private void SetFinished()
        {
          
        }

        private void Run_Click(object sender, System.EventArgs e)
        {
            Run.Enabled = false;
            Status.Text = "Running...";
            Status.Refresh();

            Thread exportThread = new Thread(new ThreadStart(this.RunExport));
            exportThread.Start();
        }

        public void initHalcon()
        {
            Run.Enabled = false;
            Status.Text = "Running...";
            Status.Refresh();

            Thread exportThread = new Thread(new ThreadStart(this.RunExport));
            exportThread.Start();

        }

        public void ArrancarModelo()
        {
           
            Thread exportThread = new Thread(new ThreadStart(this.RunExport_Modelos));
            exportThread.Start();
        }

        public static string g_ruta3dModelo = "", g_modeloActual;
        private void comboBox_Modelo3ds_SelectedIndexChanged(object sender, EventArgs e)
        {


            var Core_Sleeve = comboBox_Modelo3ds.SelectedItem;
            string Path_to_object = g_Path_Modelos3D + @"\" + Core_Sleeve.ToString();

            DirectoryInfo Archivos_3ds = new DirectoryInfo(Path_to_object);
            var Archivos = Archivos_3ds.GetFiles();

            if (Archivos.Length >= 1)
            {
                for (int i = 0; i < Archivos.Length; i++)
                {
                    string ArchivoActual = Archivos[i].ToString();
                    if (ArchivoActual.Contains(".stl") || ArchivoActual.Contains(".STL"))
                    {
                        string Ruta = Path_to_object + @"\" + ArchivoActual;

                        g_ruta3dModelo = Ruta.Replace("\\", "/");
                        var Modelo = ArchivoActual.Split('.');
                        g_modeloActual = Modelo[0].ToUpper();
                        //      DialogResult dialogResult = MessageBox.Show(" Do you want see the selected model ?", "3D Model", MessageBoxButtons.YesNo);

                        //  if (dialogResult == DialogResult.Yes)
                        //    {
                        
                        ArrancarModelo();
                        //      }
                       
                    }




                }

            }


        }


        public void Carga_Cbx_3ds()
        {


            try
            {
                comboBox_Modelo3ds.Items.Clear();

                string[] ficheros = Directory.GetDirectories(g_Path_Modelos3D);

                for (int i = 0; i < ficheros.Length - 1; i++)
                {
                    var AuxFile = ficheros[i].Split('\\');
                    string AuxFile_3d = AuxFile[AuxFile.Length - 1];
                    comboBox_Modelo3ds.Items.Add(AuxFile_3d);


                }

            }
            catch (Exception)
            {

                MessageBox.Show("Ocurrio un problema en la carga de los modelos existente", "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
            //
            // TODO: Add any constructor code after InitializeComponent call
            //
        }
        private void button1_Click(object sender, EventArgs e)
        {

            try
            {

              
                var fileContent = string.Empty;
                var filePath = string.Empty;

                using (OpenFileDialog openFileDialog = new OpenFileDialog())
                {
                    openFileDialog.InitialDirectory = "c:\\";
                    openFileDialog.Filter = "stl files (*.stl)|*.stl|All files (*.*)|*.*";
                    openFileDialog.FilterIndex = 2;
                    openFileDialog.RestoreDirectory = true;

                    if (openFileDialog.ShowDialog() == DialogResult.OK)
                    {
                        DialogResult dialogResult = MessageBox.Show(" The 3D model is a  -> SLEEVE <- ", "Core or Sleeve ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question);

                        //Get the path of specified file
                        filePath = openFileDialog.FileName;
                        string[] RutaSelected = filePath.Split('\\');
                        string ArchivoStlSelected = RutaSelected[RutaSelected.Length - 1];
                        /// Creo carpeta 

                        string[] CarpetaNueva = ArchivoStlSelected.Split('.');


                        if (dialogResult == DialogResult.Yes)/// -> es una SLEEVE
                        {
                            CarpetaNueva[0] = CarpetaNueva[0] + " sleeve";
                            if (!Directory.Exists((Path.Combine(g_Path_Modelos3D, CarpetaNueva[0]))))
                            {
                                Directory.CreateDirectory(Path.Combine(g_Path_Modelos3D, CarpetaNueva[0]));
                            }
                        }
                        else {
                            if (!Directory.Exists((Path.Combine(g_Path_Modelos3D, CarpetaNueva[0]))))
                            {
                                Directory.CreateDirectory(Path.Combine(g_Path_Modelos3D, CarpetaNueva[0]));
                            }
                        }


                        //Read the contents of the file into a stream
                        var fileStream = openFileDialog.OpenFile();
                        /// copio archivo seleccionado


                        string PathTo_copy = Path.Combine(g_Path_Modelos3D, CarpetaNueva[0]);


                            File.Copy(filePath, Path.Combine(PathTo_copy, CarpetaNueva[0] + "_3D." + CarpetaNueva[1]), true);

                            Carga_Cbx_3ds();

                            MessageBox.Show("File copied success!", "File Copied", MessageBoxButtons.OK, MessageBoxIcon.Information
                                );


                    }
                }

            }
            catch (Exception err)
            {

                MessageBox.Show(err.Message.ToString(), "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);

            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            /// Mover y mostrar el modelo transrotado
            /// 

            groupBox1.Enabled = false;
            decimal[] Valor_transRot = new decimal[6];
            HDevelopExport.Valor_transRot[0] = numericUpDown_X.Value;
            HDevelopExport.Valor_transRot[1] = numericUpDown_Y.Value;
            HDevelopExport.Valor_transRot[2] = numericUpDown_Z.Value;
            HDevelopExport.Valor_transRot[3] = numericUpDown_C.Value;
            HDevelopExport.Valor_transRot[4] = numericUpDown_B.Value;
            HDevelopExport.Valor_transRot[5] = numericUpDown_A.Value;
            Mover_Modelo();
        }
        public void Mover_Modelo()
        {

            Thread exportThread = new Thread(new ThreadStart(this.RunExport_MoverModelos3D));
            exportThread.Start();

        }

        private void RunExport_MoverModelos3D()
        {
            HDevelopTemplate.g_ShowGroupBox = false;
            HTuple WindowHandle = HWinCtrl.HalconWindow;
            HDevExp.Move_model_3d(WindowHandle, g_ruta3dModelo);
            HDevelopTemplate.g_ShowGroupBox = true;

        }


        private void button3_Click(object sender, EventArgs e)
        {
            groupBox1.Enabled = false;
            groupBox2.Enabled = false;
            groupBox3.Enabled = false;
            groupBox4.Enabled = false;
            groupBox5.Enabled = false;
            groupBox6.Enabled = false;

            Crear_modelo_SFM();

            groupBox1.Enabled = true;
            groupBox2.Enabled = true;
            groupBox3.Enabled = true;
            groupBox4.Enabled = true;
            groupBox5.Enabled = true;
            groupBox6.Enabled = true;
        }


        public void Crear_modelo_SFM()
        {
            DialogResult dialog = MessageBox.Show("Are you sure that want make a Surface Model File ?","SFM File",MessageBoxButtons.YesNo,MessageBoxIcon.Information);

            if (dialog==DialogResult.Yes)
            {

                Thread exportThread = new Thread(new ThreadStart(this.makeSFM));
                exportThread.Start();

            }
        }

        private void pictureBox1_Click(object sender, EventArgs e)
        {

        }

        public void makeSFM()
        {

            HTuple WindowHandle = HWinCtrl.HalconWindow;
            HDevExp.MakeSFM_Model(g_ruta3dModelo);

            this.Invoke((MethodInvoker)delegate
            {
                SetFinished();
            });
        }

        private void timer1_Tick(object sender, EventArgs e)
        {
            g_ShowGroupBox = g_ShowGroupBox ? groupBox1.Enabled = g_ShowGroupBox : groupBox1.Enabled = g_ShowGroupBox;

            if (HDevelopExport.showFromLoad)
            {
                Show_loadForm();
                timer1.Enabled = false;
            }
        }

        public void Show_loadForm()
        {

            Thread exportThread = new Thread(new ThreadStart(LodForm_Now));
            exportThread.Start();

        }
        Form1 LoadForm;

        private void button2_Click_1(object sender, EventArgs e)
        {
            DialogResult dialogResult = MessageBox.Show("Are you sure that want close the SURFACE MODEL SYSTEM?", 
                                                        "Close App", MessageBoxButtons.YesNo,
                                                        MessageBoxIcon.Exclamation);

            if (dialogResult== DialogResult.Yes)
            {
                this.Close();
            }
            
        }

        public void LodForm_Now()
        {
            this.Invoke((MethodInvoker)delegate
            {
           //    LoadForm = new Form1();

            //    LoadForm.Show();
            });
    




        }



    }
}

namespace MasterApp
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.SQL_LED = new MfgControl.AdvancedHMI.Controls.SimpleLED();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.LED_SERIAL = new MfgControl.AdvancedHMI.Controls.SimpleLED();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.VISION1_LED = new MfgControl.AdvancedHMI.Controls.SimpleLED();
            this.button2 = new System.Windows.Forms.Button();
            this.groupBox4 = new System.Windows.Forms.GroupBox();
            this.simpleLED4 = new MfgControl.AdvancedHMI.Controls.SimpleLED();
            this.ethernetIPforCLXCom1 = new AdvancedHMIDrivers.EthernetIPforCLXCom(this.components);
            this.groupBox5 = new System.Windows.Forms.GroupBox();
            this.LED_PLC = new MfgControl.AdvancedHMI.Controls.SimpleLED();
            this.timer1 = new System.Windows.Forms.Timer(this.components);
            this.timer2 = new System.Windows.Forms.Timer(this.components);
            this.button1 = new System.Windows.Forms.Button();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            this.groupBox3.SuspendLayout();
            this.groupBox4.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.ethernetIPforCLXCom1)).BeginInit();
            this.groupBox5.SuspendLayout();
            this.SuspendLayout();
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.SQL_LED);
            this.groupBox1.ForeColor = System.Drawing.Color.White;
            this.groupBox1.Location = new System.Drawing.Point(12, 65);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(139, 110);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "SQlApi";
            // 
            // SQL_LED
            // 
            this.SQL_LED.BackColor = System.Drawing.Color.Transparent;
            this.SQL_LED.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.SQL_LED.Location = new System.Drawing.Point(109, 9);
            this.SQL_LED.MaximumSize = new System.Drawing.Size(360, 360);
            this.SQL_LED.MinimumSize = new System.Drawing.Size(30, 30);
            this.SQL_LED.Name = "SQL_LED";
            this.SQL_LED.Size = new System.Drawing.Size(30, 30);
            this.SQL_LED.TabIndex = 4;
            this.SQL_LED.Value = true;
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.LED_SERIAL);
            this.groupBox2.ForeColor = System.Drawing.Color.White;
            this.groupBox2.Location = new System.Drawing.Point(157, 64);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(139, 111);
            this.groupBox2.TabIndex = 1;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "SerialBridge";
            // 
            // LED_SERIAL
            // 
            this.LED_SERIAL.BackColor = System.Drawing.Color.Transparent;
            this.LED_SERIAL.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.LED_SERIAL.Location = new System.Drawing.Point(103, 10);
            this.LED_SERIAL.MaximumSize = new System.Drawing.Size(360, 360);
            this.LED_SERIAL.MinimumSize = new System.Drawing.Size(30, 30);
            this.LED_SERIAL.Name = "LED_SERIAL";
            this.LED_SERIAL.Size = new System.Drawing.Size(30, 30);
            this.LED_SERIAL.TabIndex = 5;
            this.LED_SERIAL.Value = true;
            // 
            // groupBox3
            // 
            this.groupBox3.Controls.Add(this.button1);
            this.groupBox3.Controls.Add(this.VISION1_LED);
            this.groupBox3.Controls.Add(this.button2);
            this.groupBox3.ForeColor = System.Drawing.Color.White;
            this.groupBox3.Location = new System.Drawing.Point(12, 181);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(139, 111);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "VR1";
            // 
            // VISION1_LED
            // 
            this.VISION1_LED.BackColor = System.Drawing.Color.Transparent;
            this.VISION1_LED.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.VISION1_LED.Location = new System.Drawing.Point(109, 10);
            this.VISION1_LED.MaximumSize = new System.Drawing.Size(360, 360);
            this.VISION1_LED.MinimumSize = new System.Drawing.Size(30, 30);
            this.VISION1_LED.Name = "VISION1_LED";
            this.VISION1_LED.Size = new System.Drawing.Size(30, 30);
            this.VISION1_LED.TabIndex = 5;
            this.VISION1_LED.Value = true;
            // 
            // button2
            // 
            this.button2.ForeColor = System.Drawing.Color.Black;
            this.button2.Location = new System.Drawing.Point(6, 82);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(127, 23);
            this.button2.TabIndex = 8;
            this.button2.Text = "Reset VS1";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // groupBox4
            // 
            this.groupBox4.Controls.Add(this.simpleLED4);
            this.groupBox4.ForeColor = System.Drawing.Color.White;
            this.groupBox4.Location = new System.Drawing.Point(157, 181);
            this.groupBox4.Name = "groupBox4";
            this.groupBox4.Size = new System.Drawing.Size(139, 111);
            this.groupBox4.TabIndex = 3;
            this.groupBox4.TabStop = false;
            this.groupBox4.Text = "VR2";
            // 
            // simpleLED4
            // 
            this.simpleLED4.BackColor = System.Drawing.Color.Transparent;
            this.simpleLED4.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.simpleLED4.Location = new System.Drawing.Point(109, 10);
            this.simpleLED4.MaximumSize = new System.Drawing.Size(360, 360);
            this.simpleLED4.MinimumSize = new System.Drawing.Size(30, 30);
            this.simpleLED4.Name = "simpleLED4";
            this.simpleLED4.Size = new System.Drawing.Size(30, 30);
            this.simpleLED4.TabIndex = 6;
            this.simpleLED4.Value = true;
            // 
            // ethernetIPforCLXCom1
            // 
            this.ethernetIPforCLXCom1.CIPConnectionSize = 508;
            this.ethernetIPforCLXCom1.DisableMultiServiceRequest = false;
            this.ethernetIPforCLXCom1.DisableSubscriptions = false;
            this.ethernetIPforCLXCom1.IniFileName = "";
            this.ethernetIPforCLXCom1.IniFileSection = null;
            this.ethernetIPforCLXCom1.IPAddress = "192.168.0.10";
            this.ethernetIPforCLXCom1.PollRateOverride = 500;
            this.ethernetIPforCLXCom1.Port = 44818;
            this.ethernetIPforCLXCom1.ProcessorSlot = 0;
            this.ethernetIPforCLXCom1.RoutePath = null;
            this.ethernetIPforCLXCom1.Timeout = 4000;
            // 
            // groupBox5
            // 
            this.groupBox5.Controls.Add(this.LED_PLC);
            this.groupBox5.ForeColor = System.Drawing.Color.White;
            this.groupBox5.Location = new System.Drawing.Point(12, 3);
            this.groupBox5.Name = "groupBox5";
            this.groupBox5.Size = new System.Drawing.Size(284, 56);
            this.groupBox5.TabIndex = 5;
            this.groupBox5.TabStop = false;
            this.groupBox5.Text = "StatusPLC";
            // 
            // LED_PLC
            // 
            this.LED_PLC.BackColor = System.Drawing.Color.Transparent;
            this.LED_PLC.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.LED_PLC.Location = new System.Drawing.Point(254, 9);
            this.LED_PLC.MaximumSize = new System.Drawing.Size(360, 360);
            this.LED_PLC.MinimumSize = new System.Drawing.Size(30, 30);
            this.LED_PLC.Name = "LED_PLC";
            this.LED_PLC.Size = new System.Drawing.Size(30, 30);
            this.LED_PLC.TabIndex = 4;
            this.LED_PLC.Value = true;
            this.LED_PLC.Click += new System.EventHandler(this.simpleLED5_Click);
            // 
            // timer1
            // 
            this.timer1.Interval = 500;
            this.timer1.Tick += new System.EventHandler(this.timer1_Tick);
            // 
            // timer2
            // 
            this.timer2.Interval = 2500;
            this.timer2.Tick += new System.EventHandler(this.timer2_Tick);
            // 
            // button1
            // 
            this.button1.ForeColor = System.Drawing.Color.Black;
            this.button1.Location = new System.Drawing.Point(6, 44);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(127, 23);
            this.button1.TabIndex = 9;
            this.button1.Text = "Take Calibration Photo";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click_1);
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.Color.FromArgb(((int)(((byte)(38)))), ((int)(((byte)(40)))), ((int)(((byte)(47)))));
            this.ClientSize = new System.Drawing.Size(308, 305);
            this.ControlBox = false;
            this.Controls.Add(this.groupBox5);
            this.Controls.Add(this.groupBox4);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox2);
            this.Controls.Add(this.groupBox1);
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.Name = "Form1";
            this.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen;
            this.Text = "Master Vision Sistem MGTX v1.0";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox2.ResumeLayout(false);
            this.groupBox3.ResumeLayout(false);
            this.groupBox4.ResumeLayout(false);
            ((System.ComponentModel.ISupportInitialize)(this.ethernetIPforCLXCom1)).EndInit();
            this.groupBox5.ResumeLayout(false);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private MfgControl.AdvancedHMI.Controls.SimpleLED SQL_LED;
        private System.Windows.Forms.GroupBox groupBox2;
        private MfgControl.AdvancedHMI.Controls.SimpleLED LED_SERIAL;
        private System.Windows.Forms.GroupBox groupBox3;
        private MfgControl.AdvancedHMI.Controls.SimpleLED VISION1_LED;
        private System.Windows.Forms.GroupBox groupBox4;
        private MfgControl.AdvancedHMI.Controls.SimpleLED simpleLED4;
        private AdvancedHMIDrivers.EthernetIPforCLXCom ethernetIPforCLXCom1;
        private System.Windows.Forms.GroupBox groupBox5;
        private MfgControl.AdvancedHMI.Controls.SimpleLED LED_PLC;
        private System.Windows.Forms.Timer timer1;
        private System.Windows.Forms.Timer timer2;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button1;
    }
}


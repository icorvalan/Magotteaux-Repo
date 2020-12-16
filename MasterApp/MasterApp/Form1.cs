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

namespace MasterApp
{

    public partial class Form1 : Form
    {


        EthernetIP EthernetIP = new EthernetIP();
        public string IP_Plc = "192.168.1.10";
        public string BDD = "magotteaux";
        SQL_Bridge SQL_Bridge;
        public delegate void ShowLEDSerial();
        public delegate void ShowLEDSQL();
        public delegate void ShowLEDVision();

        public Form1()
        {
            InitializeComponent();

            EthernetIP.Ethernet_Init(IP_Plc);
            SQL_Bridge = new SQL_Bridge(IP_Plc);
            SQL_Bridge.SQL_Init(BDD);

            SQL_Bridge.Set_Update_BD("ram_numeros", "N3", "MasterApp", 1);
        }

        public string g_pathSERIALBRIDGE = @"C:\Users\Vision MGTX\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\SerialBridge\SerialBridge.appref-ms";
        public string g_pathSQLAIP = @"C:\Users\Vision MGTX\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\SQLapi\SQLapi.appref-ms";
        public string g_pathVISION = @"D:\Visionteach\VisionSystem\matching.exe";


        private void Form1_Load(object sender, EventArgs e)
        {
            timer1.Enabled = true;
        }


        private void InitPLC()
        {
            LED_PLC.Value = true;


            List<string> TagsPLC = EthernetIP.Get_Tags();

            while (TagsPLC.Count == 0)
            {
                EthernetIP.CloseEthernetIP();
                EthernetIP.Ethernet_Init(IP_Plc);
                TagsPLC = EthernetIP.Get_Tags();


            }
            LED_PLC.LED_Blink = true;
            LED_PLC.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            LED_PLC.Value = true;

            VisionSystem_Init();

            timer2.Enabled = true;
        }
        private void timer1_Tick(object sender, EventArgs e)
        {
            timer1.Enabled = false;
            InitPLC();



        }


        public void SQL_Init() { }
        public void VisionSystem_Init()
        {


            SQL_Bridge.Set_Update_BD("ram_numeros", "N3", "Abrir", 1);

            string Proceso = "SerialBridge";
            string Path = @g_pathSERIALBRIDGE;
            bool activeSerial = IsActive_Process(Proceso, Path);
            if (!activeSerial)
            {
                 Proceso = "SerialBridge";
                 Path = g_pathSERIALBRIDGE;
                Init_Process(Proceso, Path);
            }
      
            ShowLEDSerial MD2 = new ShowLEDSerial(LEDSERIAL);
            MD2();



           // Thread.Sleep(5000);

            Proceso = "SQLapi";
            Path = g_pathSQLAIP;
            activeSerial = IsActive_Process(Proceso, Path);
            if (!activeSerial)
            {

                Init_Process(Proceso, Path);
            }

            
            ShowLEDSerial MD3 = new ShowLEDSerial(LEDSQL);
            MD3();



            Thread.Sleep(10000);

            Proceso = "matching";
            Path = g_pathVISION;
            activeSerial = IsActive_Process(Proceso, Path);
            if (!activeSerial)
            {

                Init_Process(Proceso, Path);
            }
         


            ShowLEDSerial MD4 = new ShowLEDSerial(LEDvision);
            MD4();

        }


        public void LEDSERIAL()
        {
            LED_SERIAL.LED_Blink = true;
            LED_SERIAL.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            LED_SERIAL.Value = true;
        }

        public void LEDSQL()
        {
            SQL_LED.LED_Blink = true;
            SQL_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            SQL_LED.Value = true;
        }
        public void LEDvision()
        {
            VISION1_LED.LED_Blink = true;
            VISION1_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
            VISION1_LED.Value = true;
        }

        private bool Init_Process(string Proceso, string Path)
        {

            try
            {
                ProcessStartInfo startInfo = new ProcessStartInfo();
                startInfo.FileName = @Path;
                var process = Process.GetProcessesByName(Proceso);
                Process proc;
                int IsActive = process.Count();
                if (IsActive < 1)
                {
                    proc = Process.Start(startInfo);
                    var names3 = proc.ProcessName;
                    return true;
                }
                else
                {

                    Process myprc = GetaProcess(Proceso);
                    myprc.Kill();
                    Thread.Sleep(3000);
                    proc = Process.Start(startInfo);
                    var names3 = proc.ProcessName;

                    return true;
                }


            }
            catch (Exception)
            {


            }
            return false;
        }
        private bool IsActive_Process(string Proceso, string Path)
        {
            ProcessStartInfo startInfo = new ProcessStartInfo();
            startInfo.FileName = @Path;
            var process = Process.GetProcessesByName(Proceso);

            int IsActive = process.Count();
            if (IsActive > 0)
            {

                return true;
            }
            else
            {

                return false;
            }

        }

        private Process GetaProcess(string processname)
        {
            Process[] aProc = Process.GetProcessesByName(processname);

            if (aProc.Length > 0)
                return aProc[0];

            else return null;
        }

        private void simpleLED5_Click(object sender, EventArgs e)
        {

        }

        private void timer2_Tick(object sender, EventArgs e)
        {
            timer2.Enabled = false;
            string Proceso = "SerialBridge";
            string Path = @g_pathSERIALBRIDGE;
            bool activeSerial = IsActive_Process(Proceso, Path);




            if (!activeSerial)
            {
                LED_SERIAL.LED_Blink = false;
                LED_SERIAL.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Red;
                LED_SERIAL.Value = true;

                Init_Process(Proceso, Path);
            }
            else
            {
                LED_SERIAL.LED_Blink = true;
                LED_SERIAL.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
                LED_SERIAL.Value = true;


            }



            Proceso = "SQLapi";
            Path = g_pathSQLAIP;
            activeSerial = IsActive_Process(Proceso, Path);

            if (!activeSerial)
            {
                SQL_LED.LED_Blink = false;
                SQL_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Red;
                SQL_LED.Value = true;

                Init_Process(Proceso, Path);
            }
            else
            {
                SQL_LED.LED_Blink = true;
                SQL_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
                SQL_LED.Value = true;


            }

            Proceso = "matching";
            Path = g_pathVISION;
            activeSerial = IsActive_Process(Proceso, Path);

            if (!activeSerial)
            {
                VISION1_LED.LED_Blink = false;
                VISION1_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Red;
                VISION1_LED.Value = true;

                string VisionStatus = SQL_Bridge.Get_Columna_Generic("N3", "ram_numeros", "1");
                if (VisionStatus== "Abrir")
                {
                    Init_Process(Proceso, Path);
                }
                
            }
            else
            {
                VISION1_LED.LED_Blink = true;
                VISION1_LED.LED_Color = MfgControl.AdvancedHMI.Controls.SimpleLED.LED_Col.Green;
                VISION1_LED.Value = true;


            }







            timer2.Enabled = true;
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            SQL_Bridge.Set_Update_BD("ram_numeros", "N3", "Cerrar_Programa", 1);
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            SQL_Bridge.Set_Update_BD("ram_numeros", "N3", "Take_Foto", 1);
            Thread.Sleep(1000);
            SQL_Bridge.Set_Update_BD("ram_numeros", "N3", "Abrir", 1);

        }
    }
}

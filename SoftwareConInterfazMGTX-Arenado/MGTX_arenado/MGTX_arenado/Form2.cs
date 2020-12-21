using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Threading;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;
namespace MGTX_arenado
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            //CleanColor();

            List<string> corrds = new List<string>();
            List<string> corrdsPerimeter = new List<string>();
            OpenFileDialog file;

            file = new OpenFileDialog();

            string root= String.Empty;

            Excel.Application xlApp;
            Excel.Workbook xlWorkbook;
            Excel.Worksheet xlWorkSheet;
            Excel.Range range;
            string rootFile = String.Empty;
            if (file.ShowDialog().Equals(DialogResult.OK))
            {
                root = file.FileName;
            }

            xlApp = new Excel.Application();
            xlWorkbook = xlApp.Workbooks.Open(root);
            xlWorkSheet = xlWorkbook.Sheets[1];
            range = xlWorkSheet.UsedRange;
            string data = String.Empty;

            for (int k = 1; k <= range.Rows.Count; k++)
            {
                data = range.Cells[k, 2].Value2.ToString();

                if (data.Equals("SANDMIXER"))
                {
                    string coords = String.Empty;
                    string velocidad = range[k, 7].Value2.ToString();
                    if (velocidad.Equals("50"))
                    {
                        string x = range[k, 5].Value2.ToString();
                        string y = range[k, 6].Value2.ToString();
                        coords = x + ";" + y + ";" + 0;
                        corrds.Add(coords);

                    }
                    if (velocidad.Equals("99"))
                    {
                        string x = range[k, 5].Value2.ToString();
                        string y = range[k, 6].Value2.ToString();
                        coords = x + ";" + y + ";" + 1;
                        corrds.Add(coords);
                    }
                }
                if (data.Equals("SANDMIXERP"))
                {
                    string coords = String.Empty;
                    string x = range[k, 5].Value2.ToString();
                    string y = range[k, 6].Value2.ToString();
                    coords = x + ";" + y + ";" + 0;
                    corrdsPerimeter.Add(coords);
                }

            }

            //foreach (var item in corrdsPerimeter)
            //{
            //    string[] dataPoints = item.Split(';');

            //    double x = Convert.ToDouble(dataPoints[0]);
            //    double y = Convert.ToDouble(dataPoints[1]);
            //    string vel = dataPoints[2];


            //    chart1.Series["Perimetro"].Points.AddXY(x, y);
            //}



            foreach (var item in corrds)
            {
                string[] dataPoints = item.Split(';');

                double xp = Convert.ToDouble(dataPoints[0]);
                double yp = Convert.ToDouble(dataPoints[1]);
                string vel = dataPoints[2];


                chart1.Series["CaminoRobot"].Points.AddXY(xp, yp);

                if (vel.Equals("1"))
                {
                    chart1.Series["Herramientas"].Points.AddXY(xp, yp);
                }



            }


        }


        private void Form2_Load(object sender, EventArgs e)
        {

        }
    }
}

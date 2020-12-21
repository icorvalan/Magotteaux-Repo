using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DarkDemo
{
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
        }

        private void Form2_Load(object sender, EventArgs e)
        {
  
            timer1.Enabled = true;
        }

        int Carga = 0;
        private void timer1_Tick(object sender, EventArgs e)
        {
            bunifuGauge1.Value = Carga;
            Carga++;

            if (Carga>100)
            {
                Carga = 0;
            }


        }

        private void bunifuGauge1_Load(object sender, EventArgs e)
        {

        }
    }
}

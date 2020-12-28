using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Diagnostics;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace MGTX_arenado
{
    public partial class Form1 : Form
    {

        /// <summary>
        /// Variables globales que capturan datos de Pattern
        /// </summary>
        string X1Pattern = String.Empty;
        string Y1Pattern = String.Empty;
        string X2Pattern = String.Empty;
        string Y2Pattern = String.Empty;
        string Z1Pattern = String.Empty;
        string Z2Pattern = String.Empty;
        //Lista de valores de y
        List<string> YValues = new List<string>();
        //Variable que almacena root de excel seleccionado
        string g_string = String.Empty;
        //Variable que abre dialogo para obtener ruta de excel
        OpenFileDialog file;
        //Masa total modelo Lb
        double g_weight = 1603.8;
        //Masa total modelo Kg
        double g_weight2 = 727.47;
        //Volumen drag mm^3
        double g_drag2 = 0.3698;
        //Volumen cope mm^3
        double g_cope2 = 0.5842;
        //Volumen drag litros
        double g_drag = 369.8;
        //Volumen cope litros
        double g_cope = 584.2;
        //Volumen drag y cope mm^3
        double g_volumen2 = 0.954;
        //Volumen drag y cope litros
        double g_volumen = 954;
        //Velocidad de fluido lb/min
        double g_fast1 = 1500;
        //Flujo de fluido kg/s
        double g_fast3 = 11.33;
        //Velocidad de fluido lb/s
        double g_fast2 = 25;
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
        //Clase para obtener datos de los puntos medios obtenidos
        class PointMiddle
        {
            public int i { get; set; }
            public int j { get; set; }
            public float x { get; set; }
            public float y { get; set; }
            public string nameTool { get; set; }
            public string id { get; set; }
            public bool center { get; set; }
            public bool perimeter { get; set; }
            public int groupPerimeter { get; set; }

        }
        //Clase que permite obtener posición de Lid
        class PosLid
        {
            public string nameLid { get; set; }
            public string posX1 { get; set; }
            public string posY1 { get; set; }
            public string id { get; set; }
        }
        //Clase que permite obtener posición de Sprue
        class PosSprue
        {
            public string nameSprue { get; set; }
            public string posX1 { get; set; }
            public string posY1 { get; set; }
            public string id { get; set; }
        }
        //Diccionario para posiciones de lid
        IDictionary<int, PosLid> DictPosLid = new Dictionary<int, PosLid>();
        //Diccionario para posiciones de sprue
        IDictionary<int, PosSprue> DictPosSprue = new Dictionary<int, PosSprue>();
        //Dicionario para guardado de posiciones de herramientas
        IDictionary<int, PointMiddle> DictPositionMiddlePoint = new Dictionary<int, PointMiddle>();
        //Diccionario para guardado de puntos medios perimetro
        IDictionary<int, PointMiddle> DicPositionPerimeterMiddlePoint = new Dictionary<int, PointMiddle>();
        
      
        /// <summary>
        /// Funcion para escoger y leer excel
        /// </summary>
        public void ReadExcel()
        {
            try
            {
                DictPosLid.Clear();
                DictPosSprue.Clear();
                DictPositionMiddlePoint.Clear();
                DicPosCudricula.Clear();
                puntosSprue.Clear();
                YValues.Clear();

                dataGridView1.Rows.Clear();

                file = new OpenFileDialog();

                Excel.Application xlApp;
                Excel.Workbook xlWorkbook;
                Excel.Worksheet xlWorkSheet;
                Excel.Range range;
                string rootFile = String.Empty;
                if (file.ShowDialog().Equals(DialogResult.OK))
                {
                    g_string = file.FileName;
                }

                xlApp = new Excel.Application();
                xlWorkbook = xlApp.Workbooks.Open(g_string);
                xlWorkSheet = xlWorkbook.Sheets[1];
                range = xlWorkSheet.UsedRange;
                string data = String.Empty;
                int contLid = 0;
                int contSprue = 0;

                for (int i = 1; i <= range.Rows.Count; i++)
                {
                    data = range.Cells[i, 2].Value2.ToString();
                    //Obtencion datos de PATTERN
                    if (data.Equals("PATTERN"))
                    {
                        X1Pattern = range.Cells[i, 5].Value2.ToString();
                        X2Pattern = range.Cells[i, 8].Value2.ToString();
                        Y1Pattern = range.Cells[i, 6].Value2.ToString();
                        Y2Pattern = range.Cells[i, 9].Value2.ToString();
                        Z1Pattern = range.Cells[i, 7].Value2.ToString();
                        Z2Pattern = range.Cells[i, 10].Value2.ToString();

                    }
                    //Obtencion datos de SPRUE
                    if (data.Equals("SPRUE"))
                    {
                        PosSprue sprue = new PosSprue();
                        sprue.nameSprue = range.Cells[i, 2].Value2.ToString();
                        sprue.posX1 = range.Cells[i, 5].Value2.ToString();
                        sprue.posY1 = range.Cells[i, 6].Value2.ToString();
                        sprue.id = range.Cells[i, 3].Value2.ToString();
                        DictPosSprue.Add(contSprue, sprue);
                        contSprue += 1;

                    }
                    //Obtencion datos de LID
                    if (data.Contains("LID"))
                    {
                        PosLid Lid = new PosLid();
                        Lid.nameLid = range.Cells[i, 2].Value2.ToString();
                        Lid.posX1 = range.Cells[i, 5].Value2.ToString();
                        Lid.posY1 = range.Cells[i, 6].Value2.ToString();
                        Lid.id = range.Cells[i, 3].Value2.ToString();
                        DictPosLid.Add(contLid, Lid);
                        contLid += 1;

                    }
                    //LLenado de lista con valores de y
                    YValues.Add(range.Cells[i, 6].Value2.ToString());
                }
                //Cerrando instancias de excel
                xlWorkbook.Close(0);
                xlApp.Quit();
                CloseExcel();
                //Obtencion de medidas de Pattern
                SizeOfBox();
                //Creación de matriz dinamica segun dimensiones de Pattern
                MakeMatrix();
            }
            catch(Exception ex)
            {

            }
        }
        /// <summary>
        /// Función que obtiene la menor posición en y
        /// </summary>
        /// <returns></returns>
        public float MinorValueY()
        {
            YValues.RemoveAt(0);
            float minor = float.Parse(YValues.ElementAt(0));

            foreach (var item in YValues)
            {
                float aux = float.Parse(item);
                if (minor > aux)
                {
                    minor = aux;
                }

            }

            return minor;
        }
        /// <summary>
        /// Función para obtener dimensiones del PATTERN
        /// </summary>
        public void SizeOfBox()
        {
            
            float lenght, width, height = 0;

            lenght = Math.Abs(float.Parse(X2Pattern) - float.Parse(X1Pattern));
            width = Math.Abs(float.Parse(Y2Pattern) - float.Parse(Y1Pattern));
            height = Math.Abs((float.Parse(Z1Pattern)) + Math.Abs(float.Parse(Z2Pattern)) / 2);

            textBox1.Text = lenght.ToString();
            textBox2.Text = width.ToString();
            textBox3.Text = height.ToString();
            
        }

        /// <summary>
        /// Funcion que calcula la densidad total segun las consntante del pattern volumen drag y cope, Calcula la masa del boxel y obtiene el tiempo de permanencia
        /// </summary>
        public double CalculoTiempoPermanencia()
        {
            //Densidad total
            double DensidadTotal = g_weight2 / g_volumen2;
            //Volumen de Boxel
            double alto = 0;
            if (!String.IsNullOrEmpty(textBox3.Text))
            {
                alto = Convert.ToDouble(textBox3.Text); 
            }
            //Volumen de boxel mm^3
            double volumenBox1 = g_lenghtBoxel * g_weidhtBoxel * alto;
            //Volumen de boxel en L
            double volumenBox2 = volumenBox1 * Math.Pow(10, -6);
            //Volumen en m^3
            double volumenBox3 = volumenBox1 / Math.Pow(10,9);

            //Calculo masa de Boxel

            double masaBoxel = DensidadTotal * volumenBox3;

            //Calculo de tiempo de permanencia

            double TiempoDePermanencia = masaBoxel / g_fast3;





            return TiempoDePermanencia;

        }

        /// <summary>
        /// Función que retorna la masa por cada de las celda de la matriz
        /// </summary>
        //public double MasaPorCelda(double masaPattern, int filas, int columnas)
        //{
        //    double masa = 0;

        //    int cantidadDeCeldas = filas * columnas;

        //    masa = masaPattern / cantidadDeCeldas;

        //    return masa;
        //}


        /// <summary>
        /// Funcion para crear tiempo de flujo en cada cuadricula
        /// </summary>
        //public double TiempoDePermanencia(double masa)
        //{
        //    double tPermanencia = 0;

        //    tPermanencia = masa / 25;

        //    return tPermanencia;

        //}

        /// <summary>
        /// Funcion para crear sumatoria en rango de x
        /// </summary>
        /// <param name="x"></param>
        /// <param name="lenght"></param>
        /// <returns></returns>
        public List<float> MakeIntervalX(float x, float lenght)
        {
            List<float> rangex = new List<float>();

            for (int i = 0; i < 2; i++)
            {
                x = x + lenght;

                rangex.Add(x);

            }

            return rangex;
        }



        /// <summary>
        /// Funcion que que genera rangos (especifica para Y)
        /// </summary>
        /// <param name="n"></param>
        /// <param name="dimension"></param>
        /// <returns></returns>
        public List<float> MakeInterval(float n ,  float dimension)
        {
            List<float> range = new List<float>();

            for (int i = 0; i < 2; i++)
            {
                range.Add(n);
                n = n + dimension;

                
            }

            return range;
        }


        int g_lenghtBoxel = 0;
        int g_weidhtBoxel = 0;
        int g_column = 0;
        /// <summary>
        /// Creación de matriz dinamica
        /// </summary>
        public void MakeMatrix()
        {
            //Obtencion de largo de PATTERN
            float length = Math.Abs(Convert.ToInt32(Math.Round(float.Parse(X1Pattern))));
            //Obtencion de Ancho de PATTERN
            float weight = Math.Abs(Convert.ToInt32(Math.Round(float.Parse(Y2Pattern))));

            //Inicialización de variables de posicion
            int x1, x2, y1, y2 = 0;

            //Obtencion de posiciones menores de pattern
            x2 = Convert.ToInt32(float.Parse(X2Pattern));
            y1 = Convert.ToInt32(float.Parse(Y1Pattern));
            //Asignación de variables segun posición de pattern obtenida
            float x = x2;
            //Obtención de la menor posición en Y 
            float y = MinorValueY();
            //Estableciendo largo y ancho de celda de matriz
            float lengthcCell = 200;
            
            float weightCell = 200;
            
            //Inicialización de variables de fila y columna
            int column = 0;
            int row = 0;
            //Si la posición x es menor que 0
            if (x < 0)
            {
                //se suma al largo la posición y se divide por el largo de la celda
                row = Convert.ToInt32((length + Math.Abs(x)) / (lengthcCell));
            }
            else
            {
                //sino solo se divide el largo por el largo de la celda
                row = Convert.ToInt32(length / lengthcCell);
            }
            //la logica anterior se repite en y
            if (y < 0)
            {

                column = Convert.ToInt32((weight + Math.Abs(y)) / (weightCell));
                if (column.Equals(0))
                {
                    column = Math.Abs(Convert.ToInt32(weight / weightCell));
                }

            }
            else
            {
                column = Convert.ToInt32(weight / weightCell);
            }
            //asignación de dimensiones a matriz datagridview
            dataGridView1.ColumnCount = column;
            g_column = column;
            dataGridView1.RowCount = row+1;


            List<string> rangeYValues = new List<string>();
            List<string> rangeXValues = new List<string>();
            List<float> rangey = new List<float>();
            List<float> rangex = new List<float>();
            float auxY = y;
            float auxX = x;
            string[] dataNewRange = adjustRange( auxX,auxY,Convert.ToInt32(column), Convert.ToInt32(row), Convert.ToInt32(length), Convert.ToInt32(weight)).Split(';');

            lengthcCell = float.Parse(dataNewRange[1]);
            g_lenghtBoxel = Convert.ToInt32(lengthcCell);
            weightCell = float.Parse(dataNewRange[0]);
            g_weidhtBoxel = Convert.ToInt32(weightCell);
            string[] datax= new string[row];
            for (int i = 0; i <=row; i++)
            {
                
                for (int j = 0; j <column; j++)
                {
                    
                    rangey = MakeInterval(auxY, lengthcCell);
                    
                    auxY = rangey.ElementAt(1);

                    if (i.Equals(0))
                    {
                        string coord =  auxX.ToString() + ";" + rangey.ElementAt(0).ToString() + ";" + auxX.ToString() + ";" + rangey.ElementAt(1).ToString() ;
                        rangeYValues.Add(rangey.ElementAt(0).ToString() + ";" + rangey.ElementAt(1).ToString());
                        dataGridView1.Rows[i].Cells[j].Value = coord;

                    }
                    else
                    { 
                        string[] datay = rangeYValues.ElementAt(j).ToString().Split(';');
                        string coord = x.ToString()+ ";" + datay[0] + ";" + x.ToString() + ";" + datay[1];
                        dataGridView1.Rows[i].Cells[j].Value = coord;
                    }
                    
                   


                }
                x = x + weightCell;

                //if (i.Equals(row-1))
                //{
                //    for (int k = 0; k < rangeYValues.Count; k++)
                //    {
                //        string[] datay = rangeYValues.ElementAt(k).ToString().Split(';');
                //        string coord = x.ToString() + ";" + datay[0] + ";" + x.ToString() + ";" + datay[1];
                //        dataGridView1.Rows[i].Cells[k].Value = coord;
                //    }
                //}

               
            }
        }

        /// <summary>
        /// Funcion para ajustar el rango conforme a las filas y las columnas obtenidas, esto con el fin de obtener más cercania a las coordenadas del pattern 
        /// </summary>
        /// <param name="auxX">Variable referente a coordenada de inicio x</param>
        /// <param name="auxY">Variable referente a coordenada de inicio y</param>
        /// <param name="column">Cantidad de Columnas obtenida</param>
        /// <param name="row">Cantidad de Filas obtenidas</param>
        /// <param name="lenght">Largo del Pattern</param>
        /// <param name="weidht">Ancho del pattern</param>
        /// <returns></returns>
        public string adjustRange( float auxX,float auxY,int column, int row,int lenght, int weidht)
        {

            double rangeWeidht=0, rangeLength=0;

            if (auxY<0)
            {
                rangeLength = (weidht + Math.Abs(auxY)) / column;
            }
            else
            {
                rangeLength = weidht / column;
            }

            if (auxX<0)
            {
                rangeWeidht = (lenght + Math.Abs(auxX)) / row;

            }
            else
            {
                rangeWeidht = lenght / row;
            }
            

            

            string newRange = rangeWeidht.ToString() + ";" + rangeLength.ToString();

            return newRange;


        }

        int countMiddleCenter = 0;
        public void MiddlePointInCenter(int i, int j, string name, string id)
        {
            PointMiddle middlePoint = new PointMiddle();
            middlePoint.i = i;
            middlePoint.j = j;
            var data = dataGridView1.Rows[i].Cells[j].Value;

            string coords = Convert.ToString(data);
            string[] dataCoords = coords.Split(';');

            float datax1 = float.Parse(dataCoords[0]);
            float datay1 = float.Parse(dataCoords[1]);
            float datax2 = float.Parse(dataCoords[2]);
            float datay2 = float.Parse(dataCoords[3]);

            middlePoint.x = (datax1 + datax2) / 2;
            middlePoint.y = (datay1 + datay2) / 2;
            middlePoint.nameTool = name;
            middlePoint.id = id;
            //DictPositionCenter.Add(contMiddlePoints, middlePoint);
            contMiddlePoints++;

        }



        List<string> puntos = new List<string>();
        public void findZone()
        {
            int countLid = DictPosLid.Count();
            int countSprue = DictPosSprue.Count();
            //int cont = 0;
            //int posc = 0;
            //int posf = 0;
            //double aux=0;
            bool findPosition = false;
            float auxX1, auxY1;

            ////Encontrando Lids
            for (int i = 0; i < countLid; i++)
            {
                PosLid x1Lid = DictPosLid[i];
                float x1 = float.Parse(x1Lid.posX1);
                float y1 = float.Parse(x1Lid.posY1);
                string name = x1Lid.nameLid;
                string id = x1Lid.id;
                CreateCube(i, x1, y1, 100);

                for (int j = 0; j < dataGridView1.Rows.Count; j++)
                {
                    for (int k = 0; k < dataGridView1.Columns.Count; k++)
                    {
                        var data = dataGridView1.Rows[j].Cells[k].Value;

                        string coords = Convert.ToString(data);
                        string[] dataCoords = coords.Split(';');

                        float datax1 = float.Parse(dataCoords[0]);
                        float datay1 = float.Parse(dataCoords[1]);
                        float datax2 = float.Parse(dataCoords[2]);
                        float datay2 = float.Parse(dataCoords[3]);

                        if ((x1 < datax1) && (datay1 < y1 && y1 < datay2))
                        {
                            dataGridView1.Rows[j].Cells[k].Style.BackColor = Color.Green;

                            middlePointInRange(j, k, name, id, true, false);


                            findPosition = true;
                            break;
                        }


                    }

                    if (findPosition)
                    {

                        cuadricula colorCuadricula = DicPosCudricula[i];

                        auxX1 = colorCuadricula.posUp.ElementAt(0);
                        auxY1 = colorCuadricula.posUp.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);


                        auxX1 = colorCuadricula.posDown.ElementAt(0);
                        auxY1 = colorCuadricula.posDown.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posRight.ElementAt(0);
                        auxY1 = colorCuadricula.posRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posUpRight.ElementAt(0);
                        auxY1 = colorCuadricula.posUpRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posUpLef.ElementAt(0);
                        auxY1 = colorCuadricula.posUpLef.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posDownRight.ElementAt(0);
                        auxY1 = colorCuadricula.posDownRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);

                        auxX1 = colorCuadricula.posDownLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posDownLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Green, name, id);



                        findPosition = false;
                        break;

                    }

                }

            }


            //Encontrando Sprue
            findPosition = false;
            DicPosCudricula.Clear();
            for (int i = 0; i < countSprue; i++)
            {
                PosSprue pointSprue = DictPosSprue[i];
                float x1 = float.Parse(pointSprue.posX1);
                float y1 = float.Parse(pointSprue.posY1);
                string name = pointSprue.nameSprue;
                string id = pointSprue.id;
                CreateCube(i, x1, y1, 100);
                
                
                for (int j = 0; j < dataGridView1.Rows.Count; j++)
                {
                    for (int k = 0; k < dataGridView1.Columns.Count; k++)
                    {
                        var data = dataGridView1.Rows[j].Cells[k].Value;

                        string coords = Convert.ToString(data);
                        string[] dataCoords = coords.Split(';');

                        float datax1 = float.Parse(dataCoords[0]);
                        float datay1 = float.Parse(dataCoords[1]);
                        float datay2 = float.Parse(dataCoords[3]);

                        if ((x1 <= datax1) && (datay1 <= y1 && y1 <= datay2))
                        {
                            dataGridView1.Rows[j].Cells[k].Style.BackColor = Color.Orange;
                            middlePointInRange(j, k, name, id,true,false);
                            
                            
                            findPosition = true;
                            break;
                        }

                    }

                    if (findPosition)
                    {
                        
                        cuadricula colorCuadricula = DicPosCudricula[i];

                        auxX1 = colorCuadricula.posUp.ElementAt(0);
                        auxY1 = colorCuadricula.posUp.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange,name,id);

                        auxX1 = colorCuadricula.posDown.ElementAt(0);
                        auxY1 = colorCuadricula.posDown.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posRight.ElementAt(0);
                        auxY1 = colorCuadricula.posRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posUpRight.ElementAt(0);
                        auxY1 = colorCuadricula.posUpRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posUpLef.ElementAt(0);
                        auxY1 = colorCuadricula.posUpLef.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posDownRight.ElementAt(0);
                        auxY1 = colorCuadricula.posDownRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        auxX1 = colorCuadricula.posDownLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posDownLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, Color.Orange, name, id);

                        

                        findPosition = false;
                        break;

                    }

                }
            }
        
            
        }



        /// <summary>
        /// Función que guarda los puntos medios del perimetro en diccionario de datos sobre puntos 
        /// </summary>
        /// <param name="i"></param>
        /// <param name="j"></param>
        /// <param name="name"></param>
        /// <param name="id"></param>
        /// <param name="center"></param>
        /// <param name="perimeter"></param>
        int countMiddlePointPerimeter = 0;
        public void MiddlePointsPerimeter(int i, int j, string name, string id, bool center, bool perimeter,int groupPerimeter)
        {
            PointMiddle middlePoint = new PointMiddle();
            middlePoint.i = i;
            middlePoint.j = j;
            var data = dataGridView1.Rows[i].Cells[j].Value;

            string coords = Convert.ToString(data);
            string[] dataCoords = coords.Split(';');

            float datax1 = float.Parse(dataCoords[0]);
            float datay1 = float.Parse(dataCoords[1]);
            //float datax2 = float.Parse(dataCoords[2]);
            //float datay2 = float.Parse(dataCoords[3]);

            middlePoint.x = datax1;
            middlePoint.y = datay1;
            middlePoint.nameTool = name;
            middlePoint.id = id;
            middlePoint.center = center;
            middlePoint.perimeter = perimeter;
            middlePoint.groupPerimeter = groupPerimeter;
            DicPositionPerimeterMiddlePoint.Add(countMiddlePointPerimeter, middlePoint);
            countMiddlePointPerimeter++;
        }
        
        
        int contMiddlePoints = 0;
        List<string> puntosSprue = new List<string>();
        int contSpruePoint = 0;

        /// <summary>
        /// Función que guarda los puntos medios en diccionario de datos sobre puntos 
        /// </summary>
        /// <param name="i"></param>
        /// <param name="j"></param>
        /// <param name="name"></param>
        /// <param name="id"></param>
        /// <param name="center"></param>
        public void middlePointInRange(int i, int j,string name,string id,bool center,bool perimeter)
        {
            PointMiddle middlePoint = new PointMiddle();
            middlePoint.i = i;
            middlePoint.j = j;
            var data = dataGridView1.Rows[i].Cells[j].Value;

            string coords = Convert.ToString(data);
            string[] dataCoords = coords.Split(';');

            float datax1 = float.Parse(dataCoords[0]);
            float datay1 = float.Parse(dataCoords[1]);
            float datax2 = float.Parse(dataCoords[2]);
            float datay2 = float.Parse(dataCoords[3]);

            middlePoint.x = (datax1 + datax2) / 2;
            middlePoint.y = (datay1 + datay2) / 2;
            middlePoint.nameTool = name;
            middlePoint.id = id;
            middlePoint.center = center;
            middlePoint.perimeter = perimeter;
            if (middlePoint.nameTool.Contains("LID"))
            {
                if (!NoPointsRepeatedLID(middlePoint.x, middlePoint.y))
                {
                    DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                    contMiddlePoints++;
                }
            }
            if (middlePoint.nameTool.Equals("SPRUE"))
            {


                if (contSpruePoint.Equals(0))
                {
                    puntosSprue.Add(middlePoint.x.ToString() + ";" + middlePoint.y);
                    DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                    contMiddlePoints++;
                }
                else
                {
                    
                    
                    string coord = middlePoint.x.ToString() + ";" + middlePoint.y.ToString();
                    try
                    {
                        string value = puntosSprue.First(s => s.Equals(coord));
                    }
                    catch(Exception)
                    {
                        DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                        contMiddlePoints++;
                        puntosSprue.Add(coord);
                    }

                    //foreach (var item in puntosSprue)
                    //{
                    //    string[] dataPoints = item.Split(';');
                    //    repeatSprue = (item[0].Equals(middlePoint.x.ToString()) && item[1].Equals(middlePoint.y.ToString()));
                    //    if (!repeatSprue)
                    //    {
                    //        DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                    //        contMiddlePoints++;

                    //    }

                    //}

                    //if (!repeatSprue)
                    //{
                    //    puntosSprue.Add(middlePoint.x.ToString() + ";" + middlePoint.y.ToString());
                    //}

                }
                contSpruePoint++;
                
            }
        }

        
        public bool NoPointsRepeatedLID(float x, float y)
        {
            bool repeated = false;
            
            foreach (var item in DictPositionMiddlePoint.Keys)
            {
                PointMiddle point = DictPositionMiddlePoint[item];
              
                if (point.x.Equals(x) && point.y.Equals(y))
                {
                    repeated = true;
                    break;
                }
                
            }


            return repeated;
        }

        class cuadricula
        {
            public List<float> posUp = new List<float>();
            public List<float> posDown = new List<float>();
            public List<float> posRight = new List<float>();
            public List<float> posLeft = new List<float>();
            public List<float> posUpLef = new List<float>();
            public List<float> posUpRight = new List<float>();
            public List<float> posDownLeft = new List<float>();
            public List<float> posDownRight = new List<float>();
        }

       


        IDictionary<int, cuadricula> DicPosCudricula = new Dictionary<int, cuadricula>();
        /// <summary>
        /// Funcion que genera puntos de cuadricula al punto de referencia
        /// </summary>
        /// <param name="id"></param>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="factorDediferencia"></param>
        public void CreateCube(int id,float x,float y,float factorDeDiferencia)
        { 
            
            float x1, y1=0;
            float auxUPX1, auxUPY1 = 0;
            float auxDownUPX1, auxDownUPY1 = 0;
            cuadricula cuadricula = new cuadricula();
            //Posición arriba de punto
            x1 = x + factorDeDiferencia;
            y1 = y ;
            cuadricula.posUp.Add(x1);
            cuadricula.posUp.Add(y1);

            //Posición abajo de punto
            x1 = x - factorDeDiferencia;
            y1 = y ;
            cuadricula.posDown.Add(x1);
            cuadricula.posDown.Add(y1);
            auxDownUPX1 = x - factorDeDiferencia;
            auxDownUPY1 = y;

            //Posicion derecha de punto

            x1 = x ;
            y1 = y + factorDeDiferencia;
            cuadricula.posRight.Add(x1);
            cuadricula.posRight.Add(y1);
            

            //Posicion izquierda de punto
            x1 = x ;
            y1 = y - factorDeDiferencia;
            cuadricula.posLeft.Add(x1);
            cuadricula.posLeft.Add(y1);

            //Guardado de posicion arriba del punto
            auxUPX1 = x + factorDeDiferencia;
            auxUPY1 = y;

            //Posicion abajo derecha
            x1 = auxUPX1;
            y1 = auxUPY1 + factorDeDiferencia;

            cuadricula.posUpRight.Add(x1);
            cuadricula.posUpRight.Add(y1);

            //Posicion abajo izquierda
            x1 = auxUPX1;
            y1 = auxUPY1 - factorDeDiferencia;

            cuadricula.posUpLef.Add(x1);
            cuadricula.posUpLef.Add(y1);


            //Guardado de posicion abajo del punto
            auxDownUPX1 = x - factorDeDiferencia;
            auxDownUPY1 = y;

            //posicion arriba derecha

            x1 = auxDownUPX1;
            y1 = auxDownUPY1 + factorDeDiferencia;

            cuadricula.posDownRight.Add(x1);
            cuadricula.posDownRight.Add(y1);


            //posicion arriba izquierda

            x1 = auxDownUPX1;
            y1 = auxDownUPY1 - factorDeDiferencia;

            cuadricula.posDownLeft.Add(x1);
            cuadricula.posDownLeft.Add(y1);


            DicPosCudricula.Add(id, cuadricula);
           
          
        }

        List<string> perimeterPosition = new List<string>();
        /// <summary>
        /// Funcion que busca y colorea posiciones de cuadricula segun posicion de matriz
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="color"></param>
        public void ColorCuadricula(float x, float y, Color color, string name,string id)
        {
            bool findposition = false;
            int cont = 0;
            string position = String.Empty;
            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                for (int j = 0; j < dataGridView1.Columns.Count; j++)
                {
                    var data = dataGridView1.Rows[i].Cells[j].Value;

                    string coords = Convert.ToString(data);
                    string[] dataCoords = coords.Split(';');

                    float datax1 = float.Parse(dataCoords[0]);
                    float datay1 = float.Parse(dataCoords[1]);
                    float datay2 = float.Parse(dataCoords[3]);

                    if ((x <= datax1) && (datay1 <= y && y <= datay2))
                    {

                        dataGridView1.Rows[i].Cells[j].Style.BackColor = color;
                        middlePointInRange(i, j,name,id,false,false);
                        perimeterPosition.Add(i.ToString() + ";" + j.ToString());
                        findposition = true;
                        break;
                    }
                }

                if (findposition)
                {
                    
                    findposition = false;
                    break;
                }

            }


        }


        public void CloseExcel()
        {
            Process process = new Process();

            foreach (Process item in  Process.GetProcesses())
            {
                if (item.ProcessName.Equals("EXCEL.exe"))
                {
                    item.Kill();

                }

            }

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.textBox1.Clear();
            this.textBox2.Clear();
            this.textBox3.Clear();
            ReadExcel();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            contMiddlePoints = 0;
            CleanColor();
            DicPosCudricula.Clear();
            DictPositionMiddlePoint.Clear();
            findZone();
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            CloseExcel();
        }

        public string MiddlePoints(float x1,float y1,float x2,float y2)
        {
            string coords = String.Empty;

            float x = (x1 + x2) / 2;
            float y = (y1 + y2) / 2;

            coords = x.ToString() + ";" + y.ToString();

            return coords;
        }

        List<string> pointsRobot = new List<string>();
        public void chageMatrix()
        {
            CleanColor();
            int row = dataGridView1.RowCount;
            int column = dataGridView1.ColumnCount;
            int f = 0;
            int c = 0;
            bool impar = false;
            string[,] auxMatrix = new string[dataGridView1.RowCount,dataGridView1.ColumnCount];
            //Copia de datagridview y paso de rango a puntos medios
            for (int i = 0; i < dataGridView1.RowCount; i++)
            {
                for (int j = 0; j < dataGridView1.ColumnCount; j++)
                {
                    var range = dataGridView1.Rows[i].Cells[j].Value.ToString();
                    string coords = Convert.ToString(range);
                    string[] dataCoords = coords.Split(';');

                    float datax1 = float.Parse(dataCoords[0]);
                    float datay1 = float.Parse(dataCoords[1]);
                    float datax2 = float.Parse(dataCoords[2]);
                    float datay2 = float.Parse(dataCoords[3]);

                    auxMatrix[i, j] = MiddlePoints(datax1, datay1, datax2, datay2);
                }

            }
            //llenado de matriz usando puntos medios y camino en zig zag
            for (int i = 0; i < row; i++)
            {
                for (int j = column-1; j >= 0; j--)
                {
                    if (i%2!=0)
                    {   
                        dataGridView1.Rows[i].Cells[c].Value = auxMatrix[f, c];
                        pointsRobot.Add(auxMatrix[f, c]);
                        c++;
                    }
                    else
                    {
                        dataGridView1.Rows[i].Cells[j].Value = auxMatrix[f, c];
                        pointsRobot.Add(auxMatrix[f, c]);
                        c++;
                    }

                    
                    if (c.Equals(column))
                    {
                        c = 0;
                    }
                }
                f++;
                
            }

            //Toma de puntos medios guardados en diccionario de regiones a llenar de arena
            for (int i = 0; i < DictPositionMiddlePoint.Count; i++)
            {
                PointMiddle points = DictPositionMiddlePoint[i];
                if (points.nameTool.Contains("LID"))
                {
                    dataGridView1.Rows[points.i].Cells[points.j].Style.BackColor = Color.Green;
                }
                if (points.nameTool.Contains("SPRUE"))
                {
                    dataGridView1.Rows[points.i].Cells[points.j].Style.BackColor = Color.Orange;
                }
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                chageMatrix();
            }
            catch(Exception ex)
            {

            }
        }


        public void CleanColor()
        {
            for (int i = 0; i < dataGridView1.RowCount; i++)
            {
                for (int j = 0; j < dataGridView1.ColumnCount; j++)
                {
                    dataGridView1.Rows[i].Cells[j].Style.BackColor = Color.White;
                }
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            CleanColor();
        }

        /// <summary>
        /// Guardado de excel
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        private void button5_Click(object sender, EventArgs e)
        {
            double MasaPattern = 0;
            //double masaDrag = 0;
            //double masaCope = 0;

            //string[] dataDimensiones = g_string.Split(';');

            //if (dataDimensiones[2].Equals("Cope.xlsx"))
            //{

            //}
            //if (dataDimensiones[2].Equals("Drag.xlsx"))
            //{

            //}



            Excel.Application xlApp;
            Excel.Workbook xlWorkbook;
            Excel.Worksheet xlWorkSheet;
            Excel.Range range;
            xlApp = new Excel.Application();
            xlWorkbook = xlApp.Workbooks.Open(g_string);
            xlWorkSheet = xlWorkbook.Sheets[1];
            range = xlWorkSheet.UsedRange;


            int id = Convert.ToInt32(range.Cells[range.Rows.Count, 1].Value2.ToString());
            string v1 = "99";
            string v2 = "50";
            int cont = 0;
            int largoExcel = range.Rows.Count + DictVerticesPerimetro.Count();
            int iterador = range.Rows.Count;
            //Camino Robot perimetro 
            //Vertices Perimetro Superior
            for (int i = 0; i < 2; i++)
            {
                verticesPerimeter vp = DictVerticesPerimetro[i];
                
                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXERP";
                range.Cells[iterador, 3].Value = 15;
                range.Cells[iterador, 4].Value = 0;
                range.Cells[iterador, 5].Value = vp.x;
                range.Cells[iterador, 6].Value = vp.y;
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
                range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
                range.Cells[iterador, 10].Value = 0;
                range.Cells[iterador, 11].Value = 0;
                range.Cells[iterador, 12].Value = 1;
                range.Cells[iterador, 13].Value = 1;
                id++;
                iterador++;
            }
            //Perimetro Vertices Inferior
            for (int i = DictVerticesPerimetro.Count()-2; i < DictVerticesPerimetro.Count(); i++)
            {
                verticesPerimeter vp = DictVerticesPerimetro[i];
                
                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXERP";
                range.Cells[iterador, 3].Value = 15;
                range.Cells[iterador, 4].Value = 0;
                range.Cells[iterador, 5].Value = vp.x;
                range.Cells[iterador, 6].Value = vp.y;
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
                range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
                range.Cells[iterador, 10].Value = 0;
                range.Cells[iterador, 11].Value = 0;
                range.Cells[iterador, 12].Value = 1;
                range.Cells[iterador, 13].Value = 1;
                id++;
                iterador++;
            }
            ////Agregando vertice superior Perimetro
            //iterador += 1;
            //id += 1;
            //string[] dataPos = dataGridView1.Rows[vpSup.fila].Cells[vpSup.columna].Value.ToString().Split(';');

            //string xVs = dataPos[0];
            //string yVs = dataPos[1];
            //range.Cells[iterador, 1].Value = id;
            //range.Cells[iterador, 2].Value = "SANDMIXERP";
            //range.Cells[iterador, 3].Value = 15;
            //range.Cells[iterador, 4].Value = 0;
            //range.Cells[iterador, 5].Value = xVs;
            //range.Cells[iterador, 6].Value = yVs;
            //range.Cells[iterador, 7].Value = v2;
            //range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
            //range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
            //range.Cells[iterador, 10].Value = 0;
            //range.Cells[iterador, 11].Value = 0;
            //range.Cells[iterador, 12].Value = 1;
            //range.Cells[iterador, 13].Value = 1;

            ////Agregando vertices inferior perimetro
            //iterador += 1;
            //id += 1;
            //string[] dataPosVp = dataGridView1.Rows[vpInf.fila].Cells[vpInf.columna].Value.ToString().Split(';');

            //string xVi = dataPosVp[0];
            //string yVi = dataPosVp[1];
            //range.Cells[iterador, 1].Value = id;
            //range.Cells[iterador, 2].Value = "SANDMIXERP";
            //range.Cells[iterador, 3].Value = 15;
            //range.Cells[iterador, 4].Value = 0;
            //range.Cells[iterador, 5].Value = xVi;
            //range.Cells[iterador, 6].Value = yVi;
            //range.Cells[iterador, 7].Value = v2;
            //range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
            //range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
            //range.Cells[iterador, 10].Value = 0;
            //range.Cells[iterador, 11].Value = 0;
            //range.Cells[iterador, 12].Value = 1;
            //range.Cells[iterador, 13].Value = 1;


            //Obtencion de cantidad de regiones relacionadas al perimetro del objeto
            //List<string> pointsPerimeter = new List<string>();
            //int contadorDePosiciones = 0;
            //int posVertices = 0;
            //foreach (var item in DictVerticesPerimetro.Keys)
            //{
            //    verticesPerimeter vp = DictVerticesPerimetro[item];
            //    posVertices++;
            //    if (!posVertices.Equals(5))
            //    {
            //        pointsPerimeter.Add(vp.x + ";" + vp.y);
            //    }
            //    else
            //    {
            //        posVertices = 0;
            //    }

            //}

            //Guardando Cuadricula de perimetro






            //Camino Robot perimetro
            //int contVertexPerimeter = 0;
            //for (int i = range.Rows.Count; i < largoExcel; i++)
            //{
            //    verticesPerimeter vp = DictVerticesPerimetro[contVertexPerimeter];
            //    string[] dataPos = dataGridView1.Rows[vp.fila].Cells[vp.columna].Value.ToString().Split(';');

            //    string x = dataPos[0];
            //    string y = dataPos[1];
            //    range.Cells[i, 1].Value = id;
            //    range.Cells[i, 2].Value = "SANDMIXERP";
            //    range.Cells[i, 3].Value = 12;
            //    range.Cells[i, 4].Value = 0;
            //    range.Cells[i, 5].Value = x;
            //    range.Cells[i, 6].Value = y;
            //    range.Cells[i, 7].Value = v2;
            //    range.Cells[i, 8].Value = CalculoTiempoPermanencia() * 0.3;
            //    range.Cells[i, 9].Value = CalculoTiempoPermanencia() * 0.7;
            //    range.Cells[i, 10].Value = 0;
            //    range.Cells[i, 11].Value = 0;
            //    range.Cells[i, 12].Value = 1;
            //    range.Cells[i, 13].Value = 1;
            //    id++;
            //    contVertexPerimeter++;
            //    iterador++;
            //}

            List<string> VecSup = new List<string>();
            for (int i = 0; i < g_column; i++)
            {
                string middlepoint = pointsRobot.ElementAt(i);
                VecSup.Add(middlepoint);
            }
            List<string> VecInf = new List<string>();
            for (int i = (pointsRobot.Count() - g_column); i < pointsRobot.Count(); i++)
            {
                string middlepoint = pointsRobot.ElementAt(i);
                VecInf.Add(middlepoint);
            }


            foreach (var item in VecSup)
            {
                string[] dataMiddlepoint = item.Split(';');
                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXER";
                range.Cells[iterador, 3].Value = 12;
                range.Cells[iterador, 4].Value = 0;
                range.Cells[iterador, 5].Value = dataMiddlepoint[0];
                range.Cells[iterador, 6].Value = dataMiddlepoint[1];
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
                range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
                range.Cells[iterador, 10].Value = 0;
                range.Cells[iterador, 11].Value = 0;
                range.Cells[iterador, 11].Value = 1;
                range.Cells[iterador, 12].Value = 1;

                id++;
                iterador++;
            }

            foreach (var item in VecInf)
            {
                string[] dataMiddlepoint = item.Split(';');
                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXER";
                range.Cells[iterador, 3].Value = 13;
                range.Cells[iterador, 4].Value = 0;
                range.Cells[iterador, 5].Value = dataMiddlepoint[0];
                range.Cells[iterador, 6].Value = dataMiddlepoint[1];
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = CalculoTiempoPermanencia() * 0.3;
                range.Cells[iterador, 9].Value = CalculoTiempoPermanencia() * 0.7;
                range.Cells[iterador, 10].Value = 0;
                range.Cells[iterador, 11].Value = 0;
                range.Cells[iterador, 11].Value = 1;
                range.Cells[iterador, 12].Value = 1;

                id++;
                iterador++;
            }


            //Camino Robot general
            for (int i = 0; i < pointsRobot.Count; i++)
            {

                string middlepoint = pointsRobot.ElementAt(cont);
                cont++;
                string[] dataMiddlePoint = middlepoint.Split(';');
                string x = dataMiddlePoint[0];
                string y = dataMiddlePoint[1];

                foreach (var item in DictPositionMiddlePoint.Keys)
                {
                    PointMiddle points = DictPositionMiddlePoint[item];
                    if (!points.perimeter)
                    {
                        string punto = dataGridView1.Rows[points.i].Cells[points.j].Value.ToString();
                        string[] data = punto.Split(';');
                        if (x.Equals(data[0]) && y.Equals(data[1]))
                        {
                            range.Cells[iterador, 1].Value = id;
                            range.Cells[iterador, 2].Value = "SANDMIXERREFERENCEPOINT";
                            range.Cells[iterador, 3].Value = 14;
                            range.Cells[iterador, 4].Value = 0;
                            range.Cells[iterador, 5].Value = x;
                            range.Cells[iterador, 6].Value = y;
                            range.Cells[iterador, 7].Value = v1;
                            range.Cells[iterador, 8].Value = 0;
                            range.Cells[iterador, 9].Value = 0;
                            range.Cells[iterador, 10].Value = 0;
                            range.Cells[iterador, 11].Value = 0;
                            range.Cells[iterador, 12].Value = 1;
                            range.Cells[iterador, 13].Value = 1;
                            id++;
                            iterador++;

                            break;
                        }
                    }



                }
            }

            foreach (var item in DicPositionPerimeterMiddlePoint)
            {

            }

            xlWorkbook.SaveAs("test2.xlsx");
            xlWorkbook.Close(0);
            xlApp.Quit();
            CloseExcel();

            MessageBox.Show("Excel para test Creado");


        }

        
        private void button6_Click(object sender, EventArgs e)
        {

            DicPositionPerimeterMiddlePoint.Clear();
            perimeterPosition.Clear();
            arriba.Clear();
            abajo.Clear();
            CleanColor();
            string[,] auxMatrix = new string[dataGridView1.Rows.Count, dataGridView1.Columns.Count];

            for (int i = 0; i < dataGridView1.RowCount; i++)
            {
                for (int j = 0; j < dataGridView1.ColumnCount; j++)
                {
                    var range = dataGridView1.Rows[i].Cells[j].Value.ToString();
                    string coordenadas = Convert.ToString(range);
                    string[] dataCoords = coordenadas.Split(';');

                    float datax1 = float.Parse(dataCoords[0]);
                    float datay1 = float.Parse(dataCoords[1]);
                    float datax2 = float.Parse(dataCoords[2]);
                    float datay2 = float.Parse(dataCoords[3]);

                    auxMatrix[i, j] = MiddlePoints(datax1, datay1, datax2, datay2);
                }

            }


            for (int i = 0; i < dataGridView1.Rows.Count; i++)
            {
                for (int j = 0; j < dataGridView1.Columns.Count; j++)
                {
                    dataGridView1.Rows[i].Cells[j].Value = auxMatrix[i, j];
                }

            }


            for (int k = 0; k < perimeterPosition.Count; k++)
            {
                string fc = perimeterPosition.ElementAt(k);

                string[] data = fc.Split(';');

                int Filas = Convert.ToInt32(data[0]);
                int Columnas = Convert.ToInt32(data[1]);

                dataGridView1.Rows[Filas].Cells[Columnas].Style.BackColor = Color.Purple;

            }
            int fila, columna = 0;
            string coords = String.Empty;

            
            int cont = 0;
            foreach (var item in DictPositionMiddlePoint.Keys)
            {
                PointMiddle pm = DictPositionMiddlePoint[item];
                List<string> posiciones = new List<string>();
                if (pm.center)
                {
                    if (pm.nameTool.Contains("LID"))
                    {
                        PointMiddle newPointMiddle = new PointMiddle();

                        dataGridView1.Rows[pm.i].Cells[pm.j].Style.BackColor = Color.Red;
                        //abajo
                        coords = Potitions(pm.i, pm.j, 1, 1);
                        posiciones.Add(coords);
                        ////arriba
                        coords = Potitions(pm.i, pm.j, 1, 2);
                        posiciones.Add(coords);
                        ////izquierda
                        coords = Potitions(pm.i, pm.j, 1, 3);
                        posiciones.Add(coords);
                        //Derecha
                        coords = Potitions(pm.i, pm.j, 1, 4);
                        posiciones.Add(coords);
                        //Arriba derecha
                        coords = Potitions(pm.i, pm.j, 1, 5);
                        posiciones.Add(coords);
                        //Arriba izquierda
                        coords = Potitions(pm.i, pm.j, 1, 6);
                        posiciones.Add(coords);
                        //Abajo derecha
                        coords = Potitions(pm.i, pm.j, 1, 7);
                        posiciones.Add(coords);
                        //Abajo Izquierda
                        coords = Potitions(pm.i, pm.j, 1, 8);
                        posiciones.Add(coords);

                        for (int i = 0; i < arriba.Count; i++)
                        {
                            string position = arriba.ElementAt(i);
                            string[] data = position.Split(';');
                            fila = Convert.ToInt32(data[0]);
                            columna = Convert.ToInt32(data[1]);
                            coords = Potitions(fila, columna, 1, 3);
                            posiciones.Add(coords);
                            coords = Potitions(fila, columna, 1, 4);
                            posiciones.Add(coords);

                        }

                        for (int i = 0; i < abajo.Count; i++)
                        {
                            string position = abajo.ElementAt(i);
                            string[] data = position.Split(';');
                            fila = Convert.ToInt32(data[0]);
                            columna = Convert.ToInt32(data[1]);
                            coords = Potitions(fila, columna, 1, 3);
                            posiciones.Add(coords);
                            coords = Potitions(fila, columna, 1, 4);
                            posiciones.Add(coords);
                        }

                        //llenando casillas vacias izquierda y derecha abajo
                        int auxf = pm.i + 1;
                        int auxc = pm.j;


                        coords = Potitions(auxf, auxc, 1, 3);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 1, 4);
                        posiciones.Add(coords);

                        //llenando casillas vacias izquierda y derecha arriba
                        auxf = pm.i - 1;
                        auxc = pm.j;
                        coords = Potitions(auxf, auxc, 1, 4);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 1, 3);
                        posiciones.Add(coords);

                    }
                    if (pm.nameTool.Contains("SPRUE"))
                    {
                        PointMiddle newPointMiddle = new PointMiddle();

                        dataGridView1.Rows[pm.i].Cells[pm.j].Style.BackColor = Color.Red;
                        //abajo
                        coords = Potitions(pm.i, pm.j, 1, 1);
                        posiciones.Add(coords);
                        ////arriba
                        coords = Potitions(pm.i, pm.j, 1, 2);
                        posiciones.Add(coords);
                        ////izquierda
                        coords = Potitions(pm.i, pm.j, 1, 3);
                        posiciones.Add(coords);
                        //Derecha
                        coords = Potitions(pm.i, pm.j, 1, 4);
                        posiciones.Add(coords);
                        //Arriba derecha
                        coords = Potitions(pm.i, pm.j, 1, 5);
                        posiciones.Add(coords);
                        //Arriba izquierda
                        coords = Potitions(pm.i, pm.j, 1, 6);
                        posiciones.Add(coords);
                        //Abajo derecha
                        coords = Potitions(pm.i, pm.j, 1, 7);
                        posiciones.Add(coords);
                        //Abajo Izquierda
                        coords = Potitions(pm.i, pm.j, 1, 8);
                        posiciones.Add(coords);

                        for (int i = 0; i < arriba.Count; i++)
                        {
                            string position = arriba.ElementAt(i);
                            string[] data = position.Split(';');
                            fila = Convert.ToInt32(data[0]);
                            columna = Convert.ToInt32(data[1]);
                            coords = Potitions(fila, columna, 1, 3);
                            posiciones.Add(coords);
                            coords = Potitions(fila, columna, 1, 4);
                            posiciones.Add(coords);

                        }

                        for (int i = 0; i < abajo.Count; i++)
                        {
                            string position = abajo.ElementAt(i);
                            string[] data = position.Split(';');
                            fila = Convert.ToInt32(data[0]);
                            columna = Convert.ToInt32(data[1]);
                            coords = Potitions(fila, columna, 1, 3);
                            posiciones.Add(coords);
                            coords = Potitions(fila, columna, 1, 4);
                            posiciones.Add(coords);
                        }

                        //llenando casillas vacias izquierda y derecha abajo
                        int auxf = pm.i + 1;
                        int auxc = pm.j;


                        coords = Potitions(auxf, auxc, 1, 3);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 1, 4);
                        posiciones.Add(coords);

                        //llenando casillas vacias izquierda y derecha arriba
                        auxf = pm.i - 1;
                        auxc = pm.j;
                        coords = Potitions(auxf, auxc, 1, 4);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 1, 3);
                        posiciones.Add(coords);
                    }

                    if (posiciones.Count!=0)
                    {
                        posiciones = posiciones.Where(x => !String.IsNullOrEmpty(x)).ToList();
                        foreach (var obj in posiciones)
                        {
                            string[] Lasposition = obj.Split(';');
                            int Row = Convert.ToInt32(Lasposition[0]);
                            int Column = Convert.ToInt32(Lasposition[1]);

                            MiddlePointsPerimeter(Row, Column, pm.nameTool, pm.id, false, true, cont);
                        }

                        cont++;
                    }

                    
                    arriba.Clear();
                    abajo.Clear();

                }



            }

            VerticesPerimetro(cont);


            CleanColor();
            foreach (var item in DicPositionPerimeterMiddlePoint.Keys)
            {
                PointMiddle pm = DicPositionPerimeterMiddlePoint[item];
                int F = pm.i;
                int C = pm.j;

                dataGridView1.Rows[F].Cells[C].Style.BackColor = Color.YellowGreen;

            }

            int row = dataGridView1.Rows.Count;
            int column = dataGridView1.Columns.Count;
            int f = 0;
            int c = 0;
            //llenado de matriz usando puntos medios y camino en zig zag
            //for (int i = 0; i < row; i++)
            //{
            //    if (i % 2 != 0)
            //    {
            //        for (int j = column - 1; j >= 0; j--)
            //        {
            //            if (c.Equals(column))
            //            {
            //                c = 0;
            //            }

            //            dataGridView1.Rows[f].Cells[c].Value = auxMatrix[i, j];
            //            pointsRobot.Add(dataGridView1.Rows[f].Cells[c].Value.ToString());
            //            c++;
            //        }
            //    }
            //    else
            //    {
                    
            //        for (int j = 0; j < column; j++)
            //        {
            //            if (c.Equals(column))
            //            {
            //                c = 0;
            //            }

            //            dataGridView1.Rows[f].Cells[c].Value = auxMatrix[i, j];
            //            pointsRobot.Add(dataGridView1.Rows[f].Cells[c].Value.ToString());
            //            c++;
            //        }
            //    }

            //    f++;
                  
            //}
        }

        class verticesPerimeter
        {
            public int fila { get; set; }
            public int columna { get; set; }
            public string x { get; set; }
            public string y { get; set; }
            public int groupId { get; set; }
        }
        //DIccionario dedicado a guardar verctices de cuadricula de perimetro
        IDictionary<int, verticesPerimeter> DictVerticesPerimetro = new Dictionary<int, verticesPerimeter>();
        public void VerticesPerimetro(int contador)
        {
            

            List<string> vertices = new List<string>();

            string coords = String.Empty;
            for (int i = 0; i < contador; i++)
            {
                
                List<string> puntos = new List<string>();
                foreach (var item in DicPositionPerimeterMiddlePoint.Keys)
                {
                    PointMiddle pm = DicPositionPerimeterMiddlePoint[item];

                    if (pm.groupPerimeter.Equals(i))
                    {
                        coords = pm.i + ";" + pm.j;
                        puntos.Add(coords);
                    }
                }
                vertices = findVerticesPerimetro(puntos);
                string[] dataVerticesSuperiores = vertices.ElementAt(0).Split(';');
                string[] dataVerticesInferiores = vertices.ElementAt(1).Split(';');
                getVertices(dataVerticesSuperiores, i,true);
                getVertices(dataVerticesInferiores, i,false);
                puntos.Clear();
                
                
            }
        }

        int contVerticesPerimetro = 0;
        int contadorPosicionesVertices = 0;
        public void getVertices(string[] coords, int groupid,bool estado)
        {
            
            for (int i = 2; i < coords.Count(); i++)
            {
                verticesPerimeter vp1 = new verticesPerimeter();
                int fi = 0; 
                    
                int ci = 0;
                //Posicion 1
                if (i.Equals(2))
                {
                    fi = Convert.ToInt32(coords[i - 2]);
                    ci = Convert.ToInt32(coords[i - 1]);
                }
                if (i.Equals(3))
                {
                    fi = Convert.ToInt32(coords[i - 1]);
                    ci = Convert.ToInt32(coords[i]);
                }
                

                string position = dataGridView1.Rows[fi].Cells[ci].Value.ToString();
                

                string[] dataPosition = position.Split(';');

                string x1 = dataPosition[0];
                string y1 = dataPosition[1];
                vp1.fila = fi;
                vp1.columna = ci;
                vp1.x = x1;
                vp1.y = y1;
                vp1.groupId = groupid;

                DictVerticesPerimetro.Add(contVerticesPerimetro, vp1);
                contVerticesPerimetro++;
                contadorPosicionesVertices++;

            }

            if (contadorPosicionesVertices.Equals(4))
            {
                int key = contVerticesPerimetro - 4;

                verticesPerimeter Auxvp = DictVerticesPerimetro[key];

                DictVerticesPerimetro.Add(contVerticesPerimetro, Auxvp);
                contVerticesPerimetro++;
                contadorPosicionesVertices = 0;
            }

        }

        public List<string> findVerticesPerimetro(List<string> lista)
        {
            List<string> Vertices = new List<string>();

            string[] LastPosition = lista.ElementAt(lista.Count - 1).Split(';');
            int ultimaFila = Convert.ToInt32(LastPosition[0]);
            int ultimaColumna = Convert.ToInt32(LastPosition[1]);
            List<int> filas = new List<int>();

            for (int i = 0; i < lista.Count; i++)
            {
                string[] data = lista.ElementAt(i).Split(';');

                filas.Add(Convert.ToInt32(data[0]));
            }

            filas = filas.Distinct().ToList();

            int mayorfila = filas.Max();
            int menorFila = filas.Min();
            List<int> columnas = new List<int>();
            
            foreach (var item in lista)
            {
                string[] data = item.Split(';');
                int fila = Convert.ToInt32(data[0]);
                int columna = Convert.ToInt32(data[1]);
                if (fila.Equals(mayorfila))
                {
                    columnas.Add(columna);
                }
               
            }

            int mayorColumna = columnas.Max();
            int menorColumna = columnas.Min();

            string coordenadasPuntosInferiores = menorFila.ToString() + ";" + mayorColumna.ToString()   + ";" + menorFila.ToString() + ";" + menorColumna;
            string coordenadasPuntosSuperiores = mayorfila.ToString()   + ";" +  menorColumna +";" + mayorfila.ToString() + ";"+ mayorColumna.ToString();
            Vertices.Add(coordenadasPuntosInferiores);
            Vertices.Add(coordenadasPuntosSuperiores);

            return Vertices;
        }

        List<string> arriba = new List<string>();
        List<string> abajo = new List<string>();
    
        public string Potitions(int f, int c, int move, int pos)
        {

            string coords = String.Empty;
            int auxf = 0;
            int auxc = 0;

            switch (pos)
            {
                //Abajo
                case 1:
                    try
                    {
                        auxf = f + move;
                        if (auxf < 0)
                        {
                            while (auxf < 0)
                            {
                                move = move - 1;
                                auxf = f + move;
                                if (auxf>0)
                                {
                                    break;
                                }

                            }
                        }
                        auxc = c;
                        coords= auxf.ToString() + ";" + auxc.ToString();
                        abajo.Add(coords);
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch (Exception)
                    {
                        coords = String.Empty;
                        break;
                    }


                case 2:
                    //Arriba
                    try
                    {
                        auxf = f - move;
                        if (auxf < 0)
                        {
                            while (auxf < 0)
                            {
                                move = move - 1;
                                auxf = f + move;
                                if (auxf >0)
                                {
                                    break;
                                }

                            }
                        }
                        auxc = c;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        arriba.Add(coords);
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch
                    {
                        coords = String.Empty;
                        break;
                    }


                case 3:
                    try
                    {
                        //Izquierda
                        auxc = c - move;
                        if (auxc < 0)
                        {
                            while (auxc < 1)
                            {
                                move = move - 1;
                                auxc = c - (move);
                                if (auxc > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f;
                        coords = auxf.ToString() + ";" + auxc.ToString();

                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    

                case 4:
                    try
                    {
                        //Derecha
                        auxc = c + move;
                        if (auxc < 0)
                        {
                            while (auxc < 0)
                            {
                                move = move - 1;
                                auxc = c + move;
                                if (auxc >0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    

                case 5:
                    try
                    {
                        //arriba Derecha
                        auxc = c + move;
                        if (auxc < 0)
                        {
                            while (auxc < 0)
                            {
                                move = move - 1;
                                auxc = c + move;

                                if (auxc > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f - move;
                        if (auxf < 0)
                        {
                            while (auxf < 0)
                            {
                                move = move - 1;
                                auxf = f - move;
                                if (auxf > 0)
                                {
                                    break;
                                }
                            }

                        }
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    

                case 6:
                    try
                    {
                        //arriba Izquierda
                        auxc = c - move;
                        if (auxc < 0)
                        {
                            while (auxc < 0)
                            {
                                move = move - 1;
                                auxc = c + move;
                                if (auxc > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f - move;
                        if (auxf < 0)
                        {
                            while (auxf < 0)
                            {
                                move = move - 1;
                                auxf = f - move;
                                if (auxf > 0)
                                {
                                    break;
                                }
                            }
                        }
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    

                case 7:
                    try
                    {
                        //abajo Derecha
                        auxc = c + move;
                        if (auxc < 0)
                        {
                            while (auxc < 1)
                            {
                                move = move - 1;
                                auxc = c + move;
                                if (auxc > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f + move;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    

                case 8:
                    try
                    {
                        //abajo Izquierda
                        auxc = c - move;
                        if (auxc < 0)
                        {
                            while (auxc < 0)
                            {
                                move = move - 1;
                                auxc = c + move;
                                if (auxc > 0)
                                {
                                    break;
                                }
                            }
                        }
                        auxf = f + move;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch(Exception ex)
                    {
                        coords = String.Empty;
                        break;
                    }
                    
            }

            return coords;

        }


      
        
        private void button3_Click_1(object sender, EventArgs e)
        {

            Form2 f = new Form2();

            f.Show();

            //CleanColor();

            //List<string> corrds = new List<string>();

            //OpenFileDialog file;

            //file = new OpenFileDialog();

            //Excel.Application xlApp;
            //Excel.Workbook xlWorkbook;
            //Excel.Worksheet xlWorkSheet;
            //Excel.Range range;
            //string rootFile = String.Empty;
            //if (file.ShowDialog().Equals(DialogResult.OK))
            //{
            //    g_string = file.FileName;
            //}

            //xlApp = new Excel.Application();
            //xlWorkbook = xlApp.Workbooks.Open(g_string);
            //xlWorkSheet = xlWorkbook.Sheets[1];
            //range = xlWorkSheet.UsedRange;
            //string data = String.Empty;

            //for (int k = 1; k <= range.Rows.Count; k++)
            //{
            //    data = range.Cells[k, 2].Value2.ToString();

            //    if (data.Equals("SANDMIXER"))
            //    {
            //        string coords = String.Empty;
            //        string velocidad = range[k, 7].Value2.ToString();
            //        if (velocidad.Equals("50"))
            //        {
            //            string x = range[k, 5].Value2.ToString();
            //            string y = range[k, 6].Value2.ToString();
            //            coords = x + ";" + y + ";" + 0;
            //            corrds.Add(coords);
                        
            //        }
            //        if(velocidad.Equals("90"))
            //        {
            //            string x = range[k, 5].Value2.ToString();
            //            string y = range[k, 6].Value2.ToString();
            //            coords = x + ";" + y + ";" + 1;
            //            corrds.Add(coords);
            //        }
            //    }

            //}

            //for (int i = 0; i < dataGridView1.Rows.Count; i++)
            //{
            //    for (int j = 0; j < dataGridView1.Columns.Count; j++)
            //    {
            //        string pos = dataGridView1[i, j].Value.ToString();
            //        string[] datapos = pos.Split(';');
            //        foreach (var item in corrds)
            //        {
            //            string[] excelposition = item.Split(';');

            //            if (datapos[0].Equals(excelposition[0]) && datapos[1].Equals(excelposition[1]))
            //            {
            //                if (excelposition[2].Equals("0"))
            //                {
            //                    dataGridView1.Rows[i].Cells[j].Style.BackColor = Color.Orange;
            //                }
            //                if (excelposition[2].Equals("1"))
            //                {
            //                    dataGridView1.Rows[i].Cells[j].Style.BackColor = Color.Green;
            //                }
            //            }

            //        }
            //     }


            //    }

            }


            
        }
    }
    


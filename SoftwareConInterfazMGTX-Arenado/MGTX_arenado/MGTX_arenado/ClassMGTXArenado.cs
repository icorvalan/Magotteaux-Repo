using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using System.Windows.Forms;

namespace MGTX_arenado
{
    class ClassMGTXArenado
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
        //Masa total modelo
        double g_weight = 1603.8;
        //Volumen drag litros
        double g_drag = 369.8;
        //Volumen cope litros
        double g_cope = 584.2;
        //Volumen drag y cope
        double g_volumen = 954;
        //Velocidad de fluido lb/min
        double g_fast1 = 1500;
        //Velocidad de fluido lb/s
        double g_fast2 = 25;
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
        //Clase para el guardado de region de interes relacionada al punto encontrado por posicion de la herramienta(sprue o lid)
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
        //Clase dedicada a guardar los vertices del perimetro
        class verticesPerimeter
        {
            public int fila { get; set; }
            public int columna { get; set; }
            public string x { get; set; }
            public string y { get; set; }
            public int groupId { get; set; }
        }
        //Diccionario para posiciones de lid
        IDictionary<int, PosLid> DictPosLid = new Dictionary<int, PosLid>();
        //Diccionario para posiciones de sprue
        IDictionary<int, PosSprue> DictPosSprue = new Dictionary<int, PosSprue>();
        //Dicionario para guardado de posiciones de herramientas
        IDictionary<int, PointMiddle> DictPositionMiddlePoint = new Dictionary<int, PointMiddle>();
        //Diccionario para guardado de puntos medios perimetro
        IDictionary<int, PointMiddle> DicPositionPerimeterMiddlePoint = new Dictionary<int, PointMiddle>();
        //Diccionario para el guardado de puntos relacionados al punto encontrado de la herramienta (sprue o lid)
        IDictionary<int, cuadricula> DicPosCudricula = new Dictionary<int, cuadricula>();
        //DIccionario dedicado a guardar verctices de cuadricula de perimetro
        IDictionary<int, verticesPerimeter> DictVerticesPerimetro = new Dictionary<int, verticesPerimeter>();
        //Listas que almacenan posiciones superiores y inferiores adyacentes al punto central de la herramienta
        List<string> arriba = new List<string>();
        List<string> abajo = new List<string>();
        //Lista que almacena puntos de robot
        List<string> pointsRobot = new List<string>();

        public void ReadExcel()
        {
            try
            {
                DictPosLid.Clear();
                DictPosSprue.Clear();
                DictPositionMiddlePoint.Clear();
                DicPosCudricula.Clear();
                YValues.Clear();

                Array.Clear(g_dataMatrix, 0, g_dataMatrix.Length);

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
            catch (Exception ex)
            {

            }
        }

        /// <summary>
        /// Funcion para cerrar todos los procesos del excel
        /// </summary>
        public void CloseExcel()
        {
            Process process = new Process();

            foreach (Process item in Process.GetProcesses())
            {
                if (item.ProcessName.Equals("EXCEL.exe"))
                {
                    item.Kill();

                }

            }

        }

        //Largo de pattern
        float g_lengtPattern = 0;
        //Ancho de pattern
        float g_widthPattern = 0;
        //Alto de pattern
        float g_heightPattern = 0;
        /// <summary>
        /// Función para obtener dimensiones del PATTERN
        /// </summary>
        public void SizeOfBox()
        {

            float lenght, width, height = 0;

            lenght = Math.Abs(float.Parse(X2Pattern) - float.Parse(X1Pattern));
            width = Math.Abs(float.Parse(Y2Pattern) - float.Parse(Y1Pattern));
            height = Math.Abs((float.Parse(Z1Pattern)) + Math.Abs(float.Parse(Z2Pattern)) / 2);
            //Asiganción de valores de dimensiones a variables globales
            g_lengtPattern = lenght;
            g_widthPattern = width;
            g_heightPattern = height;

        }


        int g_lenghtBoxel = 0;
        int g_weidhtBoxel = 0;
        string[,] g_dataMatrix = new string[100, 100];
        /// <summary>
        /// Creación de matriz dinamica
        /// </summary>
        public void MakeMatrix()
        {
            //Obtencion de largo de PATTERN
            float length = Convert.ToInt32(Math.Round(float.Parse(X1Pattern)));
            //Obtencion de Ancho de PATTERN
            float weight = Convert.ToInt32(Math.Round(float.Parse(Y2Pattern)));

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
            float lengthcCell = 100;
            g_lenghtBoxel = Convert.ToInt32(lengthcCell);
            float weightCell = 100;
            g_weidhtBoxel = Convert.ToInt32(weightCell);
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
            //asignación de dimensiones a matriz (datagridview)

            g_dataMatrix=new string[row,column];

            //dataGridView1.ColumnCount = column;

            //dataGridView1.RowCount = row;


            List<string> rangeYValues = new List<string>();
           
            List<float> rangey = new List<float>();
            List<float> rangex = new List<float>();
            float auxY = y;
            float auxX = x;
            string[] datax = new string[row];
            for (int i = 0; i < row; i++)
            {

                for (int j = 0; j < column; j++)
                {

                    rangey = MakeInterval(auxY, lengthcCell);

                    auxY = rangey.ElementAt(1);

                    if (i.Equals(0))
                    {
                        string coord = auxX.ToString() + ";" + rangey.ElementAt(0).ToString() + ";" + auxX.ToString() + ";" + rangey.ElementAt(1).ToString();
                        rangeYValues.Add(rangey.ElementAt(0).ToString() + ";" + rangey.ElementAt(1).ToString());
                        g_dataMatrix[i, j] = coord;
                        //dataGridView1.Rows[i].Cells[j].Value = coord;

                    }
                    else
                    {
                        string[] datay = rangeYValues.ElementAt(j).ToString().Split(';');
                        string coord = x.ToString() + ";" + datay[0] + ";" + x.ToString() + ";" + datay[1];
                        g_dataMatrix[i, j] = coord;
                        //dataGridView1.Rows[i].Cells[j].Value = coord;
                    }
                }
                x = x + weightCell;
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
        public List<float> MakeInterval(float n, float dimension)
        {
            List<float> range = new List<float>();

            for (int i = 0; i < 2; i++)
            {


                range.Add(n);

                n = n + dimension;
            }

            return range;
        }

        /// <summary>
        /// Función de dedicada a buscar las zonas correspondientes a un sprue o un lid
        /// </summary>
        public void findZone()
        {
            contMiddlePoints = 0;
            DicPosCudricula.Clear();
            DictPositionMiddlePoint.Clear();

            //Se obtiene cantidad lid para iterar diccionario
            int countLid = DictPosLid.Count();
            //Se obtiene cantidad de sprue
            int countSprue = DictPosSprue.Count();
            
            //int cont = 0;
            //int posc = 0;
            //int posf = 0;
            //double aux = 0;
            //Variable booleana dedicada a señalar si se encuentra o no la posicion deseada
            bool findPosition = false;
            //Variables auxiliares para obtener posiciones de x e y
            float auxX1, auxY1;

            //Encontrando Lids
            for (int i = 0; i < countLid; i++)
            {
                //toma de datos de diccionario 
                PosLid x1Lid = DictPosLid[i];

                float x1 = float.Parse(x1Lid.posX1);
                float y1 = float.Parse(x1Lid.posY1);
                string name = x1Lid.nameLid;
                string id = x1Lid.id;
                //se crea la cuadricula con puntos relacionados al centro de la herramienta
                CreateCube(i, x1, y1, 100);


                //se busca el punto central de la matriz
                for (int j = 0; j < g_dataMatrix.GetLength(0); j++)
                {
                    for (int k = 0; k < g_dataMatrix.GetLength(1); k++)
                    {
                        var data = g_dataMatrix[j,k];

                        string coords = Convert.ToString(data);
                        string[] dataCoords = coords.Split(';');

                        float datax1 = float.Parse(dataCoords[0]);
                        float datay1 = float.Parse(dataCoords[1]);
                        float datax2 = float.Parse(dataCoords[2]);
                        float datay2 = float.Parse(dataCoords[3]);
                        
                        if ((x1 < datax1) && (datay1 < y1 && y1 < datay2))
                        {
                            //dataGridView1.Rows[j].Cells[k].Style.BackColor = Color.Green;
                            //Se guarda posicion del punto central de la matriz 
                            middlePointInRange(j, k, name, id, true, false);


                            findPosition = true;
                            break;
                        }


                    }
                    //Si el punto se encuentra
                    if (findPosition)
                    {
                        //se guardan los puntos adyacentes al centros 
                        cuadricula colorCuadricula = DicPosCudricula[i];

                        auxX1 = colorCuadricula.posUp.ElementAt(0);
                        auxY1 = colorCuadricula.posUp.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);


                        auxX1 = colorCuadricula.posDown.ElementAt(0);
                        auxY1 = colorCuadricula.posDown.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1,name, id);

                        auxX1 = colorCuadricula.posRight.ElementAt(0);
                        auxY1 = colorCuadricula.posRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posUpRight.ElementAt(0);
                        auxY1 = colorCuadricula.posUpRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posUpLef.ElementAt(0);
                        auxY1 = colorCuadricula.posUpLef.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posDownRight.ElementAt(0);
                        auxY1 = colorCuadricula.posDownRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posDownLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posDownLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);



                        findPosition = false;
                        break;

                    }

                }

            }


            //Encontrando Sprue
            //usa la misma logica para guardar LID
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


                for (int j = 0; j < g_dataMatrix.GetLength(0); j++)
                {
                    for (int k = 0; k < g_dataMatrix.GetLength(1); k++)
                    {
                        var data = g_dataMatrix[j, k];

                        string coords = Convert.ToString(data);
                        string[] dataCoords = coords.Split(';');

                        float datax1 = float.Parse(dataCoords[0]);
                        float datay1 = float.Parse(dataCoords[1]);
                        float datay2 = float.Parse(dataCoords[3]);

                        if ((x1 <= datax1) && (datay1 <= y1 && y1 <= datay2))
                        {
                            //dataGridView1.Rows[j].Cells[k].Style.BackColor = Color.Orange;
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

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posDown.ElementAt(0);
                        auxY1 = colorCuadricula.posDown.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posRight.ElementAt(0);
                        auxY1 = colorCuadricula.posRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posUpRight.ElementAt(0);
                        auxY1 = colorCuadricula.posUpRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posUpLef.ElementAt(0);
                        auxY1 = colorCuadricula.posUpLef.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posDownRight.ElementAt(0);
                        auxY1 = colorCuadricula.posDownRight.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);

                        auxX1 = colorCuadricula.posDownLeft.ElementAt(0);
                        auxY1 = colorCuadricula.posDownLeft.ElementAt(1);

                        ColorCuadricula(auxX1, auxY1, name, id);



                        findPosition = false;
                        break;

                    }

                }
            }
        }

        int contMiddlePoints = 0;
        /// <summary>
        /// Función que guarda los puntos medios en diccionario de datos sobre puntos 
        /// </summary>
        /// <param name="i"></param>
        /// <param name="j"></param>
        /// <param name="name"></param>
        /// <param name="id"></param>
        /// <param name="center"></param>
        public void middlePointInRange(int i, int j, string name, string id, bool center, bool perimeter)
        {
            //Declaración de clase para almacenar puntos medios
            PointMiddle middlePoint = new PointMiddle();
            //Asignación de posicion de fila y columna
            middlePoint.i = i;
            middlePoint.j = j;
            //Obtencion de puntos en matriz
            var data = g_dataMatrix[i,j];

            string coords = Convert.ToString(data);
            string[] dataCoords = coords.Split(';');
            //asignación a variables los puntos obtenidos
            float datax1 = float.Parse(dataCoords[0]);
            float datay1 = float.Parse(dataCoords[1]);
            float datax2 = float.Parse(dataCoords[2]);
            float datay2 = float.Parse(dataCoords[3]);
            //transaformación de coordenadas a puntos medios
            middlePoint.x = (datax1 + datax2) / 2;
            middlePoint.y = (datay1 + datay2) / 2;
            //toma de nombre de herramienta
            middlePoint.nameTool = name;
            //toma de id de herramienta
            middlePoint.id = id;
            //Variable booleana para saber si el punto es el centro o o no
            middlePoint.center = center;
            //Variable booleana para saber si el punto obtenido es parte del perimetro de la herramienta
            middlePoint.perimeter = perimeter;
            //Guardado de los puntos en el diccionario
            DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
            //aumento del contador cada vez que se hace un ingreso al diccionario
            contMiddlePoints++;
        }


        /// <summary>
        /// Funcion que genera puntos de cuadricula al punto de referencia
        /// </summary>
        /// <param name="id"></param>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="factorDediferencia"></param>
        public void CreateCube(int id, float x, float y, float factorDeDiferencia)
        {
            //Coordenadas obteniddas
            float x1, y1 = 0;
            //Posiciones auxiliares para x e y con el fin de acceder a las cuadriculas adyacentes
            float auxUPX1, auxUPY1 = 0;
            float auxDownUPX1, auxDownUPY1 = 0;
            cuadricula cuadricula = new cuadricula();
            //Posición arriba de punto
            x1 = x + factorDeDiferencia;
            y1 = y;
            cuadricula.posUp.Add(x1);
            cuadricula.posUp.Add(y1);

            //Posición abajo de punto
            x1 = x - factorDeDiferencia;
            y1 = y;
            cuadricula.posDown.Add(x1);
            cuadricula.posDown.Add(y1);
            auxDownUPX1 = x - factorDeDiferencia;
            auxDownUPY1 = y;

            //Posicion derecha de punto

            x1 = x;
            y1 = y + factorDeDiferencia;
            cuadricula.posRight.Add(x1);
            cuadricula.posRight.Add(y1);


            //Posicion izquierda de punto
            x1 = x;
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
        /// Funcion que busca, guarda  posiciones de cuadricula segun posicion de matriz
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="color"></param>
        public void ColorCuadricula(float x, float y, string name, string id)
        {
            bool findposition = false;
            int cont = 0;
            string position = String.Empty;
            int fila = g_dataMatrix.GetLength(0);
            int columna = g_dataMatrix.GetLength(1);
            for (int i = 0; i < fila; i++)
            {
                for (int j = 0; j < columna; j++)
                {
                    var data = g_dataMatrix[i,j];

                    string coords = Convert.ToString(data);
                    string[] dataCoords = coords.Split(';');

                    float datax1 = float.Parse(dataCoords[0]);
                    float datay1 = float.Parse(dataCoords[1]);
                    float datay2 = float.Parse(dataCoords[3]);

                    if ((x <= datax1) && (datay1 <= y && y <= datay2))
                    {

                        //dataGridView1.Rows[i].Cells[j].Style.BackColor = color;
                        middlePointInRange(i, j, name, id, false, false);
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

        /// <summary>
        /// Funcion dedicada a encontrar los puntos medios 
        /// </summary>
        public void CrearCaminoRobot()
        {
            //Limpieza de variables 
            DicPositionPerimeterMiddlePoint.Clear();
            perimeterPosition.Clear();
            arriba.Clear();
            abajo.Clear();

            string[,] auxMatrix = new string[g_dataMatrix.GetLength(0), g_dataMatrix.GetLength(1)];
            //Copia de matriz global en matriz local auxiliar
            for (int i = 0; i < g_dataMatrix.GetLength(0); i++)
            {
                for (int j = 0; j < g_dataMatrix.GetLength(1); j++)
                {
                    var range = g_dataMatrix[i,j];
                    string coordenadas = Convert.ToString(range);
                    string[] dataCoords = coordenadas.Split(';');

                    float datax1 = float.Parse(dataCoords[0]);
                    float datay1 = float.Parse(dataCoords[1]);
                    float datax2 = float.Parse(dataCoords[2]);
                    float datay2 = float.Parse(dataCoords[3]);
                    //llenado de matriz auxiliar con los puntos medios resueltos
                    auxMatrix[i, j] = MiddlePoints(datax1, datay1, datax2, datay2);
                }

            }

            //Paso de puntos medios a matriz global
            for (int i = 0; i < g_dataMatrix.GetLength(0); i++)
            {
                for (int j = 0; j < g_dataMatrix.GetLength(1); j++)
                {
                    g_dataMatrix[i,j] = auxMatrix[i, j];
                }

            }


           

            //Declaración de filas, columnas y variable coords utilizadas en obtener el perimetro de cada objeto
            int fila, columna = 0;
            string coords = String.Empty;


            int cont = 0;
            foreach (var item in DictPositionMiddlePoint.Keys)
            {
                PointMiddle pm = DictPositionMiddlePoint[item];
                List<string> posiciones = new List<string>();
                //si el punto obtenido se encuentra en el centro
                if (pm.center)
                {
                    //si el punto es un lid
                    if (pm.nameTool.Contains("LID"))
                    {
                        //se crea perimetro para todo objeto de tipo lid y se guarda en una lista de posiciones 
                        PointMiddle newPointMiddle = new PointMiddle();

                        //dataGridView1.Rows[pm.i].Cells[pm.j].Style.BackColor = Color.Red;
                        //abajo
                        coords = Potitions(pm.i, pm.j, 2, 1);
                        posiciones.Add(coords);
                        ////arriba
                        coords = Potitions(pm.i, pm.j, 2, 2);
                        posiciones.Add(coords);
                        ////izquierda
                        coords = Potitions(pm.i, pm.j, 2, 3);
                        posiciones.Add(coords);
                        //Derecha
                        coords = Potitions(pm.i, pm.j, 2, 4);
                        posiciones.Add(coords);
                        //Arriba derecha
                        coords = Potitions(pm.i, pm.j, 2, 5);
                        posiciones.Add(coords);
                        //Arriba izquierda
                        coords = Potitions(pm.i, pm.j, 2, 6);
                        posiciones.Add(coords);
                        //Abajo derecha
                        coords = Potitions(pm.i, pm.j, 2, 7);
                        posiciones.Add(coords);
                        //Abajo Izquierda
                        coords = Potitions(pm.i, pm.j, 2, 8);
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


                        coords = Potitions(auxf, auxc, 2, 3);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 2, 4);
                        posiciones.Add(coords);

                        //llenando casillas vacias izquierda y derecha arriba
                        auxf = pm.i - 1;
                        auxc = pm.j;
                        coords = Potitions(auxf, auxc, 2, 4);
                        posiciones.Add(coords);
                        coords = Potitions(auxf, auxc, 2, 3);
                        posiciones.Add(coords);

                    }
                    if (pm.nameTool.Contains("SPRUE"))
                    {
                        //Misma logica usada para Sprue
                        PointMiddle newPointMiddle = new PointMiddle();

                        //dataGridView1.Rows[pm.i].Cells[pm.j].Style.BackColor = Color.Red;
                        //abajo
                        coords = Potitions(pm.i, pm.j, 2, 1);
                        posiciones.Add(coords);
                        ////arriba
                        coords = Potitions(pm.i, pm.j, 2, 2);
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

                    if (posiciones.Count != 0)
                    {
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


            //CleanColor();
            foreach (var item in DicPositionPerimeterMiddlePoint.Keys)
            {
                PointMiddle pm = DicPositionPerimeterMiddlePoint[item];
                int F = pm.i;
                int C = pm.j;

                //dataGridView1.Rows[F].Cells[C].Style.BackColor = Color.YellowGreen;

            }

            int row = g_dataMatrix.GetLength(0);
            int column = g_dataMatrix.GetLength(1);
            int f = 0;
            int c = 0;
            //llenado de matriz usando puntos medios y camino en zig zag
            for (int i = 0; i < row; i++)
            {
                if (i % 2 != 0)
                {
                    for (int j = column - 1; j >= 0; j--)
                    {
                        if (c.Equals(column))
                        {
                            c = 0;
                        }

                        g_dataMatrix[i,j] = auxMatrix[i, j];
                        pointsRobot.Add(auxMatrix[f, c]);
                        c++;
                    }
                }
                else
                {

                    for (int j = 0; j < column; j++)
                    {
                        if (c.Equals(column))
                        {
                            c = 0;
                        }

                        g_dataMatrix[i, j] = auxMatrix[i, j];
                        pointsRobot.Add(auxMatrix[f, c]);
                        c++;
                    }
                }

                f++;

            }

        }
        /// <summary>
        /// Funcion dedicada a resolver puntos medios entre dos puntos
        /// </summary>
        /// <param name="x1"></param>
        /// <param name="y1"></param>
        /// <param name="x2"></param>
        /// <param name="y2"></param>
        /// <returns></returns>
        public string MiddlePoints(float x1, float y1, float x2, float y2)
        {
            string coords = String.Empty;

            float x = (x1 + x2) / 2;
            float y = (y1 + y2) / 2;

            coords = x.ToString() + ";" + y.ToString();

            return coords;
        }

        /// <summary>
        /// Funcion dedicada a obtener los puntos del perimetro del objeto
        /// </summary>
        /// <param name="f">fila</param>
        /// <param name="c">columna</param>
        /// <param name="move">cantidad de veces a moverse en la matriz</param>
        /// <param name="pos">clave hacia que direccion moverse</param>
        /// <returns></returns>
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
                                if (auxf > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxc = c;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        abajo.Add(coords);
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch (Exception)
                    {
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
                                if (auxf > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxc = c;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        arriba.Add(coords);
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch
                    {
                        break;
                    }


                case 3:
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

                    //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                    break;

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
                                if (auxc > 0)
                                {
                                    break;
                                }

                            }
                        }
                        auxf = f;
                        coords = auxf.ToString() + ";" + auxc.ToString();
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch (Exception ex)
                    {
                        break;
                    }


                case 5:
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
                    //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                    break;

                case 6:
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
                    //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                    break;

                case 7:
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
                    //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                    break;

                case 8:
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
                    //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                    break;
            }

            return coords;

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
        public void MiddlePointsPerimeter(int i, int j, string name, string id, bool center, bool perimeter, int groupPerimeter)
        {
            PointMiddle middlePoint = new PointMiddle();
            middlePoint.i = i;
            middlePoint.j = j;
            var data = g_dataMatrix[i,j];

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

        /// <summary>
        /// Funcion que obtiene vertices de perimetro
        /// </summary>
        /// <param name="contador">Cantidad de herramientas en pattern(hay un perimetro por herramienta)</param>
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
                getVertices(dataVerticesSuperiores, i, true);
                getVertices(dataVerticesInferiores, i, false);
                puntos.Clear();


            }
        }

        /// <summary>
        /// Funcion dedicada a encontrar los vertices de cada perimetro correspondiente a cada objeto
        /// </summary>
        /// <param name="lista"></param>
        /// <returns></returns>
        public List<string> findVerticesPerimetro(List<string> lista)
        {
            List<string> Vertices = new List<string>();

            //string[] LastPosition = lista.ElementAt(lista.Count - 1).Split(';');
            //int ultimaFila = Convert.ToInt32(LastPosition[0]);
            //int ultimaColumna = Convert.ToInt32(LastPosition[1]);
            //Se crea una lista para almacenar las filas
            List<int> filas = new List<int>();

            for (int i = 0; i < lista.Count; i++)
            {
                string[] data = lista.ElementAt(i).Split(';');

                filas.Add(Convert.ToInt32(data[0]));
            }
            //Se eliminan los elementos repeidos
            filas = filas.Distinct().ToList();
            //Se evaluan los maximos y minimos de cada fila
            int mayorfila = filas.Max();
            int menorFila = filas.Min();
            //Se declara la variable columnas para obtener todas la columnas
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
            //Se evalua cada columna mayor y menor
            int mayorColumna = columnas.Max();
            int menorColumna = columnas.Min();
            //se entregan los vertices a lista en orden para guardado de excel
            string coordenadasPuntosInferiores = menorFila.ToString() + ";" + mayorColumna.ToString() + ";" + menorFila.ToString() + ";" + menorColumna;
            string coordenadasPuntosSuperiores = mayorfila.ToString() + ";" + menorColumna + ";" + mayorfila.ToString() + ";" + mayorColumna.ToString();
            Vertices.Add(coordenadasPuntosInferiores);
            Vertices.Add(coordenadasPuntosSuperiores);

            return Vertices;
        }

        int contVerticesPerimetro = 0;
        int contadorPosicionesVertices = 0;
        /// <summary>
        /// Funcion dedicada a guardar los vertices del perimetro en orden para la receta
        /// </summary>
        /// <param name="coords"></param>
        /// <param name="groupid"></param>
        /// <param name="estado"></param>
        public void getVertices(string[] coords, int groupid, bool estado)
        {
            //Obtencion de coordenadas
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

                //Obtengo valor de las posiciones en matriz
                string position = g_dataMatrix[fi,ci];

                //Se guardan datos en diccionario
                string[] dataPosition = position.Split(';');

                string x1 = dataPosition[0];
                string y1 = dataPosition[1];
                vp1.fila = fi;
                vp1.columna = ci;
                vp1.x = x1;
                vp1.y = y1;
                vp1.groupId = groupid;
                //Guardado de datos en diccionario
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

        /// <summary>
        /// Funcion que guarda datos en receta
        /// </summary>
        public void GuardadoDeDatosExcel()
        {
            double MasaPattern = 0;




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

            //Camino Robot perimetro
            int contVertexPerimeter = 0;
            for (int i = range.Rows.Count; i < largoExcel; i++)
            {
                verticesPerimeter vp = DictVerticesPerimetro[contVertexPerimeter];
                string[] dataPos = g_dataMatrix[vp.fila,vp.columna].Split(';');

                string x = dataPos[0];
                string y = dataPos[1];
                range.Cells[i, 1].Value = id;
                range.Cells[i, 2].Value = "SANDMIXERP";
                range.Cells[i, 3].Value = 12;
                range.Cells[i, 4].Value = 0;
                range.Cells[i, 5].Value = x;
                range.Cells[i, 6].Value = y;
                range.Cells[i, 7].Value = v2;
                range.Cells[i, 8].Value = 0;
                range.Cells[i, 9].Value = 0;
                range.Cells[i, 10].Value = 0;
                range.Cells[i, 11].Value = 0;
                range.Cells[i, 12].Value = 1;
                range.Cells[i, 13].Value = 1;
                id++;
                contVertexPerimeter++;
            }




            //Camino Robot general
            for (int i = largoExcel; i < largoExcel + pointsRobot.Count; i++)
            {

                string middlepoint = pointsRobot.ElementAt(cont);
                cont++;
                string[] dataMiddlePoint = middlepoint.Split(';');
                string x = dataMiddlePoint[0];
                string y = dataMiddlePoint[1];
                range.Cells[i, 1].Value = id;
                range.Cells[i, 2].Value = "SANDMIXER";
                range.Cells[i, 3].Value = 12;
                range.Cells[i, 4].Value = 0;
                range.Cells[i, 5].Value = x;
                range.Cells[i, 6].Value = y;
                foreach (var item in DictPositionMiddlePoint.Keys)
                {
                    PointMiddle points = DictPositionMiddlePoint[item];
                    string punto = g_dataMatrix[points.i, points.j];
                    string[] data = punto.Split(';');
                    if (x.Equals(data[0]) && y.Equals(data[1]))
                    {
                        range.Cells[i, 7].Value = v1;
                        range.Cells[i, 8].Value = CalculoTiempoPermanencia() * 0.3;
                        range.Cells[i, 9].Value = CalculoTiempoPermanencia() * 0.7;
                        break;
                    }
                    else
                    {
                        range.Cells[i, 7].Value = v2;
                        range.Cells[i, 8].Value = 0;
                        range.Cells[i, 9].Value = 0;
                    }

                }


                range.Cells[i, 10].Value = 0;
                range.Cells[i, 11].Value = 0;
                range.Cells[i, 12].Value = 1;
                range.Cells[i, 13].Value = 1;
                id++;
            }

            xlWorkbook.SaveAs("test2.xlsx");
            xlWorkbook.Close(0);
            xlApp.Quit();
            CloseExcel();

            MessageBox.Show("Excel para test Creado");
        }


        /// <summary>
        /// Funcion que calcula la densidad total segun las consntante del pattern volumen drag y cope, Calcula la masa del boxel y obtiene el tiempo de permanencia
        /// </summary>
        public double CalculoTiempoPermanencia()
        {
            //Densidad total
            double DensidadTotal = g_weight / g_volumen;
            //Volumen de Boxel
            double alto = 0;
            if (g_heightPattern!=0)
            {
                alto = Convert.ToDouble(g_heightPattern);
            }
            //Volumen de boxel mm^3
            double volumenBox1 = g_lenghtBoxel * g_weidhtBoxel * alto;
            //Volumen de boxel en L
            double volumenBox2 = volumenBox1 * Math.Pow(10, -6);

            //Calculo masa de Boxel

            double masaBoxel = DensidadTotal * volumenBox2;

            //Calculo de tiempo de permanencia

            double TiempoDePermanencia = masaBoxel / g_fast2;





            return TiempoDePermanencia;

        }


    }
}

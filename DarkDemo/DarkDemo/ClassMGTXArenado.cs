using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using System.Windows.Forms;
using DarkDemo;

namespace MGTX_arenado
{
    class ClassMGTXArenado
    {

        public Form1 form;
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
        //Clase para obtener datos de los puntos medios obtenidos
        class PointMiddle
        {
            public int i { get; set; }
            public int j { get; set; }
            public int x { get; set; }
            public int y { get; set; }
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

        public void ReadExcel(List<string> Listdata)
        {
            try
            {
                DictPosLid.Clear();
                DictPosSprue.Clear();
                DictPositionMiddlePoint.Clear();
                DicPosCudricula.Clear();
                DictVerticesPerimetro.Clear();
                pointsRobot.Clear();
                YValues.Clear();
                puntosSprue.Clear();
                contVerticesPerimetro = 0;


                string data = String.Empty;
                int contLid = 0;
                int contSprue = 0;
                for (int i = 0; i < Listdata.Count; i++)
                {

                    if (Listdata.ElementAt(i).Contains("LID"))
                    {
                        int pos = i + 3;

                        PosLid Lid = new PosLid();
                        Lid.nameLid = Listdata.ElementAt(i);
                        Lid.posX1 = Listdata.ElementAt(pos);
                        Lid.posY1 = Listdata.ElementAt(pos + 1);
                        Lid.id = Listdata.ElementAt(i + 1);
                        DictPosLid.Add(contLid, Lid);
                        contLid += 1;
                    }


                    if (Listdata.ElementAt(i).Contains("SPRUE"))
                    {
                        int pos = i + 3;

                        PosSprue sprue = new PosSprue();
                        sprue.nameSprue = Listdata.ElementAt(i);
                        sprue.posX1 = Listdata.ElementAt(pos);
                        sprue.posY1 = Listdata.ElementAt(pos + 1);
                        sprue.id = Listdata.ElementAt(i + 1);
                        DictPosSprue.Add(contSprue, sprue);
                        contSprue += 1;
                    }

                    if (Listdata.ElementAt(i).Equals("PATTERN"))
                    {
                        int pos = i + 3;

                        X1Pattern = Listdata.ElementAt(pos);
                        X2Pattern = Listdata.ElementAt(pos + 3);
                        Y1Pattern = Listdata.ElementAt(pos + 1);
                        Y2Pattern = Listdata.ElementAt(pos + 4);
                        Z1Pattern = Listdata.ElementAt(pos + 2);
                        Z2Pattern = Listdata.ElementAt(pos + 5);
                    }
                }




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
        
        string[,] g_dataMatrix;
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
            //MinorValueY();
            float y = MinorValueY(); ;
            //Estableciendo largo y ancho de celda de matriz
            float lengthcCell = 200;
            g_lenghtBoxel = Convert.ToInt32(lengthcCell);
            float weightCell = 200;
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
                column = Math.Abs(Convert.ToInt32(weight / weightCell));
            }
            //asignación de dimensiones a matriz (datagridview)

            g_dataMatrix = new string[row+1, column];

           


            List<string> rangeYValues = new List<string>();

            List<float> rangey = new List<float>();
            List<float> rangex = new List<float>();
            float auxY = y;
            float auxX = x;
            string[] datax = new string[row];
            string[] dataNewRange = adjustRange(auxX, auxY, Convert.ToInt32(column), Convert.ToInt32(row), Convert.ToInt32(length), Convert.ToInt32(weight)).Split(';');

            lengthcCell = float.Parse(dataNewRange[1]);
            g_lenghtBoxel = Convert.ToInt32(lengthcCell);
            weightCell = float.Parse(dataNewRange[0]);
            g_weidhtBoxel = Convert.ToInt32(weightCell);

            for (int i = 0; i <= row; i++)
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
                        

                    }
                    else
                    {
                        string[] datay = rangeYValues.ElementAt(j).ToString().Split(';');
                        string coord = x.ToString() + ";" + datay[0] + ";" + x.ToString() + ";" + datay[1];
                        g_dataMatrix[i, j] = coord;
                        
                    }
                }
                x = x + weightCell;
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
        public string adjustRange(float auxX, float auxY, int column, int row, int lenght, int weidht)
        {

            double rangeWeidht = 0, rangeLength = 0;

            if (auxY < 0)
            {
                rangeLength = (weidht + Math.Abs(auxY)) / column;
            }
            else
            {
                rangeLength = weidht / column;
            }

            if (auxX < 0)
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

        /// <summary>
        /// Función que obtiene la menor posición en y
        /// </summary>
        /// <returns></returns>
        public float  MinorValueY()
        {
            bool emptySprue = false, emptyLid = false;
            float minor = 0;
            List<float> yMenorSprue = new List<float>();
            List<float> yMenorLid = new List<float>();
            float minYLID= 10000000, minYSPRUE = 10000000;
            if (DictPosSprue.Count>0)
            {
                
                foreach (var item in DictPosSprue.Keys)
                {
                    PosSprue point = DictPosSprue[item];

                    yMenorSprue.Add(float.Parse(point.posY1));
                }
            }
            else
            {
                emptySprue = true;
            }
            if (DictPosLid.Count>0)
            {

                foreach (var item in DictPosLid.Keys)
                {
                    PosLid point = DictPosLid[item];

                    yMenorLid.Add(float.Parse(point.posY1));
                }
            }
            else
            {
                emptyLid = true;
            }
            if (!emptyLid)
            {
                 minYLID = yMenorLid.Min();
            }
            if (!emptySprue)
            {
                minYSPRUE =Convert.ToInt32(yMenorSprue.Min());
            }
            
            float yPattern = float.Parse(Y1Pattern);
            if (!emptyLid)
            {
                if (yPattern > minYLID)
                {
                    minor = minYLID;
                }
                else
                {
                    minor = yPattern;
                }
            }
            if (!emptySprue)
            {
                if (yPattern > minYSPRUE)
                {
                    minor = minYSPRUE;
                }
                else
                {
                    minor = yPattern;
                }
            }

            if (minYLID > minYSPRUE)
            {
                minor = minYSPRUE;
            }
            else
            {
                minor = minYLID;
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

        //Contador de puntos medios
        int contMiddlePoints = 0;
        //Lista para validar sprue
        List<string> puntosSprue = new List<string>();
        //Contador de puntos de Sprues
        int contSpruePoint = 0;
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
            middlePoint.x = Convert.ToInt32((datax1 + datax2) / 2);
            middlePoint.y = Convert.ToInt32((datay1 + datay2) / 2);
            //toma de nombre de herramienta
            middlePoint.nameTool = name;
            //toma de id de herramienta
            middlePoint.id = id;
            //Variable booleana para saber si el punto es el centro o o no
            middlePoint.center = center;
            //Variable booleana para saber si el punto obtenido es parte del perimetro de la herramienta
            middlePoint.perimeter = perimeter;
            if (middlePoint.nameTool.Contains("LID"))
            {
                if (!NoPointsRepeatedLID(middlePoint.x, middlePoint.y))
                {
                    //Guardado de los puntos en el diccionario
                    DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                    //aumento del contador cada vez que se hace un ingreso al diccionario
                    contMiddlePoints++;
                }
            }
            else
            {
                //Verificación de que no existan puntos de sprue repetidos
                string coord = middlePoint.x.ToString() + ";" + middlePoint.y.ToString();
                try
                {
                    //Si el valor no se encuentra en la lista cae a una excepción y se agrega como un nuevo valor al diccionario
                    string value = puntosSprue.First(s => s.Equals(coord));
                }
                catch (Exception ex)
                {
                    //Guardado de los puntos en el diccionario
                    DictPositionMiddlePoint.Add(contMiddlePoints, middlePoint);
                    //aumento del contador cada vez que se hace un ingreso al diccionario
                    contMiddlePoints++;
                    //Se agrega el nuevo valor a la lista para proxima evaluación
                    puntosSprue.Add(coord);
                }
            }
            
        }
        /// <summary>
        /// Función que verifica si existen puntos repetidos en lista
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <returns></returns>
        public bool NoPointsRepeatedLID(float x, float y)
        {
            bool repeated = false;
            //Recorriendo diccionario
            foreach (var item in DictPositionMiddlePoint.Keys)
            {
                PointMiddle point = DictPositionMiddlePoint[item];
                //Verificando que el punto recibido en diccionario no se encuentre en el diccionario
                if (point.x.Equals(x) && point.y.Equals(y))
                {
                    repeated = true;
                    break;
                }

            }


            return repeated;
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
                        //Misma logica usada para Sprue
                        PointMiddle newPointMiddle = new PointMiddle();

                        //dataGridView1.Rows[pm.i].Cells[pm.j].Style.BackColor = Color.Red;
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

                    if (posiciones.Count != 0)
                    {
                        try
                        {
                            foreach (var obj in posiciones)
                            {
                                string[] Lasposition = obj.Split(';');
                                int Row = Convert.ToInt32(Lasposition[0]);
                                int Column = Convert.ToInt32(Lasposition[1]);
                                if (Row >=0 && Column>=0)
                                {
                                    MiddlePointsPerimeter(Row, Column, pm.nameTool, pm.id, false, true, cont);

                                }
                            }

                            cont++;
                        }
                        catch(Exception)
                        {
                            cont++;
                        }
                        
                    }


                    arriba.Clear();
                    abajo.Clear();

                }



            }

            VerticesPerimetro(cont);


         

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

                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green;
                        break;
                    }
                    catch (Exception ex)
                    {
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
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch (Exception ex)
                    {
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
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch (Exception)
                    {

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
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch (Exception)
                    {

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
                        //dataGridView1.Rows[auxf].Cells[auxc].Style.BackColor = Color.Green; ;
                        break;
                    }
                    catch (Exception ex)
                    {

                        break;
                    }
                   
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

            middlePoint.x = Convert.ToInt32(datax1);
            middlePoint.y = Convert.ToInt32(datay1);
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
        public void GuardadoDeDatosExcel(ExcelClass excel)
        {


            double MasaPattern = 0;


            ExcelClass excelClass = excel;






            string v1 = "99";
            string v2 = "50";
            int cont = 0;


            //Camino Robot perimetro
            //obteniendo  columnas Perimetro
            //Declaración de lista que contiene columnas de perimetro
            List<int> Colum = new List<int>();
            foreach (var item in DictVerticesPerimetro.Keys)
            {
                verticesPerimeter point = DictVerticesPerimetro[item];

                int y = Convert.ToInt32(float.Parse(point.y));
                Colum.Add(y);
            }
            //Se eliminan elementos duplicados
            Colum = Colum.Distinct().ToList();

            //Obtendiendo Filas Perimetro
            //Declaración de lista que contiene filas Perimetro
            List<int> Row = new List<int>();
            foreach (var item in DictVerticesPerimetro.Keys)
            {
                verticesPerimeter point = DictVerticesPerimetro[item];

                int x = Convert.ToInt32(float.Parse(point.x));
                Row.Add(x);
            }
            //Se eliminan elementos duplicados
            Row = Row.Distinct().ToList();
            //Minimas Columnas Perimetro
            int minColumn = Colum.Min();
            //Maximas Columnas Perimetro
            int maxColumn = Colum.Max();
            //minimas filas Perimetro
            int minRow = Row.Min();
            //maximas filas Perimetro
            int maxRow = Row.Max();

            //Agregando matriz para perimetro
            //Camino Robot perimetro
            //Vertices Perimetro Superior
            for (int i = 0; i < 2; i++)
            {
                string[] vector_info = new string[13];

                vector_info[1] = "SANDMIXERP";
                vector_info[2] = "15";
                vector_info[3] = "0";
                vector_info[4] = minRow.ToString();
                if (i.Equals(1))
                {
                    vector_info[5] = maxColumn.ToString();
                }
                else
                {
                    vector_info[5] = minColumn.ToString();
                }
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";
                excelClass.Insertar_Info(vector_info);
            }

            //Vertices Perimetro Inferior
            for (int i = 0; i < 2; i++)
            {
                string[] vector_info = new string[13];

                vector_info[1] = "SANDMIXERP";
                vector_info[2] = "15";
                vector_info[3] = "0";
                vector_info[4] = maxRow.ToString();
                if (i.Equals(1))
                {
                    vector_info[5] = maxColumn.ToString();
                }
                else
                {
                    vector_info[5] = minColumn.ToString();
                }
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";
                excelClass.Insertar_Info(vector_info);
            }


            //Dimensiones de Pattern
            List<string> VecSup = new List<string>();
            for (int i = 0; i < g_dataMatrix.GetLength(1); i++)
            {
                string middlepoint = pointsRobot.ElementAt(i);
                VecSup.Add(middlepoint);
            }
            List<string> VecInf = new List<string>();
            for (int i = (pointsRobot.Count() - g_dataMatrix.GetLength(1)); i < pointsRobot.Count(); i++)
            {
                string middlepoint = pointsRobot.ElementAt(i);
                VecInf.Add(middlepoint);
            }
            //Agreegando Puntos superiores de pattern
            foreach (var item in VecSup)
            {
                string[] vector_info = new string[13];
                string[] dataMiddlepoint = item.Split(';');
                int x = Convert.ToInt32(float.Parse(dataMiddlepoint[0]));
                int y = Convert.ToInt32(float.Parse(dataMiddlepoint[1]));
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "12";
                vector_info[3] = "0";
                vector_info[4] = x.ToString();
                vector_info[5] = y.ToString();
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";
                excelClass.Insertar_Info(vector_info);
            }
            //Agregando Puntos inferiores de pattern
            foreach (var item in VecInf)
            {
                string[] vector_info = new string[13];
                string[] dataMiddlepoint = item.Split(';');
                int x = Convert.ToInt32(float.Parse(dataMiddlepoint[0]));
                int y = Convert.ToInt32(float.Parse(dataMiddlepoint[1]));
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "13";
                vector_info[3] = "0";
                vector_info[4] = x.ToString();
                vector_info[5] = y.ToString();
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";
                excelClass.Insertar_Info(vector_info);
            }
           




            //Camino Robot de puntos de sprue y Lid
            for (int i = 0; i < pointsRobot.Count; i++)
            {

                string middlepoint = pointsRobot.ElementAt(cont);
                cont++;
                string[] dataMiddlePoint = middlepoint.Split(';');
                int x = Convert.ToInt32(float.Parse(dataMiddlePoint[0]));
                int y = Convert.ToInt32(float.Parse(dataMiddlePoint[1]));

                foreach (var item in DictPositionMiddlePoint.Keys)
                {
                    PointMiddle points = DictPositionMiddlePoint[item];
                    if (!points.perimeter)
                    {
                        string[] vector_info = new string[13];

                        //string punto = g_dataMatrix[points.i, points.j];
                        //dataGridView1.Rows[points.i].Cells[points.j].Value.ToString();
                        //string[] data = punto.Split(';');
                        if (x.Equals(points.x) && y.Equals(points.y))
                        {
                            
                            vector_info[1]= "SANDMIXERREFERENCEPOINT";
                            vector_info[2]="14";
                            vector_info[3]="0";
                            vector_info[4]=x.ToString();
                            vector_info[5]=y.ToString();
                            vector_info[6]=v1;
                            vector_info[7]="0";
                            vector_info[8]="0";
                            vector_info[9]= "0";
                            vector_info[10]= "0";
                            vector_info[11]= "1";
                            vector_info[12]= "1";

                            excelClass.Insertar_Info(vector_info);
                            break;
                        }
                    }



                }
            }

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

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Excel = Microsoft.Office.Interop.Excel;
using System.Diagnostics;
using System.Windows.Forms;
using DarkDemo;
using System.IO;

namespace MGTX_arenado
{
    class ClassMGTXArenado
    {

        SQLapi.SQL_Bridge SQL;

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



        //Ruta archivo
        string g_File = String.Empty;


        //Nombre de archivo para agregar SandMixer
        string g_nameFile = String.Empty;

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
        //Clase usada para almacenar puntos intersectos entre una recta y una circunferencia
        class rectaCircPoints
        {
            public string limiteIzq { get; set; }
            public string limiteDer { get; set; }
            public double cx { get; set; }
            public double cy { get; set; }
            public string x1 { get; set; }
            public string y1 { get; set; }
            public string x2 { get; set; }
            public string y2 { get; set; }
            public double discriminante { get; set; }
        }
        //Lista utilzada para almacenar datos obtenidos en clase rectaCircPoints
        List<rectaCircPoints> puntos = new List<rectaCircPoints>();
        //Clase  utilizada para almacenar los puntos intersectos entre rectas
        class lineas
        {
            public string limiteInferior { get; set; }
            public string limiteSuperior { get; set; }
            public string punto1 { get; set; }
            public int id { get; set; }

        }
        //Lista utilzada para almacenar datos obtenidos en clase lineas
        List<lineas> rectasSprue = new List<lineas>();
        //Diccionario para posiciones de lid
        IDictionary<int, PosLid> DictPosLid = new Dictionary<int, PosLid>();
        //Diccionario para posiciones de sprue
        IDictionary<int, PosSprue> DictPosSprue = new Dictionary<int, PosSprue>();
        //Lista que almacena los limites del Tiny Pattern virtual
        List<string> Limites = new List<string>();

        public bool noSandMixerInRecipe(string file)
        {
            bool noSandMixer = false;
            Excel.Application xlApp;
            Excel.Workbook xlWorkbook;
            Excel.Worksheet xlWorkSheet;
            Excel.Range range;
            g_File = file;
            FileInfo nameFile = new FileInfo(g_File);
            g_nameFile = nameFile.Name;
            xlApp = new Excel.Application();
            xlWorkbook = xlApp.Workbooks.Open(g_File);
            xlWorkSheet = xlWorkbook.Sheets[1];
            range = xlWorkSheet.UsedRange;
            string data = String.Empty;
            for (int i = 1; i <= range.Rows.Count; i++)
            {
                try
                {
                    data = range.Cells[i, 2].Value2.ToString();
                    if ("SANDMIXER".Equals(data))
                    {
                        MessageBox.Show("Exist SandMixer in Recipe:" + g_nameFile, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
                        noSandMixer = false;
                        break;
                    }
                    else
                    {
                        noSandMixer = true;
                    }
                }
                catch (Exception)
                {
                    noSandMixer = true;
                }
            }


            return noSandMixer;
        }


        /// <summary>
        /// Funcion que abre un archivo y obtiene sus datos
        /// </summary>
        public void ReadExcel2()
        {
            try
            {
                DictPosLid.Clear();
                DictPosSprue.Clear();
                puntos.Clear();
                Limites.Clear();


                string data = String.Empty;
                int contLid = 0;
                int contSprue = 0;
                Excel.Application xlApp;
                Excel.Workbook xlWorkbook;
                Excel.Worksheet xlWorkSheet;
                Excel.Range range;



                xlApp = new Excel.Application();
                xlWorkbook = xlApp.Workbooks.Open(g_File);
                xlWorkSheet = xlWorkbook.Sheets[1];
                range = xlWorkSheet.UsedRange;
                data = String.Empty;

                for (int i = 1; i <= range.Rows.Count; i++)
                {
                    try
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
                    }
                    catch (Exception)
                    {

                    }
                }


                SizeOfBox();
                MakeMatrix();
            }
            catch (Exception)
            {

            }


        }


        /// <summary>
        /// Funcion que obtiene datos desde receta
        /// </summary>
        /// <param name="Listdata"></param>
        public void ReadExcel(List<string> Listdata)
        {

            try
            {
                DictPosLid.Clear();
                DictPosSprue.Clear();
                puntos.Clear();
                Limites.Clear();



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
            float x1 = 0, x2 = 0, y1 = 0, y2 = 0;

            List<string> puntos = new List<string>();
            //Obtencion de posiciones  de pattern
            x1 = float.Parse(X1Pattern);
            y1 = float.Parse(Y1Pattern);
            x2 = float.Parse(X2Pattern);
            y2 = float.Parse(Y2Pattern);
            string auxX1 = String.Empty;
            string auxY1 = String.Empty;
            string auxX2 = String.Empty;
            string auxY2 = String.Empty;
            //Ordenando posiciones del extremo inferior al mayor
            if (x1 < x2)
            {
                auxX1 = x1.ToString();
                auxY1 = y1.ToString();
                auxX2 = x2.ToString();
                auxY2 = y2.ToString();

            }
            else
            {
                auxX1 = x2.ToString();
                auxY1 = y2.ToString();
                auxX2 = x1.ToString();
                auxY2 = y1.ToString();
            }

            //Adirhiendo puntos de pattern en lista 
            string punto1 = auxX1 + ';' + auxY1;
            puntos.Add(punto1);
            string punto2 = auxX2 + ';' + auxY2;
            puntos.Add(punto2);
            //Asignación de variables segun posición de pattern obtenida
            List<string> tinyPattern = new List<string>();
            //Clave segun posicion menor o mayor
            int clave = 0;
            //Obtencion de vertices
            foreach (var item in puntos)
            {
                float auxX = float.Parse(item.Split(';')[0]);
                float auxY = float.Parse(item.Split(';')[1]);

                tinyPattern.Add(creacionDePuntoPatteernPequeno(auxX, auxY, 150, clave));
                clave++;

            }

            //Creacion de puntos coordenados de tiny Pattern

            //punto superiorx
            string xDownIzq = tinyPattern.ElementAt(0).Split(';')[0];
            string yDownIzq = tinyPattern.ElementAt(1).Split(';')[1];

            string p2Sup = xDownIzq + ';' + yDownIzq;

            double LargeTinyPattern = DistanceBetweenPoints(float.Parse(xDownIzq), float.Parse(yDownIzq), float.Parse(tinyPattern.ElementAt(0).Split(';')[0]), float.Parse(tinyPattern.ElementAt(0).Split(';')[1]));

            float rango = 150;

            int nColumnas = Convert.ToInt32(LargeTinyPattern / rango);
            float nPuntoX = 0;
            List<string> puntosPattern = new List<string>();
            string yPunto = xDownIzq;
            for (int i = 0; i <= nColumnas; i++)
            {
                if (i == 0)
                {
                    nPuntoX = float.Parse(yDownIzq);
                    puntosPattern.Add(yPunto + ';' + nPuntoX.ToString());

                }
                if (i == (nColumnas))
                {
                    nPuntoX = float.Parse(tinyPattern.ElementAt(0).Split(';')[1]);
                    puntosPattern.Add(yPunto + ';' + nPuntoX.ToString());
                    break;

                }
                if (i != 0)
                {
                    nPuntoX = nPuntoX + rango;
                    puntosPattern.Add(yPunto + ';' + nPuntoX.ToString());
                }

            }

            List<string> vecDer = new List<string>();
            string yPunto2 = tinyPattern.ElementAt(1).Split(';')[0];
            foreach (var item in puntosPattern)
            {
                string data = item.Split(';')[1];
                vecDer.Add(yPunto2 + ';' + data);
            }


            //ordenando Puntos

            for (int i = 0; i < vecDer.Count; i++)
            {
                Limites.Add(puntosPattern.ElementAt(i) + ';' + vecDer.ElementAt(i));

            }

        }

        /// <summary>
        /// Funcion que crea puntos de dimensiones respecto a un pattern más pequeño
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="range"></param>
        /// <param name="clave"></param>
        /// <returns></returns>
        private string creacionDePuntoPatteernPequeno(float x, float y, float range, int clave)
        {
            string vertices = String.Empty;

            switch (clave)
            {

                case 0:
                    y = y - range;
                    x = x + range;
                    vertices = x.ToString() + ';' + y.ToString();
                    break;

                case 1:
                    y = y + range;
                    x = x - range;
                    vertices = x.ToString() + ';' + y.ToString();
                    break;

            }
            return vertices;
        }
        /// <summary>
        /// Funcion que calcula la funcion entre dos puntos
        /// </summary>
        /// <param name="x1"></param>
        /// <param name="y1"></param>
        /// <param name="x2"></param>
        /// <param name="y2"></param>
        /// <returns></returns>
        private double DistanceBetweenPoints(float x1, float y1, float x2, float y2)
        {
            double distance = 0;

            double restx = Math.Pow((x2 - x1), 2);
            double resty = Math.Pow((y2 - y1), 2);
            distance = Math.Sqrt(restx + resty);


            return distance;

        }


        /// <summary>
        /// Funcion que retorna la distancia desde el centro de un objeto
        /// </summary>
        /// <param name="name"></param>
        private double DimensionOfObject(string name)
        {
            double dimension = 0;


            switch (name)
            {
                case "LID01":
                    dimension = 460;
                    break;

                case "LID02":
                    dimension = 386;
                    break;

                case "LID03":
                    dimension = 333;
                    break;

                case "LID04":
                    dimension = 300;
                    return dimension;

                case "LID05":
                    dimension = 253;
                    break;

                case "LID06":
                    dimension = 143;
                    break;

                case "LID07":
                    dimension = 201;
                    break;

                case "LID08":
                    dimension = 184;
                    break;

                case "SPRUE":
                    dimension = 127;
                    break;
            }

            return dimension;

        }

        /// <summary>
        /// Funcion para validar si existen puntos intersectos en una circun
        /// </summary>
        /// <param name="l1"></param>
        /// <param name="cx"></param>
        /// <param name="cy"></param>
        /// <returns></returns>
        private bool ValidatePoints(float l1, float cx, float cy, float r)
        {
            bool noTools = false;

            double coefX = Math.Pow((l1 - cy), 2);
            double variablePrimerGradoy = 0;
            double coefY = 0;
            if (cx > 0)
            {
                variablePrimerGradoy = (-2) * cx;
                coefY = Math.Abs(Math.Pow(cx, 2));

            }
            if (cx < 0)
            {
                variablePrimerGradoy = (2) * cx;
                coefY = Math.Abs(Math.Pow(cx, 2));
            }

            coefY = (coefX + coefY) - r;

            //Calculo de discriminante

            float discriminante = Convert.ToSingle(Math.Pow(variablePrimerGradoy, 2) - (4 * 1 * coefY));

            if (discriminante > 0)
            {
                noTools = true;
            }
            else
            {
                noTools = false;
            }


            return noTools;
        }

        /// <summary>
        /// Funcion que retorna los puntos intersectos entre rectas
        /// </summary>
        private void intersecctionLines(float l1, float y, string coordsInf, string coordsSup, int id)
        {
            lineas puntos = new lineas();
            puntos.limiteInferior = coordsInf;
            puntos.limiteSuperior = coordsSup;
            puntos.punto1 = l1.ToString() + ';' + y.ToString();
            puntos.id = id;

            rectasSprue.Add(puntos);

        }

        int contSprue = 0;
        /// <summary>
        /// Funcion que evalua si existe intersecciónes entre rectas
        /// </summary>
        /// <returns></returns>
        private void validateIntersecctionBetweenLines(string x1, string x2, string y1, string vY1, string vX1, string vX2, string vY2)
        {
            bool intersetion = false;

            if (float.Parse(y1) <= float.Parse(vY1) && float.Parse(vY2) <= float.Parse(y1))
            {
                if (float.Parse(x1) <= float.Parse(vX1) && float.Parse(vX1) <= float.Parse(x2))
                {
                    string coords1 = x1 + ';' + y1;
                    string coords2 = x2 + ';' + y1;
                    intersecctionLines(float.Parse(vX1), float.Parse(y1), coords1, coords2, contSprue);
                }
                if (float.Parse(x1) <= float.Parse(vX2) && float.Parse(vX2) <= float.Parse(x2))
                {
                    string coords1 = x1 + ';' + y1;
                    string coords2 = x2 + ';' + y1;
                    intersecctionLines(float.Parse(vX2), float.Parse(y1), coords1, coords2, contSprue);
                }

                contSprue++;
            }
        }



        /// <summary>
        /// Obtencion de ecuacion de la recta
        /// </summary>
        /// <param name="y"></param>
        /// <returns></returns>
        private double ecRecta(double y)
        {
            if (y < 0)
            {
                return -y;
            }
            else
            {
                return y;
            }
        }

        /// <summary>
        /// Función que evalua una componente de la ecuación general de la circunferencia
        /// </summary>
        /// <returns></returns>
        private double evConstante(double x, double cPoint)
        {
            double resultado = 0;

            if (cPoint < 0)
            {
                resultado = x + cPoint;
                resultado = Math.Abs(Math.Pow(resultado, 2));
            }
            else
            {
                resultado = x - cPoint;
                resultado = Math.Abs(Math.Pow(resultado, 2));
            }

            return resultado;
        }


        /// <summary>
        /// Funcion que obtiene variable de primer grado y coeficiente
        /// </summary>
        /// <param name="x"></param>
        /// <returns></returns>
        private string VariablePrimerGrado(double x)
        {
            string ecuacion = String.Empty;
            //Variable de primer grado
            double auxX = 0;
            if (x < 0)
            {
                auxX = (2) * (x);
            }
            else
            {
                auxX = (-2) * x;
            }
            //Coeficiente
            double coef = Math.Abs(Math.Pow(x, 2));

            ecuacion = auxX.ToString() + ';' + coef.ToString();

            return ecuacion;

        }

        /// <summary>
        /// Funcion que obtiene el discriminante de una ecuacion cuadratica
        /// </summary>
        /// <param name="b"></param>
        /// <param name="a"></param>
        /// <param name="c"></param>
        /// <returns></returns>
        private double Discriminante(double b, double a, double c)
        {
            double coef = Math.Pow(b, 2);
            double ac = 4 * a * c;
            double discriminante = (coef - ac);

            return discriminante;
        }

        /// <summary>
        /// Funcion que valida numero entre rangos
        /// </summary>
        /// <param name="range1"></param>
        /// <param name="range2"></param>
        /// <param name="n"></param>
        /// <returns></returns>
        private bool ValidatorRange(double range1, double range2, double n)
        {
            bool inRange = false;

            if (range1 <= n && n <= range2)
            {
                inRange = true;
            }

            return inRange;
        }


        /// <summary>
        /// Funcion que obtiene los puntos de interseccion entre una recta y una circunferencia
        /// </summary>
        /// <param name="x"></param>
        /// <param name="y"></param>
        /// <param name="cx"></param>
        /// <param name="cy"></param>
        /// <param name="ratio"></param>
        /// <returns></returns>
        private void intersectioncurves(float y, float cx, float cy, float ratio, string coordsIzq, string coordsDer)
        {

            //Ecuación de la recta de los puntos obtenidos
            double recta = ecRecta(y);

            //Termino de coeficiente evaluado en la ecuación de circunferencia con respecto a y
            double evTerm = evConstante(recta, cy);

            //Obtención de variable primer grado y coeficiente con respecto a x
            string[] ecuacion = VariablePrimerGrado(cx).Split(';');

            //Construcción de ecuación de segundo grado con respecto a x

            //Variable de primer grado
            double variablePrimerGrado = float.Parse(ecuacion[0]);
            double coefDeVariable = float.Parse(ecuacion[1]);
            //Coeficiente de ecuación
            double coef = (coefDeVariable + evTerm) - ratio;
            //Calculo de discriminante

            double discriminante = Discriminante(variablePrimerGrado, 1, coef);
            string xiIzq = coordsIzq.Split(';')[0];
            string xDer = coordsDer.Split(';')[0];
            if (discriminante > 0)
            {
                double x1 = ((-variablePrimerGrado) + Math.Sqrt(discriminante)) / 2;
                double x2 = ((-variablePrimerGrado) - Math.Sqrt(discriminante)) / 2;
                //string[] puntosy = evaluacionCoordenadasY(x1, cy, cx, ratio, discriminante).Split(';');

                //Validación de coordenadas que no esten fuera de tiny Pattern


                rectaCircPoints puntosIntersectos = new rectaCircPoints();

                if (ValidatorRange(Convert.ToDouble(xiIzq), Convert.ToDouble(xDer), x1))
                {
                    puntosIntersectos.x1 = x1.ToString();
                    puntosIntersectos.y1 = y.ToString();
                }
                else
                {
                    puntosIntersectos.x1 = String.Empty;
                    puntosIntersectos.y1 = String.Empty;
                }

                if (ValidatorRange(Convert.ToDouble(xiIzq), Convert.ToDouble(xDer), x2))
                {
                    puntosIntersectos.x2 = x2.ToString();
                    puntosIntersectos.y2 = y.ToString();

                }
                else
                {
                    puntosIntersectos.x2 = String.Empty;
                    puntosIntersectos.y2 = String.Empty;
                }




                puntosIntersectos.limiteIzq = coordsIzq;
                puntosIntersectos.limiteDer = coordsDer;
                puntosIntersectos.cx = cx;
                puntosIntersectos.cy = cy;




                puntosIntersectos.discriminante = discriminante;
                puntos.Add(puntosIntersectos);



            }
            else if (discriminante == 0)
            {
                double x1 = ((-variablePrimerGrado) + Math.Sqrt(discriminante)) / 2;
                //string puntosy = evaluacionCoordenadasY(x1, cy, cx, ratio, discriminante);
                rectaCircPoints puntosIntersectos = new rectaCircPoints();
                puntosIntersectos.cx = cx;
                puntosIntersectos.cy = cy;
                if (!ValidatorRange(Convert.ToDouble(xiIzq), Convert.ToDouble(xDer), x1))
                {
                    puntosIntersectos.x1 = x1.ToString();
                    puntosIntersectos.y1 = y.ToString();
                }
                else
                {
                    puntosIntersectos.x1 = String.Empty;
                    puntosIntersectos.y1 = String.Empty;
                }
                puntos.Add(puntosIntersectos);

            }



        }

        /// <summary>
        /// Funcion que crea los vertices extremos de un sprue 
        /// </summary>
        /// <param name="cx"></param>
        /// <param name="cy"></param>
        /// <param name="media"></param>
        /// <returns></returns>
        private List<string> creacionVertices(float cx, float cy, float media)
        {
            float mediaLargo = Convert.ToSingle(88.9);

            List<string> vertices = new List<string>();


            //Extremos con respecto a x
            float auxX1 = cx + media;
            float auxX2 = cx - media;

            //Calculo de vertices superiores
            float v1Sup = cy + mediaLargo;
            string verticeSuperior1 = auxX1.ToString() + ';' + v1Sup.ToString();
            vertices.Add(verticeSuperior1);
            string verticeSuperior2 = auxX2.ToString() + ';' + v1Sup.ToString();
            vertices.Add(verticeSuperior2);
            //Calculo de los vertices Inferiores

            float v2Inf = cy - mediaLargo;
            string verticeInferior1 = auxX1.ToString() + ';' + v2Inf.ToString();
            vertices.Add(verticeInferior1);
            string verticeInferior2 = auxX2.ToString() + ';' + v2Inf.ToString();
            vertices.Add(verticeInferior2);



            return vertices;
        }

        /// <summary>
        /// Función de dedicada a buscar las zonas correspondientes a un sprue o un lid
        /// </summary>
        public void findZone()
        {
            puntos.Clear();
            int countLid = DictPosLid.Count();
            int countSprue = DictPosSprue.Count();

            bool findPosition = false;
            float auxX1, auxY1;
            //Buscando LIDs
            foreach (var item in DictPosLid.Keys)
            {
                PosLid x1Lid = DictPosLid[item];
                float x1 = float.Parse(x1Lid.posX1);
                float y1 = float.Parse(x1Lid.posY1);
                string name = x1Lid.nameLid;
                double diameter = DimensionOfObject(name);
                float ratio = Convert.ToSingle(diameter / 2);
                float r = (float)Math.Pow(ratio, 2);
                foreach (var puntos in Limites)
                {
                    string Limitex1 = puntos.Split(';')[0];
                    string Limitey1 = puntos.Split(';')[1];
                    string Limitex2 = puntos.Split(';')[2];
                    string Limitey2 = puntos.Split(';')[3];

                    if (ValidatePoints(float.Parse(Limitey1), x1, y1, r))
                    {
                        intersectioncurves(float.Parse(Limitey1), x1, y1, r, Limitex1 + ';' + Limitey1, Limitex2 + ';' + Limitey2);
                    }


                }



            }
            //Buscando SPRUE
            foreach (var item in DictPosSprue.Keys)
            {
                PosSprue pointSprue = DictPosSprue[item];
                float x1 = float.Parse(pointSprue.posX1);
                float y1 = float.Parse(pointSprue.posY1);
                string name = pointSprue.nameSprue;
                double Longitud = DimensionOfObject(name);
                float media = Convert.ToSingle(Longitud / 2);
                List<string> verticesSprue = creacionVertices(x1, y1, media);
                string vX1 = verticesSprue.ElementAt(0).Split(';')[0];
                string vY1 = verticesSprue.ElementAt(0).Split(';')[1];
                string vX2 = verticesSprue.ElementAt(3).Split(';')[0];
                string vY2 = verticesSprue.ElementAt(3).Split(';')[1];
                foreach (var puntos in Limites)
                {
                    string Limitex1 = puntos.Split(';')[0];
                    string Limitey1 = puntos.Split(';')[1];
                    string Limitex2 = puntos.Split(';')[2];
                    string Limitey2 = puntos.Split(';')[3];

                    validateIntersecctionBetweenLines(Limitex1, Limitex2, Limitey1, vY1, vX1, vX2, vY2);
                }

            }
        }


        public void GuardadoDeDatosExcelYBase(SQLapi.SQL_Bridge SQL)
        {

            Excel.Application xlApp;
            Excel.Workbook xlWorkbook;
            Excel.Worksheet xlWorkSheet;
            Excel.Range range;
            xlApp = new Excel.Application();
            xlWorkbook = xlApp.Workbooks.Open(g_File);
            xlWorkSheet = xlWorkbook.Sheets[1];
            range = xlWorkSheet.UsedRange;

            string[] Header = { "RamCodificacion", "Cod Core", "Entidad_ID", "Profundidad Agujero", "Ref Pos X", "Ref Pos Y", "Ref Pos Z", "Ref Pos A", "Ref Pos B", "Ref Pos C", "DiametroTomaCore[mm]", "PorcentajeDeteccion Core", "Altura Patron Entidad" };
            int id = Convert.ToInt32(range.Cells[range.Rows.Count, 1].Value2.ToString()) + 1;
            int auxID = id;
            int entidad = 14;
            string v1 = "99";
            string v2 = "50";
            int iterador = range.Rows.Count + 1;
            //Ingresando datos en Excel
            //Limite Inferior de Pattern
            foreach (var item in Limites)
            {

                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXER";
                range.Cells[iterador, 3].Value = "12";
                range.Cells[iterador, 4].Value = "0";
                range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.Split(';')[0])).ToString();
                range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.Split(';')[1])).ToString();
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = "0";

                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                range.Cells[iterador, 9].Value = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                range.Cells[iterador, 10].Value = arenaVieja.ToString();
                range.Cells[iterador, 11].Value = "0";
                range.Cells[iterador, 12].Value = "1";
                range.Cells[iterador, 13].Value = "1";
                iterador++;
                id++;


            }

            //Limite superior de Pattern
            foreach (var item in Limites)
            {


                range.Cells[iterador, 1].Value = id;
                range.Cells[iterador, 2].Value = "SANDMIXER";
                range.Cells[iterador, 3].Value = "13";
                range.Cells[iterador, 4].Value = "0";
                range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.Split(';')[2])).ToString();
                range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.Split(';')[3])).ToString();
                range.Cells[iterador, 7].Value = v2;
                range.Cells[iterador, 8].Value = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                range.Cells[iterador, 9].Value = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                range.Cells[iterador, 10].Value = arenaVieja.ToString();
                range.Cells[iterador, 11].Value = "0";
                range.Cells[iterador, 12].Value = "1";
                range.Cells[iterador, 13].Value = "1";
                iterador++;
                id++;
            }
            //Agregando puntos de LIDs
            foreach (var item in puntos)
            {
                if (!String.IsNullOrEmpty(item.x1) && !String.IsNullOrEmpty(item.y1))
                {
                    range.Cells[iterador, 1].Value = id;
                    range.Cells[iterador, 2].Value = "SANDMIXER";
                    range.Cells[iterador, 3].Value = entidad.ToString();
                    range.Cells[iterador, 4].Value = "0";
                    range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.x1)).ToString();
                    range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.y1)).ToString();
                    range.Cells[iterador, 7].Value = v1;
                    range.Cells[iterador, 8].Value = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    range.Cells[iterador, 9].Value = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    range.Cells[iterador, 10].Value = arenaVieja.ToString();
                    range.Cells[iterador, 11].Value = "0";
                    range.Cells[iterador, 12].Value = "1";
                    range.Cells[iterador, 13].Value = "1";
                    iterador++;
                    id++;
                }
                if (!String.IsNullOrEmpty(item.x2) && !String.IsNullOrEmpty(item.y2))
                {

                    range.Cells[iterador, 1].Value = id;
                    range.Cells[iterador, 2].Value = "SANDMIXER";
                    range.Cells[iterador, 3].Value = entidad.ToString();
                    range.Cells[iterador, 4].Value = "0";
                    range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.x2)).ToString();
                    range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.y2)).ToString();
                    range.Cells[iterador, 7].Value = v1;
                    range.Cells[iterador, 8].Value = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    range.Cells[iterador, 9].Value = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    range.Cells[iterador, 10].Value = arenaVieja.ToString();
                    range.Cells[iterador, 11].Value = "0";
                    range.Cells[iterador, 12].Value = "1";
                    range.Cells[iterador, 13].Value = "1";
                    iterador++;
                    id++;
                }

                entidad++;
            }

            //Agregando rectas sprue
            int idSprue = 0;
            foreach (var item in rectasSprue)
            {
                if (idSprue.Equals(item.id))
                {
                    range.Cells[iterador, 1].Value = id;
                    range.Cells[iterador, 2].Value = "SANDMIXER";
                    range.Cells[iterador, 3].Value = entidad.ToString();
                    range.Cells[iterador, 4].Value = "0";
                    range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
                    range.Cells[iterador, 7].Value = v2;
                    range.Cells[iterador, 8].Value = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    range.Cells[iterador, 9].Value = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    range.Cells[iterador, 10].Value = arenaVieja.ToString();
                    range.Cells[iterador, 11].Value = "0";
                    range.Cells[iterador, 12].Value = "1";
                    range.Cells[iterador, 13].Value = "1";
                    iterador++;
                    id++;



                }
                else
                {
                    range.Cells[iterador, 1].Value = id;
                    range.Cells[iterador, 2].Value = "SANDMIXER";
                    range.Cells[iterador, 3].Value = entidad.ToString();
                    range.Cells[iterador, 4].Value = "0";
                    range.Cells[iterador, 5].Value = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    range.Cells[iterador, 6].Value = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
                    range.Cells[iterador, 7].Value = v2;
                    range.Cells[iterador, 8].Value = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    range.Cells[iterador, 9].Value = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    range.Cells[iterador, 10].Value = arenaVieja.ToString();
                    range.Cells[iterador, 11].Value = "0";
                    range.Cells[iterador, 12].Value = "1";
                    range.Cells[iterador, 13].Value = "1";


                    entidad++;
                    iterador++;
                    id++;
                }
            }

            xlWorkbook.SaveAs(g_File);
            xlWorkbook.Close(0);
            xlApp.Quit();

            //Ingresando datos en BDD

            entidad = 14;



            string nameTable = g_nameFile.Split('.')[0];

            //Limite Inferior de Pattern
            foreach (var item in Limites)
            {
                string[] vector_info = new string[13];
                vector_info[0] = auxID.ToString();
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "12";
                vector_info[3] = "0";
                vector_info[4] = Convert.ToInt32(float.Parse(item.Split(';')[0])).ToString();
                vector_info[5] = Convert.ToInt32(float.Parse(item.Split(';')[1])).ToString();
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";

                SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                auxID++;
            }

            //Limite superior de Pattern
            foreach (var item in Limites)
            {
                string[] vector_info = new string[13];
                vector_info[0] = auxID.ToString();
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "13";
                vector_info[3] = "0";
                vector_info[4] = Convert.ToInt32(float.Parse(item.Split(';')[2])).ToString();
                vector_info[5] = Convert.ToInt32(float.Parse(item.Split(';')[3])).ToString();
                vector_info[6] = v2;
                vector_info[7] = "0";
                double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                vector_info[8] = arenaNueva.ToString();
                double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                vector_info[9] = arenaVieja.ToString();
                vector_info[10] = "0";
                vector_info[11] = "1";
                vector_info[12] = "1";
                SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                auxID++;
            }
            //Agregando puntos de LIDs
            foreach (var item in puntos)
            {
                if (!String.IsNullOrEmpty(item.x1) && !String.IsNullOrEmpty(item.y1))
                {
                    string[] vector_info = new string[13];
                    vector_info[0] = auxID.ToString();
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.x1)).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.y1)).ToString();
                    vector_info[6] = v1;
                    vector_info[7] = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    vector_info[8] = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    vector_info[9] = arenaVieja.ToString();
                    vector_info[10] = "0";
                    vector_info[11] = "1";
                    vector_info[12] = "1";
                    SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                    auxID++;
                }
                if (!String.IsNullOrEmpty(item.x2) && !String.IsNullOrEmpty(item.y2))
                {
                    string[] vector_info = new string[13];
                    vector_info[0] = auxID.ToString();
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.x2)).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.y2)).ToString();
                    vector_info[6] = v1;
                    vector_info[7] = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    vector_info[8] = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    vector_info[9] = arenaVieja.ToString();
                    vector_info[10] = "0";
                    vector_info[11] = "1";
                    vector_info[12] = "1";
                    SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                    auxID++;
                }

                entidad++;
            }

            //Agregando rectas sprue
            idSprue = 0;
            foreach (var item in rectasSprue)
            {
                if (idSprue.Equals(item.id))
                {
                    string[] vector_info = new string[13];
                    vector_info[0] = auxID.ToString();
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
                    vector_info[6] = v1;
                    vector_info[7] = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    vector_info[8] = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    vector_info[9] = arenaVieja.ToString();
                    vector_info[10] = "0";
                    vector_info[11] = "1";
                    vector_info[12] = "1";
                    SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                    auxID++;
                }
                else
                {
                    string[] vector_info = new string[13];
                    vector_info[0] = auxID.ToString();
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
                    vector_info[6] = v1;
                    vector_info[7] = "0";
                    double arenaNueva = Math.Round((CalculoTiempoPermanencia() * 0.3));
                    vector_info[8] = arenaNueva.ToString();
                    double arenaVieja = Math.Round((CalculoTiempoPermanencia() * 0.7));
                    vector_info[9] = arenaVieja.ToString();
                    vector_info[10] = "0";
                    vector_info[11] = "1";
                    vector_info[12] = "1";
                    SQL.Set_Data_To_BD(nameTable, Header, vector_info);
                    auxID++;
                    entidad++;
                }
            }




        }



        /// <summary>
        /// Funcion que guarda datos en receta
        /// </summary>
        public void GuardadoDeDatosExcel(ExcelClass excel)
        {

            ExcelClass excelClass = excel;
            int entidad = 14;
            string v1 = "99";
            string v2 = "50";


            //Limite Inferior de Pattern
            foreach (var item in Limites)
            {
                string[] vector_info = new string[13];
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "12";
                vector_info[3] = "0";
                vector_info[4] = Convert.ToInt32(float.Parse(item.Split(';')[0])).ToString();
                vector_info[5] = Convert.ToInt32(float.Parse(item.Split(';')[1])).ToString();
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

            //Limite superior de Pattern
            foreach (var item in Limites)
            {
                string[] vector_info = new string[13];
                vector_info[1] = "SANDMIXER";
                vector_info[2] = "13";
                vector_info[3] = "0";
                vector_info[4] = Convert.ToInt32(float.Parse(item.Split(';')[2])).ToString();
                vector_info[5] = Convert.ToInt32(float.Parse(item.Split(';')[3])).ToString();
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
            //Agregando puntos de LIDs
            foreach (var item in puntos)
            {
                if (!String.IsNullOrEmpty(item.x1) && !String.IsNullOrEmpty(item.y1))
                {
                    string[] vector_info = new string[13];
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.x1)).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.y1)).ToString();
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
                if (!String.IsNullOrEmpty(item.x2) && !String.IsNullOrEmpty(item.y2))
                {
                    string[] vector_info = new string[13];
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.x2)).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.y2)).ToString();
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

                entidad++;
            }

            //Agregando rectas sprue
            int idSprue = 0;
            foreach (var item in rectasSprue)
            {
                if (idSprue.Equals(item.id))
                {
                    string[] vector_info = new string[13];
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
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
                else
                {
                    string[] vector_info = new string[13];
                    vector_info[1] = "SANDMIXER";
                    vector_info[2] = entidad.ToString();
                    vector_info[3] = "0";
                    vector_info[4] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[0])).ToString();
                    vector_info[5] = Convert.ToInt32(float.Parse(item.punto1.Split(';')[1])).ToString();
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

                    entidad++;
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
            if (g_heightPattern != 0)
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

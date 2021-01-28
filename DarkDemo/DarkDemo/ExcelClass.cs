using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace DarkDemo
{
    class ExcelClass
    {

        /// <summary>
        ///  Celdas de la BDD
        /// </summary>
        public string[] Pallet_1 = new string[] {"F5","G5","H5",
                                                "F6","G6","H6",
                                                "F7","G7","G7"};

        public string[] Pallet_2 = new string[] {  "F13","G13","H13",
                                                "F14","G14","H14",
                                                "F15","G15","G15"};

        public string[] Pallet_3 = new string[] {  "F21","G21","H21",
                                                "F22","G22","H22",
                                                "F23","G23","G23"};

        public string[] Pallet_4 = new string[] {  "K5","L5","M5",
                                                "K6","L6","M6",
                                                "K7","L7","M7"};

        public string[] Pallet_5 = new string[] {  "K13","L13","M13",
                                                "K14","L14","H14",
                                                "K15","L15","M15"};

        public string[] Pallet_6 = new string[] {  "K21","L21","H21",
                                                  "K22","L22","M22",
                                                  "K23","L23","M23"};


        public string[] g_Cabecera = new string[13];
        public int Index_base_datos = 2;

        Microsoft.Office.Interop.Excel.Application Mi_Excel = default(Microsoft.Office.Interop.Excel.Application);
        // Creamos un objeto WorkBook. Para crear el documento Excel.           
        Microsoft.Office.Interop.Excel.Workbook LibroExcel = default(Microsoft.Office.Interop.Excel.Workbook);
        // Creamos un objeto WorkSheet. Para crear la hoja del documento.
        Microsoft.Office.Interop.Excel.Worksheet HojaExcel = default(Microsoft.Office.Interop.Excel.Worksheet);




        public void init_Vars()
        {


            g_Cabecera[0] = "RamCodificacion";
            g_Cabecera[1] = "Cod Core";
            g_Cabecera[2] = "Entidad_ID";
            g_Cabecera[3] = "Profundidad Agujero";
            g_Cabecera[4] = "Ref Pos X";
            g_Cabecera[5] = "Ref Pos Y";
            g_Cabecera[6] = "Ref Pos Z";
            g_Cabecera[7] = "Ref Pos A";
            g_Cabecera[8] = "Ref Pos B";
            g_Cabecera[9] = "Ref Pos C";
            g_Cabecera[10] = "DiametroTomaCore[mm]";
            g_Cabecera[11] = "PorcentajeDeteccion Core";
            g_Cabecera[12] = "Altura Patron Entidad";
        }



        public void ejemplodeuso()
        {



            Microsoft.Office.Interop.Excel.Application Mi_Excel = default(Microsoft.Office.Interop.Excel.Application);
            // Creamos un objeto WorkBook. Para crear el documento Excel.           
            Microsoft.Office.Interop.Excel.Workbook LibroExcel = default(Microsoft.Office.Interop.Excel.Workbook);
            // Creamos un objeto WorkSheet. Para crear la hoja del documento.
            Microsoft.Office.Interop.Excel.Worksheet HojaExcel = default(Microsoft.Office.Interop.Excel.Worksheet);


            // Iniciamos una instancia a Excel, y Hacemos visibles para ver como se va creando el reporte, 
            // podemos hacerlo visible al final si se desea.
            Mi_Excel = new Microsoft.Office.Interop.Excel.Application();


            /* Ahora creamos un nuevo documento y seleccionamos la primera hoja del 
             * documento en la cual crearemos nuestro informe. 
             */
            // Creamos una instancia del Workbooks de excel.            
            LibroExcel = Mi_Excel.Workbooks.Add();
            // Creamos una instancia de la primera hoja de trabajo de excel            
            HojaExcel = LibroExcel.Worksheets[1];
            HojaExcel.Visible = Microsoft.Office.Interop.Excel.XlSheetVisibility.xlSheetVisible;

            // Hacemos esta hoja la visible en pantalla 
            // (como seleccionamos la primera esto no es necesario
            // si seleccionamos una diferente a la primera si lo
            // necesitariamos).
            HojaExcel.Activate();

            // Crear el encabezado de nuestro informe.
            // La primera línea une las celdas y las convierte un en una sola.            
            HojaExcel.Range["A1:E1"].Merge();
            // La segunda línea Asigna el nombre del encabezado.
            HojaExcel.Range["A1:E1"].Value = "----------------------------------------------";
            // La tercera línea asigna negrita al titulo.
            HojaExcel.Range["A1:E1"].Font.Bold = true;
            // La cuarta línea signa un Size a titulo de 15.
            HojaExcel.Range["A1:E1"].Font.Size = 15;

            // Crear el subencabezado de nuestro informe
            HojaExcel.Range["A2:E2"].Merge();
            HojaExcel.Range["A2:E2"].Value = "ENCUESTA DE SATISFACCIÓN AL CLIENTE EXTERNO";
            HojaExcel.Range["A2:E2"].Font.Italic = true;
            HojaExcel.Range["A2:E2"].Font.Size = 13;

            Microsoft.Office.Interop.Excel.Range objCelda = HojaExcel.Range["A3", Type.Missing];
            objCelda.Value = "ID";

            objCelda = HojaExcel.Range["B3", Type.Missing];
            objCelda.Value = "Preguntas";

            objCelda = HojaExcel.Range["C3", Type.Missing];
            objCelda.Value = "Opciones";

            objCelda = HojaExcel.Range["D3", Type.Missing];
            objCelda.Value = "Valor de la Respuesta";

            objCelda = HojaExcel.Range["E3", Type.Missing];
            objCelda.Value = "Numero Votos";

            objCelda.EntireColumn.NumberFormat = "###,###,###.00";

            int i = 4;
            /*
                                  foreach (DataRow Row in DS.Tables[0].Rows)
                                   {
                                       // Asignar los valores de los registros a las celdas
                                       HojaExcel.Cells[i, "A"] = Row.ItemArray[0];
                                       // ID
                                       HojaExcel.Cells[i, "B"] = Row.ItemArray[1];
                                       // Pregunta
                                       HojaExcel.Cells[i, "C"] = Row.ItemArray[2];
                                       // Opciones
                                       HojaExcel.Cells[i, "D"] = Row.ItemArray[3];
                                       // Valor de la Respuesta
                                       HojaExcel.Cells[i, "E"] = Row.ItemArray[4];
                                       // Numero Votos

                                       // Avanzamos una fila
                                       i++;
                                   }
              */
            // Seleccionar todo el bloque desde A1 hasta D #de filas.
            Microsoft.Office.Interop.Excel.Range Rango = HojaExcel.Range["A3:E" + (i - 1).ToString()];

            // Selecionado todo el rango especificado
            Rango.Select();

            // Ajustamos el ancho de las columnas al ancho máximo del
            // contenido de sus celdas
            Rango.Columns.AutoFit();

            // Asignar filtro por columna
            Rango.AutoFilter(1);

            // Crear un total general
            LibroExcel.PrintPreview();

            Mi_Excel.Quit();


        }


        /// <summary>
        /// Se genera el excel de la base de datos dinamica
        /// </summary>
        /// <param name="data_BD_Dinamica"></param>
        /// <returns></returns>
        public string Crear_Excel_Bdd(Data_BD_Dinamica data_BD_Dinamica)
        {



            #region ////////////  ->  Metodologia necesaria para  generar el excel. <-  //////////// 


            Microsoft.Office.Interop.Excel.Application Mi_Excel = default(Microsoft.Office.Interop.Excel.Application);
            // Creamos un objeto WorkBook. Para crear el documento Excel.           
            Microsoft.Office.Interop.Excel.Workbook LibroExcel = default(Microsoft.Office.Interop.Excel.Workbook);
            // Creamos un objeto WorkSheet. Para crear la hoja del documento.
            Microsoft.Office.Interop.Excel.Worksheet HojaExcel = default(Microsoft.Office.Interop.Excel.Worksheet);


            // Iniciamos una instancia a Excel, y Hacemos visibles para ver como se va creando el reporte, 
            // podemos hacerlo visible al final si se desea.
            Mi_Excel = new Microsoft.Office.Interop.Excel.Application();
            Mi_Excel.Visible = false;

            /* Ahora creamos un nuevo documento y seleccionamos la primera hoja del 
             * documento en la cual crearemos nuestro informe. 
             */
            // Creamos una instancia del Workbooks de excel.            
            LibroExcel = Mi_Excel.Workbooks.Add();
            // Creamos una instancia de la primera hoja de trabajo de excel            
            HojaExcel = LibroExcel.Worksheets[1];
            HojaExcel.Visible = Microsoft.Office.Interop.Excel.XlSheetVisibility.xlSheetVisible;
            HojaExcel.Name = "BD DINAMICA";
            // Hacemos esta hoja la visible en pantalla 
            // (como seleccionamos la primera esto no es necesario
            // si seleccionamos una diferente a la primera si lo
            // necesitariamos).
            HojaExcel.Activate();


            // Crear el subencabezado de nuestro informe

            string Celdas = "A3:B3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "Lista Patterns";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            Celdas = "C3";

            HojaExcel.Range[Celdas].Value = "Pos Sprue";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            Celdas = "D3";

            HojaExcel.Range[Celdas].Value = "Repeticiones";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            int N_patterns = 40, celdaInit = 4;

            for (int j = 0; j < N_patterns; j++)
            {
                HojaExcel.Range["A" + (celdaInit + j).ToString()].Value = (j + 1).ToString();
            }

            #endregion


            //////////////////////////////////////////
            /// Celdas de  base de datos dinamica
            /////////////////////////////////////////
            /// Creo la seccion de nombres
            Set_Entidades_Excel(HojaExcel);
            Set_Cantidades_Excel(HojaExcel);
            Set_Apilados_Excel(HojaExcel);

            string Fecha_Actual = DateTime.Now.ToLongDateString();
            string Path_File = "BDD MGTX " + Fecha_Actual + " " + DateTime.Now.Hour.ToString() + "_" + DateTime.Now.Minute.ToString() + "_" + DateTime.Now.Second.ToString();



            ////////////////////////////////////////////////
            //// Ingreso cada dato en el excel
            ////////////////////////////////////////////////

            /////////////////////////////////////////////
            //// Patterns
            ///////////////////////////////////////////
            int Objeto_lista = 0, elemento_Lista = 1;
            for (int fila = 0; fila < data_BD_Dinamica.Pattern_list.Count; fila++)
            {
                int Columna_Initi = 2, Columna_end = 4;
                elemento_Lista = 1;
                for (int Columna = Columna_Initi; Columna <= Columna_end; Columna++)
                {
                    HojaExcel.Cells[fila + 4, Columna].Value = data_BD_Dinamica.Pattern_list[Objeto_lista][elemento_Lista];
                    elemento_Lista++;
                }

                Objeto_lista++;
            }


            /////////////////////////////////////////////
            //// Ingreso Elementos
            ////////////////////////////////////////////

            int FilaInit = 5, ColumnaInit = 6, N_Pallet = 1;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }

            FilaInit = 5; ColumnaInit = 11; N_Pallet = 4;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }

            /////////////////////////////////////////////
            //// Ingreso Cantidades
            ////////////////////////////////////////////
            FilaInit = 5; ColumnaInit = 16; N_Pallet = 1;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets_Cantidad[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }

            FilaInit = 5; ColumnaInit = 21; N_Pallet = 4;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets_Cantidad[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }


            /////////////////////////////////////////////
            //// Ingreso Apilados
            ////////////////////////////////////////////
            FilaInit = 5; ColumnaInit = 26; N_Pallet = 1;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets_Apilado[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }

            FilaInit = 5; ColumnaInit = 31; N_Pallet = 4;
            for (int Fila = FilaInit; Fila < 22; Fila = Fila + 8)
            {

                int Segmento = 1;
                for (int Aux_fila = 0; Aux_fila < 3; Aux_fila++)
                {

                    for (int Columna = ColumnaInit; Columna < ColumnaInit + 3; Columna++)
                    {
                        HojaExcel.Cells[Fila + Aux_fila, Columna].Value = data_BD_Dinamica.Pallets_Apilado[N_Pallet][Segmento];
                        Segmento++;
                    }

                }

                N_Pallet++;
            }


            ////////////////////////
            //// Save Excel
            ////////////////////////
            string PathFile_Excel = Save_Excel_File(LibroExcel, Path_File);


            Mi_Excel.Quit();

            return PathFile_Excel;




        }


        /// <summary>
        /// Guarda el arvhico Excel en la ryta definida
        /// Procedimiento Cierra el excel una ve guardado.
        /// </summary>
        /// <param name="LibroExcel"></param>
        /// <param name="Path_File"></param>
        private string Save_Excel_File(Microsoft.Office.Interop.Excel.Workbook LibroExcel, string Path_File)
        {
            try
            {
                g_PathUltimoExcel = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\" + Path_File + ".xlsx";

                LibroExcel.SaveAs(g_PathUltimoExcel,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    false,
                    false,
                    Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlShared,
                    false,
                    false,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value);


                LibroExcel.Close(false, g_PathUltimoExcel, false);
            }
            catch (Exception)
            {


            }


            return g_PathUltimoExcel;

        }


        /// <summary>
        /// Se genera la seccion de codigo de entidades (nombre de cada core)
        /// </summary>
        /// <param name="HojaExcel"></param>
        /// <returns></returns>
        private static string Set_Entidades_Excel(Microsoft.Office.Interop.Excel.Worksheet HojaExcel)
        {
            string Celdas = "E2:M2";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "Codigo de entidades a utilizar";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            Celdas = "E3:H3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 1";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "E"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "F"] = "C1"; HojaExcel.Cells[4, "G"] = "C2"; HojaExcel.Cells[4, "H"] = "C3";


            Celdas = "J3:M3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 4";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "J"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "K"] = "C1"; HojaExcel.Cells[4, "L"] = "C2"; HojaExcel.Cells[4, "M"] = "C3";




            Celdas = "E11:H11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 2";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "E"] = "F" + (q - 12).ToString();
            }

            HojaExcel.Cells[12, "F"] = "C1"; HojaExcel.Cells[12, "G"] = "C2"; HojaExcel.Cells[12, "H"] = "C3";




            Celdas = "J11:M11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 5";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "J"] = "F" + (q - 13).ToString();
            }

            HojaExcel.Cells[12, "K"] = "C1"; HojaExcel.Cells[12, "L"] = "C2"; HojaExcel.Cells[12, "M"] = "C3";



            Celdas = "E19:H19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 3";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "E"] = "F" + (q - 20).ToString();
            }

            HojaExcel.Cells[20, "F"] = "C1"; HojaExcel.Cells[20, "G"] = "C2"; HojaExcel.Cells[20, "H"] = "C3";




            Celdas = "J19:M19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 6";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "J"] = "F" + (q - 20).ToString();
            }

            HojaExcel.Cells[20, "K"] = "C1"; HojaExcel.Cells[20, "L"] = "C2"; HojaExcel.Cells[20, "M"] = "C3";
            return Celdas;
        }
        private static string Set_Cantidades_Excel(Microsoft.Office.Interop.Excel.Worksheet HojaExcel)
        {
            string Celdas = "O2:W2";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "Numero de entidades por codigo a utilizar";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            Celdas = "O3:R3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 1";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "O"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "P"] = "C1"; HojaExcel.Cells[4, "Q"] = "C2"; HojaExcel.Cells[4, "R"] = "C3";


            Celdas = "T3:W3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 4";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "T"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "U"] = "C1"; HojaExcel.Cells[4, "V"] = "C2"; HojaExcel.Cells[4, "W"] = "C3";




            Celdas = "O11:R11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 2";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "O"] = "F" + (q - 12).ToString();
            }

            HojaExcel.Cells[12, "P"] = "C1"; HojaExcel.Cells[12, "Q"] = "C2"; HojaExcel.Cells[12, "R"] = "C3";





            Celdas = "T11:W11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 5";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "T"] = "F" + (q - 12).ToString();
            }

            HojaExcel.Cells[12, "U"] = "C1"; HojaExcel.Cells[12, "V"] = "C2"; HojaExcel.Cells[12, "W"] = "C3";



            Celdas = "O19:R19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 3";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "O"] = "F" + (q - 20).ToString();
            }
            HojaExcel.Cells[20, "P"] = "C1"; HojaExcel.Cells[20, "Q"] = "C2"; HojaExcel.Cells[20, "R"] = "C3";





            Celdas = "T19:W19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 6";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "T"] = "F" + (q - 20).ToString();
            }

            HojaExcel.Cells[20, "U"] = "C1"; HojaExcel.Cells[20, "V"] = "C2"; HojaExcel.Cells[20, "W"] = "C3";
            return Celdas;
        }
        private static string Set_Apilados_Excel(Microsoft.Office.Interop.Excel.Worksheet HojaExcel)
        {
            string Celdas = "Y2:AG2";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "¿Tipo de cores Apilados?";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            Celdas = "Y3:AB3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 1";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "Y"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "Z"] = "C1"; HojaExcel.Cells[4, "AA"] = "C2"; HojaExcel.Cells[4, "AB"] = "C3";


            Celdas = "AD3:AG3";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 4";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 5; q < 8; q++)
            {
                HojaExcel.Cells[q, "AD"] = "F" + (q - 4).ToString();
            }

            HojaExcel.Cells[4, "AE"] = "C1"; HojaExcel.Cells[4, "AF"] = "C2"; HojaExcel.Cells[4, "AG"] = "C3";




            Celdas = "Y11:AB11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 2";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;
            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "O"] = "F" + (q - 12).ToString();
            }
            HojaExcel.Cells[12, "Z"] = "C1"; HojaExcel.Cells[12, "AA"] = "C2"; HojaExcel.Cells[12, "AB"] = "C3";





            Celdas = "AD11:AG11";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 5";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;

            int mxm = 3;
            for (int q = 13; q < 16; q++)
            {
                HojaExcel.Cells[q, "AD"] = "F" + (q - 13).ToString();
            }

            HojaExcel.Cells[4, "AE"] = "C1"; HojaExcel.Cells[4, "AF"] = "C2"; HojaExcel.Cells[4, "AG"] = "C3";


            Celdas = "Y19:AB19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 3";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "Y"] = "F" + (q - 20).ToString();
            }
            HojaExcel.Cells[20, "Z"] = "C1"; HojaExcel.Cells[20, "AA"] = "C2"; HojaExcel.Cells[20, "AB"] = "C3";





            Celdas = "AD19:AG19";
            HojaExcel.Range[Celdas].Merge();
            HojaExcel.Range[Celdas].Value = "PALLET 6";
            HojaExcel.Range[Celdas].Font.Italic = true;
            HojaExcel.Range[Celdas].Font.Size = 13;


            for (int q = 21; q < 24; q++)
            {
                HojaExcel.Cells[q, "AD"] = "F" + (q - 20).ToString();
            }

            HojaExcel.Cells[20, "AD"] = "C1"; HojaExcel.Cells[20, "AE"] = "C2"; HojaExcel.Cells[20, "AG"] = "C3";
            return Celdas;
        }

        /// <summary>
        /// Se crea el archivo inicial con la cabecera
        /// </summary>
        /// <param name="Nombre_Pattern"></param>
        public void Crear_Bd_Estatica(string Nombre_Pattern)
        {
            init_Vars();


            // Iniciamos una instancia a Excel, y Hacemos visibles para ver como se va creando el reporte, 
            // podemos hacerlo visible al final si se desea.

            Mi_Excel = new Microsoft.Office.Interop.Excel.Application();

            //  Mi_Excel.Visible = true;

            /* Ahora creamos un nuevo documento y seleccionamos la primera hoja del 
             * documento en la cual crearemos nuestro informe. 
             */
            // Creamos una instancia del Workbooks de excel.            
            LibroExcel = Mi_Excel.Workbooks.Add();
            // Creamos una instancia de la primera hoja de trabajo de excel            
            HojaExcel = LibroExcel.Worksheets[1];
            HojaExcel.Visible = Microsoft.Office.Interop.Excel.XlSheetVisibility.xlSheetVisible;
            HojaExcel.Name = Nombre_Pattern;
            // Hacemos esta hoja la visible en pantalla 
            // (como seleccionamos la primera esto no es necesario
            // si seleccionamos una diferente a la primera si lo
            // necesitariamos).
            HojaExcel.Activate();


            /// Insertar Cabecera
            for (int i = 0; i < g_Cabecera.Length; i++)
            {

                HojaExcel.Cells[1, i + 1] = g_Cabecera[i];

            }


        }

        /// <summary>
        /// Insertar datos a excel respecto a coordenadas de llenado de pattern con arena
        /// </summary>
        public void insert_Arenado()
        {

        }


        /// <summary>
        /// Se inserta la info en el Index_base_datos actual
        /// </summary>
        /// <param name="Vector_info"></param>
        public void Insertar_Info(string[] Vector_info)
        {


            try
            {

                Vector_info[0] = (Index_base_datos - 1).ToString();

                for (int i = 0; i < g_Cabecera.Length; i++)
                {
                    HojaExcel.Cells[Index_base_datos, i + 1] = Vector_info[i];
                }


                Index_base_datos = Index_base_datos + 1;


            }
            catch (Exception ex)
            {


            }


        }


        public List<string> inspectExcel()
        {
            //Ingreso a excel
            Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;
            List<string> datos = new List<string>();
            int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count ;
            int column = g_Cabecera.Length;

            for (int i = 1; i < row; i++)
            {
                for (int j = 1; j < column; j++)
                {
                    datos.Add((mirango.Cells[i +1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString());
                }

            }
            return datos;
        }


        public int Erase_Last_Row()
        {

            for (int i = 0; i < g_Cabecera.Length; i++)
            {
                HojaExcel.Cells[Index_base_datos, i + 1] = "";
            }
            Index_base_datos = Index_base_datos - 1;

            return Index_base_datos;
        }



        public string g_PathUltimoExcel;

        /// <summary>
        /// Guardar el Excel.
        /// </summary>
        /// <param name="Nombre"></param>
        public string Save_Excel(string Nombre)
        {


            try
            {
                //    Mi_Excel.DisplayAlerts = false;
                //g_PathUltimoExcel = @"C:\Users\Vision MGTX\Dropbox\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\" + Nombre + ".xlsx"; 
                g_PathUltimoExcel = @"C:\Vision MGTX\" + Nombre + ".xlsx";
                //      g_PathUltimoExcel = @"C:\Users\Usuario\Dropbox (MIRS)\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\" + Nombre + ".xlsx";

                if (File.Exists(g_PathUltimoExcel))
                {
                    File.Delete(g_PathUltimoExcel);
                }
                LibroExcel.SaveAs(g_PathUltimoExcel,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    false,
                    false,
                    Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlShared,
                    false,
                    false,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value);


                LibroExcel.Close(false, g_PathUltimoExcel, false);

                return g_PathUltimoExcel;
            }
            catch (Exception)
            {

                return g_PathUltimoExcel;
            }


        }

        public string Save_Excel(string Nombre, bool CloseExcel)
        {


            try
            {
                //    Mi_Excel.DisplayAlerts = false;
                string PathBackup = @"D:\AI\Vision Artificial\4.-MAGOTTEAUX\Backup_recipie\" + Nombre + ".xlsx";
                //string PathBackup = @"C:\Users\Vision MGTX\" + Nombre + ".xlsx";
                //      g_PathUltimoExcel = @"C:\Users\Usuario\Dropbox (MIRS)\1.-Servidor Desarrollo Software\7.-Magotteaux\1.- BD\" + Nombre + ".xlsx";

                if (File.Exists(PathBackup))
                {
        //           File.Delete(PathBackup);
                }
                LibroExcel.SaveAs(PathBackup,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    false,
                    false,
                    Microsoft.Office.Interop.Excel.XlSaveAsAccessMode.xlShared,
                    false,
                    false,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value,
                    System.Reflection.Missing.Value);

                if (CloseExcel)
                {
                    LibroExcel.Close(false, PathBackup, false);

                }

                return PathBackup;
            }
            catch (Exception err)
            {

                return null;
            }


        }




        /// <summary>
        /// Mostrar/Ocultar el excel
        /// </summary>
        /// <param name="Show"></param>
        public void Show_Excel(bool Show)
        {
            try
            {

                Mi_Excel.Visible = Show;
            }
            catch (Exception err)
            {
                MessageBox.Show(err.Message, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
               
            }
        }


        /// <summary>
        ///  Se obtiene la  las filas totales  con el numero de entidad.
        /// </summary>
        /// <returns></returns>
        public int[] Get_elemetos_totales()
        {
            int[] Elementos_totales = new int[20];


            try
            {
                int N_elementos = 500;

                Microsoft.Office.Interop.Excel.Range Rango = HojaExcel.Range["C" + N_elementos.ToString() + ":C1"];

                var dato = Rango.Value;

                for (int i = 0; i < Elementos_totales.Length; i++) { Elementos_totales[i] = 0; }

                for (int i = 2; i < N_elementos; i++)
                {

                    string Number_extracted = Convert.ToString(dato[i, 1]);

                    if (Number_extracted != null)
                    {
                        int N_Entidad = Convert.ToInt16(Number_extracted);

                        switch (N_Entidad)
                        {
                            case Form1.g_LOC_ent:     // Localizador
                                Elementos_totales[Form1.g_LOC_ent]++;
                                break;


                            case Form1.g_CORE_ent:     // Core
                                Elementos_totales[Form1.g_CORE_ent]++;
                                break;

                            case Form1.g_SLEEVE_ent:     // Manga
                                Elementos_totales[Form1.g_SLEEVE_ent]++;
                                break;
                            case Form1.g_SPRUE_ent:     // Sprue
                                Elementos_totales[Form1.g_SPRUE_ent]++;
                                break;
                            case Form1.g_NUMBER_ent:     // Numero
                                Elementos_totales[Form1.g_NUMBER_ent]++;
                                break;
                            case Form1.g_PIN1_ent:     // PIN1
                                Elementos_totales[Form1.g_PIN1_ent]++;
                                break;
                            case Form1.g_PIN2_ent:     // PIN2
                                Elementos_totales[Form1.g_PIN2_ent]++;
                                break;
                            case Form1.g_LID_ent:     // Tapa
                                Elementos_totales[Form1.g_LID_ent]++;
                                break;

                            case 9:     // No Asignado

                                break;

                            case Form1.g_PATTERN_ent:     // PATTERNDIMENSION
                                Elementos_totales[Form1.g_PATTERN_ent]++;
                                break;

                            case 11:     // No Asignado

                                break;

                            case Form1.g_CoreVertical:     // Cores verticales
                                Elementos_totales[Form1.g_CoreVertical]++;
                                break;


                        }
                    }
                }




            }
            catch (Exception)
            {

            }


            return Elementos_totales;


        }



        /// <summary>
        /// Cerrar la clase y los excels abiertos
        /// 
        /// </summary>
        public void CloseExel()
        {
            try
            {

                LibroExcel.Close(false, null, null);
                Mi_Excel.Quit();

            }
            catch (Exception)
            {


            }

        }


        #region ########### Funciones de validación ########################



        /// <summary>
        /// Funcion que calcula la distancia entre puntos
        /// </summary>
        /// <param name="x1"></param>
        /// <param name="x2"></param>
        /// <param name="y1"></param>
        /// <param name="y2"></param>
        /// <returns></returns>
        public double distanceBetweenPoints(string x1, string x2, string y1, string y2)
        {

            int X1, X2, Y1, Y2;
            if (Int32.Parse(x1) > Int32.Parse(x2))
            {
                X2 = Int32.Parse(x1);
                X1 = Int32.Parse(x2);

            }
            else
            {
                X1 = Int32.Parse(x1);
                X2 = Int32.Parse(x2);
            }

            if (Int32.Parse(y1) > Int32.Parse(y2))
            {
                Y2 = Int32.Parse(y1);
                Y1 = Int32.Parse(y2);

            }
            else
            {
                Y1 = Int32.Parse(x1);
                Y2 = Int32.Parse(x2);
            }

            double n = Convert.ToDouble(2);
           
            int difx = X2 - X1;
            int dify = Y2 - Y1;
            double cx= Math.Pow(Convert.ToDouble(difx),n);
            double cy = Math.Pow(Convert.ToDouble(dify), n);
            double distancia = Math.Sqrt(cx + cy);

            return distancia;
            
        }


        /// <summary>
        /// Función que obtiene la ultima linea ingresada con sprue
        /// </summary>
        /// <returns></returns>
        public List<string> getlastsprue()
        {
            //Declaracion de lista de sprue
            List<string> listaSprue = new List<string>();

            //Ingreso a excel
            Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;
            //Cantidad de filas en excel
            int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count - 1;
            //Cantidad de filas con sprue repetidas
            int rowspure = 0;
            //Matriz que contiene datos de excel
            string[,] matriz_excel_datos = new string[row, 13];
            //Matriz que contiene solo datos de linea con sprue
            string[,] matrizSprue = new string[row, 13];
            //vector auxiliar para ingresar datos en matriz
            string[] vector_datos = new string[13];
            if (row > 1)
            {
                //insertar datos en matriz
                for (int i = 1; i <= row; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        vector_datos[j] = (mirango.Cells[i + 1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();
                        matriz_excel_datos[i - 1, j] = vector_datos[j];
                    }
                }
                //se recorren y almacenan los datos de la matriz de datos de excel
                for (int i = 0; i < row; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        if (matriz_excel_datos[i, 1].Equals("SPRUE"))
                        {

                            matrizSprue[i, j] = matriz_excel_datos[i, j];
                            rowspure = i;
                        }
                    }

                }
                //se obtiene la ultima fila de matriz de sprue
                for (int i = 0; i <= 12; i++)
                {
                    listaSprue.Add(matrizSprue[rowspure, i]);
                }



            }
            //retorno de ultimo ingreso de linea con sprue en excel
            return listaSprue;
        }



        /// <summary>
        /// Funcion que valida si existen sprue repetidas
        /// </summary>
        /// <param name="isAwhiteRecepie"></param>
        /// <returns></returns>
        public bool getSprueRepetidas(bool isAwhiteRecepie)
        {
            try
            {


                Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;

                int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count - 1;


                string displaySprue = "\n";
                int LargoVector = 1000;
                string[] vector_datos = new string[13];
                string[,] matriz_excel_datos = new string[row, 13];
                List<string> vector_info = new List<string>();
                bool opcionSprue = false;
                string[] vector_filas_sprue = new string[LargoVector];

                //insertar datos en matriz
                for (int i = 1; i <= row; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        vector_datos[j] = (mirango.Cells[i + 1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();
                        matriz_excel_datos[i - 1, j] = vector_datos[j];
                    }
                }

                //comparación vector_info con matriz de datos
                int sprueRep = 0;
                if (row != 1)
                {
                    vector_info = getlastsprue();

                    for (int i = 0; i < row - 1; i++)
                    {
                        if (matriz_excel_datos[i, 1].Equals("SPRUE"))
                        {
                            if (matriz_excel_datos[i, 12].Equals(vector_info[12]) && matriz_excel_datos[i, 1].Equals(vector_info[1]))
                            {

                                vector_filas_sprue[sprueRep] = matriz_excel_datos[i, 0] + ";" + vector_info[0];
                                sprueRep++;
                                opcionSprue = true;

                            }

                        }
                    }
                }

                Array.Resize(ref vector_filas_sprue, sprueRep);


                //mensaje de error conforme resultado de booleano bool

                if (opcionSprue)
                {

                    for (int i = 0; i < vector_filas_sprue.Length; i++)
                    {
                        if (vector_filas_sprue[i] != null)
                        {
                            string[] data = vector_filas_sprue[i].Split(';');
                            if (data[0].Equals(data[1]))
                            {
                                vector_filas_sprue = vector_filas_sprue.Where(x => x != vector_filas_sprue[i]).ToArray();
                                break;
                            }
                            displaySprue = displaySprue + vector_filas_sprue[i] + Environment.NewLine;
                        }
                    }

                    if (!isAwhiteRecepie)
                    {
                        if (!String.IsNullOrEmpty(displaySprue) && !displaySprue.Equals("\n"))
                        {
                            MessageBox.Show("Repeated Sprue:" + displaySprue, "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                            return true;
                        }
                        else
                        {
                            return false;
                        }


                    }

                    
                }
                return false;
            }
            catch (Exception ex)
            {

                return false;
            }

        }

        /// <summary>
        /// Se muestra al usuario las filas repetidas en el excel
        /// </summary>
        public bool Get_FilasRepetidas_Excel(bool isAwhiteRecepie)
        {
            try
            {


                Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;

                int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count - 1;

                string display = "\n";
                int LargoVector = 1000;
                string[] vector_datos = new string[13];
                string[,] matriz_excel_datos = new string[row, 13];
                string[] vector_info = new string[13];
                bool opcion = false;
                bool opcionFilacercana = false;
                string[] vector_filas = new string[LargoVector];
                string[] vector_filas_cercanas = new string[LargoVector];


                //vector info reciviendo ultimo dato enviado a excel

                for (int i = 1; i <= row; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        vector_info[j] = (mirango.Cells[i + 1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();

                    }
                }

                //insertar datos en matriz
                for (int i = 1; i <= row; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        vector_datos[j] = (mirango.Cells[i + 1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();

                        matriz_excel_datos[i - 1, j] = vector_datos[j];

                    }
                }

                //comparación vector_info con matriz de datos
                int filaRep = 0;
                int filacercana = 0;
                if (row != 1)
                {

                    for (int i = 0; i < row - 1; i++)
                    {

                        if (matriz_excel_datos[i, 4].Equals(vector_info[4]) && matriz_excel_datos[i, 5].Equals(vector_info[5]) && matriz_excel_datos[i, 6].Equals(vector_info[6]))
                        {

                            vector_filas[filaRep] = matriz_excel_datos[i, 0] + ";" + vector_info[0];
                            filaRep++;
                            opcion = true;

                        }
                        if (matriz_excel_datos[i,4] != vector_info[4] && matriz_excel_datos[i,5] != vector_info[5])
                        {
                            double distance = this.distanceBetweenPoints(matriz_excel_datos[i,4],vector_info[4],matriz_excel_datos[i,5],vector_info[5]);

                            if (distance < 5)
                            {
                                vector_filas_cercanas[filacercana]= matriz_excel_datos[i, 0] + ";" + vector_info[0];
                                filacercana++;
                                opcionFilacercana = true;
                            }
                        }
                       

                    }
                }

                Array.Resize(ref vector_filas, filaRep);
                Array.Resize(ref vector_filas_cercanas,filacercana);
                //mensaje de error conforme resultado de booleano bool

                if (opcion)
                {
                    for (int i = 0; i < vector_filas.Length; i++)
                    {
                        if (vector_filas[i] != null)
                        {
                            display = display + vector_filas[i] + Environment.NewLine;
                        }
                    }

                    if (!isAwhiteRecepie)
                    {
                        MessageBox.Show("Repeated rows:" + display, "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }

                    return true;
                }
                if (opcionFilacercana)
                {
                    for (int i = 0; i < vector_filas_cercanas.Length; i++)
                    {
                        if (vector_filas_cercanas[i] != null)
                        {
                            display = display + vector_filas_cercanas[i] + Environment.NewLine;
                        }
                    }

                    if (!isAwhiteRecepie)
                    {
                        MessageBox.Show("near rows :" + display, "WARNING", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }

                    return true;
                }


                return false;
            }
            catch (Exception)
            {

                return false;
            }
        }

        /// <summary>
        /// metodo que evita sobreescibir datos en el libro de excel
        /// </summary>
        /// <param name="a">indice  obtnido de combobox bx_num_index_ID desde panel 2</param>
        /// <returns>booleano </returns>
        public bool validate_data_excel(decimal a)
        {


            try
            {
                Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;
                string valor = (mirango.Cells[a + 1, 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();

                return false;
            }
            catch (Exception)
            {


                return true;
            }


        }


        /// <summary>
        /// función que impide que existan indices repetidos en libro de excel
        /// </summary>
        /// <param name="copia"></param>
        public void set_index_excel(decimal a)
        {

            try
            {
                Microsoft.Office.Interop.Excel.Range mirango = HojaExcel.UsedRange;

                int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count - 1;

                string[] vector_info = new string[13];

                //vector info reciviendo penultimo dato enviado a excel

                for (int i = 1; i <= a - 1; i++)
                {
                    for (int j = 0; j <= 12; j++)
                    {
                        vector_info[j] = (mirango.Cells[i + 1, j + 1] as Microsoft.Office.Interop.Excel.Range).Value2.ToString();

                    }
                }

                //comparación vector_info con fila seleccionada           

                if (vector_info[0] == a.ToString())
                {
                    int x = (int)a + 1;
                    vector_info[0] = x.ToString();
                    for (int i = 0; i < g_Cabecera.Length; i++)
                    {
                        HojaExcel.Cells[vector_info[0], i + 1] = vector_info[i];
                    }
                    Index_base_datos = row;


                }


            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }




        }
        /// <summary>
        /// Metodo que evita que se escriban datos saltandose filas 
        /// </summary>
        /// <param name="a"></param>
        /// <returns></returns>
        public bool count_row_excel(decimal a)
        {
            try
            {

                int row = this.HojaExcel.Rows.CurrentRegion.EntireRow.Count - 1;
                int row_adelando = row + 2;
                if (row_adelando <= a)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception)
            {
                return false;

            }
        }


        #endregion
        /// <summary>
        /// setea la celda seleccionada con espacios en blanco
        /// </summary>
        /// <param name="num"></param>
        public void erase_Data_No_ID(decimal num)
        {
            try
            {
                for (int i = 0; i < g_Cabecera.Length; i++)
                {
                    HojaExcel.Cells[num + 1, i + 1] = "";
                }
                Index_base_datos = Index_base_datos - 1;
            }
            catch(Exception ex)
            {
                MessageBox.Show("Problem with ID:" + ex.Message, "ERROR", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }


        /// <summary>
        /// elimina filas y espacio del registro de la fila
        /// </summary>
        /// <param name="a">variable proveniente de combobox bx_num_index_ID </param>
        public void delete_row_data(decimal a)
        {
            try
            {
                if (a == 0)
                {
                    MessageBox.Show("not overwrite  header");
                }
                else
                {
                    try
                    {
                        Microsoft.Office.Interop.Excel.Range cell = (Microsoft.Office.Interop.Excel.Range)Mi_Excel.Rows[a + 1, Type.Missing];
                        cell.Select();
                        cell.Delete(Microsoft.Office.Interop.Excel.XlDirection.xlUp);

                        MessageBox.Show("row removed:" + a);

                    }
                    catch (Exception ex)
                    {
                        MessageBox.Show(ex.Message);
                    }
                }


            }
            catch (Exception)
            {

            }

        }

        /// <summary>
        /// Función que encuentra filas en blanco antes de registrar
        /// </summary>
        public List<string> find_White_Space_Excel()
        {
            Microsoft.Office.Interop.Excel.Range rango = HojaExcel.UsedRange;
            int lastUsedRow = HojaExcel.Cells.SpecialCells(Microsoft.Office.Interop.Excel.XlCellType.xlCellTypeLastCell, Type.Missing).Row;
            List<string> list_row = new List<string>();
            //var cosa = (string) (rango.Cells[4,4] as Microsoft.Office.Interop.Excel.Range).Value2;


            if (lastUsedRow != 1)
            {
                for (int i = 1; i < lastUsedRow; i++)
                {
                    if (Convert.ToString((rango.Cells[i + 1, 1] as Microsoft.Office.Interop.Excel.Range).Value2) == null)
                    {
                        list_row.Add("Add element to row of ID:" + i.ToString());
                    }
                }
            }

            return list_row;

        }






    }

}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace DarkDemo
{
    class Data_BD_Dinamica
    {

        // Segmentos comienza del 1 NO del 0
        public const int g_Segmento_Pallet = 10;

        public string[] g_Info_Pallet_1 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_2 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_3 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_4 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_5 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_6 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_7 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet_8 = new string[g_Segmento_Pallet];

        public string[] g_Info_Pallet__Cantidad_1 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_2 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_3 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_4 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_5 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_6 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_7 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Cantidad_8 = new string[g_Segmento_Pallet];

        public string[] g_Info_Pallet__Apilado_1 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_2 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_3 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_4 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_5 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_6 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_7 = new string[g_Segmento_Pallet];
        public string[] g_Info_Pallet__Apilado_8 = new string[g_Segmento_Pallet];


        public List<string[]> Pallets = new List<string[]>();
        public List<string[]> Pallets_Cantidad = new List<string[]>();
        public List<string[]> Pallets_Apilado = new List<string[]>();
        public List<string[]> Pattern_list = new List<string[]>();
        /// <summary>
        /// Inicializacion de la base de datos dinamica.
        /// </summary>
        public void Init_Data_BD_Dinamica() {


            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_1[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_2[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_3[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_4[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_5[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_6[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_7[i] = ""; }
            for (int i = 1; i < g_Segmento_Pallet; i++) { g_Info_Pallet_8[i] = ""; }


            Pallets.Add(g_Info_Pallet_1);
            Pallets.Add(g_Info_Pallet_2);
            Pallets.Add(g_Info_Pallet_3);
            Pallets.Add(g_Info_Pallet_4);
            Pallets.Add(g_Info_Pallet_5);
            Pallets.Add(g_Info_Pallet_6);
            Pallets.Add(g_Info_Pallet_7);
            Pallets.Add(g_Info_Pallet_8);


            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_1);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_2);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_3);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_4);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_5);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_6);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_7);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_8);


            Pallets_Apilado.Add(g_Info_Pallet__Apilado_1);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_2);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_3);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_4);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_5);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_6);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_7);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_8);




        }



        /// <summary>
        /// ingreso los datos a los pallets
        /// </summary>
        /// <param name="N_Pallet"></param>
        /// <param name="Segmento"></param>
        /// <param name="Info"></param>
        public void Set_Info_Pallet(int N_Pallet, int Segmento, ref string Info) {

            
            // CArgo la info al elemento
             Pallets[N_Pallet][Segmento]= Pallets[N_Pallet][Segmento]+Info +";";

        }

        public void Set_cant_info_Pallet(int N_Pallet, int Segmento, ref string Info)
        {

            // CArgo la info al elemento
            Pallets_Cantidad[N_Pallet][Segmento] = Pallets_Cantidad[N_Pallet][Segmento] +Info + ";";

        }

        public void Set_Apilado_info_Pallet(int N_Pallet, int Segmento, ref string Info)
        {

            // CArgo la info al elemento
            Pallets_Apilado[N_Pallet][Segmento] = Pallets_Apilado[N_Pallet][Segmento] +Info + ";";

        }


        /// <summary>
        /// Borrro la info de los pallets
        /// </summary>
        /// <param name="N_Pallet"></param>
        public void Clear_Data_Pallets() {



            Pallets.Add(g_Info_Pallet_1);
            Pallets.Add(g_Info_Pallet_2);
            Pallets.Add(g_Info_Pallet_3);
            Pallets.Add(g_Info_Pallet_4);
            Pallets.Add(g_Info_Pallet_5);
            Pallets.Add(g_Info_Pallet_6);
            Pallets.Add(g_Info_Pallet_7);
            Pallets.Add(g_Info_Pallet_8);


            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_1);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_2);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_3);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_4);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_5);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_6);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_7);
            Pallets_Cantidad.Add(g_Info_Pallet__Cantidad_8);


            Pallets_Apilado.Add(g_Info_Pallet__Apilado_1);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_2);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_3);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_4);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_5);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_6);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_7);
            Pallets_Apilado.Add(g_Info_Pallet__Apilado_8);
        }




}
}

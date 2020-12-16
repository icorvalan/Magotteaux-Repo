using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;


// se deben incluir TODAS las DLLS de HMIDRIVERS
using AdvancedHMIDrivers;


namespace MasterApp
{
   
    public  class EthernetIP
    {

        EthernetIPforCLXCom EthernetIP_plc = new EthernetIPforCLXCom();


        ///<summary>
        ///Inicializo ethernet con 50[mseg] de refresco
        ///</summary>
        public void Ethernet_Init(string IP_Plc)
        {
            EthernetIP_plc.IPAddress = IP_Plc;
           var puperto= EthernetIP_plc.ProcessorSlot;
            Set_RateValue(50);
        }

        ///<summary>
        ///Obtengo la tasa de muestreo de las variables 
        ///</summary>
        public int Get_RateValue() { return EthernetIP_plc.PollRateOverride; }
    
        ///<summary>
        ///Seteo la tasa de muestreo de las variables 
        ///</summary>
        public void Set_RateValue(int Value) { EthernetIP_plc.PollRateOverride = Value; }

        ///<summary>
        ///Leo variable. Debe estar como VARIABLE GLOBAL del PLC
        ///</summary>
        public string Lectura_tag(string variable)
        {
            try
            {
                EthernetIP_plc.Timeout = 100;
                return EthernetIP_plc.Read(variable);
            }
            catch (Exception)
            {
                return null;
            }

        }

        ///<summary>
        ///Leo variable. Debe estar como VARIABLE GLOBAL del PLC. Funcion Sobrecargada.
        ///</summary>
        public byte[] Lectura_tag_Raw(string variable)
        {
            try
            {
                return EthernetIP_plc.ReadRaw(variable);

            }
            catch (Exception)
            {

                return null;
            }

        }

        ///<summary>
        ///Entrega Array Booleano de 16 bit. Funcion Sobrecargada.
        ///</summary>      
        public bool[] Lectura_tag_Bool(string variable)
        {
            try
            {
                return Convert_INT16_to_BOOL16(Convert.ToInt16(variable));
            }
            catch (Exception)
            {

                return null;
            }

        }



        public List<string> Get_Tags() {

            try
            {
                var Tag = EthernetIP_plc.GetTagList();

                string[] Tags = new string[Tag.Length];
                List<string> Tags_Plc = new List<string>();

                for (int i = 0; i < Tag.Length; i++)
                {
                    Tags[i] = Tag[i].TagName;
                    Tags_Plc.Add(Tags[i]);
                }
                Tags_Plc.Sort();


                return Tags_Plc;
            }
            catch (Exception)
            {
                List<string> nada = new List<string>();
                return nada;
            }
     

        }
        ///<summary>
        ///Escribo variable. Debe estar como VARIABLE GLOBAL del PLC
        ///</summary>
        public bool Escritura_tag(string tag, int Value)
        {
            try
            {
                EthernetIP_plc.Write(tag, Value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }
        public bool Escritura_tag(string tag, string Value)
        {
            try
            {
                EthernetIP_plc.Write(tag, Value);
              
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }

        public bool Escritura_tag_Raw(string tag, byte[] Value)
        {
            try
            {
                EthernetIP_plc.WriteRaw(tag, 1, Value);
                return true;
            }
            catch (Exception)
            {
                return false;

            }
        }


        public void CloseEthernetIP() {

            EthernetIP_plc.CloseConnection();
        }







        #region Se incluyen las funciones basicas de trabajo para esta clase

        bool Bit_Lectura = false;
        ///<summary>
        ///Se indica que variable se debe leer y escribir como bit de vida. las variables deben ser BOLEANAS
        ///</summary>
        public bool Funtion_Bit_Vida(string Data_read,string Data_Write)
        {
            try
            {
                string valor = EthernetIP_plc.Read(Data_read);

                Boolean.TryParse(valor, out Bit_Lectura);

                if (Bit_Lectura)
                {
                    EthernetIP_plc.Write(Data_Write, 1);
                }
                else
                {
                    EthernetIP_plc.Write(Data_Write, 0);

                }

                return Bit_Lectura;
            }
            catch (Exception)
            {

                return false;
            }



        }

        ///<summary>
        ///Se envian datos de posicion relativos a la camara GOCATOR.
        ///</summary>
        public void Funtion_Enviar_Posicion_Kuka(string X_dat, string Y_dat, string Z_dat, string Roll, string Pitch, string Yaw,string Tag_X, string Tag_Y, string Tag_Z, string Tag_A, string Tag_B, string Tag_C)
        {
            // Valores deben estar en milimetros.
            string X_pos = X_dat;
            double X = 0;
            double.TryParse(X_pos, out X);

            string Y_pos = Y_dat;
            double Y = 0;
            double.TryParse(Y_pos, out Y);

            string Z_pos = Z_dat;
            double Z = 0;
            double.TryParse(Z_pos, out Z);

            X = X * 10 + 16000;
            Y = Y * 10 + 16000;
            Z = Z * 10 + 16000;


            string Roll_pos = Roll;
            double Roll_db = 0;
            double.TryParse(Roll_pos, out Roll_db);

            string Yaw_pos = Yaw;
            double Yaw_db = 0;
            double.TryParse(Yaw_pos, out Yaw_db);

            string Pitch_pos = Pitch;
            double Pitch_db = 0;
            double.TryParse(Pitch_pos, out Pitch_db);


            double Aux_A = 0, Aux_B = 0, Aux_C = 0;

            Aux_C = (int)(-Roll_db * 10 + 16000);
            Aux_A = (int)(Yaw_db * 10  + 16000);
            Aux_B = (int)(Pitch_db * 10 + 16000);


            EthernetIP_plc.Write(Tag_X, (int)X);
            EthernetIP_plc.Write(Tag_Y, (int)Y);
            EthernetIP_plc.Write(Tag_Z, (int)Z);

            EthernetIP_plc.Write(Tag_C, (int)Aux_C);
            EthernetIP_plc.Write(Tag_B, (int)Aux_B);
            EthernetIP_plc.Write(Tag_A, (int)Aux_A);


        }

        ///<summary>
        ///Se envian datos de variables espaciales y angulares de manera seprarada para camra GOCATOR
        ///</summary>
        public bool Funtion_Enviar_Posicion_Escalada_Kuka(string Tag, double Value)
        {
            // Valores deben estar en milimetros.

            try
            {
                int Value_int = (int)Value * 10 + 16000;
                EthernetIP_plc.Write(Tag, Value_int);
                return true;
            }
            catch (Exception)
            {

                return false;
            }



        }



        ///<summary>
        ///Funcion que transforma de Array Boleano de 16 bit a entero
        ///</summary>

        public int Convert_BOOl16_to_INT16(bool[] array_bits)
        {

            if (array_bits.Length>15){ return 0; }

            int numero1 = 0;
            int i_bits;
            int potencia;
            int exp;
            int cambiar = 0;
            int signo = 0;
            int valor_bit = 0;

            if (array_bits[15] == true)
            {
                signo = -1;

            }

            numero1 = 0;

            for (i_bits = 0; i_bits <= 14; i_bits++)
            {
                if (cambiar == 1 & signo == -1)
                {
                    if (array_bits[i_bits] == true) { array_bits[i_bits] = false; }
                    else { array_bits[i_bits] = true; }
                }
                if (array_bits[i_bits] == true)
                    cambiar = 1;

                if (array_bits[i_bits] == true) { valor_bit = 1; }
                else { valor_bit = 0; }

                if (i_bits == 0)
                {
                    potencia = valor_bit;

                }
                else
                {
                    potencia = 1;
                    for (exp = 1; exp <= i_bits; exp++)
                    {
                        potencia = 2 * potencia;
                    }
                    potencia = valor_bit * potencia;

                }

                numero1 = numero1 + potencia;
            }

            if (signo == -1)
                numero1 = -1 * numero1;

            return numero1;
        }

        ///<summary>
        ///Funcion que transforma entero de 16 bits a Boleano de 16 bit 
        ///</summary>
        public bool[] Convert_INT16_to_BOOL16(int numero)
        {
            int numero_aux = numero;
            int i_bits = 0;
            int signo = 0;
            bool[] array_bits = new bool[16];
            array_bits[15] = false;
            if (numero < 0)
            {
                numero_aux = -1 * numero;
                signo = -1;
            }
            for (i_bits = 0; i_bits <= 15; i_bits++)
            {
                if (numero_aux % 2 == 0)
                {
                    array_bits[i_bits] = false;
                }
                else
                {
                    array_bits[i_bits] = true;
                }
                numero_aux = (int)numero_aux / 2;

            }
            if (signo == -1)
            {
                int cambiar = 0;
                for (i_bits = 0; i_bits <= 15; i_bits++)
                {
                    if (cambiar == 1)
                    {
                        if (array_bits[i_bits] == true) { array_bits[i_bits] = false; }
                        else { array_bits[i_bits] = true; }
                    }
                    if (array_bits[i_bits] == true)
                        cambiar = 1;


                }
            }

            return array_bits;
        }



        #endregion




    }

}

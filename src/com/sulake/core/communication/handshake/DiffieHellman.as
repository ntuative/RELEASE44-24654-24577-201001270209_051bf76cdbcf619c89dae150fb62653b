package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1363:BigInteger;
      
      private var var_945:BigInteger;
      
      private var var_1703:BigInteger;
      
      private var var_1362:BigInteger;
      
      private var var_1704:BigInteger;
      
      private var var_1702:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         var_1363 = param1;
         var_1703 = param2;
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return var_1704.toRadix(param1);
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         var_1362 = new BigInteger();
         var_1362.fromRadix(param1,param2);
         var_1704 = var_1362.modPow(var_945,var_1363);
         return getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return var_1702.toRadix(param1);
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         var_945 = new BigInteger();
         var_945.fromRadix(param1,param2);
         var_1702 = var_1703.modPow(var_945,var_1363);
         return true;
      }
   }
}

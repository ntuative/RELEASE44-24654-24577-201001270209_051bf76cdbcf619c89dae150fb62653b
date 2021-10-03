package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_966:int = 0;
      
      private var var_1074:int = 0;
      
      private var var_1567:String = "";
      
      private var var_967:int = 0;
      
      private var var_1564:String = "";
      
      private var var_1566:int = 0;
      
      private var var_1425:String = "";
      
      private var var_1561:int = 0;
      
      private var var_1562:int = 0;
      
      private var var_1563:String = "";
      
      private var var_1565:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         var_1561 = param1;
         var_1563 = param2;
         var_1425 = param3;
         var_1567 = param4;
         var_1564 = param5;
         if(param6)
         {
            var_1074 = 1;
         }
         else
         {
            var_1074 = 0;
         }
         var_1566 = param7;
         var_1562 = param8;
         var_967 = param9;
         var_1565 = param10;
         var_966 = param11;
      }
      
      public function getMessageArray() : Array
      {
         return [var_1561,var_1563,var_1425,var_1567,var_1564,var_1074,var_1566,var_1562,var_967,var_1565,var_966];
      }
      
      public function dispose() : void
      {
      }
   }
}

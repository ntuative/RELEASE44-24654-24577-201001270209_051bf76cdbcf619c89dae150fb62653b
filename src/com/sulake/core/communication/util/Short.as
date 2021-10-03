package com.sulake.core.communication.util
{
   import flash.utils.ByteArray;
   
   public class Short
   {
       
      
      private var var_707:ByteArray;
      
      public function Short(param1:int)
      {
         super();
         var_707 = new ByteArray();
         var_707.writeShort(param1);
         var_707.position = 0;
      }
      
      public function get value() : int
      {
         var _loc1_:int = 0;
         var_707.position = 0;
         if(false)
         {
            _loc1_ = var_707.readShort();
            var_707.position = 0;
         }
         return _loc1_;
      }
   }
}

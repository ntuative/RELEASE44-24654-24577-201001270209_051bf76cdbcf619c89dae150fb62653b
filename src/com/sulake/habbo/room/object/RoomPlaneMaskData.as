package com.sulake.habbo.room.object
{
   public class RoomPlaneMaskData
   {
       
      
      private var var_1977:Number = 0;
      
      private var var_1979:Number = 0;
      
      private var var_1976:Number = 0;
      
      private var var_1978:Number = 0;
      
      public function RoomPlaneMaskData(param1:Number, param2:Number, param3:Number, param4:Number)
      {
         super();
         var_1979 = param1;
         var_1976 = param2;
         var_1977 = param3;
         var_1978 = param4;
      }
      
      public function get leftSideLoc() : Number
      {
         return var_1979;
      }
      
      public function get leftSideLength() : Number
      {
         return var_1977;
      }
      
      public function get rightSideLoc() : Number
      {
         return var_1976;
      }
      
      public function get rightSideLength() : Number
      {
         return var_1978;
      }
   }
}

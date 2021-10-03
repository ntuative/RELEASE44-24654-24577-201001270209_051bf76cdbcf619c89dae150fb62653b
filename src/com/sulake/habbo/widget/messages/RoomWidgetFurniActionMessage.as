package com.sulake.habbo.widget.messages
{
   public class RoomWidgetFurniActionMessage extends RoomWidgetMessage
   {
      
      public static const const_262:String = "RWFAM_MOVE";
      
      public static const const_628:String = "RWFUAM_ROTATE";
      
      public static const const_674:String = "RWFAM_PICKUP";
       
      
      private var var_1573:int = 0;
      
      private var var_2060:int = 0;
      
      public function RoomWidgetFurniActionMessage(param1:String, param2:int, param3:int)
      {
         super(param1);
         var_1573 = param2;
         var_2060 = param3;
      }
      
      public function get furniId() : int
      {
         return var_1573;
      }
      
      public function get furniCategory() : int
      {
         return var_2060;
      }
   }
}

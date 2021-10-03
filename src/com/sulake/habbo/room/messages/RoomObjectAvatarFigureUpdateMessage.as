package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarFigureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_1640:String;
      
      private var var_544:String;
      
      public function RoomObjectAvatarFigureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_544 = param1;
         var_1640 = param2;
      }
      
      public function get race() : String
      {
         return var_1640;
      }
      
      public function get figure() : String
      {
         return var_544;
      }
   }
}

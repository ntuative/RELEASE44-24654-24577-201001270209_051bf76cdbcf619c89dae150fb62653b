package com.sulake.habbo.room.messages
{
   public class RoomObjectAvatarPostureUpdateMessage extends RoomObjectUpdateStateMessage
   {
       
      
      private var var_2079:String;
      
      private var var_828:String;
      
      public function RoomObjectAvatarPostureUpdateMessage(param1:String, param2:String = "")
      {
         super();
         var_2079 = param1;
         var_828 = param2;
      }
      
      public function get postureType() : String
      {
         return var_2079;
      }
      
      public function get parameter() : String
      {
         return var_828;
      }
   }
}

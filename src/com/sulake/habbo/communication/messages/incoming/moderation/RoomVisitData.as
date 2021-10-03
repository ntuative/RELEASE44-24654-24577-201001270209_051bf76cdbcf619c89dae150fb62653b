package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomVisitData
   {
       
      
      private var var_718:String;
      
      private var var_2049:int;
      
      private var var_1438:Boolean;
      
      private var _roomId:int;
      
      private var var_2050:int;
      
      public function RoomVisitData(param1:IMessageDataWrapper)
      {
         super();
         var_1438 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_718 = param1.readString();
         var_2050 = param1.readInteger();
         var_2049 = param1.readInteger();
      }
      
      public function get isPublic() : Boolean
      {
         return var_1438;
      }
      
      public function get roomName() : String
      {
         return var_718;
      }
      
      public function get enterMinute() : int
      {
         return var_2049;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get enterHour() : int
      {
         return var_2050;
      }
   }
}

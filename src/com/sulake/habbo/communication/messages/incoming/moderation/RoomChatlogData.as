package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class RoomChatlogData
   {
       
      
      private var var_718:String;
      
      private var var_1439:Array;
      
      private var var_1438:Boolean;
      
      private var _roomId:int;
      
      public function RoomChatlogData(param1:IMessageDataWrapper)
      {
         var_1439 = new Array();
         super();
         var_1438 = param1.readBoolean();
         _roomId = param1.readInteger();
         var_718 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            var_1439.push(new ChatlineData(param1));
            _loc3_++;
         }
         Logger.log("READ ROOMCHATLOGDATA: " + var_1438 + ", " + _roomId + ", " + var_718 + ", " + chatlog.length);
      }
      
      public function get isPublic() : Boolean
      {
         return var_1438;
      }
      
      public function get roomName() : String
      {
         return var_718;
      }
      
      public function get chatlog() : Array
      {
         return var_1439;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}

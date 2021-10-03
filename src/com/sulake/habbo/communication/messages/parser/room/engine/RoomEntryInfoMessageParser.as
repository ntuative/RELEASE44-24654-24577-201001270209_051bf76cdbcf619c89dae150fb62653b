package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   
   public class RoomEntryInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2047:int;
      
      private var var_382:Boolean;
      
      private var var_2046:Boolean;
      
      private var var_831:PublicRoomShortData;
      
      public function RoomEntryInfoMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2046 = param1.readBoolean();
         if(var_2046)
         {
            var_2047 = param1.readInteger();
            var_382 = param1.readBoolean();
         }
         else
         {
            var_831 = new PublicRoomShortData(param1);
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         if(var_831 != null)
         {
            var_831.dispose();
            var_831 = null;
         }
         return true;
      }
      
      public function get guestRoomId() : int
      {
         return var_2047;
      }
      
      public function get owner() : Boolean
      {
         return var_382;
      }
      
      public function get guestRoom() : Boolean
      {
         return var_2046;
      }
      
      public function get publicSpace() : PublicRoomShortData
      {
         return var_831;
      }
   }
}

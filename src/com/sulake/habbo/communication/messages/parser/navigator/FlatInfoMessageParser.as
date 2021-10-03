package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomSettingsFlatInfo;
   
   public class FlatInfoMessageParser implements IMessageParser
   {
       
      
      private var var_214:RoomSettingsFlatInfo;
      
      public function FlatInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         var_214 = null;
         return true;
      }
      
      public function get flatInfo() : RoomSettingsFlatInfo
      {
         return var_214;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_214 = new RoomSettingsFlatInfo();
         var_214.allowFurniMoving = param1.readInteger() == 1;
         var_214.doorMode = param1.readInteger();
         var_214.id = param1.readInteger();
         var_214.ownerName = param1.readString();
         var_214.type = param1.readString();
         var_214.name = param1.readString();
         var_214.description = param1.readString();
         var_214.showOwnerName = param1.readInteger() == 1;
         var_214.allowTrading = param1.readInteger() == 1;
         var_214.categoryAlertKey = param1.readInteger() == 1;
         return true;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1511:int = 9;
      
      public static const const_1504:int = 4;
      
      public static const const_1492:int = 1;
      
      public static const const_1270:int = 10;
      
      public static const const_1497:int = 2;
      
      public static const const_1322:int = 7;
      
      public static const const_1201:int = 11;
      
      public static const const_1436:int = 3;
      
      public static const const_1316:int = 8;
      
      public static const const_1204:int = 5;
      
      public static const const_1586:int = 6;
      
      public static const const_1255:int = 12;
       
      
      private var var_1811:String;
      
      private var _roomId:int;
      
      private var var_1087:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return var_1811;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         _roomId = param1.readInteger();
         var_1087 = param1.readInteger();
         var_1811 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return var_1087;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
   }
}

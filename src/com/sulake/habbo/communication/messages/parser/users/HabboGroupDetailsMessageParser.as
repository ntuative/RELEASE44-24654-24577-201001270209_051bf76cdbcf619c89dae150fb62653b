package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboGroupDetailsMessageParser implements IMessageParser
   {
       
      
      private var var_718:String = "";
      
      private var _name:String = "";
      
      private var _roomId:int = -1;
      
      private var var_925:int = -1;
      
      private var var_1110:String = "";
      
      public function HabboGroupDetailsMessageParser()
      {
         super();
      }
      
      public function get groupId() : int
      {
         return var_925;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_925 = param1.readInteger();
         if(var_925 != -1)
         {
            _name = param1.readString();
            var_1110 = param1.readString();
            _roomId = param1.readInteger();
            var_718 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         var_925 = -1;
         _name = "";
         var_1110 = "";
         _roomId = -1;
         var_718 = "";
         return true;
      }
      
      public function get roomName() : String
      {
         return var_718;
      }
      
      public function get roomId() : int
      {
         return _roomId;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}

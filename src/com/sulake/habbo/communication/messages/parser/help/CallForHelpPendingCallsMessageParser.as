package com.sulake.habbo.communication.messages.parser.help
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CallForHelpPendingCallsMessageParser implements IMessageParser
   {
       
      
      private var var_565:Array;
      
      public function CallForHelpPendingCallsMessageParser()
      {
         var_565 = new Array();
         super();
      }
      
      public function get callCount() : int
      {
         return var_565.length;
      }
      
      public function flush() : Boolean
      {
         var_565 = new Array();
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var_565 = new Array();
         var _loc2_:int = param1.readInteger();
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new Object();
            _loc4_.callId = param1.readString();
            _loc4_.timeStamp = param1.readString();
            _loc4_.message = param1.readString();
            var_565.push(_loc4_);
            _loc3_++;
         }
         return true;
      }
      
      public function get method_15() : Array
      {
         return var_565;
      }
   }
}

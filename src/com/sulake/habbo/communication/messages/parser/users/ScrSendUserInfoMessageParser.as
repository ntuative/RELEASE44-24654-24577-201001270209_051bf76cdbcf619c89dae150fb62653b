package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2032:int;
      
      private var var_1179:String;
      
      private var var_2030:int;
      
      private var var_2033:int;
      
      private var var_2031:int;
      
      private var var_2034:Boolean;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function get productName() : String
      {
         return var_1179;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return var_2034;
      }
      
      public function get responseType() : int
      {
         return var_2033;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return var_2030;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_1179 = param1.readString();
         var_2030 = param1.readInteger();
         var_2032 = param1.readInteger();
         var_2031 = param1.readInteger();
         var_2033 = param1.readInteger();
         var_2034 = param1.readBoolean();
         return true;
      }
      
      public function get memberPeriods() : int
      {
         return var_2032;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return var_2031;
      }
   }
}

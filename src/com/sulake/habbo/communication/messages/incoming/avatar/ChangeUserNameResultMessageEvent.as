package com.sulake.habbo.communication.messages.incoming.avatar
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.avatar.ChangeUserNameResultMessageParser;
   
   public class ChangeUserNameResultMessageEvent extends MessageEvent implements IMessageEvent
   {
      
      public static var var_1060:int = 3;
      
      public static var var_1056:int = 5;
      
      public static var var_890:int = 0;
      
      public static var var_1057:int = 4;
      
      public static var var_1061:int = 2;
      
      public static var var_1058:int = 1;
       
      
      public function ChangeUserNameResultMessageEvent(param1:Function)
      {
         super(param1,ChangeUserNameResultMessageParser);
      }
      
      public function getParser() : ChangeUserNameResultMessageParser
      {
         return var_21 as ChangeUserNameResultMessageParser;
      }
   }
}

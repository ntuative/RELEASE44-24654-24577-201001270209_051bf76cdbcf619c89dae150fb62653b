package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_555:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_436:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_555);
         var_436 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return var_436;
      }
   }
}

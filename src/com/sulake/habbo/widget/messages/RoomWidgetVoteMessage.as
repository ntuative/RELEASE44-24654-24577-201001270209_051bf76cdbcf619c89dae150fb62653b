package com.sulake.habbo.widget.messages
{
   public class RoomWidgetVoteMessage extends RoomWidgetMessage
   {
      
      public static const const_106:String = "RWVM_VOTE_MESSAGE";
       
      
      private var var_1189:int;
      
      public function RoomWidgetVoteMessage(param1:int)
      {
         super(const_106);
         var_1189 = param1;
      }
      
      public function get vote() : int
      {
         return var_1189;
      }
   }
}

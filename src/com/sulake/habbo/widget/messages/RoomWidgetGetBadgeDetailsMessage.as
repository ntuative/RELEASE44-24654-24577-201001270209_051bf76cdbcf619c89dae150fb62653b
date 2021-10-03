package com.sulake.habbo.widget.messages
{
   public class RoomWidgetGetBadgeDetailsMessage extends RoomWidgetMessage
   {
      
      public static const const_520:String = "RWGOI_MESSAGE_GET_BADGE_DETAILS";
       
      
      private var var_925:int = 0;
      
      public function RoomWidgetGetBadgeDetailsMessage(param1:int)
      {
         super(const_520);
         var_925 = param1;
      }
      
      public function get groupId() : int
      {
         return var_925;
      }
   }
}

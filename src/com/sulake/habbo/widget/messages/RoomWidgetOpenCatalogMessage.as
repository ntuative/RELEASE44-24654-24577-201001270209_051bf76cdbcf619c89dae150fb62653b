package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenCatalogMessage extends RoomWidgetMessage
   {
      
      public static const const_660:String = "RWOCM_CLUB_MAIN";
      
      public static const const_573:String = "RWGOI_MESSAGE_OPEN_CATALOG";
       
      
      private var var_2094:String = "";
      
      public function RoomWidgetOpenCatalogMessage(param1:String)
      {
         super(const_573);
         var_2094 = param1;
      }
      
      public function get pageKey() : String
      {
         return var_2094;
      }
   }
}

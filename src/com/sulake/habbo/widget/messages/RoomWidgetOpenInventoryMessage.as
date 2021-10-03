package com.sulake.habbo.widget.messages
{
   public class RoomWidgetOpenInventoryMessage extends RoomWidgetMessage
   {
      
      public static const const_859:String = "inventory_badges";
      
      public static const const_1205:String = "inventory_clothes";
      
      public static const const_1125:String = "inventory_furniture";
      
      public static const const_683:String = "RWGOI_MESSAGE_OPEN_INVENTORY";
      
      public static const const_899:String = "inventory_effects";
       
      
      private var var_1836:String;
      
      public function RoomWidgetOpenInventoryMessage(param1:String)
      {
         super(const_683);
         var_1836 = param1;
      }
      
      public function get inventoryType() : String
      {
         return var_1836;
      }
   }
}

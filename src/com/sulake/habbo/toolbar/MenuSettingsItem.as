package com.sulake.habbo.toolbar
{
   public class MenuSettingsItem
   {
       
      
      private var var_1712:Array;
      
      private var var_1711:String;
      
      private var var_1713:Boolean;
      
      public function MenuSettingsItem(param1:String, param2:Array = null, param3:Boolean = false)
      {
         super();
         var_1711 = param1;
         var_1712 = param2;
         var_1713 = param3;
      }
      
      public function get menuId() : String
      {
         return var_1711;
      }
      
      public function get yieldList() : Array
      {
         return var_1712;
      }
      
      public function get lockToIcon() : Boolean
      {
         return var_1713;
      }
   }
}

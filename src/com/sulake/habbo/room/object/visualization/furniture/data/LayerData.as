package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_404:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_358:int = 0;
      
      public static const const_850:int = 2;
      
      public static const const_911:int = 1;
      
      public static const const_726:Boolean = false;
      
      public static const const_582:String = "";
      
      public static const const_345:int = 0;
      
      public static const const_411:int = 0;
      
      public static const const_350:int = 0;
       
      
      private var var_1659:int = 0;
      
      private var var_1660:String = "";
      
      private var var_1470:int = 0;
      
      private var var_1657:int = 0;
      
      private var var_1656:Number = 0;
      
      private var var_1655:int = 255;
      
      private var var_1658:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return var_1659;
      }
      
      public function copyValues(param1:LayerData) : void
      {
         if(param1 != null)
         {
            tag = param1.tag;
            ink = param1.ink;
            alpha = param1.alpha;
            ignoreMouse = param1.ignoreMouse;
            xOffset = param1.xOffset;
            yOffset = param1.yOffset;
            zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         var_1470 = param1;
      }
      
      public function get zOffset() : Number
      {
         return var_1656;
      }
      
      public function set xOffset(param1:int) : void
      {
         var_1657 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         var_1659 = param1;
      }
      
      public function get tag() : String
      {
         return var_1660;
      }
      
      public function get alpha() : int
      {
         return var_1655;
      }
      
      public function get ink() : int
      {
         return var_1470;
      }
      
      public function set zOffset(param1:Number) : void
      {
         var_1656 = param1;
      }
      
      public function get xOffset() : int
      {
         return var_1657;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         var_1658 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return var_1658;
      }
      
      public function set tag(param1:String) : void
      {
         var_1660 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         var_1655 = param1;
      }
   }
}

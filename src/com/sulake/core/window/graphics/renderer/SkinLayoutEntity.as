package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_247:uint = 1;
      
      public static const const_438:uint = 0;
      
      public static const const_971:uint = 8;
      
      public static const const_230:uint = 4;
      
      public static const const_348:uint = 2;
       
      
      private var var_407:uint;
      
      private var var_1867:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_1868:uint;
      
      private var var_106:Rectangle;
      
      private var var_600:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         _id = param1;
         _name = param2;
         var_106 = param3;
         _color = param4;
         var_407 = param5;
         var_1867 = param6;
         var_1868 = param7;
         var_600 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return var_1867;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get blend() : uint
      {
         return var_407;
      }
      
      public function get scaleV() : uint
      {
         return var_1868;
      }
      
      public function get tags() : Array
      {
         return var_600;
      }
      
      public function get id() : uint
      {
         return _id;
      }
      
      public function dispose() : void
      {
         var_106 = null;
         var_600 = null;
      }
      
      public function get color() : uint
      {
         return _color;
      }
      
      public function get region() : Rectangle
      {
         return var_106;
      }
   }
}

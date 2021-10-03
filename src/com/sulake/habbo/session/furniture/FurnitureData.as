package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1528:String = "e";
      
      public static const const_1512:String = "i";
      
      public static const const_1581:String = "s";
       
      
      private var _id:int;
      
      private var _title:String;
      
      private var _type:String;
      
      private var var_1860:int;
      
      private var var_1309:Array;
      
      private var var_1859:int;
      
      private var var_1863:int;
      
      private var var_1861:int;
      
      private var _name:String;
      
      private var var_1862:int;
      
      private var var_1110:String;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String)
      {
         super();
         _type = param1;
         _id = param2;
         _name = param3;
         var_1860 = param4;
         var_1862 = param5;
         var_1859 = param6;
         var_1863 = param7;
         var_1861 = param8;
         var_1309 = param9;
         _title = param10;
         var_1110 = param11;
      }
      
      public function get tileSizeY() : int
      {
         return var_1863;
      }
      
      public function get tileSizeZ() : int
      {
         return var_1861;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get type() : String
      {
         return _type;
      }
      
      public function get title() : String
      {
         return _title;
      }
      
      public function get revision() : int
      {
         return var_1862;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get colourIndex() : int
      {
         return var_1860;
      }
      
      public function get tileSizeX() : int
      {
         return var_1859;
      }
      
      public function get colours() : Array
      {
         return var_1309;
      }
      
      public function get description() : String
      {
         return var_1110;
      }
   }
}

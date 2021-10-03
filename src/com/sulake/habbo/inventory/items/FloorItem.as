package com.sulake.habbo.inventory.items
{
   public class FloorItem implements IItem
   {
       
      
      protected var var_2226:Boolean;
      
      protected var var_1350:Number;
      
      protected var var_2223:Boolean;
      
      protected var _type:int;
      
      protected var var_2224:Boolean;
      
      protected var var_1695:int;
      
      protected var var_2225:Boolean;
      
      protected var var_1320:String;
      
      protected var var_1608:int;
      
      protected var _id:int;
      
      protected var _ref:int;
      
      protected var var_1661:String;
      
      protected var var_1609:Boolean;
      
      protected var _category:int;
      
      protected var var_1610:int;
      
      protected var var_2236:int;
      
      protected var var_1611:int;
      
      public function FloorItem(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:Boolean, param7:Boolean, param8:Boolean, param9:String, param10:Number, param11:int, param12:int, param13:int, param14:int, param15:String, param16:int)
      {
         super();
         _id = param1;
         _type = param2;
         _ref = param3;
         _category = param4;
         var_1609 = param5;
         var_2225 = param6;
         var_2226 = param7;
         var_2223 = param8;
         var_1320 = param9;
         var_1350 = param10;
         var_2236 = param11;
         var_1611 = param12;
         var_1610 = param13;
         var_1608 = param14;
         var_1661 = param15;
         var_1695 = param16;
      }
      
      public function get locked() : Boolean
      {
         return var_2224;
      }
      
      public function get category() : int
      {
         return _category;
      }
      
      public function get extra() : Number
      {
         return var_1350;
      }
      
      public function set locked(param1:Boolean) : void
      {
         var_2224 = param1;
      }
      
      public function get ref() : int
      {
         return _ref;
      }
      
      public function get songId() : int
      {
         return var_1695;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get sellable() : Boolean
      {
         return var_2223;
      }
      
      public function get slotId() : String
      {
         return var_1661;
      }
      
      public function get expires() : int
      {
         return var_2236;
      }
      
      public function get creationYear() : int
      {
         return var_1608;
      }
      
      public function get creationDay() : int
      {
         return var_1611;
      }
      
      public function get stuffData() : String
      {
         return var_1320;
      }
      
      public function get type() : int
      {
         return _type;
      }
      
      public function get tradeable() : Boolean
      {
         return var_2225;
      }
      
      public function get groupable() : Boolean
      {
         return var_1609;
      }
      
      public function get creationMonth() : int
      {
         return var_1610;
      }
      
      public function get recyclable() : Boolean
      {
         return var_2226;
      }
   }
}

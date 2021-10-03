package com.sulake.habbo.catalog.marketplace
{
   public class MarketplaceItemStats
   {
       
      
      private var var_1494:Array;
      
      private var var_1569:int;
      
      private var var_2066:int;
      
      private var var_2067:int;
      
      private var var_2065:int;
      
      private var _dayOffsets:Array;
      
      private var var_2064:int;
      
      private var var_1495:Array;
      
      public function MarketplaceItemStats()
      {
         super();
      }
      
      public function get dayOffsets() : Array
      {
         return _dayOffsets;
      }
      
      public function get averagePrices() : Array
      {
         return var_1494;
      }
      
      public function set averagePrices(param1:Array) : void
      {
         var_1494 = param1.slice();
      }
      
      public function set dayOffsets(param1:Array) : void
      {
         _dayOffsets = param1.slice();
      }
      
      public function get furniTypeId() : int
      {
         return var_2066;
      }
      
      public function set soldAmounts(param1:Array) : void
      {
         var_1495 = param1.slice();
      }
      
      public function set averagePrice(param1:int) : void
      {
         var_1569 = param1;
      }
      
      public function get historyLength() : int
      {
         return var_2067;
      }
      
      public function get furniCategoryId() : int
      {
         return var_2065;
      }
      
      public function get offerCount() : int
      {
         return var_2064;
      }
      
      public function set offerCount(param1:int) : void
      {
         var_2064 = param1;
      }
      
      public function get soldAmounts() : Array
      {
         return var_1495;
      }
      
      public function get averagePrice() : int
      {
         return var_1569;
      }
      
      public function set furniCategoryId(param1:int) : void
      {
         var_2065 = param1;
      }
      
      public function set historyLength(param1:int) : void
      {
         var_2067 = param1;
      }
      
      public function set furniTypeId(param1:int) : void
      {
         var_2066 = param1;
      }
   }
}

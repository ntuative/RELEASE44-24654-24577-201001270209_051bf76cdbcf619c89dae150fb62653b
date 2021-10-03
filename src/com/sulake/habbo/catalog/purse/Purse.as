package com.sulake.habbo.catalog.purse
{
   public class Purse implements IPurse
   {
       
      
      private var var_1842:int = 0;
      
      private var var_1843:int = 0;
      
      private var var_1841:int = 0;
      
      private var var_1844:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function get pixels() : int
      {
         return var_1843;
      }
      
      public function set pixels(param1:int) : void
      {
         var_1843 = param1;
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1842 = param1;
      }
      
      public function get credits() : int
      {
         return var_1841;
      }
      
      public function get clubDays() : int
      {
         return var_1842;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1844 = param1;
      }
      
      public function set credits(param1:int) : void
      {
         var_1841 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return var_1844;
      }
   }
}

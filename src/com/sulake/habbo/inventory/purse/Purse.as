package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2205:Boolean = false;
      
      private var var_2203:int = 0;
      
      private var var_1842:int = 0;
      
      private var var_2204:int = 0;
      
      private var var_1436:int = 0;
      
      private var var_1844:int = 0;
      
      public function Purse()
      {
         super();
      }
      
      public function set creditBalance(param1:int) : void
      {
         var_1436 = Math.max(0,param1);
      }
      
      public function get clubPastPeriods() : int
      {
         return var_2203;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return var_2205;
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         var_2205 = param1;
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         var_2203 = Math.max(0,param1);
      }
      
      public function set clubDays(param1:int) : void
      {
         var_1842 = Math.max(0,param1);
      }
      
      public function get creditBalance() : int
      {
         return var_1436;
      }
      
      public function set pixelBalance(param1:int) : void
      {
         var_2204 = Math.max(0,param1);
      }
      
      public function get clubDays() : int
      {
         return var_1842;
      }
      
      public function get pixelBalance() : int
      {
         return var_2204;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         var_1844 = Math.max(0,param1);
      }
      
      public function get clubPeriods() : int
      {
         return var_1844;
      }
   }
}

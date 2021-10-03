package com.sulake.habbo.toolbar
{
   public class ToolbarIconBouncer
   {
       
      
      private var var_2151:Number;
      
      private var var_590:Number = 0;
      
      private var var_2152:Number;
      
      private var var_591:Number;
      
      public function ToolbarIconBouncer(param1:Number, param2:Number)
      {
         super();
         var_2151 = param1;
         var_2152 = param2;
      }
      
      public function update() : void
      {
         var_591 += var_2152;
         var_590 += var_591;
         if(var_590 > 0)
         {
            var_590 = 0;
            var_591 = var_2151 * -1 * var_591;
         }
      }
      
      public function reset(param1:int) : void
      {
         var_591 = param1;
         var_590 = 0;
      }
      
      public function get location() : Number
      {
         return var_590;
      }
   }
}

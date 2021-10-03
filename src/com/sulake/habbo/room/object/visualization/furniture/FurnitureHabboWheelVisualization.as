package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1013:int = 31;
      
      private static const const_1014:int = 32;
      
      private static const const_732:int = 10;
      
      private static const const_480:int = 20;
       
      
      private var var_592:Boolean = false;
      
      private var var_216:Array;
      
      public function FurnitureHabboWheelVisualization()
      {
         var_216 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == -1)
         {
            var_592 = true;
            var_216 = new Array();
            var_216.push(const_1013);
            var_216.push(const_1014);
            return;
         }
         if(param1 > 0 && param1 <= const_732)
         {
            if(var_592)
            {
               var_592 = false;
               var_216 = new Array();
               var_216.push(const_732 + param1);
               var_216.push(const_480 + param1);
               var_216.push(param1);
               return;
            }
            super.setAnimation(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
         {
            if(false)
            {
               super.setAnimation(var_216.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}

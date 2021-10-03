package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1115:int = 1;
      
      private static const const_1014:int = 3;
      
      private static const const_1116:int = 2;
      
      private static const const_1117:int = 15;
       
      
      private var var_885:int;
      
      private var var_216:Array;
      
      public function FurnitureQueueTileVisualization()
      {
         var_216 = new Array();
         super();
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == const_1116)
         {
            var_216 = new Array();
            var_216.push(const_1115);
            var_885 = const_1117;
         }
         super.setAnimation(param1);
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(var_885 > 0)
         {
            --var_885;
         }
         if(var_885 == 0)
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

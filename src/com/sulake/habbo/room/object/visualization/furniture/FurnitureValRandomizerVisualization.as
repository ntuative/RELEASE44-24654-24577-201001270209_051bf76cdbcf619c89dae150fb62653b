package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1013:int = 31;
      
      private static const const_1014:int = 32;
      
      private static const const_481:int = 30;
      
      private static const const_732:int = 20;
      
      private static const const_480:int = 10;
       
      
      private var var_592:Boolean = false;
      
      private var var_216:Array;
      
      public function FurnitureValRandomizerVisualization()
      {
         var_216 = new Array();
         super();
         super.setAnimation(const_481);
      }
      
      override protected function setAnimation(param1:int) : void
      {
         if(param1 == 0)
         {
            var_592 = true;
            var_216 = new Array();
            var_216.push(const_1013);
            var_216.push(const_1014);
            return;
         }
         if(param1 > 0 && param1 <= const_480)
         {
            if(var_592)
            {
               var_592 = false;
               var_216 = new Array();
               if(_direction == 2)
               {
                  var_216.push(const_732 + 5 - param1);
                  var_216.push(const_480 + 5 - param1);
               }
               else
               {
                  var_216.push(const_732 + param1);
                  var_216.push(const_480 + param1);
               }
               var_216.push(const_481);
               return;
            }
            super.setAnimation(const_481);
         }
      }
      
      override protected function updateAnimation(param1:Number) : Boolean
      {
         if(super.getLastFramePlayed(11))
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

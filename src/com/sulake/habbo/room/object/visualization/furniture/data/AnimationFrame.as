package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class AnimationFrame
   {
      
      public static const const_548:int = -1;
      
      public static const const_891:int = -1;
       
      
      private var _y:int = 0;
      
      private var var_1785:int = -1;
      
      private var var_94:int = 0;
      
      private var var_1129:int = 1;
      
      private var var_763:int = 1;
      
      private var var_1787:Boolean = false;
      
      private var var_1786:int = 0;
      
      private var _id:int = 0;
      
      public function AnimationFrame(param1:int, param2:int, param3:int, param4:int, param5:Boolean, param6:int = -1, param7:int = 0)
      {
         super();
         _id = param1;
         var_94 = param2;
         _y = param3;
         var_1787 = param5;
         if(param4 < 0)
         {
            param4 = const_548;
         }
         var_763 = param4;
         var_1129 = param4;
         if(param6 >= 0)
         {
            var_1785 = param6;
            var_1786 = param7;
         }
      }
      
      public function get y() : int
      {
         return _y;
      }
      
      public function set remainingFrameRepeats(param1:int) : void
      {
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(var_763 > 0 && param1 > var_763)
         {
            param1 = var_763;
         }
         var_1129 = param1;
      }
      
      public function get frameRepeats() : int
      {
         return var_763;
      }
      
      public function get activeSequenceOffset() : int
      {
         return var_1786;
      }
      
      public function get id() : int
      {
         if(_id >= 0)
         {
            return _id;
         }
         return -_id * Math.random();
      }
      
      public function get remainingFrameRepeats() : int
      {
         if(var_763 < 0)
         {
            return const_548;
         }
         return var_1129;
      }
      
      public function get activeSequence() : int
      {
         return var_1785;
      }
      
      public function get isLastFrame() : Boolean
      {
         return var_1787;
      }
      
      public function get x() : int
      {
         return var_94;
      }
   }
}

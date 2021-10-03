package com.sulake.habbo.avatar.animation
{
   public class AddDataContainer
   {
       
      
      private var var_1369:String;
      
      private var var_1470:String;
      
      private var var_989:String;
      
      private var var_407:Number = 1;
      
      private var _id:String;
      
      public function AddDataContainer(param1:XML)
      {
         super();
         _id = String(param1.@id);
         var_1369 = String(param1.@align);
         var_989 = String(param1.@base);
         var_1470 = String(param1.@ink);
         var _loc2_:String = String(param1.@blend);
         if(_loc2_.length > 0)
         {
            var_407 = Number(_loc2_);
            if(var_407 > 1)
            {
               var_407 /= 100;
            }
         }
      }
      
      public function get align() : String
      {
         return var_1369;
      }
      
      public function get ink() : String
      {
         return var_1470;
      }
      
      public function get base() : String
      {
         return var_989;
      }
      
      public function get isBlended() : Boolean
      {
         return var_407 != 1;
      }
      
      public function get blend() : Number
      {
         return var_407;
      }
      
      public function get id() : String
      {
         return _id;
      }
   }
}

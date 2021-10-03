package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_930:Boolean;
      
      private var _name:String;
      
      private var var_1987:String;
      
      private var var_931:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         _name = String(param1.@name);
         var_1987 = String(param1.@link);
         var_931 = Boolean(parseInt(param1.@fliph));
         var_930 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return var_931;
      }
      
      public function get flipV() : Boolean
      {
         return var_930;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get link() : String
      {
         return var_1987;
      }
   }
}

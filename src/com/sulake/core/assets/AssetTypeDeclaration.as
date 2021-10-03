package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2149:Class;
      
      private var var_2150:Class;
      
      private var var_2148:String;
      
      private var var_1289:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         var_2148 = param1;
         var_2150 = param2;
         var_2149 = param3;
         if(rest == null)
         {
            var_1289 = new Array();
         }
         else
         {
            var_1289 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return var_2149;
      }
      
      public function get assetClass() : Class
      {
         return var_2150;
      }
      
      public function get mimeType() : String
      {
         return var_2148;
      }
      
      public function get fileTypes() : Array
      {
         return var_1289;
      }
   }
}

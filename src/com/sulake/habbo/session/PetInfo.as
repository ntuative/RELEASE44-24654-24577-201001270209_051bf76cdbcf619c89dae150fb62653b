package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1825:int;
      
      private var var_1790:int;
      
      private var var_1901:int;
      
      private var var_1896:int;
      
      private var _nutrition:int;
      
      private var var_1240:int;
      
      private var var_1899:int;
      
      private var var_1898:int;
      
      private var _energy:int;
      
      private var var_1897:int;
      
      private var var_1902:int;
      
      private var _ownerName:String;
      
      private var var_1904:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get level() : int
      {
         return var_1825;
      }
      
      public function get energy() : int
      {
         return _energy;
      }
      
      public function set respect(param1:int) : void
      {
         var_1790 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         _energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         var_1825 = param1;
      }
      
      public function get petId() : int
      {
         return var_1240;
      }
      
      public function get experienceMax() : int
      {
         return var_1898;
      }
      
      public function get nutritionMax() : int
      {
         return var_1896;
      }
      
      public function set levelMax(param1:int) : void
      {
         var_1899 = param1;
      }
      
      public function get ownerId() : int
      {
         return var_1904;
      }
      
      public function get nutrition() : int
      {
         return _nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         var_1240 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         _nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return var_1902;
      }
      
      public function get respect() : int
      {
         return var_1790;
      }
      
      public function get levelMax() : int
      {
         return var_1899;
      }
      
      public function set ownerName(param1:String) : void
      {
         _ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         var_1898 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         var_1901 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         var_1896 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         var_1904 = param1;
      }
      
      public function get experience() : int
      {
         return var_1901;
      }
      
      public function get ownerName() : String
      {
         return _ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         var_1902 = param1;
      }
      
      public function set age(param1:int) : void
      {
         var_1897 = param1;
      }
      
      public function get age() : int
      {
         return var_1897;
      }
   }
}

package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ModeratorUserInfoData
   {
       
      
      private var var_1946:int;
      
      private var var_1947:int;
      
      private var var_1945:int;
      
      private var _userName:String;
      
      private var var_1948:int;
      
      private var var_1949:int;
      
      private var var_1950:int;
      
      private var _userId:int;
      
      private var var_703:Boolean;
      
      public function ModeratorUserInfoData(param1:IMessageDataWrapper)
      {
         super();
         _userId = param1.readInteger();
         _userName = param1.readString();
         var_1949 = param1.readInteger();
         var_1948 = param1.readInteger();
         var_703 = param1.readBoolean();
         var_1945 = param1.readInteger();
         var_1947 = param1.readInteger();
         var_1946 = param1.readInteger();
         var_1950 = param1.readInteger();
      }
      
      public function get banCount() : int
      {
         return var_1950;
      }
      
      public function get userId() : int
      {
         return _userId;
      }
      
      public function get online() : Boolean
      {
         return var_703;
      }
      
      public function get minutesSinceLastLogin() : int
      {
         return var_1948;
      }
      
      public function get abusiveCfhCount() : int
      {
         return var_1947;
      }
      
      public function get cautionCount() : int
      {
         return var_1946;
      }
      
      public function get cfhCount() : int
      {
         return var_1945;
      }
      
      public function get minutesSinceRegistration() : int
      {
         return var_1949;
      }
      
      public function get userName() : String
      {
         return _userName;
      }
   }
}

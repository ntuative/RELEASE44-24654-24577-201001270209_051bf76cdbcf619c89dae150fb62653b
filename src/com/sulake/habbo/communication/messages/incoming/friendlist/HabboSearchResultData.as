package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2256:Boolean;
      
      private var var_2255:int;
      
      private var var_2258:Boolean;
      
      private var var_1520:String;
      
      private var var_1116:String;
      
      private var var_1578:int;
      
      private var var_2146:String;
      
      private var var_2257:String;
      
      private var var_2147:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1578 = param1.readInteger();
         this.var_1520 = param1.readString();
         this.var_2146 = param1.readString();
         this.var_2256 = param1.readBoolean();
         this.var_2258 = param1.readBoolean();
         param1.readString();
         this.var_2255 = param1.readInteger();
         this.var_2147 = param1.readString();
         this.var_2257 = param1.readString();
         this.var_1116 = param1.readString();
      }
      
      public function get realName() : String
      {
         return this.var_1116;
      }
      
      public function get avatarName() : String
      {
         return this.var_1520;
      }
      
      public function get avatarId() : int
      {
         return this.var_1578;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2256;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2257;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2147;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2258;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2146;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2255;
      }
   }
}

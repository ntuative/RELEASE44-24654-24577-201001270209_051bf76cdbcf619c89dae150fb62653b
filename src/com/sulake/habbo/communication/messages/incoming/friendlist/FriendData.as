package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_544:String;
      
      private var var_1113:String;
      
      private var var_1114:String;
      
      private var var_1117:int;
      
      private var _gender:int;
      
      private var var_1116:String;
      
      private var _name:String;
      
      private var var_1115:Boolean;
      
      private var var_703:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this._gender = param1.readInteger();
         this.var_703 = param1.readBoolean();
         this.var_1115 = param1.readBoolean();
         this.var_544 = param1.readString();
         this.var_1117 = param1.readInteger();
         this.var_1114 = param1.readString();
         this.var_1113 = param1.readString();
         this.var_1116 = param1.readString();
      }
      
      public function get gender() : int
      {
         return _gender;
      }
      
      public function get realName() : String
      {
         return var_1116;
      }
      
      public function get name() : String
      {
         return _name;
      }
      
      public function get motto() : String
      {
         return var_1114;
      }
      
      public function get categoryId() : int
      {
         return var_1117;
      }
      
      public function get online() : Boolean
      {
         return var_703;
      }
      
      public function get followingAllowed() : Boolean
      {
         return var_1115;
      }
      
      public function get lastAccess() : String
      {
         return var_1113;
      }
      
      public function get id() : int
      {
         return _id;
      }
      
      public function get figure() : String
      {
         return var_544;
      }
   }
}

package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_544:String;
      
      private var var_2273:String;
      
      private var var_2272:int;
      
      private var var_2275:int;
      
      private var var_1173:String;
      
      private var var_1116:String;
      
      private var _name:String;
      
      private var var_483:int;
      
      private var var_836:int;
      
      private var var_2274:int;
      
      private var _respectTotal:int;
      
      private var var_2276:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2275;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1116;
      }
      
      public function get customData() : String
      {
         return this.var_2273;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_483;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2272;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2276;
      }
      
      public function get figure() : String
      {
         return this.var_544;
      }
      
      public function get respectTotal() : int
      {
         return this._respectTotal;
      }
      
      public function get sex() : String
      {
         return this.var_1173;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_544 = param1.readString();
         this.var_1173 = param1.readString();
         this.var_2273 = param1.readString();
         this.var_1116 = param1.readString();
         this.var_2274 = param1.readInteger();
         this.var_2276 = param1.readString();
         this.var_2272 = param1.readInteger();
         this.var_2275 = param1.readInteger();
         this._respectTotal = param1.readInteger();
         this.var_836 = param1.readInteger();
         this.var_483 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2274;
      }
      
      public function get respectLeft() : int
      {
         return this.var_836;
      }
   }
}

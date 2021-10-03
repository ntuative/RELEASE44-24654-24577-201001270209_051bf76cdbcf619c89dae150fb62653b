package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1137:int;
      
      private var var_927:String;
      
      private var var_691:Array;
      
      private var var_940:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return var_691.slice();
      }
      
      public function flush() : Boolean
      {
         var_927 = "";
         var_940 = [];
         var_691 = [];
         var_1137 = 0;
         return true;
      }
      
      public function get totalVotes() : int
      {
         return var_1137;
      }
      
      public function get question() : String
      {
         return var_927;
      }
      
      public function get choices() : Array
      {
         return var_940.slice();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var_927 = param1.readString();
         var_940 = [];
         var_691 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            var_940.push(param1.readString());
            var_691.push(param1.readInteger());
            _loc3_++;
         }
         var_1137 = param1.readInteger();
         return true;
      }
   }
}

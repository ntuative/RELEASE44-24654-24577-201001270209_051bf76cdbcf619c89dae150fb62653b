package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1857:String;
      
      private var var_381:int;
      
      private var var_2081:String;
      
      private var var_2085:String;
      
      private var var_2083:int;
      
      private var var_2084:String;
      
      private var var_2082:int;
      
      private var var_600:Array;
      
      private var var_982:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         var_600 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_982 = false;
            return;
         }
         this.var_982 = true;
         var_2083 = int(_loc2_);
         var_2081 = param1.readString();
         var_381 = int(param1.readString());
         var_2082 = param1.readInteger();
         var_1857 = param1.readString();
         var_2085 = param1.readString();
         var_2084 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            var_600.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return var_2082;
      }
      
      public function get eventName() : String
      {
         return var_1857;
      }
      
      public function get eventDescription() : String
      {
         return var_2085;
      }
      
      public function get ownerAvatarName() : String
      {
         return var_2081;
      }
      
      public function get tags() : Array
      {
         return var_600;
      }
      
      public function get creationTime() : String
      {
         return var_2084;
      }
      
      public function get exists() : Boolean
      {
         return var_982;
      }
      
      public function get ownerAvatarId() : int
      {
         return var_2083;
      }
      
      public function get disposed() : Boolean
      {
         return _disposed;
      }
      
      public function dispose() : void
      {
         if(_disposed)
         {
            return;
         }
         _disposed = true;
         this.var_600 = null;
      }
      
      public function get flatId() : int
      {
         return var_381;
      }
   }
}

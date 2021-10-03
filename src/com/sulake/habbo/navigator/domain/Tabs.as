package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_497:int = 6;
      
      public static const const_205:int = 5;
      
      public static const const_665:int = 2;
      
      public static const const_311:int = 9;
      
      public static const const_316:int = 4;
      
      public static const const_236:int = 2;
      
      public static const const_502:int = 4;
      
      public static const const_204:int = 8;
      
      public static const const_636:int = 7;
      
      public static const const_238:int = 3;
      
      public static const const_287:int = 1;
      
      public static const const_217:int = 5;
      
      public static const const_406:int = 12;
      
      public static const const_303:int = 1;
      
      public static const const_693:int = 11;
      
      public static const const_493:int = 3;
      
      public static const const_1577:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_418:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         _navigator = param1;
         var_418 = new Array();
         var_418.push(new Tab(_navigator,const_287,const_406,new EventsTabPageDecorator(_navigator),MainViewCtrl.const_462));
         var_418.push(new Tab(_navigator,const_236,const_303,new RoomsTabPageDecorator(_navigator),MainViewCtrl.const_462));
         var_418.push(new Tab(_navigator,const_316,const_693,new OfficialTabPageDecorator(_navigator),MainViewCtrl.const_946));
         var_418.push(new Tab(_navigator,const_238,const_205,new MyRoomsTabPageDecorator(_navigator),MainViewCtrl.const_462));
         var_418.push(new Tab(_navigator,const_217,const_204,new SearchTabPageDecorator(_navigator),MainViewCtrl.const_545));
         setSelectedTab(const_287);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_418)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in var_418)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in var_418)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_316;
      }
      
      public function get tabs() : Array
      {
         return var_418;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         getTab(param1).selected = true;
      }
   }
}

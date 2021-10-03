package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_475:ToolbarIconGroup;
      
      private var var_982:Boolean = false;
      
      private var var_1969:String;
      
      private var var_879:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_983:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var var_46:String = "-1";
      
      private var var_106:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_657:String;
      
      private var var_1928:int;
      
      private var var_658:Timer;
      
      private var var_1443:Array;
      
      private var var_980:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2268:Array;
      
      private var var_269:ToolbarBarMenuAnimator;
      
      private var var_394:ToolbarIconAnimator;
      
      private var var_558:Array;
      
      private var var_813:Array;
      
      private var var_814:String = "-1";
      
      private var var_2336:Boolean = true;
      
      private var var_981:Array;
      
      private var var_1213:Timer;
      
      private var var_1968:int;
      
      private var var_94:Number = 0;
      
      private var _y:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         var_558 = new Array();
         var_813 = new Array();
         var_2268 = new Array();
         var_980 = new ToolbarIconBouncer(0.8,1);
         super();
         var_475 = param1;
         _windowManager = param2;
         _assetLibrary = param3;
         var_657 = param4;
         _events = param5;
         var_269 = param6;
         var_1213 = new Timer(40,40);
         var_1213.addEventListener(TimerEvent.TIMER,updateBouncer);
         var_106 = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_435,HabboWindowStyle.const_40,HabboWindowParam.const_39,new Rectangle(0,0,1,1),onMouseEvent) as IRegionWindow;
         var_106.background = true;
         var_106.alphaTreshold = 0;
         var_106.visible = false;
         _window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.BITMAP_WRAPPER,HabboWindowStyle.const_40,HabboWindowParam.const_40,new Rectangle(0,0,1,1),onMouseEvent,0));
         var_106.addChild(_window);
         _window.addEventListener(WindowEvent.const_43,onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return var_1443[var_981.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return var_1968;
      }
      
      public function get iconId() : String
      {
         return var_657;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         var_879 = param1;
         updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         exists = param1;
         setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         var_46 = param1;
         exists = true;
         setAnimator();
         setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(var_106 == null || _window == null)
         {
            return;
         }
         var_106.width = _window.width;
         var_106.height = _window.height;
         var _loc1_:Boolean = false;
         if(_loc1_)
         {
            var_94 = (0 - 0) / 2;
            _y = var_879 + (0 - 0) / 2;
         }
         else
         {
            var_94 = var_879 + (0 - 0) / 2;
            _y = (0 - 0) / 2;
         }
         var_106.x = var_94;
         var_106.y = _y;
      }
      
      public function dispose() : void
      {
         if(_window != null)
         {
            _window.dispose();
            _window = null;
         }
         if(var_106 != null)
         {
            var_106.dispose();
            var_106 = null;
         }
         var_558 = null;
         var_813 = null;
         exists = false;
         _windowManager = null;
         _events = null;
         var_269 = null;
         var_394 = null;
         _bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(var_558.indexOf(param1) < 0)
         {
            var_558.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            var_813.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!var_982)
         {
            return;
         }
         var _loc3_:StateItem = getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(var_269)
               {
                  var_269.repositionWindow(var_657,true);
               }
               if(_events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_60);
                  _loc4_.iconId = var_657;
                  _events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(false)
               {
                  if(_loc3_.hasStateOver)
                  {
                     state = _loc3_.stateOver;
                  }
                  else
                  {
                     state = var_983;
                  }
               }
               break;
            case WindowMouseEvent.const_29:
               if(false)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     state = _loc3_.defaultState;
                  }
                  else
                  {
                     state = var_814;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return var_558.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = var_813[var_558.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         var_982 = param1;
         if(var_106 != null)
         {
            var_106.visible = var_982;
         }
      }
      
      private function setTooltip() : void
      {
         if(var_106 == null)
         {
            return;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            var_106.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            var_106.toolTipCaption = "${toolbar.icon.tooltip." + var_1969.toLowerCase() + "}";
         }
         var_106.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(var_269 != null)
         {
            var_269.animateWindowIn(this,param1,param2,var_657,param3,param4,getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(var_394 != null && _window != null)
         {
            var_394.update(_window);
            if(var_394.hasNextState())
            {
               state = var_394.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var_1443 = new Array();
         var_981 = new Array();
         var_1969 = param1.@id;
         var_1968 = int(param1.@window_offset_from_icon);
         var_1928 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               var_983 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               var_814 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               var_981.push(_loc5_.id);
               var_1443.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(var_983 == "-1")
                  {
                     var_983 = _loc5_.id;
                  }
                  if(var_814 == "-1")
                  {
                     var_814 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         var_46 = var_814;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         exists = true;
         _bitmapData = param1;
         setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_269 != null)
         {
            var_269.hideWindow(param1,param2,var_657,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(var_269 != null)
         {
            var_269.positionWindow(this,param1,param2,var_657,param3,getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(var_269 != null)
         {
            var_269.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return _y;
      }
      
      public function get exists() : Boolean
      {
         return var_982;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(var_980 != null && _window != null)
         {
            var_980.update();
            _window.y = var_980.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(var_658 != null)
         {
            var_658.stop();
            var_658 = null;
         }
         var _loc1_:StateItem = getCurrentStateObject();
         if(_loc1_ != null && var_982)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            var_394 = new ToolbarIconAnimator(_loc1_,_assetLibrary,_window,var_94,_y,_bitmapData);
            if(false)
            {
               var_658 = new Timer(_loc1_.timer);
               var_658.addEventListener(TimerEvent.TIMER,updateAnimator);
               var_658.start();
            }
            if(_loc1_.bounce)
            {
               var_980.reset(-7);
               var_1213.reset();
               var_1213.start();
            }
         }
         else
         {
            var_394 = null;
            _window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return var_1928 + var_475.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return getStateObject(var_46);
      }
      
      public function get window() : IWindow
      {
         return var_106;
      }
      
      public function get x() : Number
      {
         return var_94;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = var_813[var_558.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return var_475;
      }
   }
}

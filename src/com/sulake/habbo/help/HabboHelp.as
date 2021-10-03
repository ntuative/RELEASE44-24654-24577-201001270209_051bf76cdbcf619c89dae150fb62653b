package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_2063:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_144:TutorialUI;
      
      private var var_1486:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_68:HelpUI;
      
      private var var_1485:IHabboConfigurationManager;
      
      private var var_189:IHabboToolbar;
      
      private var var_553:IHabboCommunicationManager;
      
      private var var_843:FaqIndex;
      
      private var var_1798:String = "";
      
      private var var_1367:IncomingMessages;
      
      private var var_1248:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         var_1248 = new CallForHelpData();
         var_2063 = new UserRegistry();
         super(param1,param2,param3);
         _assetLibrary = param3;
         var_843 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),onWindowManagerReady);
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return var_189;
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(var_68 != null)
         {
            var_68.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(var_68 == null)
         {
            if(!createHelpUI())
            {
               return;
            }
         }
         var_68.toggleUI();
      }
      
      private function removeTutorialUI() : void
      {
         if(var_144 != null)
         {
            var_144.dispose();
            var_144 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return var_1798;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return _windowManager;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         var_1248.reportedUserId = param1;
         var_1248.reportedUserName = param2;
         var_68.showUI(HabboHelpViewEnum.const_322);
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return var_1486;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_91:
               if(var_68 != null)
               {
                  var_68.setRoomSessionStatus(true);
               }
               if(var_144 != null)
               {
                  var_144.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_100:
               if(var_68 != null)
               {
                  var_68.setRoomSessionStatus(false);
               }
               if(var_144 != null)
               {
                  var_144.setRoomSessionStatus(false);
               }
               userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(var_68 != null)
         {
            var_68.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return var_2063;
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(var_68 != null)
         {
            var_68.showCallForHelpResult(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(var_68 != null)
         {
            var_68.dispose();
            var_68 = null;
         }
         if(var_144 != null)
         {
            var_144.dispose();
            var_144 = null;
         }
         var_1367 = null;
         if(var_843 != null)
         {
            var_843.dispose();
            var_843 = null;
         }
         if(_windowManager)
         {
            _windowManager.release(new IIDHabboWindowManager());
            _windowManager = null;
         }
         super.dispose();
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(var_189 != null)
         {
            var_189.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_126,HabboToolbarIconEnum.HELP));
         }
      }
      
      private function createTutorialUI() : Boolean
      {
         if(var_144 == null && _assetLibrary != null && _windowManager != null)
         {
            var_144 = new TutorialUI(this);
         }
         return var_144 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(var_68 == null && _assetLibrary != null && _windowManager != null)
         {
            var_68 = new HelpUI(this,_assetLibrary,_windowManager,var_1486,var_189);
         }
         return var_68 != null;
      }
      
      public function set ownUserName(param1:String) : void
      {
         var_1798 = param1;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return var_1248;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         _windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1486 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            removeTutorialUI();
            return;
         }
         if(var_144 == null)
         {
            if(!createTutorialUI())
            {
               return;
            }
         }
         var_144.update(param1,param2,param3);
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_553 = IHabboCommunicationManager(param2);
         var_1367 = new IncomingMessages(this,var_553);
         queueInterface(new IIDHabboToolbar(),onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(var_68 != null)
         {
            var_68.showUI(param1);
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(var_553 != null && param1 != null)
         {
            var_553.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return var_843;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(var_68 != null)
         {
            var_68.updateCallForGuideBotUI(false);
         }
      }
      
      public function hideUI() : void
      {
         if(var_68 != null)
         {
            var_68.hideUI();
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_189 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var_1485 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return var_144;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_84)
         {
            setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_60)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               toggleHelpUI();
               return;
            }
         }
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_91,onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_100,onRoomSessionEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_84,onHabboToolbarEvent);
         var_189.events.addEventListener(HabboToolbarEvent.const_60,onHabboToolbarEvent);
         createHelpUI();
         setHabboToolbarIcon();
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(var_68 != null)
         {
            var_68.showCallForHelpReply(param1);
         }
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(var_1485 == null)
         {
            return param1;
         }
         return var_1485.getKey(param1,param2,param3);
      }
   }
}

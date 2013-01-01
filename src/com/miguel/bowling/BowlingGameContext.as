package com.miguel.bowling
{
	import com.miguel.bowling.controllers.GameController;
	import com.miguel.bowling.controllers.StartUpCommand;
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.model.BowlingModel;
	import com.miguel.bowling.views.components.finalFrame.FinalFrameGame;
	import com.miguel.bowling.views.components.finalFrame.mediator.FinalFrameMediator;
	import com.miguel.bowling.views.components.frame.FrameGame;
	import com.miguel.bowling.views.components.frame.mediator.FrameGameMediator;
	import com.miguel.bowling.views.components.gameSet.GameSet;
	import com.miguel.bowling.views.components.gameSet.mediator.GameSetMediator;
	import com.miguel.bowling.views.components.play.PlayBall;
	import com.miguel.bowling.views.components.play.mediator.PlayBallMediator;
	import com.miguel.bowling.views.components.playManual.ManualPlayBall;
	import com.miguel.bowling.views.components.playManual.mediator.ManualPlayBallMediator;
	import com.miguel.bowling.views.mainview.MainView;
	import com.miguel.bowling.views.mainview.mediator.MainViewMediator;
	
	import flash.display.DisplayObjectContainer;
	
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Context;
	
	public class BowlingGameContext extends Context
	{
		public function BowlingGameContext(contextView:DisplayObjectContainer=null, autoStartup:Boolean=true)
		{
			super(contextView, autoStartup);
		}
		
		override public function startup():void
		{
			//map controllers
			commandMap.mapEvent(ContextEvent.STARTUP, StartUpCommand, ContextEvent,true);
			commandMap.mapEvent(GameEvent.NEW_GAME, GameController, GameEvent);
			commandMap.mapEvent(GameEvent.NEW_PLAY, GameController, GameEvent);
			commandMap.mapEvent(GameEvent.GAME_SET_VIEW_READY, GameController, GameEvent);
			
			//map model
			injector.mapSingleton(BowlingModel);
			
			//map view
			mediatorMap.mapView(GameSet, GameSetMediator);
			mediatorMap.mapView(PlayBall, PlayBallMediator);
			mediatorMap.mapView(FrameGame, FrameGameMediator);
			mediatorMap.mapView(MainView, MainViewMediator);
			mediatorMap.mapView(FinalFrameGame, FinalFrameMediator);
			mediatorMap.mapView(ManualPlayBall, ManualPlayBallMediator);
			
			//Everything wired and ready to go!!!
			dispatchEvent(new ContextEvent(ContextEvent.STARTUP));
			
			super.startup();
		}
	}
}
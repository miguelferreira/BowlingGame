package com.miguel.bowling.views.components.playManual.mediator
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.components.playManual.ManualPlayBall;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;
	
	public class ManualPlayBallMediator extends Mediator implements IMediator
	{
		public function ManualPlayBallMediator()
		{
			super();
		}
		
		
		[Inject]
		public var view:ManualPlayBall;
		
		override public function onRegister():void
		{
			this.eventMap.mapListener(view, GameEvent.NEW_PLAY, view_newPlayEventHandler);
			
			this.eventMap.mapListener(eventDispatcher, GameEvent.NEW_GAME_READY, eventDispatcher_newGameReadyHandler);
			this.eventMap.mapListener(eventDispatcher, GameEvent.END_GAME, eventDispatcher_endGameReadyHandler);
		}
		
		private function eventDispatcher_endGameReadyHandler(event:GameEvent):void
		{
			view.endGame();
		}
		
		private function eventDispatcher_newGameReadyHandler(event:GameEvent):void
		{
			view.newGame();
		}
		
		private function view_newPlayEventHandler(event:GameEvent):void
		{
			eventDispatcher.dispatchEvent(event);
		}
	}
}
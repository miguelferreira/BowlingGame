package com.miguel.bowling.views.components.play.mediator
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.views.components.play.PlayBall;
	
	import org.robotlegs.core.IMediator;
	import org.robotlegs.mvcs.Mediator;
	
	public class PlayBallMediator extends Mediator implements IMediator
	{
		public function PlayBallMediator()
		{
			super();
		}
		
		
		[Inject]
		public var view:PlayBall;
		
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
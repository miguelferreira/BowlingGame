package com.miguel.bowling.controllers
{
	import com.miguel.bowling.events.GameEvent;
	import com.miguel.bowling.model.BowlingModel;
	
	import org.robotlegs.mvcs.Command;
	
	public class GameController extends Command
	{
		[Inject]
		public var bowlingModel:BowlingModel;

		[Inject]
		public var gameEvent:GameEvent;
		
		

		override public function execute():void
		{
			switch (gameEvent.type)
			{
				case GameEvent.NEW_PLAY:
						bowlingModel.newPlay(gameEvent.playBall.pinsPlay);
					break;
				
				case GameEvent.GAME_SET_VIEW_READY:
				case GameEvent.NEW_GAME:
						bowlingModel.newGame();
						dispatch( new GameEvent( GameEvent.NEW_GAME_READY, null, bowlingModel.gameModel ));
					break;
			}
		}
	}
}
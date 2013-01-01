package com.miguel.bowling.events
{
	import com.miguel.bowling.model.vo.GameVO;
	import com.miguel.bowling.model.vo.PlayVO;
	
	import flash.events.Event;
	
	public class GameEvent extends Event
	{
		public static const NEW_PLAY:String 			= "NEW_PLAY";
		public static const NEW_GAME:String 			= "NEW_GAME";
		public static const NEW_GAME_READY:String 		= "NEW_GAME_READY";
		public static const GAME_SET_VIEW_READY:String 	= "GAME_SET_VIEW_READY";
		public static const END_GAME:String				= "END_GAME";
		
		public var playBall:PlayVO;
		public var newGame:GameVO;
		
		public function GameEvent(type:String, play:PlayVO = null, game:GameVO = null)
		{
			this.playBall = play;
			this.newGame = game;
			super(type, false, false);
		}
		
		override public function clone():Event
		{
			return new GameEvent(this.type, this.playBall);
		}
	}
}
package com.miguel.bowling.model.vo
{
	public class GameVO
	{
		public function GameVO()
		{
			game = [];
			
			for (var i:int = 0; i < 9; i++)
			{
				game.push(new FrameVO());
			}
			
			game.push(new FinalFrameVO() );
		}
		
		public var game:Array = [];
	}
}
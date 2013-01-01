package com.miguel.bowling.views.components.gameSet.raw
{
	import com.miguel.bowling.model.vo.GameVO;
	import com.miguel.bowling.views.components.finalFrame.FinalFrameGame;
	import com.miguel.bowling.views.components.frame.FrameGame;
	
	import spark.components.BorderContainer;
	
	public class GameSetRaw extends BorderContainer
	{
		public function GameSetRaw()
		{
			super();
		}
		
		public var frame1:FrameGame;
		public var frame2:FrameGame;
		public var frame3:FrameGame;
		public var frame4:FrameGame;
		public var frame5:FrameGame;
		public var frame6:FrameGame;
		public var frame7:FrameGame;
		public var frame8:FrameGame;
		public var frame9:FrameGame;
		public var frame10:FinalFrameGame;
		
		public function newGame(game:GameVO):void
		{
			frame1.frameGameVO = game.game[0];
			frame2.frameGameVO = game.game[1];
			frame3.frameGameVO = game.game[2];
			frame4.frameGameVO = game.game[3];
			frame5.frameGameVO = game.game[4];
			frame6.frameGameVO = game.game[5];
			frame7.frameGameVO = game.game[6];
			frame8.frameGameVO = game.game[7];
			frame9.frameGameVO = game.game[8];
			frame10.frameGameVO= game.game[9];
		}
	}
}
package com.miguel.bowling.views.components.finalFrame.raw
{
	import com.miguel.bowling.model.vo.FinalFrameVO;
	import com.miguel.bowling.views.components.frame.raw.FrameGameRaw;
	
	import spark.components.Label;
	
	public class FinalFrameRaw extends FrameGameRaw
	{
		public function FinalFrameRaw()
		{
			super();
		}
		
		public var extraPlay:Label;
		
		public function get finalFrameGameVO():FinalFrameVO
		{
			return super.frameGameVO as FinalFrameVO;
		}
		
		public function updateExtra():void
		{
			extraPlay.visible  = true;
			extraPlay.text = finalFrameGameVO.extraHand.toString();
		}
		
		override public function newGame():void
		{
			extraPlay.visible  = false;
			extraPlay.text = "";
			super.newGame();
		}
	}
}
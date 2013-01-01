package com.miguel.bowling.model.vo
{
	public class FinalFrameVO extends FrameVO
	{
		public var extraHand:int = -1;
		
		override public function compare(frame:FrameVO):Boolean
		{
			return super.compare(frame) && this.extraHand == (frame as FinalFrameVO).extraHand;
		}
	}
}
package com.miguel.bowling.controllers
{
	import org.robotlegs.base.ContextEvent;
	import org.robotlegs.mvcs.Command;
	
	public class StartUpCommand extends Command
	{
		
		override public function execute():void
		{
			// Do some custom startup stuff here!
//			dispatch( new GameEvent(GameEvent.NEW_GAME) );
			
			dispatch( new ContextEvent( ContextEvent.STARTUP_COMPLETE ) );
		}
	}
}
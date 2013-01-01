package flexUnitTests
{
	import com.miguel.bowling.model.BowlingModel;
	import com.miguel.bowling.model.vo.FinalFrameVO;
	import com.miguel.bowling.model.vo.FrameVO;
	import com.miguel.bowling.model.vo.GameVO;
	
	import flash.events.EventDispatcher;
	
	import org.flexunit.asserts.assertEquals;
	import org.flexunit.asserts.assertTrue;
	
	public class GameModelTest
	{	
		private var gameModel:BowlingModel;
		
		private var game:GameVO;
		
		[Before]
		public function setUp():void
		{
			this.gameModel = new BowlingModel();
			this.gameModel.eventDispatcher = new EventDispatcher();
		}
		
		[After]
		public function tearDown():void
		{
			this.gameModel = null;
		}
		
		[Test]
		public function testSetNewGame():void
		{
			gameModel.newGame();
			assertEquals("BowlingModel should have a gameVO", 
				this.gameModel.gameModel != null && this.gameModel.gameFrame == 0, true );
		}
		
		[Test]
		public function testNewPlay():void
		{
			gameModel.newGame();
			gameExample1();
			assertTrue("Game example 1 should be equal", compareGames(game));
				
			gameModel.newGame();
			gameExample2();
			assertTrue("Game example 2 should be equal", compareGames(game));
				
			gameModel.newGame();
			gameExample3();
			assertTrue("Game example 3 should be equal", compareGames(game));
		}
		
		private function gameExample1():void
		{
			gameModel.newPlay(8);
			gameModel.newPlay(2);
			gameModel.newPlay(10);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(3);
			gameModel.newPlay(2);
			gameModel.newPlay(0);
			gameModel.newPlay(10);
			gameModel.newPlay(5);
			gameModel.newPlay(0);
			gameModel.newPlay(7);
			gameModel.newPlay(2);
			gameModel.newPlay(5);
			gameModel.newPlay(3);
			gameModel.newPlay(4);
			gameModel.newPlay(5);
			
			game = new GameVO();
			
			(game.game[0] as FrameVO).firstHand = 8;
			(game.game[0] as FrameVO).secondHand = 2;
			(game.game[0] as FrameVO).spare = true;
			(game.game[0] as FrameVO).total = 20;
			
			(game.game[1] as FrameVO).firstHand = 10;
			(game.game[1] as FrameVO).secondHand = -1;
			(game.game[1] as FrameVO).strike = true;
			(game.game[1] as FrameVO).total = 40;
			
			(game.game[2] as FrameVO).firstHand = 5;
			(game.game[2] as FrameVO).secondHand = 5;
			(game.game[2] as FrameVO).spare = true;
			(game.game[2] as FrameVO).total = 55;
			
			(game.game[3] as FrameVO).firstHand = 5;
			(game.game[3] as FrameVO).secondHand = 3;
			(game.game[3] as FrameVO).total = 63;
			
			(game.game[4] as FrameVO).firstHand = 2;
			(game.game[4] as FrameVO).secondHand = 0;
			(game.game[4] as FrameVO).total = 65;
			
			(game.game[5] as FrameVO).firstHand = 10;
			(game.game[5] as FrameVO).secondHand = -1;
			(game.game[5] as FrameVO).strike = true;
			(game.game[5] as FrameVO).total = 80;
			
			(game.game[6] as FrameVO).firstHand = 5;
			(game.game[6] as FrameVO).secondHand = 0;
			(game.game[6] as FrameVO).total = 85;
			
			(game.game[7] as FrameVO).firstHand = 7;
			(game.game[7] as FrameVO).secondHand = 2;
			(game.game[7] as FrameVO).total = 94;
			
			(game.game[8] as FrameVO).firstHand = 5;
			(game.game[8] as FrameVO).secondHand = 3;
			(game.game[8] as FrameVO).total = 102;
			
			(game.game[9] as FinalFrameVO).firstHand = 4;
			(game.game[9] as FinalFrameVO).secondHand = 5;
			(game.game[9] as FinalFrameVO).total = 111;
		}
		
		private function gameExample2():void
		{
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			gameModel.newPlay(10);
			
			game = new GameVO();
			
			(game.game[0] as FrameVO).firstHand = 10;
			(game.game[0] as FrameVO).secondHand = -1;
			(game.game[0] as FrameVO).strike = true;
			(game.game[0] as FrameVO).total = 30;
			
			(game.game[1] as FrameVO).firstHand = 10;
			(game.game[1] as FrameVO).secondHand = -1;
			(game.game[1] as FrameVO).strike = true;
			(game.game[1] as FrameVO).total = 60;
			
			(game.game[2] as FrameVO).firstHand = 10;
			(game.game[2] as FrameVO).secondHand = -1;
			(game.game[2] as FrameVO).strike = true;
			(game.game[2] as FrameVO).total = 90;
			
			(game.game[3] as FrameVO).firstHand = 10;
			(game.game[3] as FrameVO).secondHand = -1;
			(game.game[3] as FrameVO).strike = true;
			(game.game[3] as FrameVO).total = 120;
			
			(game.game[4] as FrameVO).firstHand = 10;
			(game.game[4] as FrameVO).secondHand = -1;
			(game.game[4] as FrameVO).strike = true;
			(game.game[4] as FrameVO).total = 150;
			
			(game.game[5] as FrameVO).firstHand = 10;
			(game.game[5] as FrameVO).secondHand = -1;
			(game.game[5] as FrameVO).strike = true;
			(game.game[5] as FrameVO).total = 180;
			
			(game.game[6] as FrameVO).firstHand = 10;
			(game.game[6] as FrameVO).secondHand = -1;
			(game.game[6] as FrameVO).strike = true;
			(game.game[6] as FrameVO).total = 210;
			
			(game.game[7] as FrameVO).firstHand = 10;
			(game.game[7] as FrameVO).secondHand = -1;
			(game.game[7] as FrameVO).strike = true;
			(game.game[7] as FrameVO).total = 240;
			
			(game.game[8] as FrameVO).firstHand = 10;
			(game.game[8] as FrameVO).secondHand = -1;
			(game.game[8] as FrameVO).strike = true;
			(game.game[8] as FrameVO).total = 270;
			
			(game.game[9] as FinalFrameVO).firstHand = 10;
			(game.game[9] as FinalFrameVO).secondHand = 10;
			(game.game[9] as FinalFrameVO).extraHand = 10;
			(game.game[9] as FinalFrameVO).strike = true;
			(game.game[9] as FinalFrameVO).total = 300;
		}
		
		private function gameExample3():void
		{
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			gameModel.newPlay(5);
			
			game = new GameVO();
			
			(game.game[0] as FrameVO).firstHand = 5;
			(game.game[0] as FrameVO).secondHand = 5;
			(game.game[0] as FrameVO).spare = true;
			(game.game[0] as FrameVO).total = 15;
			
			(game.game[1] as FrameVO).firstHand = 5;
			(game.game[1] as FrameVO).secondHand = 5;
			(game.game[1] as FrameVO).spare = true;
			(game.game[1] as FrameVO).total = 30;
			
			(game.game[2] as FrameVO).firstHand = 5;
			(game.game[2] as FrameVO).secondHand = 5;
			(game.game[2] as FrameVO).spare = true;
			(game.game[2] as FrameVO).total = 45;
			
			(game.game[3] as FrameVO).firstHand = 5;
			(game.game[3] as FrameVO).secondHand = 5;
			(game.game[3] as FrameVO).spare = true;
			(game.game[3] as FrameVO).total = 60;
			
			(game.game[4] as FrameVO).firstHand = 5;
			(game.game[4] as FrameVO).secondHand = 5;
			(game.game[4] as FrameVO).spare = true;
			(game.game[4] as FrameVO).total = 75;
			
			(game.game[5] as FrameVO).firstHand = 5;
			(game.game[5] as FrameVO).secondHand = 5;
			(game.game[5] as FrameVO).spare = true;
			(game.game[5] as FrameVO).total = 90;
			
			(game.game[6] as FrameVO).firstHand = 5;
			(game.game[6] as FrameVO).secondHand = 5;
			(game.game[6] as FrameVO).spare = true;
			(game.game[6] as FrameVO).total = 105;
			
			(game.game[7] as FrameVO).firstHand = 5;
			(game.game[7] as FrameVO).secondHand = 5;
			(game.game[7] as FrameVO).spare = true;
			(game.game[7] as FrameVO).total = 120;
			
			(game.game[8] as FrameVO).firstHand = 5;
			(game.game[8] as FrameVO).secondHand = 5;
			(game.game[8] as FrameVO).spare = true;
			(game.game[8] as FrameVO).total = 135;
			
			(game.game[9] as FinalFrameVO).firstHand = 5;
			(game.game[9] as FinalFrameVO).secondHand = 5;
			(game.game[9] as FinalFrameVO).extraHand = 5;
			(game.game[9] as FinalFrameVO).spare = true;
			(game.game[9] as FinalFrameVO).total = 150;
		}
		
		private function compareGames(game:GameVO):Boolean
		{
			var frame:FrameVO;
			var frame1:FrameVO;
			
			for (var i:uint = 0; i < 10; i++) 
			{
				frame = game.game[i] as FrameVO;
				frame1 = gameModel.gameModel.game[i] as FrameVO;
				
				if (!frame.compare(frame1))
					return false;
			}
			
			return true;
		}
	}
}
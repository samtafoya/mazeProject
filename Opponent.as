package {

	import flash.display.MovieClip;
	import flash.events.*;


	public class Opponent extends MovieClip {
		public var atFinalDestination: Boolean;

		private var TIMER_IS_DONE: int;

		private var mySolution: Array;
		private var timer: int = 0;
		private var solutionIndex: int;

		public var isPurple: Boolean;
		public var isGrey: Boolean;


		public function Opponent(colPlace: int, rowPlace: int, timerDone: int) {
			this.width = Game.SIZE;
			this.height = Game.SIZE;
			this.x = (Game.COLS - colPlace) * Game.SIZE + Game.OFFSET;
			this.y = (Game.ROWS - rowPlace) * Game.SIZE + Game.OFFSET;
			atFinalDestination = false;

			/*if (isPurple) {
				this.gotoAndStop("Purple");
			}*/
			
			TIMER_IS_DONE = timerDone;

		}


		public function setGo(solution: Array) {
			mySolution = solution;
			solutionIndex = 0;

			addEventListener(Event.ENTER_FRAME, moveOpponent);
		}

		private function moveOpponent(event: Event) {
			if (solutionIndex < mySolution.length) {
				if (timer > TIMER_IS_DONE) {
					timer = 0;
					var cell: Cell = mySolution[solutionIndex];
					this.x = cell.xPos;
					this.y = cell.yPos;
					solutionIndex++;
				}
				timer++;
			} else {
				atFinalDestination = true;
				removeEventListener(Event.ENTER_FRAME, moveOpponent);
			}
		}

		public function moveOpponent2() {
			trace(" ");
		}

	}
}
package {

	import flash.display.MovieClip;
	import flash.events.*;


	public class Player extends MovieClip {
		public var isRight: Boolean;
		public var isLeft: Boolean;
		public var isUp: Boolean;
		public var isDown: Boolean;

		public function Player() {
			this.x = (Game.COLS - 12) * Game.SIZE + Game.OFFSET;
			this.y = (Game.ROWS - 12) * Game.SIZE + Game.OFFSET;
			isRight = false;
			isLeft = false;
			isUp = false;
			isDown = false;

			//GAME LOOP FOR MOVING THE PLAYER
			addEventListener(Event.ENTER_FRAME, move);

		}

		public function move(event: Event) {
			if (isRight) {
				this.x += 50;
				isRight = false;
			} else if (isLeft) {
				this.x -= 50;
				isLeft = false;
			} else if (isUp) {
				this.y -= 50;
				isUp = false;
			} else if (isDown) {
				this.y += 50;
				isDown = false;
			}
		}

		public function movePlayer(playerCell: int, mazeCells: Array) {
			if (isRight) {
				if (!mazeCells[playerCell].east) {
					playerCell++;
					this.x = mazeCells[playerCell].xPos;
					this.y = mazeCells[playerCell].yPos;
				}
				isRight = false;
			}
			if (isLeft) {
				if (!mazeCells[playerCell].west) {
					playerCell--;
					this.x = mazeCells[playerCell].xPos;
					this.y = mazeCells[playerCell].yPos;
				}
				isLeft = false;
			}
			if (isUp) {
				if (!mazeCells[playerCell].north) {
					playerCell = playerCell - Game.COLS;
					this.x = mazeCells[playerCell].xPos;
					this.y = mazeCells[playerCell].yPos;
				}
				isUp = false;
			}
			if (isDown) {
				if (!mazeCells[playerCell].south) {
					playerCell = playerCell + Game.COLS;
					this.x = mazeCells[playerCell].xPos;
					this.y = mazeCells[playerCell].yPos;
				}
				isDown = false;
			}
		}


	}

}
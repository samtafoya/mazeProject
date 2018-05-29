package {

	import flash.display.*;
	import flash.events.*;
	import flash.text.*;
	import flash.utils.*;


	public class FinalProject extends MovieClip {
		// ARRAY OF 10 X 10 CELLS
		public var mazeCells: Array;
		public var player: Player;
		public var opponent: Opponent;
		public var opponent2: Opponent;
		public var solution: Array;
		public var allLineShapes: Array;
		public var stack: Array;
		public var playerCell: int;
		public var scoreCount: int;
		public var reverseSolution: Array;
		public var tempSolution: Array;

		public var colorTimer: int;
		public var otherTimer: int;
		public var isPurple: Boolean;

		public function FinalProject() {
			initialize();
		}

		public function initialize() {
			finalSheet.x = -800;
			finalScore.x = -800;
			congrats.x = -800;
			resetBtn.x = -800;
			//startScreen.x = -500;

			mazeCells = new Array();
			solution = new Array();
			playerCell = 0;
			scoreCount = 1;
			isPurple = false;
			colorTimer = 0;
			otherTimer = 0;

			for (var row: int = 0; row < Game.ROWS; row++) {
				for (var col: int = 0; col < Game.COLS; col++) {
					var cell: Cell = new Cell(row, col);
					mazeCells.push(cell);
				}
			}

			// CARVE PERFECT MAZE
			backTracker();

			// DRAW OERFECT MAZE
			draw();

			// CREATE A PLAYER AND ADD TO STAGE
			player = new Player();
			addChild(player);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, keyIsDown);

			// CREATE AN OPPONENT AND ADD TO THE STAGE
			opponent = new Opponent(1, 1, 7);
			addChild(opponent);

			opponent2 = new Opponent(4, 3, 7);
			addChild(opponent2);

			//
			goBtn.addEventListener(MouseEvent.CLICK, beginRace);
			
			//
			resetBtn.addEventListener(MouseEvent.CLICK, finishGame);

			//
			addEventListener(Event.ENTER_FRAME, checkGameStatus);

		}

		public function keyIsDown(event: KeyboardEvent) {
			switch (event.keyCode) {
				case Game.UPARROW:
					//player.movePlayer(playerCell, mazeCells);
					//player.isUp = true;
					moveUp();
					checkCoins();
					break;
				case Game.DOWNARROW:
					//player.movePlayer(playerCell, mazeCells);
					//player.isDown = true;
					moveDown();
					checkCoins();
					break;
				case Game.LEFTARROW:
					//player.movePlayer(playerCell, mazeCells);
					//player.isLeft = true;
					moveLeft();
					checkCoins();
					break;
				case Game.RIGHTARROW:
					//player.movePlayer(playerCell, mazeCells);
					//player.isRight = true;
					moveRight();
					checkCoins();
					break;
			}
		}

		public function checkCoins() {
			if (coin1.stage && player.hitTestObject(coin1)) {
				removeChild(coin1);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
				//opponent.isPurple = true;
			}
			if (coin2.stage && player.hitTestObject(coin2)) {
				removeChild(coin2);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin3.stage && player.hitTestObject(coin3)) {
				removeChild(coin3);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin4.stage && player.hitTestObject(coin4)) {
				removeChild(coin4);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin5.stage && player.hitTestObject(coin5)) {
				removeChild(coin5);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin6.stage && player.hitTestObject(coin6)) {
				removeChild(coin6);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin7.stage && player.hitTestObject(coin7)) {
				removeChild(coin7);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin8.stage && player.hitTestObject(coin8)) {
				removeChild(coin8);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin9.stage && player.hitTestObject(coin9)) {
				removeChild(coin9);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin10.stage && player.hitTestObject(coin10)) {
				removeChild(coin10);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin11.stage && player.hitTestObject(coin11)) {
				removeChild(coin11);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
			if (coin12.stage && player.hitTestObject(coin12)) {
				removeChild(coin12);
				myText.text = new String(scoreCount);
				scoreCount++;
				isPurple = true;
				opponent.gotoAndStop("Purple");
				opponent2.gotoAndStop("Purple");
			}
		}

		public function moveUp(): void {
			if (!mazeCells[playerCell].north) {
				playerCell = playerCell - Game.COLS;
				player.x = mazeCells[playerCell].xPos;
				player.y = mazeCells[playerCell].yPos;
			}
			if (player.hitTestPoint(opponent.x, opponent.y) && !isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && !isPurple) {
				scoreCount--;
				myText.text = new String(scoreCount);
				//scoreCount--;
			} else if (player.hitTestPoint(opponent.x, opponent.y) && isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && isPurple) {
				scoreCount++;
				myText.text = new String(scoreCount);
				//scoreCount--;
			}
		}

		public function moveDown(): void {
			if (!mazeCells[playerCell].south) {
				playerCell = playerCell + Game.COLS;
				player.x = mazeCells[playerCell].xPos;
				player.y = mazeCells[playerCell].yPos;
			}
			if (player.hitTestPoint(opponent.x, opponent.y) && !isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && !isPurple) {
				scoreCount--;
				myText.text = new String(scoreCount);
				//scoreCount--;
			} else if (player.hitTestPoint(opponent.x, opponent.y) && isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && isPurple) {
				scoreCount++;
				myText.text = new String(scoreCount);
				//scoreCount--;
			}
		}

		public function moveLeft(): void {
			if (!mazeCells[playerCell].west) {
				playerCell--;
				player.x = mazeCells[playerCell].xPos;
				player.y = mazeCells[playerCell].yPos;
			}
			if (player.hitTestPoint(opponent.x, opponent.y) && !isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && !isPurple) {
				scoreCount--;
				myText.text = new String(scoreCount);
				//scoreCount--;
			} else if (player.hitTestPoint(opponent.x, opponent.y) && isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && isPurple) {
				scoreCount++;
				myText.text = new String(scoreCount);
				//scoreCount--;
			}
		}

		public function moveRight(): void {
			if (!mazeCells[playerCell].east) {
				playerCell++;
				player.x = mazeCells[playerCell].xPos;
				player.y = mazeCells[playerCell].yPos;
			}
			if (player.hitTestPoint(opponent.x, opponent.y) && !isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && !isPurple) {
				scoreCount--;
				myText.text = new String(scoreCount);
				//scoreCount--;
			} else if (player.hitTestPoint(opponent.x, opponent.y) && isPurple || player.hitTestPoint(opponent2.x, opponent2.y) && isPurple) {
				scoreCount++;
				myText.text = new String(scoreCount);
				//scoreCount--;
			}
		}

		public function backTracker(): void {
			// CREATE VARS - INTIALIZED
			//		STACK, INDEX ACCESS TO MAZECELLS, COUNT CELLS VISITED
			//var stack: Array = new Array();
			stack = new Array();
			var i: int = 0;
			var visitedCells: int = 1;
			stack.push(i);
			mazeCells[i].visited = true;

			// BACKTRACK USING A WHILE LOOP
			while (visitedCells < Game.COLS * Game.ROWS) {
				// FOR EACH CELL, BUILD AN ARRAY OF THE CONTRAINTS
				var possibleConstraints: Array = new Array();
				// NOT A CELL ON THE WESTERN EDGE OF THE MAZE
				if (mazeCells[i].west && i % Game.COLS != 0) {
					if (!mazeCells[i - 1].visited) {
						//trace("There is a west wall");
						possibleConstraints.push("WEST");
					}
				}

				// NOT A CELL ON THE NORTHERN EDGE OF THE MAZE
				if (mazeCells[i].north && i >= Game.ROWS) {
					if (!mazeCells[i - Game.ROWS].visited) {
						//trace("There is a north wall");
						possibleConstraints.push("NORTH");
					}
				}

				// NOT A CELL ON THE SOUTHERN EDGE OF THE MAZE
				if (mazeCells[i].south && i < Game.COLS * Game.ROWS - Game.COLS) {
					if (!mazeCells[i + Game.ROWS].visited) {
						//trace("There is a south wall");
						possibleConstraints.push("SOUTH");
					}
				}

				// NOT A CELL ON THE EASTERN EDGE OF THE MAZE
				if (mazeCells[i].east && i % Game.COLS != Game.COLS - 1) {
					if (!mazeCells[i + 1].visited) {
						//trace("There is an east wall");
						possibleConstraints.push("EAST");
					}
				}

				if (possibleConstraints.length > 0) {
					// RANDONMLY CHOOSE ON OF THE CONSTRAINT VALUES TO VISIT
					var randomWall: int = Math.floor(Math.random() * possibleConstraints.length);

					// BREAK DOWN APPROPRIATE WALLS
					switch (possibleConstraints[randomWall]) {
						case "NORTH":
							mazeCells[i].north = false;
							mazeCells[i - Game.ROWS].south = false;
							i -= Game.ROWS;
							break;

						case "SOUTH":
							mazeCells[i].south = false;
							mazeCells[i + Game.ROWS].north = false;
							i += Game.ROWS;
							break;

						case "EAST":
							mazeCells[i].east = false;
							mazeCells[i + 1].west = false;
							i++;
							break;

						case "WEST":
							mazeCells[i].west = false;
							mazeCells[i - 1].east = false;
							i--;
							break;

					}

					// NEW CELL IS FOUND. CHECK AS VISITED AND PUSH ONTO STACK
					mazeCells[i].visited = true;
					stack.push(i);
					visitedCells++;

					// CHECK IF WE HAVE A SOLUTION
					if (i == Game.COLS * Game.ROWS - 1) {
						getSolution();
					}

				} else {
					// NO WALLS CAN BE REMOVED. START BACKTRACKING
					var top: int = stack.pop();
					if (top == i) {
						i = stack.pop();
						stack.push(i);
					}
				}
			}
		}

		public function getSolution() {
			solution = new Array();
			//tempSolution = new Array();
			reverseSolution = new Array();

			for (var i: int = stack.length - 1; i >= 0; i--) {
				//var x: int = 0;
				var cell: Cell = mazeCells[stack[i]];
				var cell2: Cell = mazeCells[stack[i - 7]];
				solution.push(cell);
				reverseSolution.push(cell2);
				//trace(reverseSolution);
				//tempSolution.push(mazeCells[stack[x]]);
				//x++;
			}

			//newSolution(reverseSolution);

		}

		public function newSolution(temporSolution: Array) {
			x = temporSolution.length;
			tempSolution = new Array();
			for (var i: int = 0; i < temporSolution.length; i++) {
				var cell: Cell = temporSolution[x];
				tempSolution.push(cell);
				x--;
			}
		}

		public function draw() {
			allLineShapes = new Array();
			for (var i: int = 0; i < mazeCells.length; i++) {
				var myShape: Shape = new Shape();
				myShape.graphics.lineStyle(1, 0x990000, .75);
				myShape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);
				// DRAW NORTH WALL
				if (mazeCells[i].north) {
					myShape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				} else {
					myShape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos);
				}
				// DRAW EAST WALL
				if (mazeCells[i].east) {
					myShape.graphics.lineTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				} else {
					myShape.graphics.moveTo(mazeCells[i].xPos + Game.SIZE, mazeCells[i].yPos + Game.SIZE);
				}
				// DRAW SOUTH WALL
				if (mazeCells[i].south) {
					myShape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				} else {
					myShape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos + Game.SIZE);
				}
				// DRAW WEST WALL
				if (mazeCells[i].west) {
					myShape.graphics.lineTo(mazeCells[i].xPos, mazeCells[i].yPos);
				} else {
					myShape.graphics.moveTo(mazeCells[i].xPos, mazeCells[i].yPos);
				}
				allLineShapes.push(myShape);
				addChild(myShape);
			}
		}

		public function checkGameStatus(event: Event) {
			if (isPurple) {
				colorTimer++;
				if (colorTimer > 50) {
					colorTimer = 0;
					isPurple = false;
					opponent.gotoAndStop("Grey");
					opponent2.gotoAndStop("Grey");
				}
			}
			if (opponent.atFinalDestination) {
				showScore();
			}
			if (opponent2.atFinalDestination) {
				opponent.moveOpponent2();
			}
		}

		public function showScore() {
			//reset.addEventListener(MouseEvent.CLICK, finishGame);


			finalSheet.x = 268;
			finalScore.x = 260;
			congrats.x = 68;
			resetBtn.x = 265;
			finalScore.text = new String(scoreCount);

			if (opponent.stage) {
				removeChild(opponent);
			}
			if (opponent2.stage) {
				removeChild(opponent2);
			}
			if (player.stage) {
				removeChild(player);
			}


			while (allLineShapes.length > 0) {
				var mc: Shape = allLineShapes.pop();
				this.removeChild(mc);
			}

		}

		public function finishGame(event: MouseEvent) {
			goBtn.x = 150;
			startScreen.x = 350;
			finalScore.text = new String("0");
			initialize();
		}

		public function beginRace(event: MouseEvent) {
			goBtn.x = -100;
			startScreen.x = -500;

			opponent.setGo(solution);
			opponent2.setGo(reverseSolution);
		}

	}

}
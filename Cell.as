package {

	public class Cell {
		// PROPERTIES FOR A CELL IN A MAZE
		public var xPos: int;
		public var yPos: int;
		// WALLS
		public var north: Boolean;
		public var east: Boolean;
		public var south: Boolean;
		public var west: Boolean;

		public var visited: Boolean;

		public function Cell(row, col: int) {
			xPos = col * Game.SIZE + Game.OFFSET; // 50: size of cell, 20: offset
			yPos = row * Game.SIZE + Game.OFFSET; // 50: size of cell, 20: offset
			visited = false;
			north = true;
			east = true;
			south = true;
			west = true;
		}

	}

}
import "packages/unittest/unittest.dart";
import "minesweeperkata.dart";

String minefield = """
4 2
....
.*..
""";

void main() {
  test('Minesweeper must have a height and a width', () {
      var minesweeper = new MineSweeper();
      expect(minesweeper.height, equals(0));
      expect(minesweeper.width, equals(0));
  });
  
  test('Minesweeper must read correctly height & width', () {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.height, equals(2));
    expect(minesweeper.width, equals(4));    
  });
  
  test('should find a bomb when there is one', () {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.isBomb(1,1), isTrue);
  });
  
  test('should not find a bomb when out of the minefield bounds', () {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.isBomb(-2,-3), isFalse);
  });
  
  test('should find the correct number of adjacents bombs', () {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.numberOfAdjacentBombs(0,1), equals(1));
  });
  
  test('should render correctly a cell with the number of adjacent bombs',() {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.renderCell(0,1), equals('1'));
  });
  
  test('should render correctly a cell with a bomb',() {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.renderCell(1,1), equals('*'));
  });
  
  test('should render correctly a minefield', () {
    var minesweeper = new MineSweeper.fromGrid(minefield);
    expect(minesweeper.render(), equals("""
1110
1*10
"""));
  });
  
}
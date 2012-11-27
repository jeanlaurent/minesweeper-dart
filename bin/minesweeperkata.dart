library minesweeper;

class MineSweeper {
  
      int height ;
      int width ;
      List<String> lines;
      
      MineSweeper() {
        height = 0;
        width = 0;
      }
      
      MineSweeper.fromGrid(String grid) {
        List<String> lines = grid.split('\n');
        var firstLine = lines[0];
        var dimensions =  firstLine.split(' ');
        width = int.parse(dimensions[0]);
        height = int.parse(dimensions[1]);
        this.lines = lines.getRange(1, lines.length - 1);
      }
      
      bool _isValid(int x,int y) {
        return (x >= 0) && (x < width) && (y>=0) && (y < height);  
      }
      
      bool isBomb(int x, int y) {
        if (!_isValid(x,y)) {
          return false;
        }
        return lines[y][x] == '*';
      }
      
      numberOfAdjacentBombs(int x, int y) {
        int numberOfBombs = 0;
        for(var xx =x - 1; xx <= x + 1; ++xx) {
          for(var yy =y -1; yy <= y +1; ++yy) {
            if(isBomb(xx,yy)) {
              numberOfBombs++;
            }
          } 
        }
        return numberOfBombs;
      }
      
      String renderCell(int x, int y) {
        if(isBomb(x,y)) {
          return '*';
        }
        return numberOfAdjacentBombs(x, y).toString();
      }
      
      String render() {
        String minefield = "";
        for(var y=0;y<height;y++) {
           for(var x=0; x<width; x++) {
            minefield = "${minefield}${renderCell(x,y)}";            
           }
          minefield = "$minefield\n";
        }
        return minefield;
      }
      
}
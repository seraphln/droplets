# coding=utf-8
#

import copy


GUARD = "G"
DOT = "."
LOCKED = "X"
ART = "A"


class Maze(object):
    
    def __init__(self, maze):
        self.maze = maze
        self.rows = len(self.maze)
        self.cols = len(self.maze[0])


def add_new_coord(maze, q, path, row, col):
    """
    add new path to try

    @param maze: the given maze
    @type maze: class.Maze

    @param q: the queue used to stored all the try path
    @type q: List

    @param path: the current path
    @type path: List

    @param row: current row
    @type row: Int

    @param col: current col
    @type col: Int

    :return:
    """

    def _add_coord(q, path, new_path):
        if new_path not in path:
            path = copy.deepcopy(path)
            q.append((path, new_path[0], new_path[1]))

    if (row-1) >= 0 and col <= maze.cols-1:
        new_path = (row-1, col)
        _add_coord(q, path, new_path)

    if (row+1) <= (maze.rows-1) and col <= maze.cols-1:
        new_path = (row+1, col)
        _add_coord(q, path, new_path)

    if (col-1) >= 0 and row <= maze.rows-1:
        new_path = (row, col-1)
        _add_coord(q, path, new_path)

    if (col+1) <= (maze.cols-1) and row <= maze.rows-1:
        new_path = (row, col+1)
        _add_coord(q, path, new_path)


def find_nearest_guard_with_given_art(maze, art):
    """
        find the nearest guard with given art and maze

        @param maze: the given maze
        @type maze: class.Maze

        @param art: the given art coord
        @type art: List or Tuple

        :return: nearest path to find a guard
    """
    row, col = art

    if maze.maze[row][col] != ART:
        print("Given a wrong coord")
        return

    q = []

    # default path
    cur_path = [(row, col)]

    # add new path to try
    add_new_coord(maze, q, cur_path, row, col)

    total_paths = []
    while q:
        cur_path, row, col = q.pop()

        if maze.maze[row][col] == GUARD:
            cur_path.append((row, col))
            total_paths.append(cur_path)
        elif maze.maze[row][col] == DOT:
            cur_path.append((row, col))
            add_new_coord(maze, q, cur_path, row, col)
        else:
            # invalid coord like locked or another art
            continue

    total_paths.sort(key=lambda x: len(x))
    return total_paths[0] if len(total_paths) else []


def find_all_arts_in_given_maze(maze):
    """
    find all arts coord in the given maze

    @param maze: given maze
    @type maze: class.Maze
    """
    arts = []

    for i, row in enumerate(maze.maze):
        for j, col in enumerate(row):
            if maze.maze[i][j] == ART:
                arts.append((i, j))

    return arts


def test():
    maze_lst = [[[GUARD, DOT, DOT, DOT],
                  [DOT, LOCKED, DOT, DOT],
                  [DOT, LOCKED, GUARD, DOT],
                  [DOT, DOT, ART, DOT]],
                [[GUARD, DOT, DOT, DOT],
                 [DOT, LOCKED, DOT, DOT],
                 [DOT, LOCKED, DOT, DOT],
                 [DOT, DOT, ART, DOT]],
                [[GUARD, DOT, DOT, DOT],
                  [DOT, GUARD, DOT, ART],
                  [DOT, LOCKED, DOT, DOT],
                  [DOT, DOT, ART, DOT]]]

    for cur_maze in maze_lst:
        print("=" * 80)
        maze = Maze(cur_maze)
        arts = find_all_arts_in_given_maze(maze)

        for art in arts:
            print art, find_nearest_guard_with_given_art(maze, art)
        print("=" * 80)


if __name__ == "__main__":
    test()

import 'package:devfest24/src/features/more/presentation/map_utils.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Landmark map directions test suite', () {
    test('Exhibition room to destination rooms', () {
      RoomType start = RoomType.exhibitionRoom;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.exhibitionRoom,
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs,
          RoomType.room4
        ],
      );

      // room 1
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.exhibitionRoom,
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs,
          RoomType.room3
        ],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.exhibitionRoom,
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs
        ],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.exhibitionRoom,
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway
        ],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.exhibitionRoom,
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.toilet
        ],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.exhibitionRoom, RoomType.room1, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.exhibitionRoom, RoomType.room1],
      );
    });

    test('Room 1 to destination rooms', () {
      RoomType start = RoomType.room1;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs,
          RoomType.room4,
        ],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs,
          RoomType.room3,
        ],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.stairs,
        ],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
        ],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
          RoomType.toilet,
        ],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room1,
          RoomType.room2,
          RoomType.hallway,
        ],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room1, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room1],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room1, RoomType.exhibitionRoom],
      );
    });

    test('Room 2 to destination rooms', () {
      RoomType start = RoomType.room2;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.hallway, RoomType.stairs, RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.hallway, RoomType.stairs, RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.hallway, RoomType.stairs],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.hallway],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.hallway, RoomType.toilet],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.room1],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room2, RoomType.room1, RoomType.exhibitionRoom],
      );
    });

    test('Hallway to destination rooms', () {
      RoomType start = RoomType.hallway;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.stairs, RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.stairs, RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.stairs],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.toilet],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.hallway, RoomType.room2, RoomType.room1],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1,
          RoomType.exhibitionRoom
        ],
      );
    });

    test('Stairway to destination rooms', () {
      RoomType start = RoomType.stairs;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.hallway, RoomType.toilet],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.hallway],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.hallway, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.stairs, RoomType.hallway, RoomType.room2, RoomType.room1],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.stairs,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1,
          RoomType.exhibitionRoom
        ],
      );
    });

    test('Toilet to destination rooms', () {
      RoomType start = RoomType.toilet;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway, RoomType.stairs, RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway, RoomType.stairs, RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway, RoomType.stairs],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.toilet, RoomType.hallway, RoomType.room2, RoomType.room1],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.toilet,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1,
          RoomType.exhibitionRoom
        ],
      );
    });

    test('Room 3 to destination rooms', () {
      RoomType start = RoomType.room3;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3, RoomType.stairs, RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3, RoomType.stairs],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3, RoomType.stairs, RoomType.hallway],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3, RoomType.stairs, RoomType.hallway, RoomType.toilet],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room3, RoomType.stairs, RoomType.hallway, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room3,
          RoomType.stairs,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1
        ],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room3,
          RoomType.stairs,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1,
          RoomType.exhibitionRoom
        ],
      );
    });

    test('Room 4 to destination rooms', () {
      RoomType start = RoomType.room4;
      RoomType end = RoomType.room4;

      List<RoomType> directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4],
      );

      // room 3
      end = RoomType.room3;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4, RoomType.stairs, RoomType.room3],
      );

      // stairway
      end = RoomType.stairs;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4, RoomType.stairs],
      );

      // hallway
      end = RoomType.hallway;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4, RoomType.stairs, RoomType.hallway],
      );

      // toilet
      end = RoomType.toilet;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4, RoomType.stairs, RoomType.hallway, RoomType.toilet],
      );

      // room 2
      end = RoomType.room2;
      directions = getDirections(start, end);

      expect(
        directions,
        [RoomType.room4, RoomType.stairs, RoomType.hallway, RoomType.room2],
      );

      // room 1
      end = RoomType.room1;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room4,
          RoomType.stairs,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1
        ],
      );

      // exhibition room
      end = RoomType.exhibitionRoom;
      directions = getDirections(start, end);

      expect(
        directions,
        [
          RoomType.room4,
          RoomType.stairs,
          RoomType.hallway,
          RoomType.room2,
          RoomType.room1,
          RoomType.exhibitionRoom
        ],
      );
    });
  });
}

import 'package:equatable/equatable.dart';
import 'package:inkstep/models/journey_stage.dart';
import 'package:meta/meta.dart';

class JourneyEntity extends Equatable {
  JourneyEntity({
    @required this.id,
    @required this.userId,
    @required this.artistId,
    @required this.mentalImage,
    @required this.size,
    @required this.position,
    @required this.availability,
    @required this.noImages,
    @required this.stage,
  }) : super(<dynamic>[
          id,
          userId,
          artistId,
          mentalImage,
          size,
          position,
          availability,
          noImages,
          stage,
        ]);

  factory JourneyEntity.fromJson(Map<String, dynamic> json) {
    return JourneyEntity(
      id: json['journeyID'],
      userId: json['userID'],
      artistId: json['artistID'],
      mentalImage: json['tattooDesc'],
      size: json['size'],
      position: json['position'],
      availability: json['availability'],
      noImages: int.parse(json['noRefImages']),
      stage: JourneyStage.fromJson(json),
    );
  }

  int id;
  final int userId;
  final int artistId;
  final String mentalImage;
  final String size;
  final String position;
  final String availability;
  final int noImages;
  final JourneyStage stage;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'id': id,
      'userID': userId,
      'artistID': artistId,
      'tattooDesc': mentalImage,
      'size': size,
      'position': position,
      'availability': availability,
      'noRefImages': noImages,
    };
  }
}

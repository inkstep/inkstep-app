import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

class JourneyEntity extends Equatable {
  JourneyEntity({
    @required this.userId,
    this.artistId = 101,
    @required this.mentalImage,
    @required this.size,
    @required this.position,
    @required this.availability,
    @required this.deposit,
    @required this.noImages,
  }) : super(<dynamic>[
          userId,
          artistId,
          mentalImage,
          size,
          position,
          availability,
          deposit,
          noImages,
        ]);

  factory JourneyEntity.fromJson(Map<String, dynamic> json) {
    return JourneyEntity(
      userId: json['userID'],
      artistId: json['artistID'],
      mentalImage: json['tattooDesc'],
      size: json['size'],
      position: json['position'],
      availability: json['availability'],
      deposit: json['deposit'],
      noImages: int.parse(json['noRefImages']),
    );
  }

  final int userId;
  final int artistId;
  final String mentalImage;
  final String size;
  final String position;
  final String availability;
  final String deposit;
  final int noImages;

  Map<String, dynamic> toJson() {
    return <String, dynamic>{
      'userID': userId.toString(),
      'artistID': artistId.toString(),
      'tattooDesc': mentalImage,
      'size': size,
      'position': position,
      'availability': availability,
      'deposit': deposit,
      'noRefImages': noImages.toString(),
    };
  }
}

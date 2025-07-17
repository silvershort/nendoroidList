import 'package:json_annotation/json_annotation.dart';

part 'repo.g.dart';

@JsonSerializable(explicitToJson: true)
class Repo {
  String name;
  String path;
  String sha;
  int size;
  String url;
  @JsonKey(name: 'html_url')
  String htmlUrl;
  @JsonKey(name: 'git_url')
  String gitUrl;
  @JsonKey(name: 'download_url')
  String? downloadUrl;
  String type;
  @JsonKey(name: '_links')
  Links links;

  Repo({
    required this.name,
    required this.path,
    required this.sha,
    required this.size,
    required this.url,
    required this.htmlUrl,
    required this.gitUrl,
    this.downloadUrl,
    required this.type,
    required this.links,
  });

  factory Repo.fromJson(Map<String, dynamic> json) => _$RepoFromJson(json);

  Map<String, dynamic> toJson() => _$RepoToJson(this);

  @override
  String toString() {
    return 'Repo{name: $name, path: $path, sha: $sha, size: $size, url: $url, htmlUrl: $htmlUrl, gitUrl: $gitUrl, downloadUrl: $downloadUrl, type: $type, links: $links}';
  }
}

@JsonSerializable(explicitToJson: true)
class Links {
  String self;
  String git;
  String html;

  Links({
    required this.self,
    required this.git,
    required this.html,
  });

  factory Links.fromJson(Map<String, dynamic> json) => _$LinksFromJson(json);

  Map<String, dynamic> toJson() => _$LinksToJson(this);
}

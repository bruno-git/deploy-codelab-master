import 'dart:io' show File, HttpServer, Platform;
import 'dart:async' show runZoned;
import 'package:http_server/http_server.dart' show VirtualDirectory;

void main() {
  // Assumes the server lives in bin/ and that `pub build` ran.
  var buildUri = Platform.script.resolve('../build');

  var staticFiles = new VirtualDirectory(buildUri.toFilePath());
  staticFiles
      ..allowDirectoryListing = true
      ..directoryHandler = (dir, request) {
    // Redirect directory-requests to piratebadge.html file.
    var indexUri = new Uri.file(dir.path).resolve('piratebadge.html');
    staticFiles.serveFile(new File(indexUri.toFilePath()), request);
  };

  var portEnv = Platform.environment['PORT'];
  var port = portEnv == null ? 9999 : int.parse(portEnv);

  runZoned(() {
    HttpServer.bind('127.0.0.3', port).then((server) {
      server.listen(staticFiles.serveRequest);
    });
  },
  onError: (e, stackTrace) => print('Oh noes! $e $stackTrace'));
}
